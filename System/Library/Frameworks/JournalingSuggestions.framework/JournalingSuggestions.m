NSData *createUrlForImage(_:)@<X0>(UIImage *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  UIImage *v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;
  NSData *v21;
  NSData *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  NSData *result;
  NSData *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  UIImage *v34;
  uint64_t v35;

  v34 = a1;
  v3 = type metadata accessor for UUID();
  v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL();
  v8 = *(void *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v31 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x270FA5388](v9);
  v32 = (char *)&v31 - v12;
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v31 - v13;
  v15 = objc_msgSend(self, sel_defaultManager);
  v16 = objc_msgSend(v15, sel_temporaryDirectory);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  URL.appendingPathComponent(_:)();
  v17 = v34;
  swift_bridgeObjectRelease();
  v33 = v8;
  v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19 = v14;
  v20 = v7;
  v18(v19, v7);
  v21 = UIImageHEICRepresentation(v17);
  if (v21)
  {
    v22 = v21;
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    outlined copy of Data._Representation(v23, v25);
    v26 = v32;
  }
  else
  {
    v26 = v31;
    result = UIImagePNGRepresentation(v17);
    if (!result) {
      return result;
    }
    v28 = result;
    v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v29;

    outlined copy of Data._Representation(v23, v25);
  }
  URL.appendingPathExtension(_:)();
  outlined consume of Data._Representation(v23, v25);
  v18(a2, v20);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(a2, v26, v20);
  outlined copy of Data._Representation(v23, v25);
  v30 = v35;
  Data.write(to:options:)();
  if (v30)
  {
    outlined consume of Data._Representation(v23, v25);
    outlined consume of Data?(v23, v25);
    return (NSData *)((uint64_t (*)(char *, uint64_t))v18)(a2, v20);
  }
  else
  {
    outlined consume of Data?(v23, v25);
    return (NSData *)outlined consume of Data._Representation(v23, v25);
  }
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t protocol witness for Error._domain.getter in conformance JournalingSuggestionsError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance JournalingSuggestionsError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance JournalingSuggestionsError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance JournalingSuggestionsError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t prepareUrlAccess(_:)(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](prepareUrlAccess(_:), 0, 0);
}

uint64_t prepareUrlAccess(_:)()
{
  uint64_t v1 = v0[12];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_init);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v25(v1, 1, 1, v3);
  URL._bridgeToObjectiveC()(v5);
  v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = partial apply for closure #1 in prepareUrlAccess(_:);
  *(void *)(v9 + 24) = v8;
  v0[6] = partial apply for thunk for @callee_guaranteed (@in_guaranteed URL) -> ();
  v0[7] = v9;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = thunk for @escaping @callee_guaranteed (@in_guaranteed URL) -> ();
  v0[5] = &block_descriptor;
  v10 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  v0[8] = 0;
  objc_msgSend(v2, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v7, 0, v0 + 8, v10);
  _Block_release(v10);

  id v11 = (id)v0[8];
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v7) {
    __break(1u);
  }
  uint64_t v12 = v0[12];
  if (v11)
  {
    id v13 = v11;
    swift_willThrow();

    outlined destroy of URL?(v12, &demangling cache variable for type metadata for URL?);
LABEL_6:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  uint64_t v14 = v0[11];
  outlined init with copy of URL?(v0[12], v14, &demangling cache variable for type metadata for URL?);
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v14, 1, v3);
  uint64_t v17 = v0[11];
  uint64_t v16 = v0[12];
  if (v15 == 1)
  {
    uint64_t v24 = v0[10];
    outlined destroy of URL?(v17, &demangling cache variable for type metadata for URL?);
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
    swift_allocError();
    v18 = v2;
    uint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v19, v24, v3);
    v25(v20, 0, 1, v3);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    outlined destroy of URL?(v16, &demangling cache variable for type metadata for URL?);
    goto LABEL_6;
  }
  uint64_t v23 = v0[9];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v23, v17, v3);
  outlined destroy of URL?(v16, &demangling cache variable for type metadata for URL?);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v21 = (uint64_t (*)(void))v0[1];
LABEL_7:
  return v21();
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

void closure #1 in prepareUrlAccess(_:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_defaultManager);
  uint64_t v5 = URL.path.getter();
  v6 = (void *)MEMORY[0x245690370](v5);
  swift_bridgeObjectRelease();
  unsigned int v7 = objc_msgSend(v4, sel_fileExistsAtPath_, v6);

  if (v7)
  {
    outlined destroy of URL?(a2, &demangling cache variable for type metadata for URL?);
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v10 = *(void *)(v8 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, a1, v8);
    uint64_t v9 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
    v9(a2, 0, 1, v8);
  }
}

uint64_t sub_2444C1DD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in prepareUrlAccess(_:)(uint64_t a1)
{
  closure #1 in prepareUrlAccess(_:)(a1, *(void *)(v1 + 16));
}

uint64_t sub_2444C1DEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed URL) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed URL) -> ()(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
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

uint64_t type metadata accessor for JournalingSuggestionsError()
{
  uint64_t result = type metadata singleton initialization cache for JournalingSuggestionsError;
  if (!type metadata singleton initialization cache for JournalingSuggestionsError) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void assetImageContentToUrl(_:)(void *a1@<X0>, char *a2@<X8>)
{
  v54 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v52 = *(void *)(v3 - 8);
  uint64_t v53 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v50 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v51 = (char *)v49 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v49 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v49 - v19;
  MEMORY[0x270FA5388](v18);
  v22 = (char *)v49 - v21;
  id v56 = objc_msgSend(a1, sel_content);
  int v23 = swift_dynamicCast();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v23)
  {
    v24(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v25 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v25(v22, v8, v9);
      v25(v54, v22, v9);
      return;
    }
  }
  else
  {
    v24(v8, 1, 1, v9);
  }
  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for URL?);
  id v26 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v27 = swift_dynamicCastObjCClass();
  if (v27)
  {
    v28 = (UIImage *)v27;
    v49[1] = v26;
    id v29 = objc_msgSend(self, sel_defaultManager);
    id v30 = objc_msgSend(v29, sel_temporaryDirectory);

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v5, v53);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v31 = *(void (**)(char *, uint64_t))(v10 + 8);
    v31(v17, v9);
    v32 = UIImageHEICRepresentation(v28);
    if (v32)
    {
      v33 = v32;
      uint64_t v34 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v36 = v35;

      outlined copy of Data._Representation(v34, v36);
      v37 = v51;
    }
    else
    {
      v42 = UIImagePNGRepresentation(v28);
      if (!v42)
      {
        v45 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        goto LABEL_19;
      }
      v43 = v42;
      uint64_t v34 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v36 = v44;

      outlined copy of Data._Representation(v34, v36);
      v37 = v50;
    }
    URL.appendingPathExtension(_:)();
    outlined consume of Data._Representation(v34, v36);
    v31(v20, v9);
    v45 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v45(v20, v37, v9);
    uint64_t v46 = v55;
    outlined copy of Data._Representation(v34, v36);
    Data.write(to:options:)();
    if (v46)
    {
      outlined consume of Data._Representation(v34, v36);
      outlined consume of Data?(v34, v36);
      v31(v20, v9);
LABEL_20:
      swift_unknownObjectRelease();
      return;
    }
    outlined consume of Data?(v34, v36);
    outlined consume of Data._Representation(v34, v36);
LABEL_19:
    v45(v54, v20, v9);
    goto LABEL_20;
  }
  swift_unknownObjectRelease();
  id v38 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v39 = swift_dynamicCastObjCClass();
  if (v39)
  {
    v40 = (void *)v39;
    if (getCurrentTheme()() == 2)
    {
      id v41 = objc_msgSend(v40, sel_darkURL);
      static URL._unconditionallyBridgeFromObjectiveC(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      id v48 = objc_msgSend(v40, sel_lightURL);
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRelease();
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
    swift_allocError();
    void *v47 = 0x6D4949552C4C5255;
    v47[1] = 0xEB00000000656761;
    v47[2] = 0;
    v47[3] = 0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
}

uint64_t getCurrentTheme()()
{
  uint64_t v7 = 1;
  type metadata accessor for OS_dispatch_queue();
  uint64_t v0 = static OS_dispatch_queue.main.getter();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = &v7;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = partial apply for closure #1 in getCurrentTheme();
  *(void *)(v2 + 24) = v1;
  aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_13;
  uint64_t v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v0, v3);

  _Block_release(v3);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v7;
    swift_release();
    return v5;
  }
  return result;
}

uint64_t makeDateInternal(start:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  id v41 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v40 = (char *)&v34 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v39 = (char *)&v34 - v21;
  MEMORY[0x270FA5388](v20);
  int v23 = (char *)&v34 - v22;
  outlined init with copy of URL?(a1, (uint64_t)v9, &demangling cache variable for type metadata for Date?);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v24((uint64_t)v9, 1, v10) == 1)
  {
    outlined destroy of URL?((uint64_t)v9, &demangling cache variable for type metadata for Date?);
    uint64_t v25 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a3, 1, 1, v25);
  }
  else
  {
    unint64_t v36 = v14;
    uint64_t v37 = a3;
    unint64_t v35 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v35(v23, v9, v10);
    uint64_t v27 = (uint64_t)v41;
    outlined init with copy of URL?(v38, (uint64_t)v41, &demangling cache variable for type metadata for Date?);
    v28 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v28(v19, v23, v10);
    if (v24(v27, 1, v10) == 1)
    {
      id v29 = v39;
      v35(v39, v19, v10);
      outlined destroy of URL?((uint64_t)v41, &demangling cache variable for type metadata for Date?);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
      id v29 = v39;
      v35(v39, v41, v10);
    }
    id v30 = v36;
    v28(v40, v23, v10);
    v28(v30, v29, v10);
    uint64_t v31 = v37;
    DateInterval.init(start:end:)();
    v32 = *(void (**)(char *, uint64_t))(v11 + 8);
    v32(v29, v10);
    v32(v23, v10);
    uint64_t v33 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v31, 0, 1, v33);
  }
}

void closure #1 in getCurrentTheme()(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  id v3 = objc_msgSend(v2, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_userInterfaceStyle);

  *a1 = v4;
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance UIUserInterfaceStyle@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UIUserInterfaceStyle(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

uint64_t sub_2444C2C84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in getCurrentTheme()()
{
  closure #1 in getCurrentTheme()(*(void **)(v0 + 16));
}

uint64_t sub_2444C2C9C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestionsError(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 3u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        uint64_t v12 = a2[2];
        uint64_t v13 = a2[3];
        a1[2] = v12;
        a1[3] = v13;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = type metadata accessor for URL();
        uint64_t v7 = *(void *)(v6 - 8);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
        {
          uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
          (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for JournalingSuggestionsError(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = type metadata accessor for URL();
      uint64_t v5 = *(void *)(v3 - 8);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v3);
      if (!result)
      {
        id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
        uint64_t result = v4(a1, v3);
      }
      break;
    case 1:
    case 3:
      goto LABEL_5;
    case 2:
      swift_bridgeObjectRelease();
LABEL_5:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestionsError(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[2];
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = type metadata accessor for URL();
      uint64_t v5 = *(void *)(v4 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
      {
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      }
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for JournalingSuggestionsError(void *a1, void *a2)
{
  if (a1 != a2)
  {
    outlined destroy of JournalingSuggestionsError((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = type metadata accessor for URL();
        uint64_t v5 = *(void *)(v4 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
        {
          uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
          memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t outlined destroy of JournalingSuggestionsError(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for JournalingSuggestionsError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for URL();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for JournalingSuggestionsError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of JournalingSuggestionsError((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for URL();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestionsError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestionsError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for JournalingSuggestionsError()
{
  return swift_storeEnumTagMultiPayload();
}

void type metadata completion function for JournalingSuggestionsError()
{
  type metadata accessor for URL?();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataMultiPayload();
  }
}

void type metadata accessor for URL?()
{
  if (!lazy cache variable for type metadata for URL?)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL?);
    }
  }
}

void type metadata accessor for HKWorkoutActivityType(uint64_t a1)
{
}

void type metadata accessor for MOSuggestionSheetViewState(uint64_t a1)
{
}

void type metadata accessor for MOSuggestionAssetMetadataKey(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MOSuggestionAssetsType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MOSuggestionAssetsType(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MOSuggestionAssetsType(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MOSuggestionAssetsType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x245690370](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionSheetTask(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetMotionActivityType()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetsType(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, type metadata accessor for MOSuggestionAssetsType);
  uint64_t v3 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, type metadata accessor for MOSuggestionAssetsType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MOSuggestionAssetsType@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x245690370](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetMetadataKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
  uint64_t v3 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
}

uint64_t lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMetadataKey()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MOSuggestionAssetMotionActivityType(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, type metadata accessor for MOSuggestionAssetMotionActivityType);
  uint64_t v3 = lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, type metadata accessor for MOSuggestionAssetMotionActivityType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MOSuggestionAssetsType(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for HKStateOfMindLabel(uint64_t a1)
{
}

void type metadata accessor for HKStateOfMindAssociation(uint64_t a1)
{
}

void type metadata accessor for HKStateOfMindKind(uint64_t a1)
{
}

void type metadata accessor for MOSuggestionAssetMotionActivityType(uint64_t a1)
{
}

void type metadata accessor for MOSuggestionAssetsType(uint64_t a1)
{
}

void type metadata accessor for HKWorkoutActivityType(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, type metadata accessor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, type metadata accessor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetsType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetsType and conformance MOSuggestionAssetsType, type metadata accessor for MOSuggestionAssetsType);
}

uint64_t base witness table accessor for RawRepresentable in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, type metadata accessor for MOSuggestionAssetMotionActivityType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, type metadata accessor for MOSuggestionAssetMotionActivityType);
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMotionActivityType()
{
  return lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError(&lazy protocol witness table cache variable for type MOSuggestionAssetMotionActivityType and conformance MOSuggestionAssetMotionActivityType, type metadata accessor for MOSuggestionAssetMotionActivityType);
}

void SuggestionSheetManager.viewState.setter()
{
}

void static JournalingSuggestion.StateOfMind.loaderError(_:for:)(uint64_t a1, unint64_t a2, void *a3)
{
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.bridge);
  swift_bridgeObjectRetain_n();
  id v7 = a3;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v10 = 136315650;
    type metadata accessor for JournalingSuggestion.StateOfMind(0);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.StateOfMind.Type);
    uint64_t v12 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v17 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2080;
    id v14 = objc_msgSend(v7, sel_content, v17, v18);
    uint64_t v15 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v8, v9, "%s.getAssetLoader, Unexpected content %s: %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x245691070](v11, -1, -1);
    MEMORY[0x245691070](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t specialized getMetadataValue<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized getMetadata<A>(_:key:as:)(a1, a2, (uint64_t)v8);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
  }
  outlined destroy of URL?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
  type metadata accessor for JournalingSuggestionsError();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  swift_allocError();
  uint64_t v12 = v11;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v13;
  v14._countAndFlagsBits = 8250;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  id v24 = (id)v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date.Type);
  v15._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  uint64_t v16 = v22;
  unint64_t v17 = v23;
  uint64_t v22 = 0x203A7465737341;
  unint64_t v23 = 0xE700000000000000;
  id v24 = objc_msgSend(a1, sel_content);
  v18._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  uint64_t v19 = v22;
  unint64_t v20 = v23;
  *uint64_t v12 = v16;
  v12[1] = v17;
  v12[2] = v19;
  v12[3] = v20;
  swift_storeEnumTagMultiPayload();
  return swift_willThrow();
}

uint64_t specialized getMetadataValue<A>(_:key:as:)(void *a1, void *a2)
{
  uint64_t v3 = specialized getMetadata<A>(_:key:as:)(a1, a2);
  if (v4)
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    swift_allocError();
    uint64_t v6 = v5;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v7;
    v8._countAndFlagsBits = 8250;
    v8._object = (void *)0xE200000000000000;
    String.append(_:)(v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int.Type);
    v9._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_content);
    v10._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    uint64_t *v6 = v12;
    v6[1] = v13;
    v6[2] = 0x203A7465737341;
    v6[3] = 0xE700000000000000;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  return v3;
}

{
  uint64_t result;
  char v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;

  uint64_t result = specialized getMetadata<A>(_:key:as:)(a1, a2);
  if (v4)
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    swift_allocError();
    uint64_t v6 = v5;
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v7;
    v8._countAndFlagsBits = 8250;
    v8._object = (void *)0xE200000000000000;
    String.append(_:)(v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double.Type);
    v9._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_content);
    v10._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    uint64_t *v6 = v11;
    v6[1] = v12;
    v6[2] = 0x203A7465737341;
    v6[3] = 0xE700000000000000;
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, void *a11)
{
  uint64_t v48 = a8;
  uint64_t v49 = a2;
  uint64_t v46 = a7;
  uint64_t v47 = a1;
  uint64_t v50 = a4;
  uint64_t v42 = a3;
  uint64_t v44 = a6;
  v45 = a11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v41 = (uint64_t)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v39 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16);
  v40 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v21;
  uint64_t v22 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v16);
  outlined init with copy of URL?(a10, (uint64_t)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for URL?);
  unint64_t v24 = (*(unsigned __int8 *)(v17 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v38 = (v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (*(unsigned __int8 *)(v14 + 80) + v27 + 8) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v29 = (v15 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  id v30 = (char *)swift_allocObject();
  *((void *)v30 + 2) = 0;
  *((void *)v30 + 3) = 0;
  uint64_t v31 = v50;
  *((void *)v30 + 4) = v42;
  *((void *)v30 + 5) = v31;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(&v30[v24], v40, v39);
  *(void *)&v30[v38] = v44;
  *(double *)&v30[v25] = a9;
  *(void *)&v30[v26] = v46;
  *(void *)&v30[v27] = v48;
  outlined init with take of URL?(v41, (uint64_t)&v30[v28]);
  v32 = v45;
  *(void *)&v30[v29] = v45;
  uint64_t v33 = &v30[(v29 + 15) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v34 = v49;
  *(void *)uint64_t v33 = v47;
  *((void *)v33 + 1) = v34;
  swift_bridgeObjectRetain();
  id v35 = v32;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v43, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:), (uint64_t)v30);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v9 + 168) = v16;
  *(_OWORD *)(v9 + 152) = v15;
  *(_OWORD *)(v9 + 136) = v14;
  *(void *)(v9 + 128) = a9;
  *(double *)(v9 + 120) = a1;
  *(void *)(v9 + 104) = a7;
  *(void *)(v9 + 112) = a8;
  *(void *)(v9 + 88) = a5;
  *(void *)(v9 + 96) = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  *(void *)(v9 + 176) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  *(void *)(v9 + 184) = v10;
  *(void *)(v9 + 192) = *(void *)(v10 - 8);
  *(void *)(v9 + 200) = swift_task_alloc();
  *(void *)(v9 + 208) = swift_task_alloc();
  *(void *)(v9 + 216) = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  *(void *)(v9 + 224) = swift_task_alloc();
  uint64_t v11 = type metadata accessor for Date();
  *(void *)(v9 + 232) = v11;
  *(void *)(v9 + 240) = *(void *)(v11 - 8);
  *(void *)(v9 + 248) = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:), 0, 0);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain();
    char v4 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v6 = *v3++;
      uint64_t v5 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, v4);
      }
      unint64_t v8 = v4[2];
      unint64_t v7 = v4[3];
      if (v8 >= v7 >> 1) {
        char v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v7 > 1), v8 + 1, 1, v4);
      }
      v4[2] = v8 + 1;
      v4[v8 + 4] = v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = (uint64_t *)(v9 + 32);
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v14 = *v11++;
      uint64_t v13 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
      }
      unint64_t v16 = v12[2];
      unint64_t v15 = v12[3];
      if (v16 >= v15 >> 1) {
        uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v15 > 1), v16 + 1, 1, v12);
      }
      v12[2] = v16 + 1;
      v12[v16 + 4] = v13;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void *)(v0 + 240);
  uint64_t v17 = *(void *)(v0 + 248);
  uint64_t v19 = *(char **)(v0 + 224);
  uint64_t v20 = *(int **)(v0 + 216);
  uint64_t v21 = *(void *)(v0 + 192);
  uint64_t v47 = *(void *)(v0 + 144);
  uint64_t v48 = *(void *)(v0 + 176);
  unint64_t v46 = *(void *)(v0 + 136);
  uint64_t v44 = *(void *)(v0 + 184);
  unint64_t v45 = *(void *)(v0 + 128);
  uint64_t v22 = *(void *)(v0 + 104);
  uint64_t v43 = *(void *)(v0 + 232);
  type metadata accessor for HKStateOfMind();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v22, v43);
  specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v23 = (void *)HKStateOfMind.init(date:kind:valence:labels:associations:metadata:)();
  *(void *)(v0 + 256) = v23;
  uint64_t v24 = v20[5];
  *(_DWORD *)(v0 + 312) = v24;
  unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  *(void *)(v0 + 264) = v25;
  *(void *)(v0 + 272) = (v21 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v25(&v19[v24], 1, 1, v44);
  *(void *)uint64_t v19 = v23;
  uint64_t v26 = v20[6];
  uint64_t v27 = v20[7];
  id v28 = v23;
  *(void *)&v19[v26] = specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(v45);
  *(void *)&v19[v27] = specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(v46);
  outlined init with copy of URL?(v47, v48, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v48, 1, v44) == 1)
  {
    outlined destroy of URL?(*(void *)(v0 + 176), &demangling cache variable for type metadata for URL?);
    unint64_t v29 = *(void **)(v0 + 256);
    uint64_t v30 = *(void *)(v0 + 224);
    uint64_t v31 = *(void (**)(uint64_t, void))(v0 + 160);
    *(void *)(v0 + 40) = *(void *)(v0 + 216);
    *(void *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    outlined init with copy of JournalingSuggestion.StateOfMind(v30, (uint64_t)boxed_opaque_existential_1);
    v31(v0 + 16, 0);

    outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestion.StateOfMind(v30);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
  else
  {
    uint64_t v35 = *(void *)(v0 + 208);
    uint64_t v36 = *(void *)(v0 + 184);
    uint64_t v37 = *(void *)(v0 + 192);
    uint64_t v38 = *(void *)(v0 + 176);
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
    *(void *)(v0 + 280) = v39;
    *(void *)(v0 + 288) = (v37 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v39(v35, v38, v36);
    v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v40;
    void *v40 = v0;
    v40[1] = closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
    uint64_t v41 = *(void *)(v0 + 200);
    uint64_t v42 = *(void *)(v0 + 208);
    return prepareUrlAccess(_:)(v41, v42);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  }
  else {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  void (*v2)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, void);
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v10)(void);
  uint64_t v12;

  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v2 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 200);
  char v4 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 224) + *(int *)(v0 + 312);
  (*(void (**)(void, uint64_t))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 208), v4);
  outlined destroy of URL?(v5, &demangling cache variable for type metadata for URL?);
  v1(v5, v3, v4);
  v2(v5, 0, 1, v4);
  uint64_t v6 = *(void **)(v0 + 256);
  unint64_t v7 = *(void *)(v0 + 224);
  unint64_t v8 = *(void (**)(uint64_t, void))(v0 + 160);
  *(void *)(v0 + 40) = *(void *)(v0 + 216);
  *(void *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  outlined init with copy of JournalingSuggestion.StateOfMind(v7, (uint64_t)boxed_opaque_existential_1);
  v8(v0 + 16, 0);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.StateOfMind(v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, void);
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v22)(void);
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  unint64_t v29 = v0;
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  uint64_t v3 = v1;
  char v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v24 = *(id *)(v0 + 304);
    unint64_t v25 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 184);
    uint64_t v27 = *(void *)(v0 + 208);
    unint64_t v7 = *(void **)(v0 + 152);
    unint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    id v28 = v9;
    *(_DWORD *)unint64_t v8 = 136315394;
    *(void *)(v0 + 56) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.StateOfMind.Type);
    uint64_t v10 = String.init<A>(describing:)();
    *(void *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v0 + 72) = objc_msgSend(v7, sel_content);
    uint64_t v12 = String.init<A>(describing:)();
    *(void *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2444BF000, v4, v5, "Unable to access state of mind image url: %s.getAssetLoader, Unexpected content: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245691070](v9, -1, -1);
    MEMORY[0x245691070](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 208);
    unint64_t v15 = *(void *)(v0 + 184);
    unint64_t v16 = *(void *)(v0 + 192);
    uint64_t v17 = *(void **)(v0 + 152);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  uint64_t v18 = *(void **)(v0 + 256);
  uint64_t v19 = *(void *)(v0 + 224);
  uint64_t v20 = *(void (**)(uint64_t, void))(v0 + 160);
  *(void *)(v0 + 40) = *(void *)(v0 + 216);
  *(void *)(v0 + 48) = &protocol witness table for JournalingSuggestion.StateOfMind;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  outlined init with copy of JournalingSuggestion.StateOfMind(v19, (uint64_t)boxed_opaque_existential_1);
  v20(v0 + 16, 0);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.StateOfMind(v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
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
    outlined init with copy of URL?(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

{
  Swift::Int v4;
  uint64_t vars8;

  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        uint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        uint64_t v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized static JournalingSuggestion.StateOfMind.uiColorsToGradient(_:)(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (v2)
    {
      uint64_t v9 = MEMORY[0x263F8EE78];
      uint64_t result = specialized ContiguousArray.reserveCapacity(_:)();
      if (v2 < 0)
      {
        __break(1u);
        return result;
      }
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v4 = 0;
        do
        {
          uint64_t v5 = v4 + 1;
          uint64_t v6 = MEMORY[0x245690790]();
          MEMORY[0x245690240](v6);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          uint64_t v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        int64_t v7 = (void **)(v1 + 32);
        do
        {
          int64_t v8 = *v7++;
          MEMORY[0x245690240](v8);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          --v2;
        }
        while (v2);
      }
      uint64_t v3 = v9;
    }
    return MEMORY[0x2456902E0](v3);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t (*specialized static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v50 + 64);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v45 - v5;
  uint64_t v53 = type metadata accessor for Date();
  unint64_t v55 = *(void *)(v53 - 8);
  uint64_t v7 = *(void *)(v55 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v53);
  v51 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)&v45 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v45 - v13;
  MEMORY[0x270FA5388](v12);
  v54 = (char *)&v45 - v15;
  id v16 = objc_msgSend(a1, sel_assetType);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0) {
      return 0;
    }
  }
  specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56438], (uint64_t)v14);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
  v23(v54, v14, v53);
  uint64_t v24 = specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56430]);
  specialized getMetadataValue<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56440]);
  uint64_t v27 = v26;
  uint64_t v49 = v24;
  id v28 = v54;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v11, v54, v53);
  uint64_t v29 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56428]);
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (v29) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = MEMORY[0x263F8EE78];
  }
  uint64_t v48 = v31;
  uint64_t v32 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56420]);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = v30;
  }
  uint64_t v46 = v33;
  uint64_t v47 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56418]);
  uint64_t v45 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56410]);
  assetImageContentToUrl(_:)(a1, v6);
  unint64_t v34 = v55;
  uint64_t v35 = v53;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v28, v53);
  uint64_t v36 = type metadata accessor for URL();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v6, 0, 1, v36);
  v23(v51, v11, v35);
  outlined init with take of URL?((uint64_t)v6, v52);
  unint64_t v37 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  unint64_t v55 = (v7 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (v55 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (*(unsigned __int8 *)(v50 + 80) + v40 + 8) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v42 = swift_allocObject();
  uint64_t v43 = v46;
  *(void *)(v42 + 16) = v48;
  *(void *)(v42 + 24) = v43;
  v23((char *)(v42 + v37), v51, v53);
  *(void *)(v42 + v55) = v49;
  *(void *)(v42 + v38) = v27;
  *(void *)(v42 + v39) = v47;
  *(void *)(v42 + v40) = v45;
  outlined init with take of URL?(v52, v42 + v41);
  *(void *)(v42 + ((v3 + v41 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  id v44 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2444C6BC4()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v7 + v5 + 8) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
  }
  unint64_t v12 = (v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = v12 + 8;

  return MEMORY[0x270FA0238](v0, v13, v3 | v7 | 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for Date() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                  - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + v10 + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + v6, *(void *)(v2 + v7), *(void *)(v2 + v9), *(void *)(v2 + v10), *(double *)(v2 + v8), v2 + v12, *(void **)(v2 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_2444C6F1C()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  unint64_t v5 = (((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v7 + v5 + 8) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
  }
  unint64_t v12 = (v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_release();

  return MEMORY[0x270FA0238](v0, v13 + 16, v3 | v7 | 7);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for Date() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v15 = v1[2];
  uint64_t v14 = v1[3];
  uint64_t v7 = v1[5];
  uint64_t v13 = v1[4];
  uint64_t v8 = *(void *)((char *)v1 + v5);
  double v9 = *(double *)((char *)v1 + v6);
  uint64_t v10 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)(v9, a1, v15, v14, v13, v7, (uint64_t)v1 + v4, v8, v10);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t type metadata accessor for HKStateOfMind()
{
  unint64_t result = lazy cache variable for type metadata for HKStateOfMind;
  if (!lazy cache variable for type metadata for HKStateOfMind)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for HKStateOfMind);
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

uint64_t outlined init with copy of JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.StateOfMind(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError;
  if (!lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError)
  {
    type metadata accessor for JournalingSuggestionsError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError);
  }
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t (*static UIImage.getLoaderForImageUrl(_:)(uint64_t a1))()
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
}

uint64_t closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v15 = (void *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v15 = a1;
  v15[1] = a2;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:), v14);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a4;
  v6[20] = type metadata accessor for JournalingSuggestionsError();
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  v6[23] = v8;
  v6[24] = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  v6[25] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v6[26] = v10;
  void *v10 = v6;
  v10[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:);
  return prepareUrlAccess(_:)(v9, a4);
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:);
  }
  else {
    uint64_t v2 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  Class isa;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void);
  id v20;
  uint64_t (*v21)(void);
  uint64_t v23;

  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = Data.init(contentsOf:options:)();
  if (v1)
  {

LABEL_3:
    unint64_t v5 = *(void *)(v0 + 192);
    uint64_t v4 = *(void *)(v0 + 200);
    uint64_t v7 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 184);
    uint64_t v8 = *(void (**)(uint64_t, void *))(v0 + 144);
    *(void *)uint64_t v7 = 0x6567616D494955;
    *(void *)(v7 + 8) = 0xE700000000000000;
    *(_OWORD *)(v7 + 16) = xmmword_2444FECC0;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    *(void *)(v0 + 88) = 0;
    uint64_t v9 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError(v7, v10);
    v8(v0 + 56, v9);

    outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestionsError(v7, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    goto LABEL_6;
  }
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  unint64_t v13 = objc_allocWithZone(MEMORY[0x263F827E8]);
  outlined copy of Data._Representation(v11, v12);
  isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v15 = objc_msgSend(v13, sel_initWithData_, isa);
  outlined consume of Data._Representation(v11, v12);

  if (!v15)
  {
    outlined consume of Data._Representation(v11, v12);
    goto LABEL_3;
  }
  uint64_t v17 = *(void *)(v0 + 192);
  id v16 = *(void *)(v0 + 200);
  uint64_t v18 = *(void *)(v0 + 184);
  uint64_t v19 = *(void (**)(uint64_t, void))(v0 + 144);
  *(void *)(v0 + 120) = type metadata accessor for UIImage();
  *(void *)(v0 + 128) = &protocol witness table for UIImage;
  *(void *)(v0 + 96) = v15;
  uint64_t v20 = v15;
  v19(v0 + 96, 0);

  outlined consume of Data._Representation(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
LABEL_6:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 168);
  unint64_t v5 = *(void (**)(uint64_t, void *))(v0 + 144);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v4, *(void *)(v0 + 136), v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v6 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v7);
  v5(v0 + 16, v6);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t (*static UIImage.getImageLoaderForLivePhoto(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  unint64_t result = specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1);
  uint64_t v4 = v3;
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    id v7 = a1;
    return partial apply for closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:);
  }
  return result;
}

uint64_t closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), void *), uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a5;
  swift_retain();
  id v10 = a5;
  a3(partial apply for closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:), v9);

  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, void *a2, void (*a3)(long long *, void *), uint64_t a4, void *a5)
{
  uint64_t v46 = a1;
  uint64_t v8 = type metadata accessor for JournalingSuggestionsError();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (uint64_t *)((char *)&v42 - v12);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.LivePhoto?);
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = a2;
    a3(&v47, a2);

    return outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  uint64_t v43 = v11;
  id v44 = v20;
  uint64_t v45 = v8;
  outlined init with copy of JournalingSuggestionAsset?(v46, (uint64_t)&v47);
  if (!*((void *)&v48 + 1))
  {
    outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
  int v23 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, v23 ^ 1u, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
LABEL_8:
    outlined destroy of URL?((uint64_t)v16, &demangling cache variable for type metadata for JournalingSuggestion.LivePhoto?);
    id v26 = objc_msgSend(a5, sel_assetType);
    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v29 = v28;

    *unint64_t v13 = 0x6567616D494955;
    v13[1] = 0xE700000000000000;
    v13[2] = v27;
    v13[3] = v29;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v49 = 0;
    uint64_t v30 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v13, v31);
    a3(&v47, v30);

    outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    uint64_t v32 = (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError;
    uint64_t v33 = (uint64_t)v13;
    return outlined destroy of JournalingSuggestionsError(v33, v32);
  }
  outlined init with take of JournalingSuggestion.LivePhoto((uint64_t)v16, (uint64_t)v44);
  uint64_t v34 = Data.init(contentsOf:options:)();
  unint64_t v36 = v35;
  id v37 = objc_allocWithZone(MEMORY[0x263F827E8]);
  outlined copy of Data._Representation(v34, v36);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v39 = objc_msgSend(v37, sel_initWithData_, isa);
  outlined consume of Data._Representation(v34, v36);

  uint64_t v40 = (uint64_t)v43;
  if (v39)
  {
    *((void *)&v48 + 1) = type metadata accessor for UIImage();
    uint64_t v49 = &protocol witness table for UIImage;
    *(void *)&long long v47 = v39;
    id v41 = v39;
    a3(&v47, 0);

    outlined consume of Data._Representation(v34, v36);
    outlined destroy of JournalingSuggestionsError((uint64_t)v44, type metadata accessor for JournalingSuggestion.LivePhoto);
    return outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  outlined consume of Data._Representation(v34, v36);
  *(void *)uint64_t v40 = 0x6567616D494955;
  *(void *)(v40 + 8) = 0xE700000000000000;
  *(_OWORD *)(v40 + 16) = xmmword_2444FECD0;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v49 = 0;
  uint64_t v24 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v40, v25);
  a3(&v47, v24);

  outlined destroy of URL?((uint64_t)&v47, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v40, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  uint64_t v32 = type metadata accessor for JournalingSuggestion.LivePhoto;
  uint64_t v33 = (uint64_t)v44;
  return outlined destroy of JournalingSuggestionsError(v33, v32);
}

uint64_t (*static UIImage.getLoaderForImageUrlPair(_:)(void *a1))(uint64_t a1, uint64_t a2)
{
  *(void *)(swift_allocObject() + 16) = a1;
  id v2 = a1;
  return partial apply for closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
}

uint64_t closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = a1;
  v10[6] = a2;
  id v11 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:), (uint64_t)v10);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[23] = a5;
  v6[24] = a6;
  v6[22] = a4;
  v6[25] = type metadata accessor for JournalingSuggestionsError();
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URL();
  v6[28] = v7;
  v6[29] = *(void *)(v7 - 8);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:), 0, 0);
}

uint64_t closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)()
{
  id v1 = objc_msgSend(*(id *)(v0 + 176), sel_lightURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v2;
  void *v2 = v0;
  v2[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  return prepareUrlAccess(_:)(v3, v4);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)();
  uint64_t v9;

  id v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 256);
  uint64_t v4 = *(void *)(*(void *)v1 + 232);
  unint64_t v5 = *(void *)(*(void *)v1 + 224);
  v2[35] = v0;
  swift_task_dealloc();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v2[36] = v6;
  v6(v3, v5);
  if (v0)
  {
    uint64_t v7 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  }
  else
  {
    v6(v2[33], v2[28]);
    uint64_t v7 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  id v1 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v2;
  void *v2 = v0;
  v2[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  return prepareUrlAccess(_:)(v3, v4);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v8;

  id v2 = *v1;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 288);
  uint64_t v4 = *(void *)(*v1 + 240);
  unint64_t v5 = *(void *)(*v1 + 224);
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (v0)
  {
    uint64_t v6 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  }
  else
  {
    (*(void (**)(void, void))(v2 + 288))(*(void *)(v2 + 248), *(void *)(v2 + 224));
    uint64_t v6 = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

{
  uint64_t v0;
  id v1;
  void *v2;
  void (*v3)(uint64_t, void);
  unint64_t v4;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  id v1 = objc_msgSend(*(id *)(v0 + 176), sel_constructedImage);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void (**)(uint64_t, void))(v0 + 184);
    uint64_t v4 = type metadata accessor for UIImage();
    *(void *)(v0 + 136) = v2;
    *(void *)(v0 + 160) = v4;
    *(void *)(v0 + 168) = &protocol witness table for UIImage;
    unint64_t v5 = v2;
    v3(v0 + 136, 0);

    outlined destroy of URL?(v0 + 136, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v7 = *(void (**)(uint64_t, void *))(v0 + 184);
    *(void *)uint64_t v6 = 0x6567616D494955;
    *(void *)(v6 + 8) = 0xE700000000000000;
    *(_OWORD *)(v6 + 16) = xmmword_2444FECE0;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    *(void *)(v0 + 128) = 0;
    uint64_t v8 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError(v6, v9);
    v7(v0 + 96, v8);

    outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestionsError(v6, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  id v1 = *(void **)(v0 + 280);
  id v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  unint64_t v5 = *(void (**)(uint64_t, void *))(v0 + 184);
  uint64_t v6 = objc_msgSend(*(id *)(v0 + 176), sel_lightURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v7 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v8);
  v5(v0 + 16, v7);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  uint64_t v9 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v10;
  void *v10 = v0;
  v10[1] = closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  uint64_t v12 = *(void *)(v0 + 240);
  id v11 = *(void *)(v0 + 248);
  return prepareUrlAccess(_:)(v11, v12);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;

  id v1 = *(void **)(v0 + 304);
  id v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  unint64_t v5 = *(void (**)(uint64_t, void *))(v0 + 184);
  uint64_t v6 = objc_msgSend(*(id *)(v0 + 176), sel_darkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  *(_OWORD *)(v0 + 72) = 0u;
  *(void *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  uint64_t v7 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError(v4, v8);
  v5(v0 + 56, v7);

  outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestionsError(v4, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t closure #1 in static UIImage.getAssetLoader(for:inside:)(void (*a1)(void *, void), uint64_t a2, void *a3)
{
  v7[3] = type metadata accessor for UIImage();
  v7[4] = &protocol witness table for UIImage;
  v7[0] = a3;
  id v5 = a3;
  a1(v7, 0);
  return outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
}

uint64_t partial apply for closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), void *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t partial apply for closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t (*specialized static UIImage.getAssetLoader(for:inside:)(void *a1))()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  id v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v57 - v6;
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v59 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v60 = (char *)&v57 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v57 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v57 - v17;
  id v62 = objc_msgSend(a1, sel_content);
  int v19 = swift_dynamicCast();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  uint64_t v61 = v9;
  if (!v19)
  {
    v20(v7, 1, 1, v8);
LABEL_7:
    outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for URL?);
    id v27 = objc_msgSend(a1, sel_content);
    self;
    uint64_t v28 = swift_dynamicCastObjCClass();
    if (v28)
    {
      *(void *)(swift_allocObject() + 16) = v28;
      return (uint64_t (*)())partial apply for closure #1 in static UIImage.getAssetLoader(for:inside:);
    }
    else
    {
      swift_unknownObjectRelease();
      id v30 = objc_msgSend(a1, sel_content);
      self;
      uint64_t v31 = (void *)swift_dynamicCastObjCClass();
      if (v31)
      {
        id v32 = objc_msgSend(v31, sel_imageURL);
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = v60;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();
          swift_unknownObjectRelease();

          uint64_t v35 = v61;
          unint64_t v36 = *(void (**)(char *, char *, uint64_t))(v61 + 32);
          v36(v5, v34, v8);
          v20(v5, 0, 1, v8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v5, 1, v8) != 1)
          {
            id v37 = v59;
            v36(v59, v5, v8);
            (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v34, v37, v8);
            unint64_t v38 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
            uint64_t v39 = swift_allocObject();
            v36((char *)(v39 + v38), v34, v8);
            (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v8);
            return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
          }
        }
        else
        {
          swift_unknownObjectRelease();
          v20(v5, 1, 1, v8);
        }
        outlined destroy of URL?((uint64_t)v5, &demangling cache variable for type metadata for URL?);
      }
      else
      {
        swift_unknownObjectRelease();
      }
      id v50 = objc_msgSend(a1, sel_content);
      self;
      long long v48 = (uint64_t (*)())swift_dynamicCastObjCClass();
      if (!v48)
      {
        swift_unknownObjectRelease();
        return v48;
      }
      *(void *)(swift_allocObject() + 16) = v48;
      return closure #1 in static UIImage.getLoaderForImageUrlPair(_:)partial apply;
    }
  }
  v20(v7, 0, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    goto LABEL_7;
  }
  uint64_t v21 = v61;
  v58 = *(void (**)(char *, char *, uint64_t))(v61 + 32);
  v59 = (char *)(v61 + 32);
  v58(v18, v7, v8);
  v57 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v57(v16, v18, v8);
  id v22 = objc_msgSend(a1, sel_assetType);
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;
  if (v23 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v25 != v26)
  {
    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_14;
    }
    uint64_t v52 = v61 + 8;
    v51 = *(void (**)(char *, uint64_t))(v61 + 8);
    v51(v18, v8);
    uint64_t v53 = v60;
    v57(v60, v16, v8);
    unint64_t v54 = (*(unsigned __int8 *)(v52 + 72) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 72);
    uint64_t v55 = swift_allocObject();
    v58((char *)(v55 + v54), v53, v8);
    v51(v16, v8);
    return partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:);
  }

  swift_bridgeObjectRelease_n();
LABEL_14:
  id v41 = specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1);
  uint64_t v43 = v42;
  uint64_t v44 = v61;
  if (v41)
  {
    uint64_t v45 = v41;
    uint64_t v46 = (void *)swift_allocObject();
    v46[2] = v45;
    v46[3] = v43;
    v46[4] = a1;
    id v47 = a1;
    long long v48 = closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)partial apply;
  }
  else
  {
    long long v48 = 0;
  }
  uint64_t v49 = *(void (**)(char *, uint64_t))(v44 + 8);
  v49(v16, v8);
  v49(v18, v8);
  return v48;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in UIImage()
{
  return &protocol witness table for UIImage;
}

uint64_t sub_2444C9A94()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in static UIImage.getAssetLoader(for:inside:)(void (*a1)(void *, void), uint64_t a2)
{
  return closure #1 in static UIImage.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return closure #1 in static UIImage.getLoaderForImageUrl(_:)(a1, a2, v6);
}

unint64_t type metadata accessor for UIImage()
{
  unint64_t result = lazy cache variable for type metadata for UIImage;
  if (!lazy cache variable for type metadata for UIImage)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIImage);
  }
  return result;
}

uint64_t sub_2444C9C2C()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:)(a1, v4, v5, v6, v7, v8);
}

uint64_t outlined init with copy of JournalingSuggestionsError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_2Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(uint64_t a1, void *a2)
{
  return closure #1 in closure #1 in static UIImage.getImageLoaderForLivePhoto(for:inside:)(a1, a2, *(void (**)(long long *, void *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t outlined init with copy of JournalingSuggestionAsset?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestionsError(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2444C9F1C()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static UIImage.getLoaderForImageUrl(_:)(a1, v6, v7, v8, v10, v11);
}

uint64_t (*static Image.getAssetLoader(for:inside:)(void *a1))()
{
  unint64_t result = specialized static UIImage.getAssetLoader(for:inside:)(a1);
  uint64_t v4 = v3;
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    id v7 = a1;
    return (uint64_t (*)())partial apply for closure #1 in static Image.getAssetLoader(for:inside:);
  }
  return result;
}

uint64_t closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), void *), uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a5;
  swift_retain();
  id v10 = a5;
  a3(partial apply for closure #1 in closure #1 in static Image.getAssetLoader(for:inside:), v9);

  return swift_release();
}

uint64_t closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, void *a2, void (*a3)(long long *, void *), uint64_t a4, void *a5)
{
  uint64_t v9 = type metadata accessor for JournalingSuggestionsError();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (id *)((char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a2)
  {
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = a2;
    a3(&v23, a2);

    return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  }
  outlined init with copy of JournalingSuggestionAsset?(a1, (uint64_t)&v23);
  if (*((void *)&v24 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
    type metadata accessor for UIImage();
    if (swift_dynamicCast())
    {
      id v14 = v22[1];
      uint64_t v15 = Image.init(uiImage:)();
      *((void *)&v24 + 1) = MEMORY[0x263F1B570];
      uint64_t v25 = &protocol witness table for Image;
      *(void *)&long long v23 = v15;
      a3(&v23, 0);

      return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
    }
  }
  else
  {
    outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  }
  id v16 = objc_msgSend(a5, sel_assetType);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  *uint64_t v11 = 0x6567616D494955;
  v11[1] = 0xE700000000000000;
  v11[2] = v17;
  v11[3] = v19;
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  uint64_t v20 = (void *)swift_allocError();
  outlined init with copy of JournalingSuggestionsError((uint64_t)v11, v21);
  a3(&v23, v20);

  outlined destroy of JournalingSuggestionAsset?((uint64_t)&v23);
  return outlined destroy of JournalingSuggestionsError((uint64_t)v11);
}

uint64_t (*protocol witness for static InternalAssetProvider.getAssetLoader(for:inside:) in conformance Image(void *a1))()
{
  unint64_t result = specialized static UIImage.getAssetLoader(for:inside:)(a1);
  uint64_t v4 = v3;
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v5;
    v6[3] = v4;
    v6[4] = a1;
    id v7 = a1;
    return closure #1 in static Image.getAssetLoader(for:inside:)partial apply;
  }
  return result;
}

uint64_t partial apply for closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static Image.getAssetLoader(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), void *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in Image()
{
  return &protocol witness table for Image;
}

uint64_t partial apply for closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(uint64_t a1, void *a2)
{
  return closure #1 in closure #1 in static Image.getAssetLoader(for:inside:)(a1, a2, *(void (**)(long long *, void *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t outlined destroy of JournalingSuggestionAsset?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for JournalingSuggestion.Video(0);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v12, a3, v13);
  uint64_t v14 = (uint64_t)&v12[*(int *)(v10 + 20)];
  uint64_t v15 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  specialized getMetadata<A>(_:key:as:)(a4, (void *)*MEMORY[0x263F56400], (uint64_t)v9);
  outlined assign with take of Date?((uint64_t)v9, v14);
  v19[3] = v10;
  v19[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Video;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  outlined init with copy of JournalingSuggestion.Video((uint64_t)v12, (uint64_t)boxed_opaque_existential_1);
  a1(v19, 0);
  outlined destroy of URL?((uint64_t)v19, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestion.Video((uint64_t)v12);
}

uint64_t (*specialized static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v37 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v36 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v35 = (char *)&v34 - v8;
  id v9 = objc_msgSend(a1, sel_assetType);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v39 = [a1 (SEL)0x1F6513798];
  int v16 = swift_dynamicCast();
  uint64_t v17 = v37;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56);
  if (v16)
  {
    v18(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v4, 1, v5) != 1)
    {
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
      uint64_t v20 = v35;
      v19(v35, v4, v5);
      uint64_t v21 = v36;
      v19(v36, v20, v5);
      unint64_t v22 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      uint64_t v23 = swift_allocObject();
      v19((char *)(v23 + v22), v21, v5);
      *(void *)(v23 + ((v6 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      id v24 = a1;
      return partial apply for closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:);
    }
  }
  else
  {
    v18(v4, 1, 1, v5);
  }
  outlined destroy of URL?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
LABEL_13:
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  __swift_project_value_buffer(v26, (uint64_t)static Logger.bridge);
  id v27 = a1;
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    id v30 = (uint8_t *)swift_slowAlloc();
    id v31 = (id)swift_slowAlloc();
    id v39 = v31;
    *(_DWORD *)id v30 = 136315138;
    id v38 = [v27 (SEL)0x1F6513798];
    uint64_t v32 = String.init<A>(describing:)();
    id v38 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, (uint64_t *)&v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v28, v29, "SuggestionVideo.getAssetLoader, Unexpected content: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245691070](v31, -1, -1);
    MEMORY[0x245691070](v30, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_2444CAC24()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return closure #1 in static JournalingSuggestion.Video.getAssetLoader(for:inside:)(a1, a2, v2 + v6, v7);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Video(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Video(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Video(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Video(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  swift_retain();
  static JournalingSuggestionAsset.make(from:completionHandler:)(a1, (void (*)(char *, void *))partial apply for closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:), (uint64_t)v10, a4, a5);

  return swift_release();
}

uint64_t closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v36 = a4;
  uint64_t v33 = a1;
  uint64_t v34 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v8 = type metadata accessor for Result();
  uint64_t v35 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void *)((char *)v32 - v9);
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)v32 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v32 - v20;
  if (a2)
  {
    uint64_t *v10 = (uint64_t)a2;
    swift_storeEnumTagMultiPayload();
    id v22 = a2;
    v34(v10);
  }
  else
  {
    v32[1] = AssociatedTypeWitness;
    uint64_t v23 = v19;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v33, v11);
    uint64_t v24 = v23;
    int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v15, 1, a5);
    uint64_t v26 = v34;
    if (v25 == 1)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      uint64_t v27 = swift_allocError();
      os_log_type_t v29 = v28;
      uint64_t *v28 = _typeName(_:qualified:)();
      v29[1] = v30;
      v29[2] = 0;
      v29[3] = 0;
      swift_storeEnumTagMultiPayload();
      uint64_t *v10 = v27;
      swift_storeEnumTagMultiPayload();
      v26(v10);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v15, a5);
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v18, v21, a5);
      swift_dynamicCast();
      swift_storeEnumTagMultiPayload();
      v26(v10);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v21, a5);
    }
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v35 + 8))(v10, v8);
}

uint64_t sub_2444CB318()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2)
{
  return closure #1 in static JournalingSuggestionAsset.make(from:completionHandler:)(a1, a2, *(void (**)(uint64_t *))(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16));
}

uint64_t static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void (*a2)(char *, void *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = a5;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = type metadata accessor for JournalingSuggestionsError();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t *)((char *)&v30 - v16);
  uint64_t v18 = *(void *)(a1 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 24));
  swift_bridgeObjectRetain();
  *uint64_t v17 = _typeName(_:qualified:)();
  v17[1] = v19;
  v17[2] = 0;
  v17[3] = 0;
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = *(void *)(v18 + 16);
  if (v20)
  {
    uint64_t v21 = v18 + 56;
    while (*(void *)(v21 - 24) != a4)
    {
      v21 += 32;
      if (!--v20) {
        goto LABEL_5;
      }
    }
    uint64_t v24 = *(void (**)(uint64_t (*)(uint64_t, void *), void *))(v21 - 8);
    swift_retain();
    swift_bridgeObjectRelease();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v17, (uint64_t)v15);
    unint64_t v25 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v31;
    v26[2] = a4;
    v26[3] = v27;
    uint64_t v28 = v33;
    v26[4] = v32;
    v26[5] = v28;
    outlined init with take of JournalingSuggestionsError((uint64_t)v15, (uint64_t)v26 + v25);
    swift_retain();
    swift_retain();
    v24(partial apply for closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:), v26);
    swift_release_n();
    swift_release();
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(v10, 1, 1, a4);
    lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
    id v22 = (void *)swift_allocError();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v17, v23);
    v32(v10, v22);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return outlined destroy of JournalingSuggestionsError((uint64_t)v17);
}

uint64_t closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2, void (*a3)(char *, void *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v34 = a4;
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v16);
  id v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v23 = v20;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v15, 1, 1, a6);
    id v24 = a2;
    a3(v15, a2);

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v23);
  }
  else
  {
    uint64_t v32 = a5;
    uint64_t v33 = v20;
    outlined init with copy of JournalingSuggestionAsset?(a1, (uint64_t)v35);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
    char v26 = swift_dynamicCast();
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    if (v26)
    {
      v27(v18, 0, 1, a6);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v18, a6);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v15, v22, a6);
      v27(v15, 0, 1, a6);
      a3(v15, 0);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v33);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v22, a6);
    }
    else
    {
      v27(v18, 1, 1, a6);
      uint64_t v28 = *(void (**)(char *, uint64_t))(v12 + 8);
      uint64_t v29 = v33;
      v28(v18, v33);
      v27(v15, 1, 1, a6);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      uint64_t v30 = (void *)swift_allocError();
      outlined init with copy of JournalingSuggestionsError(v32, v31);
      a3(v15, v30);

      return ((uint64_t (*)(char *, uint64_t))v28)(v15, v29);
    }
  }
}

uint64_t sub_2444CB9E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for JournalingSuggestionsError() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v5 = type metadata accessor for URL();
      uint64_t v6 = *(void *)(v5 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
      }
      break;
    case 1u:
    case 3u:
      goto LABEL_5;
    case 2u:
      swift_bridgeObjectRelease();
LABEL_5:
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t outlined init with take of JournalingSuggestionsError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestionsError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(uint64_t a1, void *a2)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = *(void *)(type metadata accessor for JournalingSuggestionsError() - 8);
  uint64_t v7 = (void (*)(char *, void *))v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return closure #2 in static JournalingSuggestionAsset.make(from:completionHandler:)(a1, a2, v7, v8, v9, v5);
}

uint64_t static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](static JournalingSuggestionAsset.content(forItem:), 0, 0);
}

uint64_t static JournalingSuggestionAsset.content(forItem:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = type metadata accessor for Optional();
  *uint64_t v3 = v0;
  v3[1] = static JournalingSuggestionAsset.content(forItem:);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000011, 0x8000000244501300, partial apply for closure #1 in static JournalingSuggestionAsset.content(forItem:), v2, v4);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](static JournalingSuggestionAsset.content(forItem:), 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v8 = type metadata accessor for CheckedContinuation();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - v10, a1, v8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, v11, v8);
  static JournalingSuggestionAsset.make(from:completionHandler:)(a2, (uint64_t)partial apply for closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:), v13, a3, a4);
  return swift_release();
}

uint64_t partial apply for closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1)
{
  return closure #1 in static JournalingSuggestionAsset.content(forItem:)(a1, v1[4], v1[2], v1[3]);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = a2;
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v37 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v38 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v36 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v40 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v19 = type metadata accessor for Result();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t *)((char *)&v34 - v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v34 - v20, a1, v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v41 = *v21;
    type metadata accessor for CheckedContinuation();
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    uint64_t v34 = v18;
    uint64_t v24 = v40;
    (*(void (**)(char *, uint64_t *, uint64_t))(v40 + 32))(v17, v21, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v15, v17, AssociatedTypeWitness);
    char v25 = swift_dynamicCast();
    char v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
    if (v25)
    {
      v26(v10, 0, 1, a3);
      uint64_t v27 = v38;
      uint64_t v28 = v36;
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v36, v10, a3);
      uint64_t v29 = v37;
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v37, v28, a3);
      v26(v29, 0, 1, a3);
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(returning:)();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v28, a3);
    }
    else
    {
      v26(v10, 1, 1, a3);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v5);
      type metadata accessor for JournalingSuggestionsError();
      lazy protocol witness table accessor for type JournalingSuggestionsError and conformance JournalingSuggestionsError();
      uint64_t v30 = swift_allocError();
      uint64_t v32 = v31;
      *uint64_t v31 = _typeName(_:qualified:)();
      v32[1] = v33;
      void v32[2] = 0;
      v32[3] = 0;
      swift_storeEnumTagMultiPayload();
      uint64_t v41 = v30;
      type metadata accessor for CheckedContinuation();
      CheckedContinuation.resume(throwing:)();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, AssociatedTypeWitness);
  }
}

uint64_t InternalAssetContent.AssetProvider.loader.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t InternalAssetContent.providers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*InternalAssetContent.providers.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

JournalingSuggestions::InternalAssetContent __swiftcall InternalAssetContent.init()()
{
  return (JournalingSuggestions::InternalAssetContent)MEMORY[0x263F8EE78];
}

uint64_t default argument 0 of InternalAssetContent.init(providers:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t default associated conformance accessor for JournalingSuggestionAsset.JournalingSuggestionAsset.JournalingSuggestionContent: JournalingSuggestionAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return MEMORY[0x270FA02F8](a3, a2, AssociatedTypeWitness, &protocol requirements base descriptor for JournalingSuggestionAsset, &associated conformance descriptor for JournalingSuggestionAsset.JournalingSuggestionAsset.JournalingSuggestionContent: JournalingSuggestionAsset);
}

uint64_t dispatch thunk of static InternalAssetProvider.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

ValueMetadata *type metadata accessor for InternalAssetContent()
{
  return &type metadata for InternalAssetContent;
}

uint64_t initializeBufferWithCopyOfBuffer for InternalAssetContent.AssetProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InternalAssetContent.AssetProvider()
{
  return swift_release();
}

uint64_t initializeWithCopy for InternalAssetContent.AssetProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for InternalAssetContent.AssetProvider(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for InternalAssetContent.AssetProvider(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalAssetContent.AssetProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InternalAssetContent.AssetProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalAssetContent.AssetProvider()
{
  return &type metadata for InternalAssetContent.AssetProvider;
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

uint64_t sub_2444CC91C()
{
  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v1 = type metadata accessor for CheckedContinuation();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  type metadata accessor for Optional();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v4 = *(void *)(type metadata accessor for CheckedContinuation() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return closure #1 in closure #1 in static JournalingSuggestionAsset.content(forItem:)(a1, v5, v3);
}

uint64_t closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, void *a3, void *a4)
{
  uint64_t v42 = a4;
  uint64_t v43 = a2;
  uint64_t v44 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v41 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for JournalingSuggestion.Song(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v13 + *(int *)(v11 + 28);
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = 1;
  uint64_t v40 = v14;
  uint64_t v38 = v16;
  v16((char *)v14, 1, 1, v15);
  uint64_t v18 = (uint64_t)v13 + *(int *)(v10 + 32);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v39 = v18;
  v20(v18, 1, 1, v19);
  id v21 = objc_msgSend(a3, sel_title);
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  *uint64_t v13 = v22;
  v13[1] = v24;
  id v25 = objc_msgSend(a3, sel_artistName);
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  v13[2] = v26;
  v13[3] = v28;
  id v29 = objc_msgSend(a3, sel_albumTitle);
  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v31;

  v13[4] = v30;
  v13[5] = v32;
  id v33 = objc_msgSend(a3, sel_imageURL);
  if (v33)
  {
    uint64_t v34 = v33;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v17 = 0;
  }
  v38(v9, v17, 1, v15);
  outlined assign with take of URL?((uint64_t)v9, v40, &demangling cache variable for type metadata for URL?);
  uint64_t v35 = v41;
  specialized getMetadata<A>(_:key:as:)(v42, (void *)*MEMORY[0x263F563E0], v41);
  outlined assign with take of URL?(v35, v39, &demangling cache variable for type metadata for Date?);
  v45[3] = v10;
  v45[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Song;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v45);
  outlined init with copy of JournalingSuggestion.Song((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v44(v45, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v45);
  return outlined destroy of JournalingSuggestion.Song((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v9 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_13:
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    id v16 = a1;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = v20;
      *(_DWORD *)uint64_t v19 = 136315394;
      type metadata accessor for JournalingSuggestion.Song(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Song.Type);
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      id v23 = objc_msgSend(v16, sel_content, v26, v27);
      uint64_t v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444BF000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245691070](v20, -1, -1);
      MEMORY[0x245691070](v19, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v11 = v10;
  if (objc_msgSend(v10, sel_mediaType) == (id)1 || objc_msgSend(v11, sel_mediaType) == (id)4)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = a1;
    id v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_2444CD140()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Song.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined assign with take of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Song(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Song(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Song(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Song(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double static JournalingSuggestion.Workout.Details.toCountPerMinute(_:)(void *a1)
{
  id v2 = objc_msgSend(self, sel__countPerMinuteUnit);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  double v4 = v3;

  return v4;
}

uint64_t closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3, void *a4)
{
  v71 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v7 - 8);
  v67 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v68 = (uint64_t)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)v59 - v12;
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v65 = (char *)v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v64 = (char *)v59 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v60 = (char *)v59 - v21;
  MEMORY[0x270FA5388](v20);
  id v23 = (char *)v59 - v22;
  uint64_t v24 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v59 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = v25;
  uint64_t v28 = (uint64_t)&v27[*(int *)(v25 + 32)];
  uint64_t v29 = type metadata accessor for DateInterval();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56);
  uint64_t v66 = v28;
  id v62 = v31;
  uint64_t v63 = v29;
  uint64_t v61 = v30 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t))v31)(v28, 1, 1);
  *((void *)v27 + 1) = 0;
  uint64_t v32 = (id *)(v27 + 8);
  *(void *)uint64_t v27 = a3;
  *((void *)v27 + 2) = 0;
  *((void *)v27 + 3) = 0;
  id v33 = a4;
  specialized getMetadata<A>(_:key:as:)(a4, (void *)*MEMORY[0x263F564A8], (uint64_t)v13);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v35 = v34(v13, 1, v14);
  v70 = v33;
  if (v35 == 1)
  {
    outlined destroy of URL?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    v59[1] = a2;
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 32);
    uint64_t v36 = v15 + 32;
    uint64_t v37 = v38;
    v38(v23, (uint64_t)v13, v14);
    uint64_t v39 = v68;
    specialized getMetadata<A>(_:key:as:)(v33, (void *)*MEMORY[0x263F564A0], v68);
    int v40 = v34((char *)v39, 1, v14);
    uint64_t v41 = (void (**)(char *, char *, uint64_t))(v36 - 16);
    uint64_t v42 = (void (**)(char *, uint64_t))(v36 - 24);
    if (v40 == 1)
    {
      outlined destroy of URL?(v68, &demangling cache variable for type metadata for Date?);
      uint64_t v43 = *v41;
      (*v41)(v64, v23, v14);
      v43(v65, v23, v14);
      uint64_t v44 = v67;
      DateInterval.init(start:end:)();
      (*v42)(v23, v14);
      v62(v44, 0, 1, v63);
      uint64_t v45 = (uint64_t)v44;
    }
    else
    {
      v59[0] = v36 - 24;
      uint64_t v46 = v60;
      v37(v60, v68, v14);
      id v47 = *v41;
      (*v41)(v64, v23, v14);
      v47(v65, v46, v14);
      long long v48 = v67;
      DateInterval.init(start:end:)();
      uint64_t v49 = *(void (**)(char *, uint64_t))v59[0];
      (*(void (**)(char *, uint64_t))v59[0])(v46, v14);
      v49(v23, v14);
      v62(v48, 0, 1, v63);
      uint64_t v45 = (uint64_t)v48;
    }
    outlined assign with take of URL?(v45, v66, &demangling cache variable for type metadata for DateInterval?);
  }
  id v50 = v70;
  uint64_t v51 = specialized getMetadata<A>(_:key:as:)(v70, (void *)*MEMORY[0x263F56450]);
  if (v51)
  {
    uint64_t v52 = (void *)v51;

    id *v32 = v52;
  }
  uint64_t v53 = specialized getMetadata<A>(_:key:as:)(v50, (void *)*MEMORY[0x263F56498]);
  if (v53)
  {
    uint64_t v54 = v53;

    *((void *)v27 + 2) = v54;
  }
  uint64_t v55 = specialized getMetadata<A>(_:key:as:)(v50, (void *)*MEMORY[0x263F56448]);
  if (v55)
  {
    uint64_t v56 = v55;

    *((void *)v27 + 3) = v56;
  }
  v72[3] = v69;
  v72[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Workout.Details;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v72);
  outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v27, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.Workout.Details);
  v71(v72, 0);
  outlined destroy of URL?((uint64_t)v72, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestion.Workout.Details((uint64_t)v27, type metadata accessor for JournalingSuggestion.Workout.Details);
}

uint64_t closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, void *a2), void *), uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a1;
  v9[4] = a2;
  id v10 = a5;
  swift_retain();
  a3(partial apply for closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:), v9);

  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  outlined init with copy of URL?(a1, (uint64_t)v19, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  outlined init with take of JournalingSuggestionAsset?((uint64_t)v19, (uint64_t)(v14 + 4));
  v14[9] = a3;
  v14[10] = a4;
  v14[11] = a5;
  v14[12] = a2;
  id v15 = a3;
  swift_retain();
  id v16 = a2;
  _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5((uint64_t)v12, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:), (uint64_t)v14);
  return swift_release();
}

uint64_t closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[17] = a4;
  uint64_t v9 = type metadata accessor for UUID();
  v8[22] = v9;
  v8[23] = *(void *)(v9 - 8);
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  v8[27] = v10;
  v8[28] = *(void *)(v10 - 8);
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  v8[34] = type metadata accessor for JournalingSuggestion.Workout(0);
  v8[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  v8[36] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  v8[37] = v11;
  v8[38] = *(void *)(v11 - 8);
  v8[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:), 0, 0);
}

uint64_t closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)()
{
  uint64_t v1 = *(void *)(v0 + 304);
  outlined init with copy of URL?(*(void *)(v0 + 136), v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  id v2 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if (!*(void *)(v0 + 40))
  {
    uint64_t v29 = *(void *)(v0 + 288);
    uint64_t v28 = *(void *)(v0 + 296);
    outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    (*v2)(v29, 1, 1, v28);
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 288);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset);
  int v6 = swift_dynamicCast();
  uint64_t v7 = *v2;
  (*v2)(v5, v6 ^ 1u, 1, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
  {
LABEL_7:
    uint64_t v30 = *(void *)(v0 + 168);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    outlined destroy of URL?(*(void *)(v0 + 288), &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    *(void *)(v0 + 88) = 0;
    v31(v0 + 56, v30);
    outlined destroy of URL?(v0 + 56, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    goto LABEL_20;
  }
  uint64_t v8 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 296);
  uint64_t v11 = *(void *)(v0 + 272);
  uint64_t v10 = *(void *)(v0 + 280);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v14 = *(void **)(v0 + 144);
  outlined init with take of JournalingSuggestion.Workout(*(void *)(v0 + 288), v8, type metadata accessor for JournalingSuggestion.Workout.Details);
  outlined init with copy of JournalingSuggestion.Workout.Details(v8, v10, type metadata accessor for JournalingSuggestion.Workout.Details);
  v7(v10, 0, 1, v9);
  uint64_t v15 = v10 + *(int *)(v11 + 20);
  id v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v16(v15, 1, 1, v13);
  uint64_t v17 = *(int *)(v11 + 24);
  *(void *)(v10 + v17) = 0;
  id v18 = objc_msgSend(v14, sel_iconURL);
  uint64_t v74 = v17;
  uint64_t v75 = v15;
  v76 = v16;
  if (!v18)
  {
    v16(*(void *)(v0 + 208), 1, 1, *(void *)(v0 + 216));
LABEL_9:
    uint64_t v32 = *(void **)(v0 + 144);
    outlined destroy of URL?(*(void *)(v0 + 208), &demangling cache variable for type metadata for URL?);
    id v33 = (UIImage *)objc_msgSend(v32, sel_icon);
    if (!v33) {
      goto LABEL_17;
    }
    uint64_t v34 = *(void *)(v0 + 256);
    uint64_t v35 = *(void *)(v0 + 224);
    uint64_t v72 = *(void *)(v0 + 216);
    v73 = v33;
    uint64_t v37 = *(void *)(v0 + 184);
    uint64_t v36 = *(void *)(v0 + 192);
    uint64_t v38 = *(void *)(v0 + 176);
    id v39 = objc_msgSend(self, sel_defaultManager);
    id v40 = objc_msgSend(v39, sel_temporaryDirectory);

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
    uint64_t v41 = v73;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v42(v34, v72);
    uint64_t v43 = UIImageHEICRepresentation(v73);
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v71 = v10;
      uint64_t v46 = *(void *)(v0 + 240);
      uint64_t v45 = *(void *)(v0 + 248);
      uint64_t v47 = *(void *)(v0 + 216);
      uint64_t v48 = *(void *)(v0 + 224);
      uint64_t v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v51 = v50;

      outlined copy of Data._Representation(v49, v51);
    }
    else
    {
      uint64_t v52 = UIImagePNGRepresentation(v73);
      if (!v52)
      {
        uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 224) + 32);
        uint64_t v58 = v75;
        v57 = v76;
        goto LABEL_16;
      }
      uint64_t v53 = v52;
      uint64_t v71 = v10;
      uint64_t v45 = *(void *)(v0 + 248);
      uint64_t v48 = *(void *)(v0 + 224);
      uint64_t v46 = *(void *)(v0 + 232);
      uint64_t v47 = *(void *)(v0 + 216);
      uint64_t v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v51 = v54;

      outlined copy of Data._Representation(v49, v51);
    }
    URL.appendingPathExtension(_:)();
    outlined consume of Data._Representation(v49, v51);
    v42(v45, v47);
    uint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
    v55(v45, v46, v47);
    uint64_t v56 = v55;
    outlined copy of Data._Representation(v49, v51);
    Data.write(to:options:)();
    v57 = v76;
    outlined consume of Data?(v49, v51);
    outlined consume of Data._Representation(v49, v51);
    uint64_t v58 = v75;
    uint64_t v41 = v73;
    uint64_t v10 = v71;
LABEL_16:
    uint64_t v59 = *(void *)(v0 + 216);
    uint64_t v60 = *(void *)(v0 + 200);
    v56(v60, *(void *)(v0 + 248), v59);

    v57(v60, 0, 1, v59);
    outlined assign with take of URL?(v60, v58, &demangling cache variable for type metadata for URL?);
    goto LABEL_17;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)(v0 + 256);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v22 = *(void *)(v0 + 224);
  uint64_t v23 = *(void *)(v0 + 208);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v24 = v16;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
  v25(v23, v20, v21);
  v24(v23, 0, 1, v21);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v23, 1, v21) == 1) {
    goto LABEL_9;
  }
  uint64_t v26 = *(void *)(v0 + 264);
  uint64_t v27 = *(void *)(v0 + 216);
  v25(v26, *(void *)(v0 + 208), v27);
  outlined destroy of URL?(v15, &demangling cache variable for type metadata for URL?);
  v25(v15, v26, v27);
  v76(v15, 0, 1, v27);
LABEL_17:
  id v61 = objc_msgSend(*(id *)(v0 + 144), sel_route);
  if (v61)
  {
    id v62 = v61;
    id v63 = objc_msgSend(v61, sel_locationReadings);
    type metadata accessor for CLLocation();
    uint64_t v64 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRelease();
    *(void *)(v10 + v74) = v64;
  }
  uint64_t v65 = *(void *)(v0 + 312);
  uint64_t v66 = *(void *)(v0 + 280);
  v67 = *(void (**)(uint64_t, void))(v0 + 152);
  *(void *)(v0 + 120) = *(void *)(v0 + 272);
  *(void *)(v0 + 128) = &protocol witness table for JournalingSuggestion.Workout;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  outlined init with copy of JournalingSuggestion.Workout.Details(v66, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.Workout);
  v67(v0 + 96, 0);
  outlined destroy of JournalingSuggestion.Workout.Details(v65, type metadata accessor for JournalingSuggestion.Workout.Details);
  outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.Workout.Details(v66, type metadata accessor for JournalingSuggestion.Workout);
LABEL_20:
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
  uint64_t v69 = *(uint64_t (**)(void))(v0 + 8);
  return v69();
}

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
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
  outlined destroy of URL?(a1, &demangling cache variable for type metadata for TaskPriority?);
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

uint64_t specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (int *)type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v25[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = (char *)v12 + *(int *)(v10 + 20);
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a4, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  *uint64_t v12 = a3;
  uint64_t v16 = v9[6];
  *(void *)((char *)v12 + v16) = 0;
  uint64_t v17 = (void *)*MEMORY[0x263F56478];
  swift_bridgeObjectRetain();
  uint64_t v18 = specialized getMetadata<A>(_:key:as:)(a5, v17);
  if (v18) {
    *(void *)((char *)v12 + v16) = v18;
  }
  uint64_t v19 = v9[7];
  uint64_t v20 = (char *)v12 + v9[8];
  *(void *)((char *)v12 + v19) = specialized getMetadata<A>(_:key:as:)(a5, (void *)*MEMORY[0x263F56458]);
  *(void *)uint64_t v20 = specialized getMetadata<A>(_:key:as:)(a5, (void *)*MEMORY[0x263F56480]);
  v20[8] = v21 & 1;
  v25[3] = (uint64_t)v9;
  v25[4] = (uint64_t)&protocol witness table for JournalingSuggestion.WorkoutGroup;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v12, (uint64_t)boxed_opaque_existential_1, type metadata accessor for JournalingSuggestion.WorkoutGroup);
  a1(v25, 0);
  outlined destroy of URL?((uint64_t)v25, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  return outlined destroy of JournalingSuggestion.Workout.Details((uint64_t)v12, type metadata accessor for JournalingSuggestion.WorkoutGroup);
}

uint64_t (*specialized static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56490]);
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = v9;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = a1;
    id v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:);
  }
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_2444BF000, v16, v17, "Workout asset should carry .workoutHKType of type Int metadata", v18, 2u);
    MEMORY[0x245691070](v18, -1, -1);
  }

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  id v9 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    id v18 = objc_msgSend(a1, sel_metadata);
    uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&long long v32 = *MEMORY[0x263F56488];
    type metadata accessor for MOSuggestionAssetMetadataKey(0);
    lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
    id v20 = (id)v32;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v19 + 16) && (unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v34), (v22 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v19 + 56) + 32 * v21, (uint64_t)&v32);
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
    }
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable((uint64_t)v34);
    uint64_t v23 = *((void *)&v33 + 1);
    outlined destroy of URL?((uint64_t)&v32, &demangling cache variable for type metadata for Any?);
    if (!v23)
    {
      if (one-time initialization token for bridge != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)static Logger.bridge);
      id v25 = a1;
      uint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        v34[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        *(void *)&long long v32 = objc_msgSend(v25, sel_content, (void)v32);
        uint64_t v30 = String.init<A>(describing:)();
        *(void *)&long long v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2444BF000, v26, v27, "SuggestionWorkout.getAssetLoader, Unexpected content: %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245691070](v29, -1, -1);
        MEMORY[0x245691070](v28, -1, -1);
      }
      else
      {
      }
    }
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = specialized static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(a1);
  uint64_t v14 = v13;
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = v14;
    v16[4] = v11;
    return partial apply for closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:);
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
}

uint64_t (*specialized static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Workout(0);
  uint64_t v139 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v144 = (uint64_t)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v140 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v134 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v133 = (char *)&v105 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v105 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v131 = (char *)&v105 - v13;
  MEMORY[0x270FA5388](v12);
  v138 = (char *)&v105 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v15 - 8);
  v135 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  unint64_t v136 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  v146 = (uint64_t *)((char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v132 = (uint64_t)&v105 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v137 = (uint64_t)&v105 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v141 = (uint64_t)&v105 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v145 = (uint64_t)&v105 - v25;
  uint64_t v26 = type metadata accessor for URL();
  uint64_t v142 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v129 = v28;
  v130 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v105 - v29;
  id v31 = objc_msgSend(a1, sel_assetType);
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v34 = v33;
  if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v37 = (void *)*MEMORY[0x263F56460];
  specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56460]);
  if (v38) {
    return 0;
  }
  assetImageContentToUrl(_:)(a1, v30);
  uint64_t v39 = specialized getMetadata<A>(_:key:as:)(a1, v37);
  if (v40)
  {
    (*(void (**)(char *, uint64_t))(v142 + 8))(v30, v26);
    return 0;
  }
  uint64_t v41 = v39;
  uint64_t v42 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56488]);
  uint64_t v43 = (uint64_t *)v26;
  if (!v42)
  {
LABEL_10:
    if (one-time initialization token for bridge != -1) {
      goto LABEL_50;
    }
    goto LABEL_11;
  }
  uint64_t v44 = v42;
  if (*(void *)(v42 + 16) < v41)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v123 = v26;
  uint64_t v51 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F56470]);
  uint64_t v52 = a1;
  uint64_t v53 = MEMORY[0x263F8EE78];
  if (v51) {
    uint64_t v54 = v51;
  }
  else {
    uint64_t v54 = MEMORY[0x263F8EE78];
  }
  uint64_t v111 = v54;
  uint64_t v55 = (void *)*MEMORY[0x263F56468];
  v106 = v52;
  uint64_t result = (uint64_t (*)(void (*)(uint64_t *, void), uint64_t))specialized getMetadata<A>(_:key:as:)(v52, v55);
  if (result) {
    uint64_t v26 = (uint64_t)result;
  }
  else {
    uint64_t v26 = v53;
  }
  if (v41 < 0)
  {
    __break(1u);
LABEL_52:
    __break(1u);
    return result;
  }
  uint64_t v56 = v41;
  uint64_t v57 = v141;
  uint64_t v58 = v142;
  uint64_t v105 = v44;
  if (v56)
  {
    unint64_t v59 = *(void *)(v44 + 16);
    uint64_t v120 = v56;
    if (v56 - 1 < v59)
    {
      uint64_t v60 = v44;
      unint64_t v61 = 0;
      unint64_t v122 = *(void *)(v111 + 16);
      unint64_t v121 = *(void *)(v26 + 16);
      uint64_t v118 = v60 + 32;
      v128 = (uint64_t **)(v140 + 56);
      v127 = (void (**)(char *, char *, uint64_t))(v140 + 16);
      v117 = v146 + 1;
      v116 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v140 + 48);
      v108 = (void (**)(char *, uint64_t, uint64_t))(v140 + 32);
      v107 = (void (**)(char *, uint64_t))(v140 + 8);
      v115 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v136 + 56);
      v114 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v142 + 56);
      unint64_t v136 = MEMORY[0x263F8EE78];
      v109 = v11;
      v119 = v30;
      uint64_t v62 = (uint64_t)v135;
      uint64_t v113 = v26;
      uint64_t v110 = v2;
      while (1)
      {
        if (v61 >= v122)
        {
          uint64_t v43 = *v128;
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*v128)(v145, 1, 1, v4);
        }
        else
        {
          if (v61 >= *(void *)(v111 + 16))
          {
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            swift_once();
LABEL_11:
            uint64_t v45 = type metadata accessor for Logger();
            __swift_project_value_buffer(v45, (uint64_t)static Logger.bridge);
            uint64_t v46 = Logger.logObject.getter();
            os_log_type_t v47 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v46, v47))
            {
              uint64_t v48 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v48 = 0;
              _os_log_impl(&dword_2444BF000, v46, v47, "Can't get enough workout group activity types", v48, 2u);
              uint64_t v49 = v48;
              uint64_t v43 = (uint64_t *)v26;
              MEMORY[0x245691070](v49, -1, -1);
            }

            (*(void (**)(char *, uint64_t *))(v142 + 8))(v30, v43);
            return 0;
          }
          uint64_t v63 = v140;
          uint64_t v64 = v145;
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v140 + 16))(v145, v111+ ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))+ *(void *)(v63 + 72) * v61, v4);
          uint64_t v43 = *(uint64_t **)(v63 + 56);
          ((void (*)(uint64_t, void, uint64_t, uint64_t))v43)(v64, 0, 1, v4);
        }
        if (v61 >= v121)
        {
          uint64_t v65 = 1;
        }
        else
        {
          if (v61 >= *(void *)(v26 + 16)) {
            goto LABEL_49;
          }
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v140 + 16))(v57, v26+ ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80))+ *(void *)(v140 + 72) * v61, v4);
          uint64_t v65 = 0;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v43)(v57, v65, 1, v4);
        uint64_t v66 = *(void *)(v118 + 8 * v61);
        v67 = v146;
        uint64_t v68 = (uint64_t)v146 + *(int *)(v143 + 32);
        uint64_t v69 = v57;
        uint64_t v70 = type metadata accessor for DateInterval();
        uint64_t v71 = *(void *)(v70 - 8);
        uint64_t v72 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56);
        uint64_t v126 = v68;
        v125 = v72;
        uint64_t v124 = v71 + 56;
        v72(v68, 1, 1, v70);
        void *v67 = v66;
        v73 = v117;
        v117[1] = 0;
        v73[2] = 0;
        void *v73 = 0;
        uint64_t v74 = v137;
        uint64_t v43 = &demangling cache variable for type metadata for Date?;
        outlined init with copy of URL?(v145, v137, &demangling cache variable for type metadata for Date?);
        uint64_t v75 = *v116;
        if ((*v116)(v74, 1, v4) == 1)
        {
          outlined destroy of URL?(v74, &demangling cache variable for type metadata for Date?);
          uint64_t v76 = 1;
          uint64_t v77 = v123;
          uint64_t v78 = v143;
        }
        else
        {
          uint64_t v79 = v4;
          v80 = v138;
          v112 = *v108;
          v112(v138, v74, v79);
          uint64_t v81 = v69;
          uint64_t v82 = v132;
          outlined init with copy of URL?(v81, v132, &demangling cache variable for type metadata for Date?);
          v83 = *v127;
          v84 = v109;
          v85 = v80;
          uint64_t v4 = v79;
          (*v127)(v109, v85, v79);
          if (v75(v82, 1, v79) == 1)
          {
            v86 = v131;
            ((void (*)(char *))v112)(v131);
            outlined destroy of URL?(v82, &demangling cache variable for type metadata for Date?);
            v87 = v107;
          }
          else
          {
            v87 = v107;
            (*v107)(v84, v79);
            v86 = v131;
            v112(v131, v82, v79);
          }
          v88 = v138;
          v83(v133, v138, v79);
          v83(v134, v86, v79);
          v89 = v135;
          DateInterval.init(start:end:)();
          v90 = *v87;
          v91 = v86;
          uint64_t v62 = (uint64_t)v89;
          (*v87)(v91, v79);
          v90(v88, v79);
          uint64_t v76 = 0;
          uint64_t v2 = v110;
          uint64_t v78 = v143;
          uint64_t v43 = &demangling cache variable for type metadata for Date?;
          uint64_t v77 = v123;
        }
        v125(v62, v76, 1, v70);
        outlined assign with take of URL?(v62, v126, &demangling cache variable for type metadata for DateInterval?);
        uint64_t v92 = v144;
        outlined init with copy of JournalingSuggestion.Workout.Details((uint64_t)v146, v144, type metadata accessor for JournalingSuggestion.Workout.Details);
        (*v115)(v92, 0, 1, v78);
        (*v114)(v92 + *(int *)(v2 + 20), 1, 1, v77);
        *(void *)(v92 + *(int *)(v2 + 24)) = 0;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v30 = v119;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v136 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v136 + 16) + 1, 1, v136);
        }
        uint64_t v58 = v142;
        uint64_t v26 = v113;
        unint64_t v95 = *(void *)(v136 + 16);
        unint64_t v94 = *(void *)(v136 + 24);
        if (v95 >= v94 >> 1) {
          unint64_t v136 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v94 > 1, v95 + 1, 1, v136);
        }
        ++v61;
        unint64_t v96 = v136;
        *(void *)(v136 + 16) = v95 + 1;
        outlined init with take of JournalingSuggestion.Workout(v144, v96+ ((*(unsigned __int8 *)(v139 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v139 + 80))+ *(void *)(v139 + 72) * v95, type metadata accessor for JournalingSuggestion.Workout);
        uint64_t v57 = v141;
        outlined destroy of URL?(v141, &demangling cache variable for type metadata for Date?);
        outlined destroy of URL?(v145, &demangling cache variable for type metadata for Date?);
        outlined destroy of JournalingSuggestion.Workout.Details((uint64_t)v146, type metadata accessor for JournalingSuggestion.Workout.Details);
        if (v120 == v61) {
          goto LABEL_47;
        }
      }
    }
    goto LABEL_52;
  }
  unint64_t v136 = MEMORY[0x263F8EE78];
LABEL_47:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v97 = v123;
  v98 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  v99 = v130;
  v98(v130, v30, v123);
  unint64_t v100 = (*(unsigned __int8 *)(v58 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  unint64_t v101 = (v129 + v100 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v102 = swift_allocObject();
  *(void *)(v102 + 16) = v136;
  v98((char *)(v102 + v100), v99, v97);
  v103 = v106;
  *(void *)(v102 + v101) = v106;
  id v104 = v103;
  return partial apply for specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:);
}

uint64_t sub_2444CFEF0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return specialized closure #1 in static JournalingSuggestion.WorkoutGroup.getAssetLoader(for:inside:)(a1, a2, v7, v2 + v6, v8);
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey()
{
  unint64_t result = lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey)
  {
    type metadata accessor for MOSuggestionAssetMetadataKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey);
  }
  return result;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t sub_2444D0134()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, a2, *(void (**)(uint64_t (*)(uint64_t, void *), void *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_2444D0180()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1, void *a2)
{
  return closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_2444D01CC()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 56)) {
    __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  }

  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t outlined init with take of JournalingSuggestionAsset?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 4);
  uint64_t v7 = v1[9];
  uint64_t v8 = v1[10];
  uint64_t v10 = v1[11];
  uint64_t v9 = v1[12];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in closure #1 in static JournalingSuggestion.Workout.getAssetLoader(for:inside:)(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t outlined init with take of JournalingSuggestion.Workout(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t type metadata accessor for CLLocation()
{
  unint64_t result = lazy cache variable for type metadata for CLLocation;
  if (!lazy cache variable for type metadata for CLLocation)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLLocation);
  }
  return result;
}

uint64_t sub_2444D04E0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Workout.Details.getAssetLoader(for:inside:)(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t MOSuggestionAssetMotionActivityType.movementType.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  if (v2 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v4 == v5)
  {
    char v9 = 0;
    goto LABEL_13;
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  char v9 = 0;
  if (v7) {
    goto LABEL_14;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
    char v9 = 1;
    goto LABEL_13;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v15)
  {
    char v9 = 1;
    goto LABEL_14;
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  char v9 = 2;
  if (v16 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v18 == v19)
  {
LABEL_13:
    uint64_t result = swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v20) {
    char v9 = 2;
  }
  else {
    char v9 = 3;
  }
LABEL_14:
  *a1 = v9;
  return result;
}

uint64_t closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void (*a1)(long long *, void), uint64_t a2, void *a3, uint64_t a4)
{
  char v7 = (int *)type metadata accessor for JournalingSuggestion.MotionActivity(0);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = specialized getMetadata<A>(_:key:as:)(a3, (void *)*MEMORY[0x263F563E8]);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = v10;
    uint64_t v13 = specialized getMetadata<A>(_:key:as:)(a3, (void *)*MEMORY[0x263F563F0]);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      MOSuggestionAssetMotionActivityType.movementType.getter((char *)&v22);
      char v15 = v22;
      if (v22 != 3)
      {
        uint64_t v17 = type metadata accessor for URL();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
        uint64_t v18 = &v9[v7[6]];
        uint64_t v19 = type metadata accessor for DateInterval();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
        *(void *)&v9[v7[5]] = v12;
        uint64_t v20 = v7[7];
        v9[v20] = 3;
        outlined assign with copy of URL?(a4, (uint64_t)v9);
        v9[v20] = v15;
        *((void *)&v23 + 1) = v7;
        uint64_t v24 = &protocol witness table for JournalingSuggestion.MotionActivity;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v22);
        outlined init with copy of JournalingSuggestion.MotionActivity((uint64_t)v9, (uint64_t)boxed_opaque_existential_1);
        a1(&v22, 0);

        outlined destroy of JournalingSuggestionAsset?((uint64_t)&v22);
        return outlined destroy of JournalingSuggestion.MotionActivity((uint64_t)v9);
      }
    }
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  a1(&v22, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)&v22);
}

uint64_t (*specialized static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void *a1))(void (*a1)(long long *, void), uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v6 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v21[-v7];
  id v9 = objc_msgSend(a1, sel_assetType);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      return 0;
    }
  }
  assetImageContentToUrl(_:)(a1, v8);
  uint64_t v17 = type metadata accessor for URL();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 0, 1, v17);
  outlined init with take of URL?((uint64_t)v8, (uint64_t)v6);
  unint64_t v18 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  outlined init with take of URL?((uint64_t)v6, v19 + v18);
  id v20 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:);
}

uint64_t sub_2444D0B20()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(void (*a1)(long long *, void), uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v6 = *(void **)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return closure #1 in static JournalingSuggestion.MotionActivity.getAssetLoader(for:inside:)(a1, a2, v6, v7);
}

uint64_t outlined assign with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.MotionActivity(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, void *a3, void *a4)
{
  char v38 = a4;
  uint64_t v39 = a2;
  char v40 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v37 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for JournalingSuggestion.Podcast(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v13 + *(int *)(v11 + 24);
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = 1;
  uint64_t v36 = v14;
  uint64_t v34 = v16;
  v16((char *)v14, 1, 1, v15);
  uint64_t v18 = (uint64_t)v13 + *(int *)(v10 + 28);
  uint64_t v19 = type metadata accessor for Date();
  id v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v35 = v18;
  v20(v18, 1, 1, v19);
  id v21 = objc_msgSend(a3, sel_artistName);
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  v13[2] = v22;
  v13[3] = v24;
  id v25 = objc_msgSend(a3, sel_title);
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  *uint64_t v13 = v26;
  v13[1] = v28;
  id v29 = objc_msgSend(a3, sel_imageURL);
  if (v29)
  {
    uint64_t v30 = v29;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v17 = 0;
  }
  v34(v9, v17, 1, v15);
  outlined assign with take of URL?((uint64_t)v9, v36, &demangling cache variable for type metadata for URL?);
  uint64_t v31 = v37;
  specialized getMetadata<A>(_:key:as:)(v38, (void *)*MEMORY[0x263F563E0], v37);
  outlined assign with take of URL?(v31, v35, &demangling cache variable for type metadata for Date?);
  v41[3] = v10;
  v41[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Podcast;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  outlined init with copy of JournalingSuggestion.Podcast((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v40(v41, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v41);
  return outlined destroy of JournalingSuggestion.Podcast((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v9 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_13:
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    id v16 = a1;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = v20;
      *(_DWORD *)uint64_t v19 = 136315394;
      type metadata accessor for JournalingSuggestion.Podcast(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Podcast.Type);
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      id v23 = objc_msgSend(v16, sel_content, v26, v27);
      uint64_t v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444BF000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245691070](v20, -1, -1);
      MEMORY[0x245691070](v19, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v11 = v10;
  if (objc_msgSend(v10, sel_mediaType) == (id)2 || objc_msgSend(v11, sel_mediaType) == (id)5)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = a1;
    id v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_2444D1478()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Podcast.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined init with copy of JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Podcast(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Podcast(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Podcast(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getMetadataValue<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - v10;
  getMetadata<A>(_:key:as:)(a1, a2, a3, (uint64_t)&v24 - v10);
  uint64_t v12 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v11, a3);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for JournalingSuggestionsError();
  _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
  swift_allocError();
  uint64_t v14 = v13;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v15;
  v16._countAndFlagsBits = 8250;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  id v26 = (id)a3;
  swift_getMetatypeMetadata();
  v17._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  uint64_t v18 = v24;
  unint64_t v19 = v25;
  uint64_t v24 = 0x203A7465737341;
  unint64_t v25 = 0xE700000000000000;
  id v26 = objc_msgSend(a1, sel_content);
  v20._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  uint64_t v21 = v24;
  unint64_t v22 = v25;
  *uint64_t v14 = v18;
  v14[1] = v19;
  v14[2] = v21;
  v14[3] = v22;
  swift_storeEnumTagMultiPayload();
  return swift_willThrow();
}

uint64_t getMetadata<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  id v7 = objc_msgSend(a1, sel_metadata);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v14[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
  id v9 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v8 + 16) && (unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15), (v11 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v10, (uint64_t)v14);
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  int v12 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, v12 ^ 1u, 1, a3);
}

uint64_t getMetadata<A>(_:key:as:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  *(void *)&v13[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey, type metadata accessor for MOSuggestionAssetMetadataKey);
  id v8 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v14), (v10 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v13);
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  outlined destroy of AnyHashable((uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  int v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, v11 ^ 1u, 1, a3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

{
  uint64_t v2;
  uint64_t vars8;

  type metadata accessor for UUID();
  _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x245690750](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  unint64_t v19 = a1;
  unint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v20 = v2;
  id v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    char v10 = ~v8;
    id v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    int v12 = v5 + 16;
    int v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
      unint64_t v15 = dispatch thunk of static Equatable.== infix(_:_:)();
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

uint64_t _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Logger.bridge.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for bridge, (uint64_t)static Logger.bridge);
}

void *Logger.subystemPrefix.unsafeMutableAddressor()
{
  return &static Logger.subystemPrefix;
}

unint64_t static Logger.subystemPrefix.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.shared);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.shared);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.osLogger(category:)()
{
  swift_bridgeObjectRetain();

  return Logger.init(subsystem:category:)();
}

uint64_t Logger.shared.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for shared, (uint64_t)static Logger.shared);
}

uint64_t static Logger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for shared, (uint64_t)static Logger.shared, a1);
}

uint64_t one-time initialization function for picker()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.picker);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.picker);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.picker.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for picker, (uint64_t)static Logger.picker);
}

uint64_t static Logger.picker.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for picker, (uint64_t)static Logger.picker, a1);
}

uint64_t one-time initialization function for assets()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.assets);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.assets);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.assets.unsafeMutableAddressor()
{
  return Logger.bridge.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t)static Logger.assets);
}

uint64_t Logger.bridge.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for assets, (uint64_t)static Logger.assets, a1);
}

uint64_t one-time initialization function for bridge()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.bridge);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.bridge.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.shared.getter(&one-time initialization token for bridge, (uint64_t)static Logger.bridge, a1);
}

uint64_t static Logger.shared.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  char v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
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
  outlined destroy of URL?(a1, &demangling cache variable for type metadata for TaskPriority?);
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

BOOL static PlatformVersion.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 < a3 || a2 < a4;
}

uint64_t PlatformVersion.minor.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

BOOL static PlatformVersion.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance PlatformVersion(void *a1, void *a2)
{
  return *a1 < *a2 || a1[1] < a2[1];
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance PlatformVersion(void *a1, void *a2)
{
  return *a2 >= *a1 && a2[1] >= a1[1];
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance PlatformVersion(void *a1, void *a2)
{
  return *a1 >= *a2 && a1[1] >= a2[1];
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance PlatformVersion(void *a1, void *a2)
{
  return *a2 < *a1 || a2[1] < a1[1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PlatformVersion(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void one-time initialization function for DEFAULT_OPTIONS()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = specialized static SuggestionSheetManager.getClientPlatformVersion()();
  uint64_t v7 = v6;
  char v9 = v8;
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  BOOL v13 = (v9 & 1) == 0 && v5 > 17 && v7 >= 0;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F565B8]), sel_initWithShowCancelButton_showBlankEntryButton_peekDetentRatio_presentFullScreen_presentationIsAnimated_selectedTabIsRecommended_selectedSuggestionId_contentOptions_, 1, 1, 1, 1, 1, isa, 1.0, v13);

  static SuggestionSheetManager.DEFAULT_OPTIONS = (uint64_t)v14;
}

uint64_t *SuggestionSheetManager.DEFAULT_OPTIONS.unsafeMutableAddressor()
{
  if (one-time initialization token for DEFAULT_OPTIONS != -1) {
    swift_once();
  }
  return &static SuggestionSheetManager.DEFAULT_OPTIONS;
}

id static SuggestionSheetManager.DEFAULT_OPTIONS.getter()
{
  return static SuggestionSheetManager.DEFAULT_OPTIONS.getter(&one-time initialization token for DEFAULT_OPTIONS, (void **)&static SuggestionSheetManager.DEFAULT_OPTIONS);
}

id one-time initialization function for shared()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SuggestionSheetManager()), sel_init);
  static SuggestionSheetManager.shared = (uint64_t)result;
  return result;
}

id SuggestionSheetManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t *SuggestionSheetManager.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static SuggestionSheetManager.shared;
}

id static SuggestionSheetManager.shared.getter()
{
  return static SuggestionSheetManager.DEFAULT_OPTIONS.getter(&one-time initialization token for shared, (void **)&static SuggestionSheetManager.shared);
}

id static SuggestionSheetManager.DEFAULT_OPTIONS.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

id SuggestionSheetManager.presentationOptions.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions);
}

uint64_t SuggestionSheetManager.servicePickerViewState()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.servicePickerViewState();
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_83;
  char v9 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v13 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x245690630](0, v7, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

void closure #1 in SuggestionSheetManager.servicePickerViewState()(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x245691120](v1);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller);
    if (!v4)
    {
LABEL_35:

      return;
    }
    uint64_t v5 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock);
    uint64_t v7 = v4;
    objc_msgSend(v6, sel_lock);
    uint64_t v8 = &v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    uint64_t v9 = *(void *)&v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    int v10 = v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8];
    int v11 = &v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState];
    char v12 = v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8];
    if (v10)
    {
      if (!v3[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8]) {
        goto LABEL_10;
      }
    }
    else
    {
      if (v9 != *(void *)v11) {
        char v12 = 1;
      }
      if (v12)
      {
LABEL_10:
        objc_msgSend(*(id *)&v3[v5], sel_unlock);
        if (one-time initialization token for bridge != -1) {
          swift_once();
        }
        uint64_t v13 = type metadata accessor for Logger();
        __swift_project_value_buffer(v13, (uint64_t)static Logger.bridge);
        id v14 = v3;
        uint64_t v15 = Logger.logObject.getter();
        os_log_type_t v16 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 134218496;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v17 + 12) = 2048;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v17 + 22) = 2048;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl(&dword_2444BF000, v15, v16, "servicePickerViewState, target, %lu, targetView, %lu, view, %lu", (uint8_t *)v17, 0x20u);
          MEMORY[0x245691070](v17, -1, -1);

          if (v10) {
            goto LABEL_24;
          }
        }
        else
        {

          if (v10)
          {
LABEL_24:
            id v23 = Logger.logObject.getter();
            os_log_type_t v24 = static os_log_type_t.debug.getter();
            if (!os_log_type_enabled(v23, v24))
            {
              uint64_t v35 = v14;
              goto LABEL_34;
            }
            unint64_t v25 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v25 = 0;
            id v26 = "nil targetViewState, ignoring update";
            uint64_t v27 = v23;
            os_log_type_t v28 = v24;
            id v29 = v25;
            uint32_t v30 = 2;
LABEL_31:
            _os_log_impl(&dword_2444BF000, v27, v28, v26, v29, v30);
            uint64_t v35 = v23;
            MEMORY[0x245691070](v25, -1, -1);
            id v23 = v14;
LABEL_34:

            uint64_t v3 = (char *)v7;
            goto LABEL_35;
          }
        }
        char v18 = v8[8];
        unint64_t v19 = (char *)v14 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
        *(void *)unint64_t v19 = *(void *)v8;
        v19[8] = v18;
        if (v11[8])
        {
          if ((unint64_t)(v9 - 1) > 1) {
            goto LABEL_26;
          }
        }
        else if (*(void *)v11 || (unint64_t)(v9 - 1) >= 2)
        {
LABEL_26:
          uint64_t v31 = Logger.logObject.getter();
          os_log_type_t v32 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v33 = 0;
            _os_log_impl(&dword_2444BF000, v31, v32, "Posting picker state update: .dismissed", v33, 2u);
            MEMORY[0x245691070](v33, -1, -1);
          }

          -[NSObject updatePickerState:animated:](v7, sel_updatePickerState_animated_, 0, objc_msgSend(*(id *)((char *)&v14->isa+ OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions), sel_presentationIsAnimated));
          *(void *)unint64_t v19 = 0;
          v19[8] = 1;
LABEL_29:
          id v23 = Logger.logObject.getter();
          os_log_type_t v34 = static os_log_type_t.debug.getter();
          if (!os_log_type_enabled(v23, v34))
          {
            uint64_t v35 = v7;
            uint64_t v7 = v14;
            goto LABEL_34;
          }
          unint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v25 = 134217984;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          id v26 = "Expecting transition to %lu";
          uint64_t v27 = v23;
          os_log_type_t v28 = v34;
          id v29 = v25;
          uint32_t v30 = 12;
          goto LABEL_31;
        }
        Swift::String v20 = Logger.logObject.getter();
        os_log_type_t v21 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v20, v21))
        {
          unint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v22 = 0;
          _os_log_impl(&dword_2444BF000, v20, v21, "Requesting picker", v22, 2u);
          MEMORY[0x245691070](v22, -1, -1);
        }

        [v7 requestPickerWithOptions:*(Class *)((char *)&v14->isa+ OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions)];
        goto LABEL_29;
      }
    }
    *(void *)uint64_t v8 = 0;
    v8[8] = 1;
    goto LABEL_10;
  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t SuggestionSheetManager.remoteViewStateChangedTo(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  int v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:);
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_72;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x245690630](0, v10, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  return swift_release();
}

void closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v52 - v8;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x245691120](a1 + 16);
  if (v10)
  {
    int64_t v11 = v10;
    uint64_t v12 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
    int64_t v13 = v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
    if (*(unsigned char *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState + 8) != 1)
    {
      uint64_t v23 = *(void *)v13;
      *(void *)int64_t v13 = 0;
      *(unsigned char *)(v13 + 8) = 1;
      if ((*(unsigned char *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
        || v23 != *(void *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState))
      {
        int v53 = 1;
        if (!a2) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
      if (one-time initialization token for bridge != -1) {
        goto LABEL_49;
      }
      goto LABEL_9;
    }
    if (one-time initialization token for bridge != -1) {
      goto LABEL_47;
    }
LABEL_4:
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.bridge);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v15, v16)) {
      goto LABEL_12;
    }
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    char v18 = "No view state updated expected.";
    unint64_t v19 = v15;
    os_log_type_t v20 = v16;
    os_log_type_t v21 = v17;
    uint32_t v22 = 2;
LABEL_11:
    _os_log_impl(&dword_2444BF000, v19, v20, v18, v21, v22);
    MEMORY[0x245691070](v17, -1, -1);
    while (1)
    {
LABEL_12:

      int v53 = 0;
      if (a2)
      {
LABEL_13:
        uint64_t v26 = MEMORY[0x263F8EE80];
      }
      else
      {
LABEL_15:
        uint64_t v27 = (uint64_t *)(v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens);
        swift_beginAccess();
        uint64_t v26 = *v27;
        *uint64_t v27 = MEMORY[0x263F8EE80];
      }
      objc_msgSend(*(id *)(v11 + v12), sel_unlock, v52);
      int64_t v28 = 0;
      int64_t v29 = v11 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState;
      *(void *)int64_t v29 = a2;
      *(unsigned char *)(v29 + 8) = 0;
      uint64_t v30 = *(void *)(v26 + 64);
      uint64_t v54 = (void *)v11;
      uint64_t v55 = v26 + 64;
      uint64_t v31 = 1 << *(unsigned char *)(v26 + 32);
      uint64_t v32 = -1;
      if (v31 < 64) {
        uint64_t v32 = ~(-1 << v31);
      }
      unint64_t v33 = v32 & v30;
      int64_t v11 = (unint64_t)(v31 + 63) >> 6;
      int64_t v52 = v11 - 1;
      a2 = &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers);
      if ((v32 & v30) != 0) {
        break;
      }
LABEL_23:
      int64_t v46 = v28 + 1;
      if (__OFADD__(v28, 1))
      {
        __break(1u);
LABEL_47:
        swift_once();
        goto LABEL_4;
      }
      if (v46 >= v11) {
        goto LABEL_40;
      }
      unint64_t v47 = *(void *)(v55 + 8 * v46);
      if (v47) {
        goto LABEL_26;
      }
      int64_t v48 = v28 + 2;
      ++v28;
      if (v46 + 1 >= v11) {
        goto LABEL_40;
      }
      unint64_t v47 = *(void *)(v55 + 8 * v48);
      if (v47)
      {
LABEL_29:
        int64_t v46 = v48;
LABEL_26:
        unint64_t v33 = (v47 - 1) & v47;
        unint64_t v37 = __clz(__rbit64(v47)) + (v46 << 6);
        int64_t v28 = v46;
        goto LABEL_22;
      }
      int64_t v28 = v46 + 1;
      if (v46 + 2 >= v11) {
        goto LABEL_40;
      }
      unint64_t v47 = *(void *)(v55 + 8 * (v46 + 2));
      if (v47)
      {
        v46 += 2;
        goto LABEL_26;
      }
      int64_t v48 = v46 + 3;
      int64_t v28 = v46 + 2;
      if (v46 + 3 >= v11)
      {
LABEL_40:
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v7, 1, 1, v49);
        unint64_t v33 = 0;
        goto LABEL_41;
      }
      unint64_t v47 = *(void *)(v55 + 8 * v48);
      if (v47) {
        goto LABEL_29;
      }
      while (1)
      {
        int64_t v46 = v48 + 1;
        if (__OFADD__(v48, 1)) {
          break;
        }
        if (v46 >= v11)
        {
          int64_t v28 = v52;
          goto LABEL_40;
        }
        unint64_t v47 = *(void *)(v55 + 8 * v46);
        ++v48;
        if (v47) {
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_49:
      swift_once();
LABEL_9:
      uint64_t v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)static Logger.bridge);
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v15, v25))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 134217984;
        uint64_t v57 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        char v18 = "Completed transition to %lu";
        unint64_t v19 = v15;
        os_log_type_t v20 = v25;
        os_log_type_t v21 = v17;
        uint32_t v22 = 12;
        goto LABEL_11;
      }
    }
    while (1)
    {
      unint64_t v36 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      unint64_t v37 = v36 | (v28 << 6);
LABEL_22:
      uint64_t v38 = *(void *)(v26 + 48);
      uint64_t v39 = type metadata accessor for UUID();
      (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v7, v38 + *(void *)(*(void *)(v39 - 8) + 72) * v37, v39);
      uint64_t v40 = *(void *)(v26 + 56) + 32 * v37;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
      uint64_t v42 = &v7[*(int *)(v41 + 48)];
      uint64_t v43 = *(void *)v40;
      uint64_t v44 = *(void *)(v40 + 24);
      long long v56 = *(_OWORD *)(v40 + 8);
      long long v45 = v56;
      *(void *)uint64_t v42 = v43;
      *(_OWORD *)(v42 + 8) = v45;
      *((void *)v42 + 3) = v44;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v7, 0, 1, v41);
      swift_retain();
      swift_retain();
LABEL_41:
      outlined init with take of JournalingSuggestion.ItemContent?((uint64_t)v7, (uint64_t)v9, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48))(v9, 1, v50) == 1) {
        break;
      }
      os_log_type_t v34 = &v9[*(int *)(v50 + 48)];
      uint64_t v12 = *((void *)v34 + 1);
      (*((void (**)(void))v34 + 2))();
      swift_release();
      swift_release();
      uint64_t v35 = type metadata accessor for UUID();
      (*(void (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8))(v9, v35);
      if (!v33) {
        goto LABEL_23;
      }
    }
    swift_release();
    uint64_t v51 = v54;
    if (v53) {
      SuggestionSheetManager.servicePickerViewState()();
    }
  }
}

Swift::Bool __swiftcall SuggestionSheetManager.activate()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v19 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_sharedApplication);
  id v9 = objc_msgSend(v8, sel_connectedScenes);

  type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
  lazy protocol witness table accessor for type UIScene and conformance NSObject();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v11 = (void *)specialized Collection.first.getter(v10);
  Swift::Bool result = swift_bridgeObjectRelease();
  if (v11)
  {
    self;
    uint64_t v13 = swift_dynamicCastObjCClassUnconditional();
    if (*(void *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
    {

      return (*(unsigned char *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState + 8) & 1) == 0
          && (unint64_t)(*(void *)(v0
                                          + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState)
                              - 1) < 2;
    }
    else
    {
      uint64_t v14 = v13;
      v18[1] = *(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue);
      uint64_t v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v15;
      *(void *)(v16 + 24) = v14;
      aBlock[4] = partial apply for closure #1 in SuggestionSheetManager.activate();
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_0;
      uint64_t v17 = _Block_copy(aBlock);
      swift_retain();
      v18[0] = v11;
      static DispatchQoS.unspecified.getter();
      uint64_t v20 = MEMORY[0x263F8EE78];
      lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x245690630](0, v7, v4, v17);
      _Block_release(v17);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
      swift_release();
      swift_release();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized Collection.first.getter(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    uint64_t v6 = __CocoaSet.endIndex.getter();
    char v8 = MEMORY[0x2456906F0](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      outlined consume of Set<UIScene>.Index._Variant(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    specialized Set.subscript.getter(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    outlined consume of Set<UIScene>.Index._Variant(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = specialized _NativeSet.startIndex.getter(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = specialized Dictionary.startIndex.getter(a1);
  if (v9) {
    goto LABEL_9;
  }
  if (*(_DWORD *)(a1 + 36) != v8)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    return v10(a2, 1, 1, v4);
  }
  else
  {
    uint64_t v11 = (uint64_t *)&v6[*(int *)(v4 + 48)];
    uint64_t v12 = specialized Dictionary.subscript.getter((uint64_t)v6, result, v8, 0, a1);
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    *uint64_t v11 = v12;
    v11[1] = v13;
    void v11[2] = v15;
    v11[3] = v17;
    uint64_t v19 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 16))(a2, v6, v19);
    uint64_t v20 = (uint64_t *)(a2 + *(int *)(v4 + 48));
    *uint64_t v20 = v12;
    v20[1] = v14;
    v20[2] = v16;
    v20[3] = v18;
    swift_retain();
    swift_retain();
    outlined destroy of URL?((uint64_t)v6, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(a2, 0, 1, v4);
  }
}

void closure #1 in SuggestionSheetManager.activate()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x245691120](v3);
  if (v4)
  {
    uint64_t v5 = (char *)v4;
    uint64_t v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller;
    if (!*(void *)(v4 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
    {
      if (one-time initialization token for bridge != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      __swift_project_value_buffer(v7, (uint64_t)static Logger.bridge);
      int v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_2444BF000, v8, v9, "Activating JournalingSuggestionsPicker", v10, 2u);
        MEMORY[0x245691070](v10, -1, -1);
      }

      id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F565B0]), sel_initForScene_, a2);
      objc_msgSend(v11, sel_setDelegate_, v5);
      uint64_t v12 = *(void **)&v5[v6];
      *(void *)&v5[v6] = v11;
      uint64_t v13 = (char *)v11;

      objc_msgSend(v13, sel_activate);
      uint64_t v5 = v13;
    }
  }
}

uint64_t SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v35 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  *(void *)(v18 + 24) = a5;
  if (*(void *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller))
  {
    uint64_t v19 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    uint64_t v20 = *(void **)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock);
    swift_retain();
    objc_msgSend(v20, sel_lock);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
    uint64_t v21 = (uint64_t *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens);
    swift_beginAccess();
    swift_retain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v36 = *v21;
    *uint64_t v21 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v35, a3, (uint64_t)partial apply for closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:), v18, (uint64_t)v17, isUniquelyReferenced_nonNull_native);
    *uint64_t v21 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    swift_endAccess();
    objc_msgSend(*(id *)(v6 + v19), sel_unlock);
    objc_msgSend(*(id *)(v6 + v19), sel_lock);
    uint64_t v23 = v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(unsigned char *)(v6 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(void *)v23 != 2)
    {
      *(void *)uint64_t v23 = 2;
      *(unsigned char *)(v23 + 8) = 0;
    }
    objc_msgSend(*(id *)(v6 + v19), sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
  }
  else
  {
    uint64_t v24 = one-time initialization token for bridge;
    swift_retain();
    if (v24 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)static Logger.bridge);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      int64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v28 = 0;
      _os_log_impl(&dword_2444BF000, v26, v27, "Can't show suggestions picker, not activated", v28, 2u);
      MEMORY[0x245691070](v28, -1, -1);
    }

    uint64_t v29 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v13, 1, 1, v29);
    type metadata accessor for MainActor();
    swift_retain();
    uint64_t v30 = static MainActor.shared.getter();
    uint64_t v31 = (void *)swift_allocObject();
    uint64_t v32 = MEMORY[0x263F8F500];
    v31[2] = v30;
    v31[3] = v32;
    v31[4] = a4;
    v31[5] = a5;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:), (uint64_t)v31);
    swift_release();
  }
  return swift_release();
}

uint64_t closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v8 = static MainActor.shared.getter();
  os_log_type_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = a1;
  v9[5] = a2;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)partial apply, (uint64_t)v9);
  return swift_release();
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  type metadata accessor for MainActor();
  v5[4] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:), v7, v6);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  uint64_t v2 = swift_release();
  v1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

BOOL static SuggestionSheetManager.DismissReason.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void SuggestionSheetManager.DismissReason.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int SuggestionSheetManager.DismissReason.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SuggestionSheetManager.DismissReason(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SuggestionSheetManager.DismissReason()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SuggestionSheetManager.DismissReason()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SuggestionSheetManager.DismissReason()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id SuggestionSheetManager.dismiss(presentationToken:reason:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  int v5 = a2 & 1;
  uint64_t v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  uint64_t v7 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens;
  swift_beginAccess();
  uint64_t v8 = specialized Dictionary._Variant.removeValue(forKey:)(a1);
  swift_endAccess();
  outlined consume of SuggestionSheetManager.TrackingHandlers?(v8);
  uint64_t v9 = *(void *)(*(void *)v7 + 16);
  id result = objc_msgSend(*(id *)(v3 + v6), sel_unlock);
  if (v9) {
    BOOL v11 = v5 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    objc_msgSend(*(id *)(v3 + v6), sel_lock);
    uint64_t v12 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(void *)v12)
    {
      *(void *)uint64_t v12 = 0;
      *(unsigned char *)(v12 + 8) = 0;
    }
    objc_msgSend(*(id *)(v3 + v6), sel_unlock);
    return (id)SuggestionSheetManager.servicePickerViewState()();
  }
  return result;
}

Swift::Void __swiftcall SuggestionSheetManager.onApplicationMovedToForeground()()
{
  Swift::UInt v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) == 0)
  {
    uint64_t v2 = *v1;
    if ((unint64_t)(*v1 - 3) >= 0xFFFFFFFFFFFFFFFELL)
    {
      uint64_t v3 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
      objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
      *Swift::UInt v1 = v2;
      *((unsigned char *)v1 + 8) = 0;
      uint64_t v4 = v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState;
      *(void *)uint64_t v4 = 0;
      *(unsigned char *)(v4 + 8) = 1;
      uint64_t v5 = v0 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState;
      *(void *)uint64_t v5 = 0;
      *(unsigned char *)(v5 + 8) = 1;
      objc_msgSend(*(id *)(v0 + v3), sel_unlock);
      SuggestionSheetManager.servicePickerViewState()();
    }
  }
}

uint64_t SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(uint64_t a1, uint64_t a2)
{
  return specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(a2);
}

void SuggestionSheetManager.suggestionSheetControllerShouldShowBlankComposeView(_:)()
{
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_2444BF000, oslog, v1, "Picker:BCV", v2, 2u);
    MEMORY[0x245691070](v2, -1, -1);
  }
}

void SuggestionSheetManager.suggestionSheetControllerShouldShowMomentsValidator(_:)()
{
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.bridge);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_2444BF000, oslog, v1, "Picker:MV", v2, 2u);
    MEMORY[0x245691070](v2, -1, -1);
  }
}

uint64_t SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  v3[7] = a3;
  v3[8] = ObjectType;
  v3[5] = a1;
  v3[6] = a2;
  type metadata accessor for Date();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:), 0, 0);
}

uint64_t SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  uint64_t v1 = v0[4].i64[0];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [JournalingSuggestion.ItemContent]);
  uint64_t v4 = (int8x16_t *)swift_task_alloc();
  v0[5].i64[1] = (uint64_t)v4;
  v4[1] = vextq_s8(v0[3], v0[3], 8uLL);
  v4[2].i64[0] = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6].i64[0] = (uint64_t)v5;
  void *v5 = v0;
  v5[1] = SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
  return MEMORY[0x270FA2158](&v0[1], v2, v3, 0, 0, &async function pointer to partial apply for closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:), v4, v2);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t (*v27)(void);
  uint64_t v29;
  uint64_t v30;

  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[7];
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v2 != v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v2 != v4)
      {
LABEL_4:
        if (one-time initialization token for bridge != -1) {
          swift_once();
        }
        uint64_t v5 = type metadata accessor for Logger();
        __swift_project_value_buffer(v5, (uint64_t)static Logger.bridge);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v6 = Logger.logObject.getter();
        uint64_t v7 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v6, v7))
        {
          uint64_t v8 = swift_slowAlloc();
          *(_DWORD *)uint64_t v8 = 134218240;
          v0[3] = v4;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v8 + 12) = 2048;
          v0[4] = v2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2444BF000, v6, v7, "assets input count=%ld, output count=%ld", (uint8_t *)v8, 0x16u);
          MEMORY[0x245691070](v8, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
    uint64_t v16 = (void *)v0[5];
    uint64_t v15 = (void *)v0[6];
    uint64_t v17 = objc_msgSend(v15, sel_title);
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    uint64_t v20 = type metadata accessor for JournalingSuggestion(0);
    uint64_t v21 = (char *)v16 + *(int *)(v20 + 24);
    uint64_t v22 = objc_msgSend(v15, sel_startDate);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v23 = objc_msgSend(v15, sel_endDate);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    DateInterval.init(start:end:)();
    uint64_t v24 = type metadata accessor for DateInterval();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v21, 0, 1, v24);
    uint64_t v25 = objc_msgSend(v15, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v26 = NSObject.hashValue.getter();
    *uint64_t v16 = v1;
    v16[1] = v29;
    v16[2] = v19;
    *(void *)((char *)v16 + *(int *)(v20 + 32)) = v26;
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 0, 1, v20);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.bridge);
  uint64_t v10 = Logger.logObject.getter();
  BOOL v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_2444BF000, v10, v11, "Error: No valid representation available for asset, dropping, asset type", v12, 2u);
    MEMORY[0x245691070](v12, -1, -1);
  }
  uint64_t v13 = v0[5];

  uint64_t v14 = type metadata accessor for JournalingSuggestion(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
LABEL_16:
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a3;
  v4[13] = a4;
  v4[10] = a1;
  v4[11] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent??);
  v4[20] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskGroup<JournalingSuggestion.ItemContent?>.Iterator);
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:), 0, 0);
}

uint64_t closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  uint64_t v57 = v0;
  unint64_t v1 = v0[12];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v2 = v3;
    if (!v3) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v3 = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_30;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return MEMORY[0x270FA1E80](v3, v4, v5);
  }
  uint64_t v6 = 0;
  uint64_t v49 = v0 + 9;
  unint64_t v53 = v1 & 0xC000000000000001;
  uint64_t v50 = v0[12] + 32;
  uint64_t v51 = v0 + 2;
  uint64_t v48 = MEMORY[0x263F8EE58] + 8;
  uint64_t v55 = v0;
  uint64_t v52 = v2;
  do
  {
    if (v53) {
      id v8 = (id)MEMORY[0x245690790](v6, v0[12]);
    }
    else {
      id v8 = *(id *)(v50 + 8 * v6);
    }
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_assetType, v48);
    BOOL v11 = specialized static SuggestionSheetManager.content(bySpiType:)();

    if (v11)
    {
      if (one-time initialization token for bridge != -1) {
        swift_once();
      }
      uint64_t v54 = v11;
      uint64_t v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)static Logger.bridge);
      id v13 = v9;
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v56 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        id v18 = objc_msgSend(v13, sel_assetType);
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v21 = v20;

        uint64_t v0 = v55;
        *(void *)(v16 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v56);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2444BF000, v14, v15, "Got asset with internal asset type: %s", (uint8_t *)v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245691070](v17, -1, -1);
        MEMORY[0x245691070](v16, -1, -1);
      }
      else
      {
      }
      uint64_t v30 = v0[14];
      uint64_t v31 = v0[15];
      uint64_t v32 = (void *)v55[13];
      uint64_t v33 = type metadata accessor for TaskPriority();
      uint64_t v34 = *(void *)(v33 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v31, 1, 1, v33);
      uint64_t v35 = (void *)swift_allocObject();
      v35[2] = 0;
      v35[3] = 0;
      v35[4] = v54;
      v35[5] = v13;
      v35[6] = v32;
      outlined init with copy of URL?(v31, v30, &demangling cache variable for type metadata for TaskPriority?);
      LODWORD(v30) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v30, 1, v33);
      id v36 = v13;
      id v37 = v32;
      uint64_t v0 = v55;
      uint64_t v38 = v55[14];
      if (v30 == 1)
      {
        outlined destroy of URL?(v55[14], &demangling cache variable for type metadata for TaskPriority?);
      }
      else
      {
        TaskPriority.rawValue.getter();
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v38, v33);
      }
      uint64_t v2 = v52;
      if (v35[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v39 = dispatch thunk of Actor.unownedExecutor.getter();
        uint64_t v41 = v40;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v39 = 0;
        uint64_t v41 = 0;
      }
      uint64_t v42 = *(void *)v55[11];
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = &async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
      *(void *)(v43 + 24) = v35;
      uint64_t v44 = (void *)(v41 | v39);
      if (v41 | v39)
      {
        uint64_t v44 = v51;
        void *v51 = 0;
        v51[1] = 0;
        v55[4] = v39;
        v55[5] = v41;
      }
      uint64_t v7 = v55[15];
      v55[6] = 1;
      v55[7] = v44;
      v55[8] = v42;
      swift_task_create();

      swift_release();
      outlined destroy of URL?(v7, &demangling cache variable for type metadata for TaskPriority?);
    }
    else
    {
      if (one-time initialization token for bridge != -1) {
        swift_once();
      }
      uint64_t v22 = type metadata accessor for Logger();
      __swift_project_value_buffer(v22, (uint64_t)static Logger.bridge);
      id v23 = v9;
      uint64_t v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v56 = v27;
        *(_DWORD *)uint64_t v26 = 136315138;
        *uint64_t v49 = objc_msgSend(v23, sel_assetType);
        type metadata accessor for MOSuggestionAssetsType(0);
        uint64_t v28 = String.init<A>(describing:)();
        *(void *)(v26 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v56);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2444BF000, v24, v25, "Error: Not implemented internal asset type: %s", (uint8_t *)v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245691070](v27, -1, -1);
        MEMORY[0x245691070](v26, -1, -1);
      }
      else
      {
      }
    }
    ++v6;
  }
  while (v2 != v6);
LABEL_30:
  swift_bridgeObjectRelease();
  TaskGroup.makeAsyncIterator()();
  v0[28] = MEMORY[0x263F8EE78];
  uint64_t v45 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type TaskGroup<JournalingSuggestion.ItemContent?>.Iterator and conformance TaskGroup<A>.Iterator, &demangling cache variable for type metadata for TaskGroup<JournalingSuggestion.ItemContent?>.Iterator);
  int64_t v46 = (void *)swift_task_alloc();
  v0[29] = v46;
  *int64_t v46 = v0;
  v46[1] = closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
  uint64_t v4 = v0[25];
  uint64_t v3 = v0[20];
  uint64_t v5 = v45;
  return MEMORY[0x270FA1E80](v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v9;

  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 216);
    uint64_t v6 = v2 + 200;
    uint64_t v4 = *(void *)(v2 + 200);
    uint64_t v5 = *(void *)(v6 + 8);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v7 = destructiveProjectEnumData for JournalingSuggestionsError;
  }
  else
  {
    uint64_t v7 = closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  unint64_t v1 = v0[20];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[22] + 48))(v1, 1, v0[21]) == 1)
  {
    uint64_t v2 = v0[28];
    uint64_t v3 = (void *)v0[10];
    (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
    outlined destroy of URL?(v1, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent??);
    *uint64_t v3 = v2;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v7 = v0[23];
    uint64_t v6 = v0[24];
    id v8 = v0[16];
    uint64_t v9 = v0[17];
    outlined init with take of JournalingSuggestion.ItemContent?(v1, v6, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    outlined init with copy of URL?(v6, v7, &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      outlined destroy of URL?(v0[23], &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
      id v10 = v0[28];
    }
    else
    {
      uint64_t v12 = v0[18];
      BOOL v11 = v0[19];
      outlined init with take of JournalingSuggestion.ItemContent(v0[23], v11, type metadata accessor for JournalingSuggestion.ItemContent);
      outlined init with copy of JournalingSuggestionsError(v11, v12, type metadata accessor for JournalingSuggestion.ItemContent);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v10 = v0[28];
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        id v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v10 + 16) + 1, 1, v0[28]);
      }
      os_log_type_t v15 = *(void *)(v10 + 16);
      uint64_t v14 = *(void *)(v10 + 24);
      uint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        uint64_t v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v14 > 1, v15 + 1, 1, v10);
        uint64_t v16 = v15 + 1;
        id v10 = v24;
      }
      uint64_t v17 = v0[18];
      id v18 = v0[19];
      uint64_t v19 = v0[17];
      *(void *)(v10 + 16) = v16;
      outlined init with take of JournalingSuggestion.ItemContent(v17, v10+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v15, type metadata accessor for JournalingSuggestion.ItemContent);
      _s21JournalingSuggestions0aB5ErrorOWOhTm_0(v18, type metadata accessor for JournalingSuggestion.ItemContent);
    }
    outlined destroy of URL?(v0[24], &demangling cache variable for type metadata for JournalingSuggestion.ItemContent?);
    v0[28] = v10;
    unint64_t v20 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type TaskGroup<JournalingSuggestion.ItemContent?>.Iterator and conformance TaskGroup<A>.Iterator, &demangling cache variable for type metadata for TaskGroup<JournalingSuggestion.ItemContent?>.Iterator);
    unint64_t v21 = (void *)swift_task_alloc();
    v0[29] = v21;
    *unint64_t v21 = v0;
    v21[1] = closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:);
    uint64_t v22 = v0[25];
    id v23 = v0[20];
    return MEMORY[0x270FA1E80](v23, v22, v20);
  }
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  uint64_t v7 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v6[15] = v7;
  v6[16] = *(void *)(v7 - 8);
  v6[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:), 0, 0);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 96);
  UUID.init()();
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  *(void *)(v1 + *(int *)(v2 + 20)) = MEMORY[0x263F8EE78];
  uint64_t v49 = v2;
  *(void *)(v1 + *(int *)(v2 + 24)) = v4;
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    uint64_t v6 = (uint64_t *)(*(void *)(v0 + 96) + 32);
    swift_bridgeObjectRetain();
    do
    {
      long long v50 = *(_OWORD *)v6;
      uint64_t v8 = JournalingSuggestion.ItemContent.getContentProviderOfType<A>(assetType:for:inside:)(*v6, *(void **)(v0 + 104), *(void *)(v0 + 112), *v6, v6[1]);
      if (v8)
      {
        uint64_t v12 = v8;
        uint64_t v13 = v9;
        uint64_t v14 = v10;
        uint64_t v15 = v11;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, v4);
        }
        unint64_t v17 = v4[2];
        unint64_t v16 = v4[3];
        if (v17 >= v16 >> 1) {
          uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v4);
        }
        v4[2] = v17 + 1;
        uint64_t v7 = &v4[6 * v17];
        v7[4] = v12;
        void v7[5] = v13;
        v7[6] = v14;
        v7[7] = v15;
        *((_OWORD *)v7 + 4) = v50;
        outlined consume of InternalAssetContent.AssetProvider?(v12);
      }
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  if (v4[2])
  {
    JournalingSuggestion.ItemContent.appendAssetContent(_:)((Swift::OpaquePointer)v4);
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Logger.bridge);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = *(void *)(v0 + 136);
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v51 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_beginAccess();
      uint64_t v24 = *(void *)(v21 + *(int *)(v49 + 20));
      swift_bridgeObjectRetain();
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestionAsset.Type);
      uint64_t v26 = MEMORY[0x245690490](v24, v25);
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v28, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444BF000, v19, v20, "Got asset representations: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245691070](v23, -1, -1);
      MEMORY[0x245691070](v22, -1, -1);
    }

    uint64_t v30 = *(void *)(v0 + 128);
    uint64_t v29 = *(void *)(v0 + 136);
    uint64_t v31 = *(void *)(v0 + 120);
    uint64_t v32 = *(void *)(v0 + 88);
    swift_beginAccess();
    outlined init with copy of JournalingSuggestionsError(v29, v32, type metadata accessor for JournalingSuggestion.ItemContent);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 56))(v32, 0, 1, v31);
  }
  else
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v33 = *(void **)(v0 + 104);
    uint64_t v34 = type metadata accessor for Logger();
    __swift_project_value_buffer(v34, (uint64_t)static Logger.bridge);
    id v35 = v33;
    id v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = *(void *)(v0 + 88);
    uint64_t v40 = *(void *)(v0 + 120);
    uint64_t v41 = *(void *)(v0 + 128);
    uint64_t v42 = *(void **)(v0 + 104);
    if (v38)
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v51 = v44;
      *(_DWORD *)uint64_t v43 = 136315138;
      *(void *)(v0 + 72) = objc_msgSend(v42, sel_assetType);
      type metadata accessor for MOSuggestionAssetsType(0);
      uint64_t v45 = String.init<A>(describing:)();
      *(void *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2444BF000, v36, v37, "Error: Couldn't load any representation for asset of type: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245691070](v44, -1, -1);
      MEMORY[0x245691070](v43, -1, -1);

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v39, 1, 1, v40);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v39, 1, 1, v40);
    }
  }
  _s21JournalingSuggestions0aB5ErrorOWOhTm_0(*(void *)(v0 + 136), type metadata accessor for JournalingSuggestion.ItemContent);
  swift_task_dealloc();
  unint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

uint64_t SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](SuggestionSheetManager.getAssetsFor(suggestion:), 0, 0);
}

uint64_t SuggestionSheetManager.getAssetsFor(suggestion:)()
{
  uint64_t v1 = *(void **)(v0[4] + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller);
  v0[5] = v1;
  if (v1)
  {
    uint64_t v2 = v0[3];
    uint64_t v3 = swift_task_alloc();
    v0[6] = v3;
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    id v4 = v1;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[7] = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MOSuggestionAsset]);
    void *v5 = v0;
    v5[1] = SuggestionSheetManager.getAssetsFor(suggestion:);
    return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000019, 0x80000002445014B0, partial apply for closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:), v3, v6);
  }
  else
  {
    type metadata accessor for JournalingSuggestionsError();
    lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
    swift_allocError();
    void *v7 = 0xD000000000000028;
    v7[1] = 0x8000000244501480;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = SuggestionSheetManager.getAssetsFor(suggestion:);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = SuggestionSheetManager.getAssetsFor(suggestion:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v10 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = partial apply for closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [MOSuggestionAsset<Swift.AnyObject>]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_53;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a3;
  swift_release();
  objc_msgSend(a2, sel_getAssetsForSuggestion_withTypes_onAssetsCallback_, v12, 0, v11);
  _Block_release(v11);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(unint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for JournalingSuggestionsError();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (unint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    uint64_t v14 = one-time initialization token for bridge;
    swift_bridgeObjectRetain();
    if (v14 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain_n();
    unint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134217984;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      unint64_t v27 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444BF000, v16, v17, "got %ld assets from system picker", v18, 0xCu);
      MEMORY[0x245691070](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v27 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    return CheckedContinuation.resume(returning:)();
  }
  else if (a2)
  {
    unint64_t v27 = (unint64_t)a2;
    id v20 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    unint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    swift_bridgeObjectRelease();
    unint64_t v27 = 0xD000000000000023;
    unint64_t v28 = 0x80000002445014F0;
    id v22 = objc_msgSend(a4, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    unint64_t v24 = v28;
    *uint64_t v13 = v27;
    v13[1] = v24;
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
    uint64_t v25 = swift_allocError();
    outlined init with copy of JournalingSuggestionsError((uint64_t)v13, v26, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
    unint64_t v27 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
    CheckedContinuation.resume(throwing:)();
    return _s21JournalingSuggestions0aB5ErrorOWOhTm_0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for JournalingSuggestionsError);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [MOSuggestionAsset<Swift.AnyObject>]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MOSuggestionAsset);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v58 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v61 = *(void *)(v13 - 8);
  uint64_t v62 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.bridge);
  id v18 = a3;
  uint64_t v60 = v17;
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v59 = a2;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    id v63 = v18;
    uint64_t v23 = v22;
    uint64_t v57 = swift_slowAlloc();
    uint64_t v64 = a2;
    v65[0] = v57;
    *(_DWORD *)uint64_t v23 = 134218242;
    v56[2] = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v23 + 12) = 2080;
    v56[1] = v23 + 14;
    id v24 = objc_msgSend(v63, sel_suggestionIdentifier);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    lazy protocol witness table accessor for type UUID and conformance UUID((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t v25 = v12;
    uint64_t v26 = v62;
    uint64_t v27 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v28 = v4;
    uint64_t v29 = v9;
    unint64_t v31 = v30;
    uint64_t v32 = v26;
    uint64_t v12 = v25;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v15, v32);
    uint64_t v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v31, v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v9 = v29;
    uint64_t v4 = v28;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2444BF000, v19, v20, "sheet delegate shouldPerform:%lu, for:'%s'", (uint8_t *)v23, 0x16u);
    uint64_t v33 = v57;
    swift_arrayDestroy();
    MEMORY[0x245691070](v33, -1, -1);
    uint64_t v34 = v23;
    id v18 = v63;
    MEMORY[0x245691070](v34, -1, -1);
  }
  else
  {
  }
  uint64_t v35 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock], sel_lock);
  swift_beginAccess();
  uint64_t v36 = swift_bridgeObjectRetain();
  specialized Collection.first.getter(v36, (uint64_t)v12);
  swift_bridgeObjectRelease();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers));
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 48))(v12, 1, v37) == 1)
  {
    outlined destroy of URL?((uint64_t)v12, &demangling cache variable for type metadata for (key: UUID, value: SuggestionSheetManager.TrackingHandlers)?);
    objc_msgSend(*(id *)&v4[v35], sel_unlock);
    objc_msgSend(*(id *)&v4[v35], sel_lock);
    BOOL v38 = &v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
    if ((v4[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8] & 1) != 0
      || *(void *)v38)
    {
      *(void *)BOOL v38 = 0;
      v38[8] = 0;
    }
    objc_msgSend(*(id *)&v4[v35], sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_2444BF000, v39, v40, "Ignoring selection, sheet already dismissed", v41, 2u);
      MEMORY[0x245691070](v41, -1, -1);
    }
  }
  else
  {
    uint64_t v42 = &v12[*(int *)(v37 + 48)];
    uint64_t v44 = *(void *)v42;
    uint64_t v43 = *((void *)v42 + 1);
    swift_release();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v12, v62);
    objc_msgSend(*(id *)&v4[v35], sel_unlock);
    if (v59 != 2)
    {
      uint64_t v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v45, v46))
      {
        id v47 = v18;
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v48 = 0;
        _os_log_impl(&dword_2444BF000, v45, v46, "requesting assets...", v48, 2u);
        uint64_t v49 = v48;
        id v18 = v47;
        MEMORY[0x245691070](v49, -1, -1);
      }

      MEMORY[0x245690550]();
      uint64_t v50 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v9, 0, 1, v50);
      uint64_t v51 = (void *)swift_allocObject();
      v51[2] = 0;
      v51[3] = 0;
      uint64_t v52 = v58;
      v51[4] = v58;
      v51[5] = v4;
      v51[6] = v18;
      v51[7] = v44;
      v51[8] = v43;
      id v53 = v18;
      id v54 = v52;
      uint64_t v55 = v4;
      _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), (uint64_t)v51);
    }
    swift_release();
  }
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[4] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v8[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for JournalingSuggestion?);
  v8[10] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for JournalingSuggestion(0);
  v8[11] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[12] = v10;
  v8[13] = *(void *)(v10 + 64);
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), 0, 0);
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  objc_msgSend(*(id *)(v0 + 32), sel_setDisableAssetUnwrapping_, 1);
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  *(int8x16_t *)(v1 + 24) = vextq_s8(*(int8x16_t *)(v0 + 40), *(int8x16_t *)(v0 + 40), 8uLL);
  return MEMORY[0x270FA2498](SuggestionSheetManager.getAssetsFor(suggestion:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.bridge);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.debug.getter();
  uint64_t v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[17];
  if (v4)
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[3] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v2, v3, "getAssetsFor count=%ld", v6, 0xCu);
    MEMORY[0x245691070](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = (void *)swift_task_alloc();
  v0[19] = v8;
  *uint64_t v8 = v0;
  v8[1] = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  uint64_t v9 = v0[17];
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[6];
  return SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(v10, v11, v9);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(void);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v1 + 48))(v2, 1, v0[11]) == 1)
  {
    outlined destroy of URL?(v2, (uint64_t *)&demangling cache variable for type metadata for JournalingSuggestion?);
    uint64_t v3 = v0[5];
    uint64_t v4 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
    objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
    uint64_t v5 = v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
      || *(void *)v5)
    {
      *(void *)uint64_t v5 = 0;
      *(unsigned char *)(v5 + 8) = 0;
    }
    objc_msgSend(*(id *)(v3 + v4), sel_unlock);
    SuggestionSheetManager.servicePickerViewState()();
  }
  else
  {
    uint64_t v7 = v0[14];
    id v6 = v0[15];
    BOOL v21 = v0[13];
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    uint64_t v23 = v0[7];
    uint64_t v10 = (void *)v0[5];
    uint64_t v22 = v8;
    outlined init with take of JournalingSuggestion.ItemContent(v2, v6, type metadata accessor for JournalingSuggestion);
    uint64_t v11 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
    outlined init with copy of JournalingSuggestionsError(v6, v7, type metadata accessor for JournalingSuggestion);
    type metadata accessor for MainActor();
    swift_retain();
    uint64_t v12 = v10;
    uint64_t v13 = static MainActor.shared.getter();
    uint64_t v14 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    uint64_t v15 = (v21 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    *(void *)(v16 + 16) = v13;
    *(void *)(v16 + 24) = v17;
    outlined init with take of JournalingSuggestion.ItemContent(v7, v16 + v14, type metadata accessor for JournalingSuggestion);
    id v18 = (void *)(v16 + v15);
    uint8_t *v18 = v23;
    v18[1] = v9;
    *(void *)(v16 + ((v15 + 23) & 0xFFFFFFFFFFFFFFF8)) = v12;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v22, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), v16);
    swift_release();
    _s21JournalingSuggestions0aB5ErrorOWOhTm_0(v6, type metadata accessor for JournalingSuggestion);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);
  uint64_t v18;

  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  id v6 = static os_log_type_t.error.getter();
  uint64_t v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[18];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    char *v10 = v12;

    _os_log_impl(&dword_2444BF000, v5, v6, "getAssetsError: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x245691070](v10, -1, -1);
    MEMORY[0x245691070](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v0[5];
  uint64_t v14 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  uint64_t v15 = v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(unsigned char *)(v13 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(void *)v15)
  {
    *(void *)uint64_t v15 = 0;
    *(unsigned char *)(v15 + 8) = 0;
  }
  objc_msgSend(*(id *)(v13 + v14), sel_unlock);
  SuggestionSheetManager.servicePickerViewState()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  }
  else {
    uint64_t v4 = closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  type metadata accessor for JournalingSuggestion(0);
  v7[7] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[8] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[9] = v9;
  v7[10] = v8;
  return MEMORY[0x270FA2498](closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), v9, v8);
}

uint64_t closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[7];
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logger.bridge);
  outlined init with copy of JournalingSuggestionsError(v1, v2, type metadata accessor for JournalingSuggestion);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[7];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    uint64_t v9 = *(void *)(*(void *)v7 + 16);
    _s21JournalingSuggestions0aB5ErrorOWOhTm_0(v7, type metadata accessor for JournalingSuggestion);
    v0[2] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2444BF000, v4, v5, "Calling picker .onCompletion with %ld assets", v8, 0xCu);
    MEMORY[0x245691070](v8, -1, -1);
  }
  else
  {
    _s21JournalingSuggestions0aB5ErrorOWOhTm_0(v0[7], type metadata accessor for JournalingSuggestion);
  }

  uint64_t v13 = (uint64_t (*)(uint64_t))(v0[4] + *(int *)v0[4]);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  void *v10 = v0;
  v10[1] = closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:);
  uint64_t v11 = v0[3];
  return v13(v11);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:), v3, v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(void *)(v0 + 48);
  swift_release();
  uint64_t v2 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  uint64_t v3 = v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(void *)v3)
  {
    *(void *)uint64_t v3 = 0;
    *(unsigned char *)(v3 + 8) = 0;
  }
  objc_msgSend(*(id *)(v1 + v2), sel_unlock);
  SuggestionSheetManager.servicePickerViewState()();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t specialized FixedWidthInteger.init(_:)(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        BOOL v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        BOOL v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v7 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

id SuggestionSheetManager.init()()
{
  uint64_t v19 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_controller] = 0;
  uint64_t v18 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_pickerQueue;
  uint64_t v17 = type metadata accessor for UIScene(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  BOOL v6 = v0;
  static DispatchQoS.unspecified.getter();
  uint64_t v21 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v19);
  *(void *)&v0[v18] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v7 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationOptions;
  if (one-time initialization token for DEFAULT_OPTIONS != -1) {
    swift_once();
  }
  char v8 = (void *)static SuggestionSheetManager.DEFAULT_OPTIONS;
  *(void *)&v6[v7] = static SuggestionSheetManager.DEFAULT_OPTIONS;
  char v9 = &v6[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_viewState];
  *(void *)char v9 = 0;
  v9[8] = 1;
  uint64_t v10 = &v6[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_transitionViewState];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  id v12 = objc_allocWithZone(MEMORY[0x263F08AE0]);
  id v13 = v8;
  *(void *)&v6[v11] = objc_msgSend(v12, sel_init);
  uint64_t v14 = &v6[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState];
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  *(void *)&v6[OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_trackingTokens] = MEMORY[0x263F8EE80];

  uint64_t v15 = (objc_class *)type metadata accessor for SuggestionSheetManager();
  v20.receiver = v6;
  v20.super_class = v15;
  return objc_msgSendSuper2(&v20, sel_init);
}

id SuggestionSheetManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestionSheetManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance SuggestionSheetManager@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SuggestionSheetManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  BOOL v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5(uint64_t a1, int *a2)
{
  BOOL v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
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
    uint64_t v5 = MEMORY[0x245690420](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeDictionary.copy()();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 32 * v4);
  specialized _NativeDictionary._delete(at:)(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, int a2)
{
  char v3 = v2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UUID, SuggestionSheetManager.TrackingHandlers>);
  int v47 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v50 = v8;
  uint64_t v51 = v5;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v43 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v45 = v9;
  uint64_t v46 = v6;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v42) {
      break;
    }
    id v24 = v43;
    unint64_t v25 = v43[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v25 = v43[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_34:
          swift_release();
          char v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v42) {
              goto LABEL_34;
            }
            unint64_t v25 = v43[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v47)
    {
      (*v48)(v50, v28, v51);
      uint64_t v29 = *(void *)(v9 + 56) + 32 * v22;
      uint64_t v30 = *(void *)v29;
      long long v49 = *(_OWORD *)(v29 + 8);
      uint64_t v31 = *(void *)(v29 + 24);
    }
    else
    {
      (*v44)(v50, v28, v51);
      uint64_t v32 = *(void *)(v9 + 56) + 32 * v22;
      uint64_t v30 = *(void *)v32;
      uint64_t v31 = *(void *)(v32 + 24);
      long long v49 = *(_OWORD *)(v32 + 8);
      swift_retain();
      swift_retain();
    }
    lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v33 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v34) & ~*(void *)(v16 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v6 = v46;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      uint64_t v6 = v46;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v16 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v19 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v11 + 48) + v19 * v27, v50, v51);
    uint64_t v20 = *(void *)(v11 + 56) + 32 * v19;
    *(void *)uint64_t v20 = v30;
    *(_OWORD *)(v20 + 8) = v49;
    *(void *)(v20 + 24) = v31;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v45;
  }
  swift_release();
  char v3 = v41;
  id v24 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v9 + 32);
  if (v40 >= 64) {
    bzero(v24, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v24 = -1 << v40;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *char v3 = v11;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v35 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v35;
    if ((*(void *)(v35 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v32 = (result + 1) & v11;
      uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v34 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v33(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
        uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 >= v32 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            int64_t v23 = (_OWORD *)(v22 + 32 * a1);
            id v24 = (_OWORD *)(v22 + 32 * v10);
            uint64_t v12 = v35;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 2))
            {
              long long v25 = v24[1];
              *int64_t v23 = *v24;
              v23[1] = v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v32 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v35;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    int64_t v26 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *int64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v31 = a2;
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)*v6;
  unint64_t v17 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a6 & 1) != 0)
  {
LABEL_7:
    int64_t v23 = *v7;
    if (v21)
    {
LABEL_8:
      id v24 = (uint64_t *)(v23[7] + 32 * v17);
      swift_release();
      uint64_t result = swift_release();
      uint64_t v26 = v31;
      *id v24 = a1;
      v24[1] = v26;
      uint64_t v27 = v33;
      v24[2] = v32;
      v24[3] = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a6 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
    goto LABEL_7;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v20, a6 & 1);
  unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  if ((v21 & 1) != (v29 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v17 = v28;
  int64_t v23 = *v7;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
  return specialized _NativeDictionary._insert(at:key:value:)(v17, (uint64_t)v14, a1, v31, v32, v33, v23);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v14 = a7[6];
  uint64_t v15 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a2, v15);
  unint64_t v17 = (void *)(a7[7] + 32 * a1);
  *unint64_t v17 = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  uint64_t v18 = a7[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a7[2] = v20;
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v40 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UUID, SuggestionSheetManager.TrackingHandlers>);
  uint64_t v34 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v42 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v32 = v42;
    uint64_t v31 = v34;
LABEL_25:
    *uint64_t v31 = v32;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v42;
    uint64_t v5 = *(void *)(v3 + 16);
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = v5;
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v41 = v3;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v35 = v3 + 64;
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v37 = v1 + 32;
  uint64_t v38 = v1 + 16;
  uint64_t v14 = v39;
  uint64_t v13 = v40;
  uint64_t v15 = v42;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t v18 = v41;
      goto LABEL_9;
    }
    int64_t v28 = v9 + 1;
    uint64_t v18 = v41;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v28 >= v36) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_23;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v17 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v14, *(void *)(v18 + 48) + v19, v13);
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v21 = 32 * v17;
    uint64_t v22 = (uint64_t *)(v20 + 32 * v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[3];
    unint64_t v25 = *(void *)(v15 + 48) + v19;
    uint64_t v26 = *(void (**)(unint64_t, char *, uint64_t))(v1 + 32);
    long long v43 = *(_OWORD *)(v22 + 1);
    v26(v25, v14, v13);
    uint64_t v27 = *(void *)(v15 + 56) + v21;
    *(void *)uint64_t v27 = v23;
    *(_OWORD *)(v27 + 8) = v43;
    *(void *)(v27 + 24) = v24;
    swift_retain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v34;
    uint64_t v32 = v42;
    goto LABEL_25;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v36) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = static String._copying(_:)();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        _StringObject.sharedUTF8.getter();
LABEL_4:
        JUMPOUT(0x2456903D0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2456903D0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2456903D0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t specialized Collection.count.getter(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x245690720](a1, a2, v7);
      type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __CocoaSet.Index.element.getter();
  type metadata accessor for UIScene(0, &lazy cache variable for type metadata for UIScene);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v17;
  swift_unknownObjectRelease();
  Swift::Int v8 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = static NSObject.== infix(_:_:)();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v16 = v15;
}

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t specialized Dictionary.subscript.getter(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(a5 + 48);
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a2, v9);
    uint64_t v10 = *(void *)(*(void *)(a5 + 56) + 32 * a2);
    swift_retain();
    swift_retain();
    return v10;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t specialized static SuggestionSheetManager.getClientPlatformVersion()()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_infoDictionary);

  if (!v1)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    goto LABEL_10;
  }
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v2 + 16)
    || (unint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x8000000244501520), (v4 & 1) == 0))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v42);
  swift_bridgeObjectRelease();
  if (!*((void *)&v43 + 1))
  {
LABEL_10:
    outlined destroy of URL?((uint64_t)&v42, &demangling cache variable for type metadata for Any?);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.bridge);
    char v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_2444BF000, v11, v12, "Client info missing PlatformVersion", v13, 2u);
      MEMORY[0x245691070](v13, -1, -1);
    }

    return 0;
  }
  long long v42 = v41;
  lazy protocol witness table accessor for type String and conformance String();
  char v5 = (void *)StringProtocol.components<A>(separatedBy:)();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v7 = v5[2];
  if (v7)
  {
    uint64_t v9 = v5[4];
    unint64_t v8 = v5[5];
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  uint64_t v15 = HIBYTE(v8) & 0xF;
  uint64_t v16 = v9 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0) {
    uint64_t v17 = HIBYTE(v8) & 0xF;
  }
  else {
    uint64_t v17 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v8 & 0x1000000000000000) != 0)
  {
    uint64_t v14 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v9, v8, 10);
    LOBYTE(v9) = v40;
    goto LABEL_62;
  }
  if ((v8 & 0x2000000000000000) == 0)
  {
    if ((v9 & 0x1000000000000000) != 0) {
      unint64_t v18 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unint64_t v18 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v14 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v18, v16, 10);
    LOBYTE(v9) = v19 & 1;
LABEL_62:
    swift_bridgeObjectRelease();
    if (v9)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v7 < 2)
      {
        swift_bridgeObjectRelease();
        uint64_t v29 = 0;
        unint64_t v30 = 0xE000000000000000;
      }
      else
      {
        if (v5[2] < 2uLL)
        {
          __break(1u);
          goto LABEL_83;
        }
        uint64_t v29 = v5[6];
        unint64_t v30 = v5[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      uint64_t v31 = specialized FixedWidthInteger.init(_:)(v29, v30);
      if ((v32 & 1) == 0)
      {
        char v5 = (void *)v31;
        if (one-time initialization token for bridge == -1)
        {
LABEL_70:
          uint64_t v33 = type metadata accessor for Logger();
          __swift_project_value_buffer(v33, (uint64_t)static Logger.bridge);
          uint64_t v34 = Logger.logObject.getter();
          os_log_type_t v35 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v34, v35))
          {
            uint64_t v36 = swift_slowAlloc();
            *(_DWORD *)uint64_t v36 = 134218240;
            *(void *)&long long v42 = v14;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v36 + 12) = 2048;
            *(void *)&long long v42 = v5;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl(&dword_2444BF000, v34, v35, "Client PlatformVersion: %ld.%ld", (uint8_t *)v36, 0x16u);
            MEMORY[0x245691070](v36, -1, -1);
          }

          return v14;
        }
LABEL_83:
        swift_once();
        goto LABEL_70;
      }
    }
    return 0;
  }
  *(void *)&long long v42 = v9;
  *((void *)&v42 + 1) = v8 & 0xFFFFFFFFFFFFFFLL;
  if (v9 == 43)
  {
    if (!v15) {
      goto LABEL_85;
    }
    if (v15 == 1 || (BYTE1(v9) - 48) > 9u) {
      goto LABEL_49;
    }
    uint64_t v14 = (BYTE1(v9) - 48);
    if (v15 != 2)
    {
      if ((BYTE2(v9) - 48) > 9u) {
        goto LABEL_49;
      }
      uint64_t v14 = 10 * (BYTE1(v9) - 48) + (BYTE2(v9) - 48);
      uint64_t v20 = v15 - 3;
      if (v20)
      {
        uint64_t v21 = (unsigned __int8 *)&v42 + 3;
        while (1)
        {
          unsigned int v22 = *v21 - 48;
          if (v22 > 9) {
            goto LABEL_49;
          }
          uint64_t v23 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
            goto LABEL_49;
          }
          uint64_t v14 = v23 + v22;
          if (__OFADD__(v23, v22)) {
            goto LABEL_49;
          }
          LOBYTE(v9) = 0;
          ++v21;
          if (!--v20) {
            goto LABEL_62;
          }
        }
      }
    }
LABEL_61:
    LOBYTE(v9) = 0;
    goto LABEL_62;
  }
  if (v9 != 45)
  {
    if (!v15 || (v9 - 48) > 9u) {
      goto LABEL_49;
    }
    uint64_t v14 = (v9 - 48);
    if (v15 != 1)
    {
      if ((BYTE1(v9) - 48) > 9u) {
        goto LABEL_49;
      }
      uint64_t v14 = 10 * (v9 - 48) + (BYTE1(v9) - 48);
      uint64_t v24 = v15 - 2;
      if (v24)
      {
        uint64_t v25 = (unsigned __int8 *)&v42 + 2;
        while (1)
        {
          unsigned int v26 = *v25 - 48;
          if (v26 > 9) {
            goto LABEL_49;
          }
          uint64_t v27 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
            goto LABEL_49;
          }
          uint64_t v14 = v27 + v26;
          if (__OFADD__(v27, v26)) {
            goto LABEL_49;
          }
          LOBYTE(v9) = 0;
          ++v25;
          if (!--v24) {
            goto LABEL_62;
          }
        }
      }
    }
    goto LABEL_61;
  }
  if (v15)
  {
    if (v15 != 1 && (BYTE1(v9) - 48) <= 9u)
    {
      if (v15 == 2)
      {
        LOBYTE(v9) = 0;
        uint64_t v14 = -(uint64_t)(BYTE1(v9) - 48);
        goto LABEL_62;
      }
      if ((BYTE2(v9) - 48) <= 9u)
      {
        uint64_t v14 = -10 * (BYTE1(v9) - 48) - (BYTE2(v9) - 48);
        uint64_t v28 = v15 - 3;
        if (!v28) {
          goto LABEL_61;
        }
        uint64_t v37 = (unsigned __int8 *)&v42 + 3;
        while (1)
        {
          unsigned int v38 = *v37 - 48;
          if (v38 > 9) {
            break;
          }
          uint64_t v39 = 10 * v14;
          if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63) {
            break;
          }
          uint64_t v14 = v39 - v38;
          if (__OFSUB__(v39, v38)) {
            break;
          }
          LOBYTE(v9) = 0;
          ++v37;
          if (!--v28) {
            goto LABEL_62;
          }
        }
      }
    }
LABEL_49:
    uint64_t v14 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_62;
  }
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t specialized static SuggestionSheetManager.contentImpl(bySpiType:)()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.Photo(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.Photo;
LABEL_16:
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v18;
    return v16;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.Video(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.Video;
    goto LABEL_16;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.LivePhoto;
    goto LABEL_16;
  }
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_21;
  }
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  if (v21 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
LABEL_26:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEEB0;
    *(void *)(v16 + 32) = type metadata accessor for JournalingSuggestion.Song(0);
    *(void *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Song;
    *(void *)(v16 + 48) = type metadata accessor for JournalingSuggestion.Podcast(0);
    *(void *)(v16 + 56) = &protocol witness table for JournalingSuggestion.Podcast;
    *(void *)(v16 + 64) = type metadata accessor for JournalingSuggestion.GenericMedia(0);
    *(void *)(v16 + 72) = &protocol witness table for JournalingSuggestion.GenericMedia;
    return v16;
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_26;
  }
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;
  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.Contact(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.Contact;
    goto LABEL_16;
  }
  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_31;
  }
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;
  if (v31 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEEA0;
    *(void *)(v16 + 32) = type metadata accessor for JournalingSuggestion.Workout(0);
    *(void *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Workout;
    uint64_t v36 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
    uint64_t v37 = &protocol witness table for JournalingSuggestion.Workout.Details;
LABEL_37:
    *(void *)(v16 + 48) = v36;
    *(void *)(v16 + 56) = v37;
    return v16;
  }
  char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_36;
  }
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;
  if (v38 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_42:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.WorkoutGroup;
    goto LABEL_16;
  }
  char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_42;
  }
  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v45 = v44;
  if (v43 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v45 == v46)
  {
    swift_bridgeObjectRelease_n();
LABEL_47:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEEA0;
    *(void *)(v16 + 32) = &type metadata for JournalingSuggestion.LocationGroup;
    *(void *)(v16 + 40) = &protocol witness table for JournalingSuggestion.LocationGroup;
    uint64_t v36 = type metadata accessor for JournalingSuggestion.Location(0);
    uint64_t v37 = &protocol witness table for JournalingSuggestion.Location;
    goto LABEL_37;
  }
  char v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_47;
  }
  uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v50 = v49;
  if (v48 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.MotionActivity(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.MotionActivity;
    goto LABEL_16;
  }
  char v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_52;
  }
  uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v55 = v54;
  if (v53 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v55 == v56) {
    goto LABEL_55;
  }
  char v57 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v57) {
    goto LABEL_60;
  }
  uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v60 = v59;
  if (v58 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v60 == v61)
  {
LABEL_55:
    swift_bridgeObjectRelease_n();
LABEL_60:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.Location(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.Location;
    goto LABEL_16;
  }
  char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62) {
    goto LABEL_60;
  }
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v65 = v64;
  if (v63 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v65 == v66)
  {
LABEL_63:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v67) {
    return 0;
  }
  uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v70 = v69;
  if (v68 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v70 == v71)
  {
    swift_bridgeObjectRelease_n();
LABEL_70:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    *(void *)(v16 + 32) = &type metadata for JournalingSuggestion.Reflection;
    *(void *)(v16 + 40) = &protocol witness table for JournalingSuggestion.Reflection;
    return v16;
  }
  char v72 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v72) {
    goto LABEL_70;
  }
  uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v75 = v74;
  if (v73 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v75 == v76)
  {
    swift_bridgeObjectRelease_n();
LABEL_75:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2444FEE90;
    uint64_t v17 = type metadata accessor for JournalingSuggestion.StateOfMind(0);
    unint64_t v18 = &protocol witness table for JournalingSuggestion.StateOfMind;
    goto LABEL_16;
  }
  char v77 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v77) {
    goto LABEL_75;
  }
  uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v80 = v79;
  if (v78 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v80 == v81) {
    goto LABEL_63;
  }
  char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v82) {
    return 0;
  }
  uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v85 = v84;
  if (v83 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v85 == v86) {
    goto LABEL_63;
  }
  char v87 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v87) {
    return 0;
  }
  uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v90 = v89;
  if (v88 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v90 == v91) {
    goto LABEL_63;
  }
  char v92 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v92) {
    return 0;
  }
  uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v95 = v94;
  if (v93 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v95 == v96) {
    goto LABEL_63;
  }
  char v97 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v97) {
    return 0;
  }
  uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v100 = v99;
  if (v98 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v100 == v101) {
    goto LABEL_63;
  }
  char v102 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v102) {
    return 0;
  }
  uint64_t v103 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v105 = v104;
  if (v103 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v105 == v106) {
    goto LABEL_63;
  }
  char v107 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v107) {
    return 0;
  }
  uint64_t v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v110 = v109;
  if (v108 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v110 == v111) {
    goto LABEL_63;
  }
  char v112 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v112) {
    return 0;
  }
  uint64_t v113 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v115 = v114;
  if (v113 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v115 == v116) {
    goto LABEL_63;
  }
  char v117 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v117) {
    return 0;
  }
  uint64_t v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v120 = v119;
  if (v118 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v120 == v121)
  {
    uint64_t v16 = 0;
  }
  else if (_stringCompareWithSmolCheck(_:_:expecting:)())
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

void *specialized static SuggestionSheetManager.content(bySpiType:)()
{
  uint64_t v1 = specialized static SuggestionSheetManager.contentImpl(bySpiType:)();
  if (v1)
  {
    uint64_t v3 = (void *)v1;
    char v4 = *(void **)(v1 + 16);
    if (!v4)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    }
    int64_t v5 = (int64_t)v4 + 2;
    if (__OFADD__(v4, 2))
    {
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && (unint64_t v2 = v3[3], v7 = v2 >> 1, (uint64_t)(v2 >> 1) >= v5))
      {
        char v4 = v3;
      }
      else
      {
        if ((uint64_t)v4 <= v5) {
          int64_t v8 = (int64_t)v4 + 2;
        }
        else {
          int64_t v8 = (int64_t)v4;
        }
        char v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v8, 1, v3);
        unint64_t v2 = v4[3];
        unint64_t v7 = v2 >> 1;
      }
      unint64_t v0 = v4[2];
      int64_t v5 = v0 + 1;
      if (v7 > v0) {
        goto LABEL_13;
      }
    }
    char v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v2 > 1), v5, 1, v4);
    unint64_t v2 = v4[3];
    unint64_t v7 = v2 >> 1;
LABEL_13:
    v4[2] = v5;
    uint64_t v9 = &v4[2 * v0];
    v9[4] = MEMORY[0x263F1B570];
    v9[5] = &protocol witness table for Image;
    int64_t v10 = v0 + 2;
    if ((uint64_t)v7 < v10) {
      char v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v2 > 1), v10, 1, v4);
    }
    uint64_t v11 = type metadata accessor for UIScene(0, (unint64_t *)&lazy cache variable for type metadata for UIImage);
    v4[2] = v10;
    uint64_t v12 = &v4[2 * v5];
    v12[4] = v11;
    v12[5] = &protocol witness table for UIImage;
    goto LABEL_16;
  }
  return 0;
}

unint64_t lazy protocol witness table accessor for type UIScene and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type UIScene and conformance NSObject;
  if (!lazy protocol witness table cache variable for type UIScene and conformance NSObject)
  {
    type metadata accessor for UIScene(255, &lazy cache variable for type metadata for UIScene);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIScene and conformance NSObject);
  }
  return result;
}

uint64_t sub_2444DCA4C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2444DCA84()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in SuggestionSheetManager.activate()()
{
  closure #1 in SuggestionSheetManager.activate()(*(void *)(v0 + 16), *(void *)(v0 + 24));
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

uint64_t lazy protocol witness table accessor for type UUID and conformance UUID(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2444DCB2C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  return closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.show(token:onCompletion:onDismiss:)(a1, v4, v5, v7, v6);
}

uint64_t outlined consume of SuggestionSheetManager.TrackingHandlers?(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t specialized SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)(uint64_t a1)
{
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2444BF000, v3, v4, "Picker didTransitionTo %lu", v5, 0xCu);
    MEMORY[0x245691070](v5, -1, -1);
  }

  return SuggestionSheetManager.remoteViewStateChangedTo(_:)(a1);
}

uint64_t specialized SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)()
{
  uint64_t v1 = v0;
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2444BF000, v3, v4, "Picker sheet cancel", v5, 2u);
    MEMORY[0x245691070](v5, -1, -1);
  }

  uint64_t v6 = OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_presentationLock), sel_lock);
  uint64_t v7 = v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC21JournalingSuggestions22SuggestionSheetManager_targetViewState + 8) & 1) != 0
    || *(void *)v7)
  {
    *(void *)uint64_t v7 = 0;
    *(unsigned char *)(v7 + 8) = 0;
  }
  objc_msgSend(*(id *)(v1 + v6), sel_unlock);

  return SuggestionSheetManager.servicePickerViewState()();
}

uint64_t sub_2444DCED0()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for SuggestionSheetManager()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type PlatformVersion and conformance PlatformVersion()
{
  unint64_t result = lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion;
  if (!lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PlatformVersion and conformance PlatformVersion);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason()
{
  unint64_t result = lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason;
  if (!lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuggestionSheetManager.DismissReason and conformance SuggestionSheetManager.DismissReason);
  }
  return result;
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in SuggestionSheetManager()
{
  return MEMORY[0x263EFDDD8];
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlatformVersion(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PlatformVersion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PlatformVersion()
{
  return &type metadata for PlatformVersion;
}

uint64_t method lookup function for SuggestionSheetManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SuggestionSheetManager);
}

uint64_t dispatch thunk of SuggestionSheetManager.activate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SuggestionSheetManager.show(token:onCompletion:onDismiss:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SuggestionSheetManager.dismiss(presentationToken:reason:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0x150))(a1, a2 & 1);
}

uint64_t dispatch thunk of SuggestionSheetManager.onApplicationMovedToForeground()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetController(_:didTransitionTo:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerDidCancel(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerShouldShowBlankComposeView(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetControllerShouldShowMomentsValidator(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SuggestionSheetManager.DismissReason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SuggestionSheetManager.DismissReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2444DD4ECLL);
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

uint64_t getEnumTag for SuggestionSheetManager.DismissReason(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for SuggestionSheetManager.DismissReason(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SuggestionSheetManager.DismissReason()
{
  return &type metadata for SuggestionSheetManager.DismissReason;
}

uint64_t destroy for SuggestionSheetManager.TrackingHandlers()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SuggestionSheetManager.TrackingHandlers(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SuggestionSheetManager.TrackingHandlers(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SuggestionSheetManager.TrackingHandlers(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

void *type metadata accessor for SuggestionSheetManager.TrackingHandlers()
{
  return &unk_26F9295F0;
}

void partial apply for closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(uint64_t a1)
{
  closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2444DD680()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(unint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[MOSuggestionAsset], Error>)
                 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  BOOL v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return closure #1 in closure #1 in SuggestionSheetManager.getAssetsFor(suggestion:)(a1, a2, v2 + v6, v7);
}

uint64_t partial apply for closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  int v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *int v8 = v3;
  v8[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(a1, a2, v6, v7);
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2444DD8E0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.sheetOnAssetCallback(suggestion:assets:)(a1, v4, v5, v6, v7, v8);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTR21JournalingSuggestions0C10SuggestionV11ItemContentVSg_Tg5Tu);
  return v6(a1, v4);
}

uint64_t outlined consume of InternalAssetContent.AssetProvider?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2444DDAC0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)()
{
  closure #1 in SuggestionSheetManager.remoteViewStateChangedTo(_:)(*(void *)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t outlined init with take of JournalingSuggestion.ItemContent?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestionsError(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2444DDC34()
{
  uint64_t v1 = type metadata accessor for JournalingSuggestion(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = type metadata accessor for DateInterval();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  unint64_t v8 = (((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();

  return MEMORY[0x270FA0238](v0, v8 + 8, v2 | 7);
}

uint64_t partial apply for closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for JournalingSuggestion(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in closure #1 in SuggestionSheetManager.suggestionSheetController(_:shouldPerform:for:)(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t _s21JournalingSuggestions0aB5ErrorOWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void partial apply for closure #1 in SuggestionSheetManager.servicePickerViewState()()
{
  closure #1 in SuggestionSheetManager.servicePickerViewState()(v0);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t outlined consume of Set<UIScene>.Index._Variant(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for UIScene(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized getMetadata<A>(_:key:as:)(uint64_t a1, void *a2)
{
  *(void *)&v8[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v4 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v9), (v6 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v8);
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  outlined destroy of AnyHashable((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast()) {
    return v10;
  }
  else {
    return 0;
  }
}

{
  id v4;
  unint64_t v5;
  char v6;
  int v7;
  uint64_t v8;
  _OWORD v10[2];
  unsigned char v11[40];
  uint64_t v12;

  *(void *)&v10[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v4 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v6 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v10);
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  outlined destroy of AnyHashable((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = swift_dynamicCast();
  uint64_t v8 = v12;
  if (!v7) {
    return 0;
  }
  return v8;
}

uint64_t specialized getMetadata<A>(_:key:as:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&v12[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v6 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v13), (v8 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v7, (uint64_t)v12);
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  outlined destroy of AnyHashable((uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v9 = type metadata accessor for Date();
  int v10 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a3, v10 ^ 1u, 1, v9);
}

void static JournalingSuggestion.Location.fromMedatata(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v8 - 8);
  int v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a2 + 32) = 0;
  uint64_t v11 = a2 + *(int *)(type metadata accessor for JournalingSuggestion.Location(0) + 28);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v4);
  *(void *)a2 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563B8]);
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563B0]);
  *(void *)(a2 + 24) = v13;
  specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563D8], (uint64_t)v10);
  outlined assign with take of Date?((uint64_t)v10, v11);
  uint64_t v14 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563C8]);
  if ((v15 & 1) == 0)
  {
    double v16 = *(double *)&v14;
    *(double *)&uint64_t v17 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563D0]));
    if ((v18 & 1) == 0)
    {
      double v19 = v16;
      double v20 = *(double *)&v17;
      double v21 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563C0]));
      if (v22) {
        double v23 = 0.0;
      }
      else {
        double v23 = v21;
      }
      static Date.distantPast.getter();
      id v24 = objc_allocWithZone(MEMORY[0x263F00A50]);
      Class isa = Date._bridgeToObjectiveC()().super.isa;
      id v26 = objc_msgSend(v24, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, isa, v19, v20, 0.0, v23, -1.0);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      *(void *)(a2 + 32) = v26;
    }
  }
}

uint64_t closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = type metadata accessor for JournalingSuggestion.Location(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a3, sel_metadata);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  static JournalingSuggestion.Location.fromMedatata(_:)(v11, (uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)*((void *)v9 + 4);
  id v13 = a4;

  *((void *)v9 + 4) = a4;
  v17[3] = v7;
  v17[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Location;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  outlined init with copy of JournalingSuggestion.Location((uint64_t)v9, (uint64_t)boxed_opaque_existential_1);
  a1(v17, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v17);
  return outlined destroy of JournalingSuggestion.Location((uint64_t)v9);
}

uint64_t closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for JournalingSuggestion.Location(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static JournalingSuggestion.Location.fromMedatata(_:)(a3, (uint64_t)v7);
  v11[3] = v5;
  v11[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Location;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  outlined init with copy of JournalingSuggestion.Location((uint64_t)v7, (uint64_t)boxed_opaque_existential_1);
  a1(v11, 0);
  outlined destroy of JournalingSuggestion.Location((uint64_t)v7);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v11);
}

uint64_t closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void (*a1)(void, void), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v57 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v63 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for JournalingSuggestion.Location(0);
  uint64_t v61 = *(void *)(v11 - 8);
  uint64_t v62 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v54 - v16;
  MEMORY[0x270FA5388](v15);
  double v19 = (char *)&v54 - v18;
  uint64_t v60 = *(void *)(a3 + 16);
  if (v60)
  {
    uint64_t v54 = a2;
    uint64_t v55 = a1;
    uint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    uint64_t v56 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    uint64_t v20 = 0;
    unint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t v58 = v14;
    uint64_t v59 = v19;
    do
    {
      unint64_t v64 = v21;
      uint64_t v22 = a3;
      uint64_t v23 = *(void *)(a3 + 8 * v20 + 32);
      *((void *)v17 + 4) = 0;
      uint64_t v24 = (uint64_t)&v17[*(int *)(v62 + 28)];
      v65(v24, 1, 1, v6);
      char v25 = (void *)*MEMORY[0x263F563B8];
      uint64_t v26 = swift_bridgeObjectRetain();
      *(void *)uint64_t v17 = specialized getMetadata<A>(_:key:as:)(v26, v25);
      *((void *)v17 + 1) = v27;
      *((void *)v17 + 2) = specialized getMetadata<A>(_:key:as:)(v23, (void *)*MEMORY[0x263F563B0]);
      *((void *)v17 + 3) = v28;
      *(void *)&v66[0] = *MEMORY[0x263F563D8];
      uint64_t v29 = *(void **)&v66[0];
      type metadata accessor for MOSuggestionAssetMetadataKey(0);
      lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
      id v30 = v29;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v23 + 16) && (unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v67), (v32 & 1) != 0)) {
        outlined init with copy of Any(*(void *)(v23 + 56) + 32 * v31, (uint64_t)v66);
      }
      else {
        memset(v66, 0, sizeof(v66));
      }
      a3 = v22;
      uint64_t v33 = (uint64_t)v58;
      outlined destroy of AnyHashable((uint64_t)v67);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
      uint64_t v34 = (uint64_t)v63;
      int v35 = swift_dynamicCast();
      v65(v34, v35 ^ 1u, 1, v6);
      outlined assign with take of Date?(v34, v24);
      uint64_t v36 = specialized getMetadata<A>(_:key:as:)(v23, (void *)*MEMORY[0x263F563C8]);
      if ((v37 & 1) == 0)
      {
        double v38 = *(double *)&v36;
        *(double *)&uint64_t v39 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(v23, (void *)*MEMORY[0x263F563D0]));
        if ((v40 & 1) == 0)
        {
          double v41 = v38;
          double v42 = *(double *)&v39;
          double v43 = COERCE_DOUBLE(specialized getMetadata<A>(_:key:as:)(v23, (void *)*MEMORY[0x263F563C0]));
          if (v44) {
            double v45 = 0.0;
          }
          else {
            double v45 = v43;
          }
          uint64_t v46 = v57;
          static Date.distantPast.getter();
          id v47 = objc_allocWithZone(MEMORY[0x263F00A50]);
          Class isa = Date._bridgeToObjectiveC()().super.isa;
          id v49 = objc_msgSend(v47, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, isa, v41, v42, 0.0, v45, -1.0);

          (*v56)(v46, v6);
          *((void *)v17 + 4) = v49;
        }
      }
      uint64_t v50 = (uint64_t)v59;
      outlined init with take of JournalingSuggestion.Location((uint64_t)v17, (uint64_t)v59);
      swift_bridgeObjectRelease();
      outlined init with copy of JournalingSuggestion.Location(v50, v33);
      unint64_t v21 = v64;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v21 + 16) + 1, 1, v21);
      }
      unint64_t v52 = *(void *)(v21 + 16);
      unint64_t v51 = *(void *)(v21 + 24);
      if (v52 >= v51 >> 1) {
        unint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v51 > 1, v52 + 1, 1, v21);
      }
      ++v20;
      *(void *)(v21 + 16) = v52 + 1;
      outlined init with take of JournalingSuggestion.Location(v33, v21+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v52);
      outlined destroy of JournalingSuggestion.Location(v50);
    }
    while (v60 != v20);
    swift_bridgeObjectRelease();
    a1 = v55;
  }
  else
  {
    unint64_t v21 = MEMORY[0x263F8EE78];
  }
  v67[3] = &type metadata for JournalingSuggestion.LocationGroup;
  v67[4] = &protocol witness table for JournalingSuggestion.LocationGroup;
  v67[0] = v21;
  a1(v67, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v67);
}

uint64_t (*specialized static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void *a1))(void (*a1)(void, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563F8]);
  if (v9)
  {
    if (*(void *)(v9 + 16) >= 2uLL)
    {
      *(void *)(swift_allocObject() + 16) = v9;
      return partial apply for closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:);
    }
    swift_bridgeObjectRelease();
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Logger.bridge);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_20;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "SuggestionLocationGroup, skip single location group";
  }
  else
  {
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.bridge);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_20;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "SuggestionLocationGroup.getAssetLoader, Unexpected .multiPinMapLocations type";
  }
  _os_log_impl(&dword_2444BF000, v12, v13, v15, v14, 2u);
  MEMORY[0x245691070](v14, -1, -1);
LABEL_20:

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {
LABEL_12:

    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    id v2 = objc_msgSend(a1, sel_assetType);
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (v9 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v11 != v12)
    {
      char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        return 0;
      }
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  id v15 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a1;
    *(void *)(v18 + 24) = v17;
    id v19 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:);
  }
  swift_unknownObjectRelease();
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  __swift_project_value_buffer(v21, (uint64_t)static Logger.bridge);
  id v22 = a1;
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    char v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v30 = v26;
    *(_DWORD *)char v25 = 136315138;
    id v27 = objc_msgSend(v22, sel_content);
    uint64_t v28 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v23, v24, "SuggestionLocation.getAssetLoader, Unexpected content: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245691070](v26, -1, -1);
    MEMORY[0x245691070](v25, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v9 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563F8]);
  if (v9)
  {
    if (*(void *)(v9 + 16) == 1)
    {
      uint64_t v10 = *(void *)(v9 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(swift_allocObject() + 16) = v10;
      return partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:);
    }
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.bridge);
  os_log_type_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_2444BF000, v13, v14, "SuggestionLocation, ignoring multiPinMap group", v15, 2u);
    MEMORY[0x245691070](v15, -1, -1);
  }

  return 0;
}

uint64_t (*specialized static JournalingSuggestion.Location.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6) {
    goto LABEL_14;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  }
  id v2 = objc_msgSend(a1, sel_assetType);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (v9 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v11 == v12)
  {
LABEL_14:

    swift_bridgeObjectRelease_n();
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  }
  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14) {
    return specialized static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1);
  }
  id v15 = objc_msgSend(a1, sel_assetType);
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  if (v16 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v18 == v19)
  {

    swift_bridgeObjectRelease_n();
    return specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1);
  }
  char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    return specialized static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1);
  }
  return 0;
}

uint64_t sub_2444DF7F0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(void (*a1)(void, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.LocationGroup.getAssetLoader(for:inside:)(a1, a2, *(void *)(v2 + 16));
}

uint64_t outlined init with take of JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Location(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Location(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2444DF954()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Location.getAssetLoaderForPlainLocation(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Location.getAssetLoaderMultiPinMap(for:inside:)(a1, a2, *(void *)(v2 + 16));
}

BOOL static JournalingSuggestion.GenericMedia.isThirdPartyMediaAsset(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 3;
}

uint64_t closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, void *a3, void *a4)
{
  double v42 = a4;
  uint64_t v43 = a2;
  char v44 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v41 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v13 + *(int *)(v11 + 28);
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v40 = v14;
  v16(v14, 1, 1, v15);
  uint64_t v17 = (uint64_t)v13 + *(int *)(v10 + 32);
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v39 = v17;
  v19(v17, 1, 1, v18);
  id v20 = objc_msgSend(a3, sel_title);
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  *os_log_type_t v13 = v21;
  v13[1] = v23;
  id v24 = objc_msgSend(a3, sel_artistName);
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  _OWORD v13[2] = v25;
  v13[3] = v27;
  id v28 = objc_msgSend(a3, sel_albumTitle);
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  v13[4] = v29;
  v13[5] = v31;
  id v32 = objc_msgSend(a3, sel_imageURL);
  if (v32)
  {
    uint64_t v33 = v32;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = 1;
  }
  v19((uint64_t)v9, v34, 1, v18);
  outlined assign with take of URL?((uint64_t)v9, v39, &demangling cache variable for type metadata for URL?);
  uint64_t v35 = v41;
  specialized getMetadata<A>(_:key:as:)(v42, (void *)*MEMORY[0x263F563E0], v41);
  outlined assign with take of URL?(v35, v40, &demangling cache variable for type metadata for Date?);
  v45[3] = v10;
  v45[4] = (uint64_t)&protocol witness table for JournalingSuggestion.GenericMedia;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v45);
  outlined init with copy of JournalingSuggestion.GenericMedia((uint64_t)v13, (uint64_t)boxed_opaque_existential_1);
  v44(v45, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v45);
  return outlined destroy of JournalingSuggestion.GenericMedia((uint64_t)v13);
}

uint64_t (*specialized static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_12;
    }
  }
  id v9 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
LABEL_12:
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.bridge);
    id v16 = a1;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = v20;
      *(_DWORD *)uint64_t v19 = 136315394;
      type metadata accessor for JournalingSuggestion.GenericMedia(0);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.GenericMedia.Type);
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      id v23 = objc_msgSend(v16, sel_content, v26, v27);
      uint64_t v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444BF000, v17, v18, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245691070](v20, -1, -1);
      MEMORY[0x245691070](v19, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v11 = v10;
  if ((char *)objc_msgSend(v10, sel_mediaType) - 6 < (char *)3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = a1;
    id v13 = a1;
    return partial apply for closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:);
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_2444E0050()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.GenericMedia.getAssetLoader(for:inside:)(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t outlined init with copy of JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.GenericMedia(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.GenericMedia(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id static UIColor.dynamicColor(light:dark:)(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a1;
  id v5 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v11[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  uint64_t v11[5] = v4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  void v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v11[3] = &block_descriptor_1;
  uint64_t v6 = _Block_copy(v11);
  id v7 = a2;
  id v8 = a1;
  id v9 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  return v9;
}

uint64_t sub_2444E0250()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id UIColor.init(rgbColorCodeRed:green:blue:alpha:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  double v5 = (double)a1 / 255.0;
  double v6 = (double)a2 / 255.0;
  double v7 = (double)a3 / 255.0;
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v8, sel_initWithRed_green_blue_alpha_, v5, v6, v7, a4);
}

uint64_t Color.init(light:dark:)(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a1;
  id v5 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v12[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v12[5] = v4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  _OWORD v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  uint64_t v12[3] = &block_descriptor_7;
  double v6 = _Block_copy(v12);
  id v7 = a2;
  id v8 = a1;
  id v9 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  uint64_t v10 = MEMORY[0x245690240](v9);

  return v10;
}

void one-time initialization function for resilienceBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.450980392, 0.435294118, 0.674509804, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.349019608, 0.333333333, 0.57254902, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_52;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.resilienceBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.resilienceBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for resilienceBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.resilienceBackground;
}

uint64_t static JournalingSuggestion.Reflection.resilienceBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for resilienceBackground);
}

void one-time initialization function for gratitudeBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.866666667, 0.352941176, 0.345098039, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.764705882, 0.250980392, 0.243137255, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_45;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.gratitudeBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.gratitudeBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for gratitudeBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.gratitudeBackground;
}

uint64_t static JournalingSuggestion.Reflection.gratitudeBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for gratitudeBackground);
}

void one-time initialization function for purposeBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.537254902, 0.611764706, 0.968627451, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.435294118, 0.509803922, 0.866666667, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_38;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.purposeBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.purposeBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for purposeBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.purposeBackground;
}

uint64_t static JournalingSuggestion.Reflection.purposeBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for purposeBackground);
}

void one-time initialization function for kindnessBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.854901961, 0.533333333, 0.533333333, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.752941176, 0.431372549, 0.431372549, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_31;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.kindnessBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.kindnessBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for kindnessBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.kindnessBackground;
}

uint64_t static JournalingSuggestion.Reflection.kindnessBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for kindnessBackground);
}

void one-time initialization function for creativityBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.568627451, 0.31372549, 0.447058824, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.466666667, 0.211764706, 0.345098039, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_24;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.creativityBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.creativityBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for creativityBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.creativityBackground;
}

uint64_t static JournalingSuggestion.Reflection.creativityBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for creativityBackground);
}

void one-time initialization function for wisdomBackground()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.129411765, 0.141176471, 0.219607843, 1.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.231372549, 0.243137255, 0.321568627, 1.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v9[4] = partial apply for closure #1 in static UIColor.dynamicColor(light:dark:);
  v9[5] = v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor);
  v9[3] = &block_descriptor_17;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v0;
  id v7 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  uint64_t v8 = MEMORY[0x245690240](v7);

  static JournalingSuggestion.Reflection.wisdomBackground = v8;
}

uint64_t *JournalingSuggestion.Reflection.wisdomBackground.unsafeMutableAddressor()
{
  if (one-time initialization token for wisdomBackground != -1) {
    swift_once();
  }
  return &static JournalingSuggestion.Reflection.wisdomBackground;
}

uint64_t static JournalingSuggestion.Reflection.wisdomBackground.getter()
{
  return static JournalingSuggestion.Reflection.resilienceBackground.getter(&one-time initialization token for wisdomBackground);
}

uint64_t static JournalingSuggestion.Reflection.resilienceBackground.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void (*a1)(void *, void), uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  swift_bridgeObjectRetain();
  v10[3] = &type metadata for JournalingSuggestion.Reflection;
  v10[4] = &protocol witness table for JournalingSuggestion.Reflection;
  v10[0] = a3;
  v10[1] = a4;
  v10[2] = specialized static JournalingSuggestion.Reflection.evergreenColorOfType(_:)((uint64_t)objc_msgSend(a5, sel_reflectionType));
  swift_retain();
  swift_bridgeObjectRetain();
  a1(v10, 0);
  outlined destroy of JournalingSuggestionAsset?((uint64_t)v10);
  swift_release();
  return swift_bridgeObjectRelease();
}

id thunk for @escaping @callee_guaranteed (@guaranteed UITraitCollection) -> (@owned UIColor)(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = (void *)v3();
  swift_release();

  return v5;
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

uint64_t (*specialized static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void *a1))(void (*a1)(void *, void), uint64_t a2)
{
  id v2 = objc_msgSend(a1, sel_assetType);
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
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v9 = objc_msgSend(a1, sel_content);
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_msgSend(v10, sel_reflectionPrompts);
    id v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v13[2])
    {
      uint64_t v15 = v13[4];
      uint64_t v14 = v13[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      id v16 = (void *)swift_allocObject();
      v16[2] = v15;
      v16[3] = v14;
      v16[4] = v11;
      return partial apply for closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:);
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
LABEL_13:
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.bridge);
  id v19 = a1;
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v30 = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Reflection.Type);
    uint64_t v24 = String.init<A>(describing:)();
    uint64_t v29 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    id v26 = objc_msgSend(v19, sel_content, v29, v30);
    uint64_t v27 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v20, v21, "%s.getAssetLoader, Unexpected content: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245691070](v23, -1, -1);
    MEMORY[0x245691070](v22, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t specialized static JournalingSuggestion.Reflection.evergreenColorOfType(_:)(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      if (one-time initialization token for wisdomBackground != -1) {
        goto LABEL_15;
      }
      goto LABEL_14;
    case 2:
      if (one-time initialization token for gratitudeBackground == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 3:
      if (one-time initialization token for kindnessBackground == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 4:
      if (one-time initialization token for purposeBackground == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 5:
      if (one-time initialization token for resilienceBackground == -1) {
        goto LABEL_14;
      }
      goto LABEL_15;
    case 6:
      if (one-time initialization token for creativityBackground == -1) {
        goto LABEL_14;
      }
LABEL_15:
      swift_once();
LABEL_14:
      uint64_t result = swift_retain();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_2444E1690()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(void (*a1)(void *, void), uint64_t a2)
{
  return closure #1 in static JournalingSuggestion.Reflection.getAssetLoader(for:inside:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

id partial apply for closure #1 in static UIColor.dynamicColor(light:dark:)(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 24);
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v3;
  }

  return v4;
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2)
{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [Int]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [UIColor]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  _OWORD v11[2];
  unsigned char v12[40];
  uint64_t v13;

  uint64_t v3 = objc_msgSend(a1, sel_metadata);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  uint64_t v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (uint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v7 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v4 + 56) + 32 * v6, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  char v8 = swift_dynamicCast();
  id v9 = v13;
  if (!v8) {
    return 0;
  }
  return v9;
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &lazy cache variable for type metadata for HKQuantity);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [UInt]);
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [Date]);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  _OWORD v9[2];
  unsigned char v10[40];
  uint64_t v11;

  uint64_t v3 = objc_msgSend(a1, sel_metadata);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v9[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  uint64_t v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (uint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v10), (v7 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v4 + 56) + 32 * v6, (uint64_t)v9);
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  type metadata accessor for MOSuggestionAssetMotionActivityType(0);
  if (swift_dynamicCast()) {
    return v11;
  }
  else {
    return 0;
  }
}

{
  return specialized getMetadata<A>(_:key:as:)(a1, a2, &demangling cache variable for type metadata for [[AnyHashable : Any]]);
}

{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  _OWORD v9[2];
  unsigned char v10[40];
  uint64_t v11;

  uint64_t v3 = objc_msgSend(a1, sel_metadata);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v9[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  uint64_t v5 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (uint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v10), (v7 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v4 + 56) + 32 * v6, (uint64_t)v9);
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast()) {
    return v11;
  }
  else {
    return 0;
  }
}

uint64_t specialized getMetadata<A>(_:key:as:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = objc_msgSend(a1, sel_metadata);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v13[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v14), (v9 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v6 + 56) + 32 * v8, (uint64_t)v13);
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v10 = type metadata accessor for Date();
  int v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a3, v11 ^ 1u, 1, v10);
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2, uint64_t *a3)
{
  id v5 = objc_msgSend(a1, sel_metadata);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v9 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v6 + 56) + 32 * v8, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast()) {
    return v13;
  }
  else {
    return 0;
  }
}

uint64_t specialized getMetadata<A>(_:key:as:)(void *a1, void *a2, unint64_t *a3)
{
  id v5 = objc_msgSend(a1, sel_metadata);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&v11[0] = a2;
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  id v7 = a2;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v9 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v6 + 56) + 32 * v8, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  type metadata accessor for UIScene(0, a3);
  if (swift_dynamicCast()) {
    return v13;
  }
  else {
    return 0;
  }
}

void static JournalingSuggestion.Photo.getCropRect(_:key:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)specialized getMetadata<A>(_:key:as:)(a1, a2, &lazy cache variable for type metadata for MOSuggestionAssetPhotoCropRect);
  id v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_cgRect);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v9;
  *(void *)(a3 + 16) = v11;
  *(void *)(a3 + 24) = v13;
  *(unsigned char *)(a3 + 32) = v5 == 0;
}

uint64_t closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = a1;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  *(void *)(v17 + v16) = a4;
  uint64_t v18 = (void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
  void *v18 = v22;
  v18[1] = a2;
  id v19 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:), v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[22] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v7[25] = swift_task_alloc();
  v7[26] = type metadata accessor for JournalingSuggestion.Photo(0);
  v7[27] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v7[28] = v9;
  v7[29] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v7[30] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v7[31] = v11;
  *uint64_t v11 = v7;
  v11[1] = closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
  return prepareUrlAccess(_:)(v10, a4);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
  }
  else {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void);
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v23)(void);
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;

  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void **)(v0 + 176);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 232) + 16))(v1, *(void *)(v0 + 240), *(void *)(v0 + 224));
  uint64_t v4 = v1 + *(int *)(v2 + 20);
  id v5 = type metadata accessor for Date();
  uint64_t v6 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  unint64_t v25 = *v6;
  id v26 = v4;
  (*v6)(v4, 1, 1, v5);
  uint64_t v7 = objc_msgSend(v3, sel_metadata);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v9 = (void *)*MEMORY[0x263F56400];
  *(void *)(v0 + 168) = *MEMORY[0x263F56400];
  type metadata accessor for MOSuggestionAssetMetadataKey(0);
  lazy protocol witness table accessor for type MOSuggestionAssetMetadataKey and conformance MOSuggestionAssetMetadataKey();
  uint64_t v10 = v9;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v8 + 16) && (uint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v0 + 56), (v12 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v11, v0 + 136);
  }
  else
  {
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 200);
  if (*(void *)(v0 + 160))
  {
    uint64_t v14 = swift_dynamicCast() ^ 1;
    unint64_t v15 = v13;
  }
  else
  {
    outlined destroy of URL?(v0 + 136, &demangling cache variable for type metadata for Any?);
    unint64_t v15 = v13;
    uint64_t v14 = 1;
  }
  v25(v15, v14, 1, v5);
  unint64_t v16 = *(void *)(v0 + 232);
  uint64_t v17 = *(void *)(v0 + 240);
  id v19 = *(void *)(v0 + 216);
  uint64_t v18 = *(void *)(v0 + 224);
  uint64_t v20 = *(void *)(v0 + 208);
  uint64_t v21 = *(void (**)(uint64_t, void))(v0 + 184);
  outlined assign with take of Date?(*(void *)(v0 + 200), v26);
  *(void *)(v0 + 120) = v20;
  *(void *)(v0 + 128) = &protocol witness table for JournalingSuggestion.Photo;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  outlined init with copy of JournalingSuggestion.Photo(v19, (uint64_t)boxed_opaque_existential_1);
  v21(v0 + 96, 0);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  outlined destroy of JournalingSuggestion.Photo(v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, void *);
  id v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v2 = *(void (**)(uint64_t, void *))(v0 + 184);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v3 = v1;
  v2(v0 + 16, v1);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t (*specialized static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - v7;
  id v9 = objc_msgSend(a1, sel_assetType);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      return 0;
    }
  }
  assetImageContentToUrl(_:)(a1, v8);
  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v16(v6, v8, v2);
  unint64_t v17 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v18 = swift_allocObject();
  v16((char *)(v18 + v17), v6, v2);
  *(void *)(v18 + ((v4 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  id v19 = a1;
  return partial apply for closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:);
}

uint64_t sub_2444E2BD8()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(a1, a2, v2 + v6, v7);
}

uint64_t sub_2444E2D28()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = v1 + v5;
  uint64_t v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.Photo.getAssetLoader(for:inside:)(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t outlined init with copy of JournalingSuggestion.Photo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Photo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.Photo(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Photo(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static JournalingSuggestion.LivePhoto.getLivePhotoComponentURLs(pvtURL:)@<X0>(char *a1@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v84 = *MEMORY[0x263EF8340];
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v59 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v63 = (char *)&v56 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v56 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v60 = (uint64_t)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v62 = (uint64_t)&v56 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  id v19 = (char *)&v56 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = *(void (**)(void))(v2 + 56);
  uint64_t v76 = (uint64_t)&v56 - v21;
  v20();
  unint64_t v64 = v19;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v19, 1, 1, v1);
  id v22 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v23);
  unint64_t v25 = v24;
  id v78 = 0;
  id v26 = objc_msgSend(v22, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v24, 0, 0, &v78);

  id v27 = v78;
  if (v26)
  {
    uint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v29 = v27;

    uint64_t v75 = v28;
    uint64_t v74 = *(void *)(v28 + 16);
    if (v74)
    {
      unint64_t v30 = 0;
      unint64_t v73 = v75 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      uint64_t v72 = v2 + 16;
      uint64_t v71 = v2 + 48;
      uint64_t v31 = (void (**)(char *, char *, uint64_t))(v2 + 32);
      uint64_t v68 = v79;
      char v57 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v65 = 6778480;
      long long v58 = xmmword_2444FEEA0;
      uint64_t v67 = v2;
      uint64_t v66 = v20;
      uint64_t v70 = v8;
      uint64_t v69 = (void (**)(char *, char *, uint64_t))(v2 + 32);
      do
      {
        if (v30 >= *(void *)(v75 + 16)) {
          __break(1u);
        }
        (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v16, v73 + *(void *)(v2 + 72) * v30, v1);
        ((void (*)(char *, void, uint64_t, uint64_t))v20)(v16, 0, 1, v1);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v16, 1, v1) == 1) {
          goto LABEL_38;
        }
        char v77 = *v31;
        v77(v8, v16, v1);
        v79[0] = 6778986;
        v79[1] = 0xE300000000000000;
        v79[2] = 1734701162;
        v79[3] = 0xE400000000000000;
        uint64_t v80 = v65;
        uint64_t v81 = (void *)0xE300000000000000;
        uint64_t v82 = 1667851624;
        uint64_t v83 = (void *)0xE400000000000000;
        URL.pathExtension.getter();
        Swift::String v32 = String.lowercased()();
        swift_bridgeObjectRelease();
        if (v32._countAndFlagsBits == 6778986 && v32._object == (void *)0xE300000000000000
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v31 = v69;
        }
        else
        {
          uint64_t v31 = v69;
          if (v32._countAndFlagsBits == 1734701162 && v32._object == (void *)0xE400000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
            || v80 == v32._countAndFlagsBits && v81 == v32._object
            || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
            || v82 == v32._countAndFlagsBits && v83 == v32._object)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if ((v36 & 1) == 0)
            {
              swift_arrayDestroy();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
              uint64_t inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = v58;
              *(void *)(inited + 32) = 7761773;
              *(void *)(inited + 40) = 0xE300000000000000;
              *(void *)(inited + 48) = 3436653;
              *(void *)(inited + 56) = 0xE300000000000000;
              URL.pathExtension.getter();
              Swift::String v38 = String.lowercased()();
              swift_bridgeObjectRelease();
              if (v38._countAndFlagsBits == 7761773 && v38._object == (void *)0xE300000000000000)
              {
                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v20 = v66;
              }
              else
              {
                if (_stringCompareWithSmolCheck(_:_:expecting:)())
                {
                  swift_release();
                  swift_bridgeObjectRelease();
                  uint64_t v20 = v66;
                }
                else
                {
                  uint64_t v20 = v66;
                  if (v38._countAndFlagsBits != 3436653 || v38._object != (void *)0xE300000000000000)
                  {
                    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v31 = v69;
                    if ((v40 & 1) == 0)
                    {
                      uint64_t v8 = v70;
                      (*v57)(v70, v1);
                      goto LABEL_16;
                    }
                    goto LABEL_34;
                  }
                  swift_release();
                  swift_bridgeObjectRelease();
                }
                uint64_t v31 = v69;
              }
LABEL_34:
              uint64_t v39 = (uint64_t)v64;
              outlined destroy of URL?((uint64_t)v64, &demangling cache variable for type metadata for URL?);
              uint64_t v8 = v70;
              v77((char *)v39, v70, v1);
              uint64_t v34 = v39;
              uint64_t v35 = v1;
              goto LABEL_15;
            }
          }
        }
        swift_arrayDestroy();
        uint64_t v33 = v76;
        outlined destroy of URL?(v76, &demangling cache variable for type metadata for URL?);
        uint64_t v8 = v70;
        v77((char *)v33, v70, v1);
        uint64_t v34 = v33;
        uint64_t v35 = v1;
        uint64_t v20 = v66;
LABEL_15:
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v20)(v34, 0, 1, v35);
LABEL_16:
        ++v30;
        uint64_t v2 = v67;
      }
      while (v74 != v30);
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v16, 1, 1, v1);
LABEL_38:
    swift_bridgeObjectRelease();
  }
  else
  {
    id v41 = v78;
    double v42 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v43 = v62;
  outlined init with take of URL?((uint64_t)v64, v62);
  char v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  int v45 = v44(v43, 1, v1);
  uint64_t v46 = v63;
  if (v45 == 1)
  {
    outlined destroy of URL?(v76, &demangling cache variable for type metadata for URL?);
LABEL_44:
    uint64_t v48 = v61;
    outlined destroy of URL?(v43, &demangling cache variable for type metadata for URL?);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 1, 1, v49);
  }
  id v47 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 32);
  v47(v63, v43, v1);
  uint64_t v43 = v60;
  outlined init with take of URL?(v76, v60);
  if (v44(v43, 1, v1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v46, v1);
    goto LABEL_44;
  }
  unint64_t v51 = v59;
  v47(v59, v43, v1);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
  uint64_t v53 = v46;
  uint64_t v54 = v61;
  uint64_t v55 = &v61[*(int *)(v52 + 48)];
  v47(v61, (uint64_t)v51, v1);
  v47(v55, (uint64_t)v53, v1);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v54, 0, 1, v52);
}

uint64_t closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = a1;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  uint64_t v18 = (void *)(v17 + v16);
  void *v18 = v22;
  v18[1] = a2;
  *(void *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = a4;
  swift_retain();
  id v19 = a4;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:), v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[21] = a6;
  v7[22] = a7;
  v7[19] = a4;
  v7[20] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v7[23] = swift_task_alloc();
  v7[24] = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  v7[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL)?);
  v7[26] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
  v7[27] = v9;
  v7[28] = *(void *)(v9 - 8);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  v7[32] = v10;
  v7[33] = *(void *)(v10 - 8);
  v7[34] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v7[35] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v7[36] = v12;
  *uint64_t v12 = v7;
  v12[1] = closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
  return prepareUrlAccess(_:)(v11, a4);
}

uint64_t closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
  }
  else {
    uint64_t v2 = closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_OWORD *, void *);
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void (*v48)(uint64_t, void);
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  _OWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  uint64_t v55 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(char **)(v0 + 208);
  static JournalingSuggestion.LivePhoto.getLivePhotoComponentURLs(pvtURL:)(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    outlined destroy of URL?(*(void *)(v0 + 208), &demangling cache variable for type metadata for (imageURL: URL, videoURL: URL)?);
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v52 = (_OWORD *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 152);
    uint64_t v5 = *(void *)(v0 + 264);
    uint64_t v6 = *(void *)(v0 + 272);
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.bridge);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v4, v7);
    uint64_t v9 = Logger.logObject.getter();
    uint64_t v10 = static os_log_type_t.error.getter();
    uint64_t v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 264);
    uint64_t v13 = *(void *)(v0 + 272);
    uint64_t v14 = *(void *)(v0 + 256);
    if (v11)
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v54 = v49;
      *(_DWORD *)unint64_t v15 = 136315138;
      _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_1(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
      unint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v50(v13, v14);
      _os_log_impl(&dword_2444BF000, v9, v10, "Can't prepare live photo using url: '%s'", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245691070](v49, -1, -1);
      MEMORY[0x245691070](v15, -1, -1);
    }
    else
    {
      uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v50(*(void *)(v0 + 272), *(void *)(v0 + 256));
    }

    Swift::String v32 = *(void *)(v0 + 280);
    uint64_t v33 = *(void *)(v0 + 256);
    uint64_t v34 = *(void (**)(_OWORD *, void *))(v0 + 160);
    type metadata accessor for JournalingSuggestionsError();
    _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestionsError and conformance JournalingSuggestionsError, (void (*)(uint64_t))type metadata accessor for JournalingSuggestionsError);
    *uint64_t v52 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    *(void *)(v0 + 88) = 0;
    uint64_t v35 = (void *)swift_allocError();
    char v37 = v36;
    _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_1(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
    Swift::String v38 = dispatch thunk of CustomStringConvertible.description.getter();
    unsigned __int8 *v37 = 0x4C5255747670;
    v37[1] = 0xE600000000000000;
    v37[2] = v38;
    v37[3] = v39;
    swift_storeEnumTagMultiPayload();
    v34(v52, v35);

    outlined destroy of URL?((uint64_t)v52, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    v50(v32, v33);
  }
  else
  {
    unint64_t v51 = *(void *)(v0 + 280);
    id v19 = *(void *)(v0 + 256);
    uint64_t v18 = *(void **)(v0 + 264);
    uint64_t v20 = *(void *)(v0 + 240);
    uint64_t v53 = *(void *)(v0 + 232);
    uint64_t v21 = *(void *)(v0 + 216);
    double v42 = *(void *)(v0 + 192);
    uint64_t v43 = *(void *)(v0 + 200);
    uint64_t v46 = *(void *)(v0 + 184);
    id v47 = *(void **)(v0 + 176);
    uint64_t v48 = *(void (**)(uint64_t, void))(v0 + 160);
    uint64_t v22 = *(int *)(v21 + 48);
    uint64_t v23 = *(void *)(v0 + 248) + v22;
    uint64_t v24 = *(void *)(v0 + 208) + v22;
    char v44 = (void (*)(uint64_t))v18[4];
    int v45 = *(void *)(v0 + 248);
    v44(v45);
    ((void (*)(uint64_t, uint64_t, uint64_t))v44)(v23, v24, v19);
    unint64_t v25 = v20 + *(int *)(v21 + 48);
    id v26 = (void (*)(void))v18[2];
    v26();
    ((void (*)(uint64_t, uint64_t, uint64_t))v26)(v25, v23, v19);
    id v27 = v53 + *(int *)(v21 + 48);
    v26();
    ((void (*)(uint64_t, uint64_t, uint64_t))v26)(v27, v23, v19);
    uint64_t v28 = v43 + *(int *)(v42 + 24);
    id v29 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
    ((void (*)(uint64_t, uint64_t, uint64_t))v44)(v43, v20, v19);
    ((void (*)(uint64_t, uint64_t, uint64_t))v44)(v43 + *(int *)(v42 + 20), v27, v19);
    unint64_t v30 = (void (*)(uint64_t, uint64_t))v18[1];
    v30(v53, v19);
    v30(v25, v19);
    specialized getMetadata<A>(_:key:as:)(v47, (void *)*MEMORY[0x263F56408], v46);
    outlined assign with take of Date?(v46, v28);
    *(void *)(v0 + 120) = v42;
    *(void *)(v0 + 128) = &protocol witness table for JournalingSuggestion.LivePhoto;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
    outlined init with copy of JournalingSuggestion.LivePhoto(v43, (uint64_t)boxed_opaque_existential_1);
    v48(v0 + 96, 0);
    outlined destroy of URL?(v45, &demangling cache variable for type metadata for (imageURL: URL, videoURL: URL));
    v30(v51, v19);
    outlined destroy of URL?(v0 + 96, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
    outlined destroy of JournalingSuggestion.LivePhoto(v43);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v40 = *(uint64_t (**)(void))(v0 + 8);
  return v40();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void (*v14)(uint64_t, void *);
  id v15;
  uint64_t (*v16)(void);
  uint64_t v18;

  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 296);
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.bridge);
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  uint64_t v6 = static os_log_type_t.error.getter();
  uint64_t v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 296);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 136) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    char *v10 = v12;

    _os_log_impl(&dword_2444BF000, v5, v6, "Can't access live photo urls: %@'", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x245691070](v10, -1, -1);
    MEMORY[0x245691070](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(void **)(v0 + 296);
  uint64_t v14 = *(void (**)(uint64_t, void *))(v0 + 160);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  unint64_t v15 = v13;
  v14(v0 + 16, v13);

  outlined destroy of URL?(v0 + 16, &demangling cache variable for type metadata for JournalingSuggestionAsset?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t (*specialized static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v34 - v9;
  id v11 = objc_msgSend(a1, sel_assetType);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      return 0;
    }
  }
  id v37 = objc_msgSend(a1, sel_content);
  int v18 = swift_dynamicCast();
  id v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  if (v18)
  {
    v19(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v10, v4, v5);
      uint64_t v21 = v35;
      v20(v35, v10, v5);
      unint64_t v22 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v23 = swift_allocObject();
      v20((char *)(v23 + v22), v21, v5);
      *(void *)(v23 + ((v7 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      id v24 = a1;
      return partial apply for closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:);
    }
  }
  else
  {
    v19(v4, 1, 1, v5);
  }
  outlined destroy of URL?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  __swift_project_value_buffer(v26, (uint64_t)static Logger.bridge);
  id v27 = a1;
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    unint64_t v30 = (uint8_t *)swift_slowAlloc();
    id v31 = (id)swift_slowAlloc();
    id v37 = v31;
    *(_DWORD *)unint64_t v30 = 136315138;
    id v36 = objc_msgSend(v27, sel_content);
    uint64_t v32 = String.init<A>(describing:)();
    id v36 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, (uint64_t *)&v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444BF000, v28, v29, "SuggestionLivePhoto.getAssetLoader, Unexpected content: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245691070](v31, -1, -1);
    MEMORY[0x245691070](v30, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_2444E4E04()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1, a2, v2 + v6, v7);
}

uint64_t sub_2444E4F54()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in static JournalingSuggestion.LivePhoto.getAssetLoader(for:inside:)(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t _s21JournalingSuggestions0aB5ErrorOACs0C0AAWlTm_1(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with copy of JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of JournalingSuggestion.LivePhoto(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t JournalingSuggestion.StateOfMind.init(state:icon:lightBackground:darkBackground:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  uint64_t v9 = (int *)type metadata accessor for JournalingSuggestion.StateOfMind(0);
  uint64_t result = outlined init with take of JournalingSuggestion.ItemContent?(a2, (uint64_t)a5 + v9[5], &demangling cache variable for type metadata for URL?);
  *(void *)((char *)a5 + v9[6]) = a3;
  *(void *)((char *)a5 + v9[7]) = a4;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.StateOfMind(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Video.init(url:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return JournalingSuggestion.Video.init(url:date:)(a1, a2, type metadata accessor for JournalingSuggestion.Video, a3);
}

uint64_t type metadata accessor for JournalingSuggestion.Video(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Video);
}

uint64_t JournalingSuggestion.Song.init()@<X0>(_OWORD *a1@<X8>)
{
  return JournalingSuggestion.Song.init()(type metadata accessor for JournalingSuggestion.Song, MEMORY[0x263F06EA8], MEMORY[0x263F07490], a1);
}

uint64_t type metadata accessor for JournalingSuggestion.Song(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Song);
}

uint64_t JournalingSuggestion.Workout.Details.init(activityType:activeEnergyBurned:distance:averageHeartRate:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  uint64_t v8 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a5, (uint64_t)a6 + *(int *)(v8 + 32), &demangling cache variable for type metadata for DateInterval?);
}

uint64_t type metadata accessor for JournalingSuggestion.Workout.Details(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Workout.Details);
}

uint64_t JournalingSuggestion.Workout.init(details:icon:route:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  outlined init with take of JournalingSuggestion.ItemContent?(a1, a4, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  uint64_t v7 = type metadata accessor for JournalingSuggestion.Workout(0);
  uint64_t result = outlined init with take of JournalingSuggestion.ItemContent?(a2, a4 + *(int *)(v7 + 20), &demangling cache variable for type metadata for URL?);
  *(void *)(a4 + *(int *)(v7 + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.Workout(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Workout);
}

uint64_t JournalingSuggestion.WorkoutGroup.init(workouts:icon:activeEnergyBurned:averageHeartRate:duration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, void *a7@<X8>)
{
  *a7 = a1;
  uint64_t v13 = (int *)type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  uint64_t result = outlined init with take of JournalingSuggestion.ItemContent?(a2, (uint64_t)a7 + v13[5], &demangling cache variable for type metadata for URL?);
  *(void *)((char *)a7 + v13[6]) = a3;
  *(void *)((char *)a7 + v13[7]) = a4;
  uint64_t v15 = (char *)a7 + v13[8];
  *(void *)uint64_t v15 = a5;
  v15[8] = a6 & 1;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.WorkoutGroup(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.WorkoutGroup);
}

uint64_t JournalingSuggestion.MotionActivity.init(icon:steps:date:movementType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  char v8 = *a4;
  outlined init with take of JournalingSuggestion.ItemContent?(a1, a5, &demangling cache variable for type metadata for URL?);
  uint64_t v9 = (int *)type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(void *)(a5 + v9[5]) = a2;
  uint64_t result = outlined init with take of JournalingSuggestion.ItemContent?(a3, a5 + v9[6], &demangling cache variable for type metadata for DateInterval?);
  *(unsigned char *)(a5 + v9[7]) = v8;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.MotionActivity(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.MotionActivity);
}

uint64_t JournalingSuggestion.Podcast.init()@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Podcast(0);
  *a1 = 0u;
  a1[1] = 0u;
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  unint64_t v5 = (char *)a1 + *(int *)(v2 + 28);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, 1, 1, v6);
}

uint64_t type metadata accessor for JournalingSuggestion.Podcast(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Podcast);
}

uint64_t JournalingSuggestion.ItemContent.init(id:representations:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t result = type metadata accessor for JournalingSuggestion.ItemContent(0);
  *(void *)(a4 + *(int *)(result + 20)) = a2;
  *(void *)(a4 + *(int *)(result + 24)) = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestion.ItemContent(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.ItemContent);
}

uint64_t JournalingSuggestion.ItemContent.getContentProviderOfType<A>(assetType:for:inside:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!(*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(a5 + 16))(a2, a3, a4, a5))
  {
    uint64_t v7 = _typeName(_:qualified:)();
    unint64_t v9 = v8;
    id v10 = objc_msgSend(a2, sel_assetType);
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;

    v21[1] = 0xE000000000000000;
    objc_msgSend(a2, sel_content);
    _print_unlocked<A, B>(_:_:)();
    swift_unknownObjectRelease();
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v20 = v11;
      uint64_t v18 = swift_slowAlloc();
      v21[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v9, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v13, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2444BF000, v15, v16, "No asset '%s' loader available for '%s' content class type '%s'", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x245691070](v18, -1, -1);
      MEMORY[0x245691070](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return a1;
}

Swift::Void __swiftcall JournalingSuggestion.ItemContent.appendAssetContent(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = *((void *)a1._rawValue + 2);
  if (v2)
  {
    uint64_t v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
    uint64_t v19 = *(int *)(v4 + 20);
    uint64_t v20 = *(int *)(v4 + 24);
    unint64_t v5 = *(void **)(v1 + v20);
    uint64_t v21 = v1;
    uint64_t v6 = *(void **)(v1 + v19);
    swift_bridgeObjectRetain();
    uint64_t v7 = (uint64_t *)((char *)a1._rawValue + 72);
    do
    {
      long long v22 = *(_OWORD *)(v7 - 5);
      uint64_t v8 = *(v7 - 3);
      uint64_t v9 = *(v7 - 2);
      uint64_t v10 = *(v7 - 1);
      uint64_t v11 = *v7;
      swift_retain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, v5);
      }
      unint64_t v13 = v5[2];
      unint64_t v12 = v5[3];
      if (v13 >= v12 >> 1) {
        unint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v12 > 1), v13 + 1, 1, v5);
      }
      v5[2] = v13 + 1;
      uint64_t v14 = &v5[4 * v13];
      *((_OWORD *)v14 + 2) = v22;
      v14[6] = v8;
      v14[7] = v9;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, v6, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
      }
      unint64_t v16 = v6[2];
      unint64_t v15 = v6[3];
      if (v16 >= v15 >> 1) {
        uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v15 > 1), v16 + 1, 1, v6, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
      }
      uint64_t v17 = *(void *)(v11 + 8);
      v6[2] = v16 + 1;
      uint64_t v18 = &v6[2 * v16];
      v18[4] = v10;
      v18[5] = v17;
      swift_release();
      v7 += 6;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    *(void *)(v21 + v19) = v6;
    *(void *)(v21 + v20) = v5;
  }
}

uint64_t _sScG7addTask8priority9operationyScPSg_xyYaYAcntF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v12, &demangling cache variable for type metadata for TaskPriority?);
  uint64_t v13 = type metadata accessor for TaskPriority();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    outlined destroy of TaskPriority?((uint64_t)v12);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v15 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v17 = v16;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  uint64_t v17 = 0;
LABEL_6:
  uint64_t v18 = *v5;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = *(void *)(a4 + 16);
  v19[3] = a2;
  v19[4] = a3;
  uint64_t v20 = (void *)(v17 | v15);
  if (v17 | v15)
  {
    v23[0] = 0;
    v23[1] = 0;
    uint64_t v20 = v23;
    v23[2] = v15;
    void v23[3] = v17;
  }
  v22[1] = 1;
  id v22[2] = v20;
  v22[3] = v18;
  swift_task_create();
  return swift_release();
}

uint64_t JournalingSuggestion.init(items:title:date:suggestionIdentifier:suggestionHashValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  uint64_t v11 = (int *)type metadata accessor for JournalingSuggestion(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a4, (uint64_t)a7 + v11[6], &demangling cache variable for type metadata for DateInterval?);
  unint64_t v12 = (char *)a7 + v11[7];
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a5, v13);
  *(void *)((char *)a7 + v11[8]) = a6;
  return result;
}

uint64_t JournalingSuggestion.Location.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Location(0);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  uint64_t v3 = a1 + *(int *)(v2 + 28);
  uint64_t v4 = type metadata accessor for Date();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 1, 1, v4);
}

JournalingSuggestions::JournalingSuggestion::LocationGroup __swiftcall JournalingSuggestion.LocationGroup.init(locations:)(JournalingSuggestions::JournalingSuggestion::LocationGroup locations)
{
  v1->locations._rawValue = locations.locations._rawValue;
  return locations;
}

uint64_t JournalingSuggestion.GenericMedia.init()@<X0>(_OWORD *a1@<X8>)
{
  return JournalingSuggestion.Song.init()(type metadata accessor for JournalingSuggestion.GenericMedia, MEMORY[0x263F07490], MEMORY[0x263F06EA8], a1);
}

uint64_t JournalingSuggestion.Song.init()@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(void)@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v7 = a1(0);
  *a4 = 0u;
  a4[1] = 0u;
  a4[2] = 0u;
  uint64_t v8 = (char *)a4 + *(int *)(v7 + 28);
  uint64_t v9 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = (char *)a4 + *(int *)(v7 + 32);
  uint64_t v11 = a3(0);
  unint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);

  return v12(v10, 1, 1, v11);
}

uint64_t JournalingSuggestion.Reflection.init(prompt:color:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t JournalingSuggestion.Photo.init(photo:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return JournalingSuggestion.Video.init(url:date:)(a1, a2, type metadata accessor for JournalingSuggestion.Photo, a3);
}

uint64_t JournalingSuggestion.Video.init(url:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t v9 = a3(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a2, a4 + *(int *)(v9 + 20), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.LivePhoto.init(image:video:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  v9(a4, a1, v8);
  uint64_t v10 = type metadata accessor for JournalingSuggestion.LivePhoto(0);
  v9(a4 + *(int *)(v10 + 20), a2, v8);
  return outlined init with take of JournalingSuggestion.ItemContent?(a3, a4 + *(int *)(v10 + 24), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Workout.Details.activityType.getter()
{
  return *(void *)v0;
}

uint64_t JournalingSuggestion.Workout.Details.activityType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*JournalingSuggestion.Workout.Details.activityType.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.activeEnergyBurned.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.activeEnergyBurned.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.activeEnergyBurned.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.distance.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.distance.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.distance.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Workout.Details.averageHeartRate.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.Workout.Details.averageHeartRate.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t (*JournalingSuggestion.Workout.Details.averageHeartRate.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.Details.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.Workout.Details, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.Workout.Details.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.Workout.Details, &demangling cache variable for type metadata for DateInterval?);
}

uint64_t (*JournalingSuggestion.Workout.Details.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.details.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of URL?(v1, a1, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
}

uint64_t JournalingSuggestion.Workout.details.setter(uint64_t a1)
{
  return outlined assign with take of URL?(a1, v1, &demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
}

uint64_t (*JournalingSuggestion.Workout.details.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Workout, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Workout.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Workout, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Workout.icon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.route.getter()
{
  return JournalingSuggestion.Workout.route.getter((void (*)(void))type metadata accessor for JournalingSuggestion.Workout);
}

uint64_t JournalingSuggestion.Workout.route.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.route.setter(a1, type metadata accessor for JournalingSuggestion.Workout);
}

uint64_t (*JournalingSuggestion.Workout.route.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Workout.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  uint64_t v3 = type metadata accessor for JournalingSuggestion.Workout(0);
  uint64_t v4 = a1 + *(int *)(v3 + 20);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)(a1 + *(int *)(v3 + 24)) = 0;
  return result;
}

uint64_t JournalingSuggestion.WorkoutGroup.workouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.WorkoutGroup.workouts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.workouts.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.WorkoutGroup.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.WorkoutGroup, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Workout.icon.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 20), a3, a2);
}

uint64_t JournalingSuggestion.WorkoutGroup.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.WorkoutGroup, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Workout.icon.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 20), a3);
}

uint64_t (*JournalingSuggestion.WorkoutGroup.icon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.WorkoutGroup.activeEnergyBurned.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 24));
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.WorkoutGroup.activeEnergyBurned.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 24);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.activeEnergyBurned.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.WorkoutGroup.averageHeartRate.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 28));
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.WorkoutGroup.averageHeartRate.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 28);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.averageHeartRate.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.WorkoutGroup.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.WorkoutGroup(0) + 32));
}

uint64_t JournalingSuggestion.WorkoutGroup.duration.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for JournalingSuggestion.WorkoutGroup(0);
  uint64_t v6 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*JournalingSuggestion.WorkoutGroup.duration.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Contact.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Contact.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.Contact.name.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Contact.photo.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Contact, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Contact.init(name:photo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  uint64_t v6 = type metadata accessor for JournalingSuggestion.Contact(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a3, (uint64_t)a4 + *(int *)(v6 + 20), &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Location.place.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Location.city.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void *JournalingSuggestion.Location.location.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void JournalingSuggestion.Location.location.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*JournalingSuggestion.Location.location.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Location.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Location, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Location.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Location, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Location.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Location.init(place:city:location:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  uint64_t v9 = type metadata accessor for JournalingSuggestion.Location(0);
  return outlined init with take of JournalingSuggestion.ItemContent?(a6, (uint64_t)a7 + *(int *)(v9 + 28), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.LocationGroup.locations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.LocationGroup.locations.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*JournalingSuggestion.LocationGroup.locations.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.song.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.artist.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Song.album.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Location.date.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 28), a3, a2);
}

uint64_t JournalingSuggestion.Song.artwork.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Location.date.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 28), a3);
}

uint64_t (*JournalingSuggestion.Song.artwork.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Workout.Details.date.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 32), a3, a2);
}

uint64_t JournalingSuggestion.Song.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Workout.Details.date.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 32), a3);
}

uint64_t (*JournalingSuggestion.Song.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Song.init(song:artist:album:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  return JournalingSuggestion.Song.init(song:artist:album:artwork:date:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, type metadata accessor for JournalingSuggestion.Song, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Podcast.episode.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t (*JournalingSuggestion.Podcast.show.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.Podcast.artwork.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.Podcast.artwork.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Podcast.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.Podcast, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Podcast.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Podcast.init(episode:show:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  uint64_t v10 = type metadata accessor for JournalingSuggestion.Podcast(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a5, (uint64_t)a7 + *(int *)(v10 + 24), &demangling cache variable for type metadata for URL?);
  return outlined init with take of JournalingSuggestion.ItemContent?(a6, (uint64_t)a7 + *(int *)(v10 + 28), &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.GenericMedia.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.GenericMedia.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.title.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.artist.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Location.city.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.artist.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.album.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Song.album.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*JournalingSuggestion.GenericMedia.album.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Location.date.getter(type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.GenericMedia.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Location.date.setter(a1, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.GenericMedia.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.appIcon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.Details.date.getter(type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.GenericMedia.appIcon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.Details.date.setter(a1, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.GenericMedia.appIcon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.GenericMedia.init(title:artist:album:date:appIcon:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  return JournalingSuggestion.Song.init(song:artist:album:artwork:date:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, type metadata accessor for JournalingSuggestion.GenericMedia, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.Song.init(song:artist:album:artwork:date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t (*a10)(void), uint64_t *a11, uint64_t *a12)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  uint64_t v15 = a10(0);
  outlined init with take of JournalingSuggestion.ItemContent?(a7, (uint64_t)a9 + *(int *)(v15 + 28), a11);
  return outlined init with take of JournalingSuggestion.ItemContent?(a8, (uint64_t)a9 + *(int *)(v15 + 32), a12);
}

uint64_t JournalingSuggestion.Photo.photo.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter(MEMORY[0x263F06EA8], a1);
}

uint64_t JournalingSuggestion.Photo.photo.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, MEMORY[0x263F06EA8]);
}

uint64_t (*JournalingSuggestion.Photo.photo.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Photo.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Photo, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Photo.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Photo, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Photo.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Video.url.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter(MEMORY[0x263F06EA8], a1);
}

uint64_t JournalingSuggestion.Video.url.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, MEMORY[0x263F06EA8]);
}

uint64_t (*JournalingSuggestion.Video.url.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Video.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.Video, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Video.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.Video, &demangling cache variable for type metadata for Date?);
}

uint64_t (*JournalingSuggestion.Video.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.image.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter(MEMORY[0x263F06EA8], a1);
}

uint64_t JournalingSuggestion.LivePhoto.image.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, MEMORY[0x263F06EA8]);
}

uint64_t (*JournalingSuggestion.LivePhoto.image.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.video.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion.LivePhoto(0) + 20);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t JournalingSuggestion.LivePhoto.video.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion.LivePhoto(0) + 20);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*JournalingSuggestion.LivePhoto.video.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.LivePhoto.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.LivePhoto, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t JournalingSuggestion.Podcast.artwork.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return outlined init with copy of URL?(v3 + *(int *)(v6 + 24), a3, a2);
}

uint64_t JournalingSuggestion.LivePhoto.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.LivePhoto, &demangling cache variable for type metadata for Date?);
}

uint64_t JournalingSuggestion.Podcast.artwork.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return outlined assign with take of URL?(a1, v3 + *(int *)(v6 + 24), a3);
}

uint64_t (*JournalingSuggestion.LivePhoto.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of URL?(v1, a1, &demangling cache variable for type metadata for URL?);
}

uint64_t JournalingSuggestion.MotionActivity.icon.setter(uint64_t a1)
{
  return outlined assign with take of URL?(a1, v1, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.MotionActivity.icon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.steps.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion.MotionActivity(0) + 20));
}

uint64_t JournalingSuggestion.MotionActivity.steps.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(void *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.MotionActivity.steps.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.MotionActivity.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion.MotionActivity, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.MotionActivity.date.setter(uint64_t a1)
{
  return JournalingSuggestion.Podcast.artwork.setter(a1, type metadata accessor for JournalingSuggestion.MotionActivity, &demangling cache variable for type metadata for DateInterval?);
}

uint64_t (*JournalingSuggestion.MotionActivity.date.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

void static JournalingSuggestion.MotionActivity.MovementType.running.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static JournalingSuggestion.MotionActivity.MovementType.walking.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static JournalingSuggestion.MotionActivity.MovementType.runningWalking.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aRunning_0[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  return JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys>);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys>);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys>);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
      uint64_t v15 = v21;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  return 0;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *protocol witness for Decodable.init(from:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.init(from:)(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl(void *a1)
{
  return JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.encode(to:)(a1, *v1);
}

BOOL static JournalingSuggestion.MotionActivity.MovementType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void JournalingSuggestion.MotionActivity.MovementType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<JournalingSuggestion.MotionActivity.MovementType.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v10 = v7;
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int JournalingSuggestion.MotionActivity.MovementType.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t JournalingSuggestion.MotionActivity.MovementType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance JournalingSuggestion.MotionActivity.MovementType@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return JournalingSuggestion.MotionActivity.MovementType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance JournalingSuggestion.MotionActivity.MovementType(void *a1)
{
  return JournalingSuggestion.MotionActivity.MovementType.encode(to:)(a1);
}

uint64_t JournalingSuggestion.MotionActivity.movementType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t JournalingSuggestion.MotionActivity.movementType.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for JournalingSuggestion.MotionActivity(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*JournalingSuggestion.MotionActivity.movementType.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

id JournalingSuggestion.StateOfMind.state.getter()
{
  return *v0;
}

void JournalingSuggestion.StateOfMind.state.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*JournalingSuggestion.StateOfMind.state.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.icon.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Workout.icon.getter(type metadata accessor for JournalingSuggestion.StateOfMind, &demangling cache variable for type metadata for URL?, a1);
}

uint64_t JournalingSuggestion.StateOfMind.icon.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.icon.setter(a1, type metadata accessor for JournalingSuggestion.StateOfMind, &demangling cache variable for type metadata for URL?);
}

uint64_t (*JournalingSuggestion.StateOfMind.icon.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.lightBackground.getter()
{
  return JournalingSuggestion.Workout.route.getter((void (*)(void))type metadata accessor for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Workout.route.getter(void (*a1)(void))
{
  a1(0);

  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.StateOfMind.lightBackground.setter(uint64_t a1)
{
  return JournalingSuggestion.Workout.route.setter(a1, type metadata accessor for JournalingSuggestion.StateOfMind);
}

uint64_t JournalingSuggestion.Workout.route.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = *(int *)(a2(0) + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.StateOfMind.lightBackground.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.StateOfMind.darkBackground.getter()
{
  type metadata accessor for JournalingSuggestion.StateOfMind(0);

  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.StateOfMind.darkBackground.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for JournalingSuggestion.StateOfMind(0) + 28);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.StateOfMind.darkBackground.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Reflection.prompt.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.Reflection.prompt.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JournalingSuggestion.Reflection.prompt.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.Reflection.color.getter()
{
  return swift_retain();
}

uint64_t JournalingSuggestion.Reflection.color.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.Reflection.color.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.ItemContent.id.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Photo.photo.getter(MEMORY[0x263F07508], a1);
}

uint64_t JournalingSuggestion.Photo.photo.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t JournalingSuggestion.ItemContent.id.setter(uint64_t a1)
{
  return JournalingSuggestion.Photo.photo.setter(a1, MEMORY[0x263F07508]);
}

uint64_t JournalingSuggestion.Photo.photo.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = a2(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v2, a1, v4);
}

uint64_t (*JournalingSuggestion.ItemContent.id.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t JournalingSuggestion.ItemContent.representations.getter()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);

  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.ItemContent.representations.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.ItemContent.representations.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

BOOL JournalingSuggestion.ItemContent.hasContent<A>(ofType:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20));
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (uint64_t *)(v3 + 32);
  uint64_t v6 = v4 - 1;
  do
  {
    uint64_t v7 = *v5;
    v5 += 2;
    BOOL result = v7 == a1;
  }
  while (v7 != a1 && v6-- != 0);
  return result;
}

uint64_t JournalingSuggestion.ItemContent.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  *uint64_t v9 = v5;
  v9[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return static JournalingSuggestionAsset.content(forItem:)(a1, v4, a3, a4);
}

uint64_t JournalingSuggestion.ItemContent.content.getter()
{
  type metadata accessor for JournalingSuggestion.ItemContent(0);

  return swift_bridgeObjectRetain();
}

uint64_t JournalingSuggestion.ItemContent.content.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*JournalingSuggestion.ItemContent.content.modify())()
{
  return destructiveProjectEnumData for JournalingSuggestionsError;
}

uint64_t protocol witness for Identifiable.id.getter in conformance JournalingSuggestion.ItemContent@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](JournalingSuggestion.content<A>(forType:), 0, 0);
}

uint64_t JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 24);
  long long v8 = *(_OWORD *)(v0 + 32);
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = type metadata accessor for Array();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  *(_OWORD *)(v5 + 16) = v8;
  *(void *)(v5 + 32) = v1;
  *(void *)(v5 + 40) = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  void *v6 = v0;
  v6[1] = JournalingSuggestion.content<A>(forType:);
  return MEMORY[0x270FA2158](v0 + 16, v3, v4, 0, 0, &async function pointer to partial apply for closure #1 in JournalingSuggestion.content<A>(forType:), v5, v3);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](JournalingSuggestion.content<A>(forType:), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[10] = swift_task_alloc();
  uint64_t v7 = *(void *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8);
  v6[11] = v7;
  v6[12] = *(void *)(v7 + 64);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in JournalingSuggestion.content<A>(forType:), 0, 0);
}

uint64_t closure #1 in JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v5 = *(void *)v1 + ((v4 + 32) & ~v4);
    uint64_t v6 = *(void *)(v3 + 72);
    uint64_t v26 = (v4 + 56) & ~v4;
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v14 = *(void *)(v0 + 112);
      outlined init with copy of JournalingSuggestion.ItemContent(v5 + i * v6, v14);
      uint64_t v15 = *(void *)(v14 + *(int *)(type metadata accessor for JournalingSuggestion.ItemContent(0) + 20));
      uint64_t v16 = *(void *)(v15 + 16);
      if (v16)
      {
        uint64_t v17 = (void *)(v15 + 32);
        uint64_t v18 = *(void *)(v0 + 56);
        while (*v17 != v18)
        {
          v17 += 2;
          if (!--v16) {
            goto LABEL_4;
          }
        }
        uint64_t v9 = *(void *)(v0 + 104);
        uint64_t v8 = *(void *)(v0 + 112);
        uint64_t v10 = *(void *)(v0 + 80);
        uint64_t v11 = type metadata accessor for TaskPriority();
        long long v27 = *(_OWORD *)(v0 + 64);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
        outlined init with copy of JournalingSuggestion.ItemContent(v8, v9);
        uint64_t v12 = swift_allocObject();
        *(void *)(v12 + 16) = 0;
        *(void *)(v12 + 24) = 0;
        *(_OWORD *)(v12 + 32) = v27;
        *(void *)(v12 + 48) = v18;
        outlined init with take of JournalingSuggestion.ItemContent(v9, v12 + v26);
        type metadata accessor for Optional();
        uint64_t v13 = type metadata accessor for TaskGroup();
        _sScG7addTask8priority9operationyScPSg_xyYaYAcntF(v10, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:), v12, v13);
        outlined destroy of TaskPriority?(v10);
      }
LABEL_4:
      _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0(*(void *)(v0 + 112), type metadata accessor for JournalingSuggestion.ItemContent);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 16) = **(void **)(v0 + 40);
  long long v28 = *(_OWORD *)(v0 + 64);
  *(void *)(v0 + 24) = Array.init()();
  uint64_t v19 = swift_task_alloc();
  *(void *)(v0 + 120) = v19;
  *(_OWORD *)(v19 + 16) = v28;
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v20;
  type metadata accessor for Optional();
  uint64_t v21 = type metadata accessor for TaskGroup();
  uint64_t v22 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v20 = v0;
  v20[1] = closure #1 in JournalingSuggestion.content<A>(forType:);
  uint64_t v24 = *(void *)(v0 + 32);
  return MEMORY[0x270FA20A8](v24, v0 + 24, &async function pointer to partial apply for closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:), v19, v21, v22, WitnessTable);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  void v7[5] = a4;
  v7[6] = a5;
  v7[4] = a1;
  v7[9] = type metadata accessor for JournalingSuggestion.ItemContent(0);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:), 0, 0);
}

uint64_t closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v22 = v0;
  if (one-time initialization token for assets != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[6];
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logger.assets);
  outlined init with copy of JournalingSuggestion.ItemContent(v2, v1);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[11];
  if (v6)
  {
    uint64_t v8 = v0[10];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = _typeName(_:qualified:)();
    v0[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    outlined init with copy of JournalingSuggestion.ItemContent(v7, v8);
    uint64_t v13 = String.init<A>(describing:)();
    v0[3] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0(v7, type metadata accessor for JournalingSuggestion.ItemContent);
    _os_log_impl(&dword_2444BF000, v4, v5, "Loading content %s for item %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245691070](v10, -1, -1);
    MEMORY[0x245691070](v9, -1, -1);
  }
  else
  {
    _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0(v0[11], type metadata accessor for JournalingSuggestion.ItemContent);
  }

  uint64_t v15 = (void *)swift_task_alloc();
  v0[12] = v15;
  *uint64_t v15 = v0;
  v15[1] = closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:);
  uint64_t v16 = v0[7];
  uint64_t v17 = v0[8];
  uint64_t v18 = v0[5];
  uint64_t v19 = v0[4];
  return JournalingSuggestion.ItemContent.content<A>(forType:)(v19, v18, v16, v17);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {

    return MEMORY[0x270FA2498](closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:), 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[7] - 8) + 56))(v0[4], 1, 1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v5 = type metadata accessor for Optional();
  v3[5] = v5;
  v3[6] = *(void *)(v5 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = *(void *)(a3 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:), 0, 0);
}

uint64_t closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)()
{
  uint64_t v1 = v0[8];
  uint64_t v3 = v0 + 7;
  uint64_t v2 = v0[7];
  uint64_t v4 = v0 + 6;
  uint64_t v5 = v0 + 5;
  uint64_t v6 = v0[4];
  (*(void (**)(uint64_t, void, void))(v0[6] + 16))(v2, v0[3], v0[5]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1, v6) != 1)
  {
    uint64_t v3 = v0 + 10;
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    uint64_t v10 = v0[4];
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v7, v0[7], v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v10);
    type metadata accessor for Array();
    Array.append(_:)();
    uint64_t v4 = v0 + 8;
    uint64_t v5 = v0 + 4;
  }
  (*(void (**)(void, void))(*v4 + 8))(*v3, *v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t JournalingSuggestion.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalingSuggestion.date.getter@<X0>(uint64_t a1@<X8>)
{
  return JournalingSuggestion.Podcast.artwork.getter(type metadata accessor for JournalingSuggestion, &demangling cache variable for type metadata for DateInterval?, a1);
}

uint64_t JournalingSuggestion.suggestionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JournalingSuggestion(0) + 28);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t JournalingSuggestion.suggestionHashValue.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for JournalingSuggestion(0) + 32));
}

Swift::Int JournalingSuggestion.hashValue.getter()
{
  uint64_t v1 = type metadata accessor for DateInterval();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)();
  uint64_t v8 = type metadata accessor for JournalingSuggestion(0);
  type metadata accessor for UUID();
  _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(void *)(v0 + *(int *)(v8 + 32)));
  outlined init with copy of URL?(v0 + *(int *)(v8 + 24), (uint64_t)v7, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    Hasher._combine(_:)(1u);
    _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, MEMORY[0x263F062D0]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance JournalingSuggestion()
{
  Swift::Int v0 = JournalingSuggestion.hashValue.getter();
  return v0 == JournalingSuggestion.hashValue.getter();
}

BOOL static JournalingSuggestion.== infix(_:_:)()
{
  Swift::Int v0 = JournalingSuggestion.hashValue.getter();
  return v0 == JournalingSuggestion.hashValue.getter();
}

void JournalingSuggestion.hash(into:)()
{
  uint64_t v1 = type metadata accessor for DateInterval();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for JournalingSuggestion(0);
  type metadata accessor for UUID();
  _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(void *)(v0 + *(int *)(v8 + 32)));
  outlined init with copy of URL?(v0 + *(int *)(v8 + 24), (uint64_t)v7, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    Hasher._combine(_:)(1u);
    _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, MEMORY[0x263F062D0]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance JournalingSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)();
  type metadata accessor for UUID();
  _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
  dispatch thunk of Hashable.hash(into:)();
  Hasher._combine(_:)(*(void *)(v2 + *(int *)(a2 + 32)));
  outlined init with copy of URL?(v2 + *(int *)(a2 + 24), (uint64_t)v10, &demangling cache variable for type metadata for DateInterval?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    Hasher._combine(_:)(1u);
    _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, MEMORY[0x263F062D0]);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return Hasher._finalize()();
}

void JournalingSuggestion.ItemContent.appendContentOfType<A>(assetType:for:inside:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(a5 + 16))(a2, a3, a4, a5);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    uint64_t v14 = type metadata accessor for JournalingSuggestion.ItemContent(0);
    uint64_t v15 = *(int *)(v14 + 24);
    uint64_t v16 = *(void **)(v6 + v15);
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
    }
    unint64_t v18 = v16[2];
    unint64_t v17 = v16[3];
    if (v18 >= v17 >> 1) {
      uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v16);
    }
    v16[2] = v18 + 1;
    uint64_t v19 = &v16[4 * v18];
    v19[4] = a1;
    uint64_t v19[5] = a5;
    v19[6] = v12;
    v19[7] = v13;
    *(void *)(v6 + v15) = v16;
    uint64_t v20 = *(int *)(v14 + 20);
    uint64_t v21 = *(void **)(v6 + v20);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21[2] + 1, 1, v21, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
    }
    unint64_t v23 = v21[2];
    unint64_t v22 = v21[3];
    if (v23 >= v22 >> 1) {
      uint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v22 > 1), v23 + 1, 1, v21, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestionAsset.Type>);
    }
    uint64_t v24 = *(void *)(a5 + 8);
    uint64_t v21[2] = v23 + 1;
    char v25 = &v21[2 * v23];
    v25[4] = a1;
    uint64_t v25[5] = v24;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@in_guaranteed JournalingSuggestionAsset?, @guaranteed Error?) -> ()) -> ())?(v12);
    *(void *)(v6 + v20) = v21;
  }
  else
  {
    uint64_t v26 = _typeName(_:qualified:)();
    unint64_t v28 = v27;
    id v29 = objc_msgSend(a2, sel_assetType);
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v32 = v31;

    v38[1] = 0xE000000000000000;
    objc_msgSend(a2, sel_content);
    _print_unlocked<A, B>(_:_:)();
    swift_unknownObjectRelease();
    if (one-time initialization token for bridge != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    __swift_project_value_buffer(v33, (uint64_t)static Logger.bridge);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v38[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v28, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v32, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2444BF000, v34, v35, "No asset '%s' loader available for '%s' content class type '%s'", (uint8_t *)v36, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x245691070](v37, -1, -1);
      MEMORY[0x245691070](v36, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3, void *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<HKStateOfMindAssociation>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<HKStateOfMindLabel>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetProvider.Type>);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      _OWORD v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
      uint64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4]) {
          memmove(v14, a4 + 4, 8 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;

  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      _OWORD v11[2] = v9;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
      uint64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v9 + 4]) {
          memmove(v14, a4 + 4, 16 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.Workout>, type metadata accessor for JournalingSuggestion.Workout, type metadata accessor for JournalingSuggestion.Workout);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.ItemContent>, type metadata accessor for JournalingSuggestion.ItemContent, type metadata accessor for JournalingSuggestion.ItemContent);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<JournalingSuggestion.Location>, type metadata accessor for JournalingSuggestion.Location, type metadata accessor for JournalingSuggestion.Location);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InternalAssetContent.AssetProvider>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(assetProvider: InternalAssetContent.AssetProvider, assetType: InternalAssetProvider.Type)>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  id v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t type metadata accessor for JournalingSuggestion(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion);
}

uint64_t type metadata accessor for JournalingSuggestion.Location(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Location);
}

uint64_t type metadata accessor for JournalingSuggestion.GenericMedia(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.GenericMedia);
}

uint64_t type metadata accessor for JournalingSuggestion.Photo(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Photo);
}

uint64_t type metadata accessor for JournalingSuggestion.LivePhoto(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.LivePhoto);
}

uint64_t type metadata accessor for JournalingSuggestion.Contact(uint64_t a1)
{
  return type metadata accessor for JournalingSuggestion.StateOfMind(a1, (uint64_t *)&type metadata singleton initialization cache for JournalingSuggestion.Contact);
}

uint64_t type metadata accessor for JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl);
  }
  return result;
}

uint64_t partial apply for closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  void *v10 = v3;
  v10[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  return closure #1 in JournalingSuggestion.content<A>(forType:)(a1, a2, v9, v8, v6, v7);
}

uint64_t _s10Foundation4UUIDVACSHAAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@in_guaranteed JournalingSuggestionAsset?, @guaranteed Error?) -> ()) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Workout.Details()
{
  return &protocol witness table for JournalingSuggestion.Workout.Details;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Workout()
{
  return &protocol witness table for JournalingSuggestion.Workout;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.WorkoutGroup()
{
  return &protocol witness table for JournalingSuggestion.WorkoutGroup;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Contact()
{
  return &protocol witness table for JournalingSuggestion.Contact;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Location()
{
  return &protocol witness table for JournalingSuggestion.Location;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.LocationGroup()
{
  return &protocol witness table for JournalingSuggestion.LocationGroup;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Song()
{
  return &protocol witness table for JournalingSuggestion.Song;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Podcast()
{
  return &protocol witness table for JournalingSuggestion.Podcast;
}

char **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.GenericMedia()
{
  return &protocol witness table for JournalingSuggestion.GenericMedia;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Photo()
{
  return &protocol witness table for JournalingSuggestion.Photo;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Video()
{
  return &protocol witness table for JournalingSuggestion.Video;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.LivePhoto()
{
  return &protocol witness table for JournalingSuggestion.LivePhoto;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType and conformance JournalingSuggestion.MotionActivity.MovementType);
  }
  return result;
}

char **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.MotionActivity()
{
  return &protocol witness table for JournalingSuggestion.MotionActivity;
}

char **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.StateOfMind()
{
  return &protocol witness table for JournalingSuggestion.StateOfMind;
}

_UNKNOWN **associated type witness table accessor for JournalingSuggestionAsset.JournalingSuggestionContent : JournalingSuggestionAsset in JournalingSuggestion.Reflection()
{
  return &protocol witness table for JournalingSuggestion.Reflection;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in JournalingSuggestion.ItemContent()
{
  return _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x263F07508]);
}

uint64_t base witness table accessor for Equatable in JournalingSuggestion()
{
  return _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type JournalingSuggestion and conformance JournalingSuggestion, (void (*)(uint64_t))type metadata accessor for JournalingSuggestion);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    uint64_t v9 = a3[6];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = type metadata accessor for DateInterval();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)v7 + v15;
    unint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    *(uint64_t *)((char *)v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  }
  return v7;
}

uint64_t destroy for JournalingSuggestion(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for DateInterval();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

void *initializeWithCopy for JournalingSuggestion(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *assignWithCopy for JournalingSuggestion(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateInterval();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  unint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

void *assignWithTake for JournalingSuggestion(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DateInterval();
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
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[7];
  unint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444EC308);
}

uint64_t sub_2444EC308(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for UUID();
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444EC44C);
}

void *sub_2444EC44C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for UUID();
      int v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 28);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for JournalingSuggestion()
{
  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, MEMORY[0x263F062D0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Workout(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v29 = v8;
      uint64_t v11 = (void *)a2[1];
      *a1 = *a2;
      a1[1] = (uint64_t)v11;
      uint64_t v12 = (void *)a2[2];
      uint64_t v13 = (void *)a2[3];
      a1[2] = (uint64_t)v12;
      a1[3] = (uint64_t)v13;
      uint64_t v14 = *(int *)(v7 + 32);
      __dst = (char *)a1 + v14;
      unint64_t v31 = (char *)a2 + v14;
      uint64_t v15 = type metadata accessor for DateInterval();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
      id v17 = v11;
      id v18 = v12;
      id v19 = v13;
      if (v30(v31, 1, v15))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
        memcpy(__dst, v31, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(__dst, v31, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v7);
    }
    uint64_t v21 = *(int *)(a3 + 20);
    unint64_t v22 = (char *)a1 + v21;
    unint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = type metadata accessor for URL();
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.Workout(id *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {

    int v5 = (char *)a1 + *(int *)(v4 + 32);
    uint64_t v6 = type metadata accessor for DateInterval();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  uint64_t v8 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for JournalingSuggestion.Workout(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v29 = v7;
    uint64_t v30 = a3;
    uint64_t v9 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v11 = (void *)a2[2];
    uint64_t v10 = (void *)a2[3];
    a1[2] = v11;
    a1[3] = v10;
    uint64_t v12 = *(int *)(v6 + 32);
    unint64_t v27 = (char *)a2 + v12;
    __dst = (char *)a1 + v12;
    uint64_t v13 = type metadata accessor for DateInterval();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    id v16 = v9;
    id v17 = v11;
    id v18 = v10;
    if (v15(v27, 1, v13))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(__dst, v27, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v27, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v6);
    a3 = v30;
  }
  uint64_t v20 = *(int *)(a3 + 20);
  uint64_t v21 = (char *)a1 + v20;
  unint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = type metadata accessor for URL();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for JournalingSuggestion.Workout(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v24 = a3;
      *(void *)a1 = *(void *)a2;
      uint64_t v25 = (void *)*((void *)a1 + 1);
      uint64_t v26 = (void *)*((void *)a2 + 1);
      *((void *)a1 + 1) = v26;
      id v27 = v26;

      unint64_t v28 = (void *)*((void *)a1 + 2);
      uint64_t v29 = (void *)*((void *)a2 + 2);
      *((void *)a1 + 2) = v29;
      id v30 = v29;

      unint64_t v31 = (void *)*((void *)a1 + 3);
      unint64_t v32 = (void *)*((void *)a2 + 3);
      *((void *)a1 + 3) = v32;
      id v33 = v32;

      uint64_t v34 = *(int *)(v6 + 32);
      os_log_type_t v35 = &a1[v34];
      uint64_t v36 = &a2[v34];
      uint64_t v37 = type metadata accessor for DateInterval();
      uint64_t v38 = *(void *)(v37 - 8);
      uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
      int v40 = v39(v35, 1, v37);
      int v41 = v39(v36, 1, v37);
      a3 = v24;
      if (v40)
      {
        if (!v41)
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v41)
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v35, v36, v37);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
      }
      size_t v21 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                  - 8)
                      + 64);
      unint64_t v22 = v35;
      uint64_t v23 = v36;
LABEL_8:
      memcpy(v22, v23, v21);
      goto LABEL_14;
    }
    _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0((uint64_t)a1, type metadata accessor for JournalingSuggestion.Workout.Details);
LABEL_7:
    size_t v21 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?)
                                - 8)
                    + 64);
    unint64_t v22 = a1;
    uint64_t v23 = a2;
    goto LABEL_8;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v55 = a3;
  *(void *)a1 = *(void *)a2;
  uint64_t v11 = (void *)*((void *)a2 + 1);
  *((void *)a1 + 1) = v11;
  uint64_t v12 = (void *)*((void *)a2 + 2);
  *((void *)a1 + 2) = v12;
  uint64_t v13 = (void *)*((void *)a2 + 3);
  *((void *)a1 + 3) = v13;
  uint64_t v14 = *(int *)(v6 + 32);
  uint64_t v53 = &a2[v14];
  __dst = &a1[v14];
  uint64_t v15 = type metadata accessor for DateInterval();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  if (v52(v53, 1, v15))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(__dst, v53, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(__dst, v53, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
  }
  a3 = v55;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  uint64_t v42 = *(int *)(a3 + 20);
  uint64_t v43 = &a1[v42];
  char v44 = &a2[v42];
  uint64_t v45 = type metadata accessor for URL();
  uint64_t v46 = *(void *)(v45 - 8);
  id v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  int v48 = v47(v43, 1, v45);
  int v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 24))(v43, v44, v45);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_19;
  }
  if (v49)
  {
LABEL_19:
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v43, v44, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v44, v45);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_20:
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for JournalingSuggestion.Workout(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    a1[3] = a2[3];
    uint64_t v9 = *(int *)(v6 + 32);
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for DateInterval();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = (char *)a1 + v15;
  id v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for JournalingSuggestion.Workout(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JournalingSuggestion.Workout.Details(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v20 = (void *)a1[1];
      uint64_t v21 = a2[1];
      *a1 = *a2;
      a1[1] = v21;

      unint64_t v22 = (void *)a1[2];
      a1[2] = a2[2];

      uint64_t v23 = (void *)a1[3];
      a1[3] = a2[3];

      uint64_t v24 = *(int *)(v6 + 32);
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (char *)a2 + v24;
      uint64_t v27 = type metadata accessor for DateInterval();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
      int v30 = v29(v25, 1, v27);
      int v31 = v29(v26, 1, v27);
      if (v30)
      {
        if (!v31)
        {
          (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v31)
        {
          (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v25, v26, v27);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
      }
      size_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                  - 8)
                      + 64);
      uint64_t v18 = v25;
      uint64_t v19 = v26;
LABEL_8:
      memcpy(v18, v19, v17);
      goto LABEL_14;
    }
    _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0((uint64_t)a1, type metadata accessor for JournalingSuggestion.Workout.Details);
LABEL_7:
    size_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?)
                                - 8)
                    + 64);
    uint64_t v18 = (char *)a1;
    uint64_t v19 = (char *)a2;
    goto LABEL_8;
  }
  if (v10) {
    goto LABEL_7;
  }
  *a1 = *a2;
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  a1[3] = a2[3];
  uint64_t v11 = *(int *)(v6 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for DateInterval();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  uint64_t v32 = *(int *)(a3 + 20);
  id v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = type metadata accessor for URL();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  int v38 = v37(v33, 1, v35);
  int v39 = v37(v34, 1, v35);
  if (!v38)
  {
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 40))(v33, v34, v35);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
    goto LABEL_19;
  }
  if (v39)
  {
LABEL_19:
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v33, v34, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
LABEL_20:
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Workout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444EDC08);
}

uint64_t sub_2444EDC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Workout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444EDD44);
}

uint64_t sub_2444EDD44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for JournalingSuggestion.Workout.Details?);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void type metadata completion function for JournalingSuggestion.Workout()
{
  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for JournalingSuggestion.Workout.Details?, (void (*)(uint64_t))type metadata accessor for JournalingSuggestion.Workout.Details);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for DateInterval?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Workout.Details(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v5;
    uint64_t v6 = (void *)a2[2];
    uint64_t v7 = (void *)a2[3];
    a1[2] = (uint64_t)v6;
    a1[3] = (uint64_t)v7;
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DateInterval();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    id v14 = v5;
    id v15 = v6;
    id v16 = v7;
    if (v13(v10, 1, v11))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v9, v10, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Workout.Details(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestion.Workout.Details(void *a1, void *a2, uint64_t a3)
{
  int v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (void *)a2[2];
  uint64_t v6 = (void *)a2[3];
  a1[2] = v5;
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DateInterval();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v4;
  id v14 = v5;
  id v15 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v8, v9, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for JournalingSuggestion.Workout.Details(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a1[1];
  uint64_t v7 = (void *)a2[1];
  a1[1] = v7;
  id v8 = v7;

  uint64_t v9 = (void *)a1[2];
  uint64_t v10 = (void *)a2[2];
  a1[2] = v10;
  id v11 = v10;

  uint64_t v12 = (void *)a1[3];
  id v13 = (void *)a2[3];
  a1[3] = v13;
  id v14 = v13;

  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for DateInterval();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for JournalingSuggestion.Workout.Details(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (void *)a1[1];
  uint64_t v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;

  uint64_t v8 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v9 = (void *)a1[3];
  a1[3] = a2[3];

  uint64_t v10 = *(int *)(a3 + 32);
  id v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for DateInterval();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444EE7F4);
}

uint64_t sub_2444EE7F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 32);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Workout.Details(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444EE8C8);
}

uint64_t sub_2444EE8C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Workout.Details()
{
  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, MEMORY[0x263F062D0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.WorkoutGroup(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    int v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v7 + v15) = (uint64_t)v17;
    uint64_t v18 = *(void **)((char *)a2 + v16);
    *(uint64_t *)((char *)v7 + v16) = (uint64_t)v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)v7 + v19;
    int v21 = (char *)a2 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    id v22 = v17;
    id v23 = v18;
  }
  return v7;
}

void destroy for JournalingSuggestion.WorkoutGroup(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  uint64_t v7 = *(void **)(a1 + a2[7]);
}

void *initializeWithCopy for JournalingSuggestion.WorkoutGroup(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = v15;
  uint64_t v16 = *(void **)((char *)a2 + v14);
  *(void *)((char *)a1 + v14) = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  id v20 = v15;
  id v21 = v16;
  return a1;
}

void *assignWithCopy for JournalingSuggestion.WorkoutGroup(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = *(void **)((char *)a1 + v15);
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  id v18 = v17;

  uint64_t v19 = a3[7];
  id v20 = *(void **)((char *)a1 + v19);
  id v21 = *(void **)((char *)a2 + v19);
  *(void *)((char *)a1 + v19) = v21;
  id v22 = v21;

  uint64_t v23 = a3[8];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  return a1;
}

void *initializeWithTake for JournalingSuggestion.WorkoutGroup(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[8];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  return a1;
}

void *assignWithTake for JournalingSuggestion.WorkoutGroup(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
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
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = *(void **)((char *)a1 + v15);
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);

  uint64_t v17 = a3[7];
  id v18 = *(void **)((char *)a1 + v17);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);

  uint64_t v19 = a3[8];
  id v20 = (char *)a1 + v19;
  id v21 = (char *)a2 + v19;
  *(void *)id v20 = *(void *)v21;
  v20[8] = v21[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.WorkoutGroup(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_23Tm);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.WorkoutGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_24Tm);
}

void type metadata completion function for JournalingSuggestion.WorkoutGroup()
{
  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Contact(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for URL();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Contact(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestion.Contact(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithCopy for JournalingSuggestion.Contact(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
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
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.Contact(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for JournalingSuggestion.Contact(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Contact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444EFC04);
}

uint64_t sub_2444EFC04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Contact(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444EFCCC);
}

uint64_t sub_2444EFCCC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Contact()
{
  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Location(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = (void *)a2[4];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    a1[4] = (uint64_t)v7;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = v7;
    if (v13(v10, 1, v11))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for JournalingSuggestion.Location(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestion.Location(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = (void *)a2[4];
  a1[4] = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for JournalingSuggestion.Location(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = (void *)a2[4];
  a1[4] = v7;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Location(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithTake for JournalingSuggestion.Location(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)a1[4];
  a1[4] = a2[4];

  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Location(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F0690);
}

uint64_t sub_2444F0690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 28);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Location(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F0764);
}

uint64_t sub_2444F0764(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Location()
{
  type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for JournalingSuggestion.LocationGroup()
{
  return &type metadata for JournalingSuggestion.LocationGroup;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?);
}

uint64_t destroy for JournalingSuggestion.Song(uint64_t a1, uint64_t a2)
{
  return destroy for JournalingSuggestion.Song(a1, a2, MEMORY[0x263F06EA8], MEMORY[0x263F07490]);
}

void *initializeWithCopy for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3)
{
  return initializeWithCopy for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?);
}

void *assignWithCopy for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3)
{
  return assignWithCopy for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?);
}

_OWORD *initializeWithTake for JournalingSuggestion.Song(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return initializeWithTake for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?);
}

void *assignWithTake for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3)
{
  return assignWithTake for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?);
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F0A4C);
}

uint64_t sub_2444F0A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_32Tm(a1, a2, a3, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F0A74);
}

uint64_t sub_2444F0A74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_33Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for URL?, &demangling cache variable for type metadata for Date?);
}

void type metadata completion function for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Podcast(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = *(int *)(a3 + 24);
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 28);
    uint64_t v17 = (char *)v4 + v16;
    id v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for Date();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return v4;
}

uint64_t destroy for JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestion.Podcast(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

void *assignWithCopy for JournalingSuggestion.Podcast(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.Podcast(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

void *assignWithTake for JournalingSuggestion.Podcast(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
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
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 28);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  int v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F1924);
}

uint64_t sub_2444F1924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a1 + *(int *)(a3 + 24);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = a1 + *(int *)(a3 + 28);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Podcast(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F1A78);
}

uint64_t sub_2444F1A78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.Podcast()
{
  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.GenericMedia(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Song(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t *a7)
{
  uint64_t v8 = a1;
  int v9 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v8 = *a2;
    uint64_t v8 = (uint64_t *)(v19 + ((v9 + 16) & ~(unint64_t)v9));
    swift_retain();
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = a2[3];
    a1[2] = a2[2];
    a1[3] = v12;
    uint64_t v13 = a2[5];
    uint64_t v14 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v14;
    uint64_t v29 = (char *)a2 + v14;
    a1[4] = a2[4];
    a1[5] = v13;
    uint64_t v15 = a4(0);
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v29, 1, v15))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(a5);
      memcpy(__dst, v29, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(__dst, v29, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    uint64_t v20 = *(int *)(a3 + 32);
    uint64_t v21 = (char *)v8 + v20;
    int v22 = (char *)a2 + v20;
    uint64_t v23 = a6(0);
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(a7);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
  }
  return v8;
}

uint64_t destroy for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2)
{
  return destroy for JournalingSuggestion.Song(a1, a2, MEMORY[0x263F07490], MEMORY[0x263F06EA8]);
}

uint64_t destroy for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = a3(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = a1 + *(int *)(a2 + 32);
  uint64_t v12 = a4(0);
  uint64_t v15 = *(void *)(v12 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v12);
  if (!result)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    return v14(v11, v12);
  }
  return result;
}

void *initializeWithCopy for JournalingSuggestion.GenericMedia(void *a1, void *a2, uint64_t a3)
{
  return initializeWithCopy for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?);
}

void *initializeWithCopy for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t *a7)
{
  uint64_t v9 = a2[1];
  *a1 = *a2;
  a1[1] = v9;
  uint64_t v10 = a2[3];
  a1[2] = a2[2];
  a1[3] = v10;
  uint64_t v11 = a2[5];
  uint64_t v12 = *(int *)(a3 + 28);
  __dst = (char *)a1 + v12;
  uint64_t v13 = (char *)a2 + v12;
  a1[4] = a2[4];
  a1[5] = v11;
  uint64_t v14 = a4(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  uint64_t v18 = *(int *)(a3 + 32);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = a6(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

void *assignWithCopy for JournalingSuggestion.GenericMedia(void *a1, void *a2, uint64_t a3)
{
  return assignWithCopy for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?);
}

void *assignWithCopy for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t *a7)
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
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = a4(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = *(int *)(a3 + 32);
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = a6(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestion.GenericMedia(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return initializeWithTake for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?);
}

_OWORD *initializeWithTake for JournalingSuggestion.Song(_OWORD *a1, _OWORD *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t *a7)
{
  long long v13 = a2[1];
  *a1 = *a2;
  a1[1] = v13;
  a1[2] = a2[2];
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = a4(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v20 = *(int *)(a3 + 32);
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = a6(0);
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

void *assignWithTake for JournalingSuggestion.GenericMedia(void *a1, void *a2, uint64_t a3)
{
  return assignWithTake for JournalingSuggestion.Song(a1, a2, a3, MEMORY[0x263F07490], &demangling cache variable for type metadata for Date?, MEMORY[0x263F06EA8], &demangling cache variable for type metadata for URL?);
}

void *assignWithTake for JournalingSuggestion.Song(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(void), uint64_t *a7)
{
  uint64_t v11 = a2[1];
  *a1 = *a2;
  a1[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a2[3];
  a1[2] = a2[2];
  a1[3] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a2[5];
  a1[4] = a2[4];
  a1[5] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = a4(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(a5);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  uint64_t v23 = *(int *)(a3 + 32);
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = a6(0);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(a7);
    memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F2D44);
}

uint64_t sub_2444F2D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_32Tm(a1, a2, a3, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t __swift_get_extra_inhabitant_index_32Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  if (a2 == 2147483646)
  {
    unint64_t v6 = *(void *)(a1 + 8);
    if (v6 >= 0xFFFFFFFF) {
      LODWORD(v6) = -1;
    }
    int v7 = v6 - 1;
    if (v7 < 0) {
      int v7 = -1;
    }
    return (v7 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v13 = *(void *)(v12 - 8);
    if (*(_DWORD *)(v13 + 84) == a2)
    {
      uint64_t v14 = v12;
      uint64_t v15 = a1 + *(int *)(a3 + 28);
      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
      return v16(v15, a2, v14);
    }
    else
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
      uint64_t v19 = v17;
      uint64_t v20 = a1 + *(int *)(a3 + 32);
      return v18(v20, a2, v19);
    }
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F2EA8);
}

uint64_t sub_2444F2EA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_33Tm(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &demangling cache variable for type metadata for URL?);
}

uint64_t __swift_store_extra_inhabitant_index_33Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v7 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == a3)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v7 + *(int *)(a4 + 28);
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
      return v15(v14, a2, a2, v13);
    }
    else
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(a6);
      uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
      uint64_t v18 = v16;
      uint64_t v19 = v7 + *(int *)(a4 + 32);
      return v17(v19, a2, a2, v18);
    }
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.GenericMedia(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void type metadata completion function for JournalingSuggestion.Song(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void (*a5)(uint64_t), unint64_t *a6, void (*a7)(uint64_t))
{
  type metadata accessor for DateInterval?(319, a4, a5);
  if (v9 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, a6, a7);
    if (v10 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_41Tm);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_42Tm);
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Photo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.Photo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Video(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F3A38);
}

uint64_t __swift_get_extra_inhabitant_index_41Tm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Video(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F3B4C);
}

uint64_t __swift_store_extra_inhabitant_index_42Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for JournalingSuggestion.Photo()
{
  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.LivePhoto(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Date();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

uint64_t initializeWithCopy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v7) = v13(v9, 1, v11);
  int v14 = v13(v10, 1, v11);
  if (!v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v7) = v13(v9, 1, v11);
  int v14 = v13(v10, 1, v11);
  if (!v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F46CC);
}

uint64_t sub_2444F46CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 24);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.LivePhoto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F47DC);
}

uint64_t sub_2444F47DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 24);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for JournalingSuggestion.LivePhoto()
{
  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for Date?, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.MotionActivity(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for DateInterval();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

char *initializeWithCopy for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for DateInterval();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *assignWithCopy for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for DateInterval();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *initializeWithTake for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for DateInterval();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *assignWithTake for JournalingSuggestion.MotionActivity(char *a1, char *a2, int *a3)
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for DateInterval();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F5770);
}

uint64_t sub_2444F5770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 28)) <= 3u) {
    int v14 = 3;
  }
  else {
    int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  }
  unsigned int v15 = v14 - 3;
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 28)) >= 3u) {
    return v15;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F58A8);
}

uint64_t sub_2444F58A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 28)) = a2 + 3;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void type metadata completion function for JournalingSuggestion.MotionActivity()
{
  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for DateInterval?(319, &lazy cache variable for type metadata for DateInterval?, MEMORY[0x263F062D0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType()
{
  return &type metadata for JournalingSuggestion.MotionActivity.MovementType;
}

void **initializeBufferWithCopyOfBuffer for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v14 = v4;
    if (v13(v10, 1, v11))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[7];
    *(void **)((char *)v7 + a3[6]) = *(void **)((char *)a2 + a3[6]);
    *(void **)((char *)v7 + v16) = *(void **)((char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for JournalingSuggestion.StateOfMind(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = a3[7];
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  *(void **)((char *)a1 + v15) = *(void **)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **assignWithCopy for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for JournalingSuggestion.StateOfMind(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  return a1;
}

void **assignWithTake for JournalingSuggestion.StateOfMind(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
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
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void **)((char *)a1 + a3[6]) = *(void **)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F6398);
}

uint64_t __swift_get_extra_inhabitant_index_23Tm(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.StateOfMind(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F6464);
}

void *__swift_store_extra_inhabitant_index_24Tm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for JournalingSuggestion.StateOfMind()
{
  type metadata accessor for DateInterval?(319, (unint64_t *)&lazy cache variable for type metadata for URL?, MEMORY[0x263F06EA8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for JournalingSuggestion.Reflection()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for JournalingSuggestion.Reflection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for JournalingSuggestion.Reflection(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JournalingSuggestion.Reflection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.Reflection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.Reflection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JournalingSuggestion.Reflection()
{
  return &type metadata for JournalingSuggestion.Reflection;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestion.ItemContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for JournalingSuggestion.ItemContent(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444F6B7C);
}

uint64_t sub_2444F6B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
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

uint64_t storeEnumTagSinglePayload for JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444F6C50);
}

uint64_t sub_2444F6C50(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID();
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

uint64_t type metadata completion function for JournalingSuggestion.ItemContent()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl()
{
  return &unk_26F929DB8;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2444F6EA8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return 0;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.CodingKeys()
{
  return &unk_26F929E48;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (assetProvider: InternalAssetContent.AssetProvider, assetType: @thick InternalAssetProvider.Type));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x676E696E6E7572 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696B6C6177 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x57676E696E6E7572 && a2 == 0xEE00676E696B6C61)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *specialized JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.init(from:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys>);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  int v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys>);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys>);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys>);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys();
  uint64_t v12 = (uint64_t)v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  unint64_t v13 = v29;
  int v30 = a1;
  int v14 = v11;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v11 = &unk_26F929DB8;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v11;
}

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
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

uint64_t specialized JournalingSuggestion.MotionActivity.MovementType.CodingKeys.stringValue.getter()
{
  return 0x65756C6176;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys;
  if (!lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys and conformance JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys);
  }
  return result;
}

uint64_t outlined init with copy of JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s21JournalingSuggestions0A10SuggestionV7WorkoutV7DetailsVWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t partial apply for closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #2 in closure #1 in JournalingSuggestion.content<A>(forType:)(a1, a2, v6);
}

uint64_t sub_2444F7FA8()
{
  uint64_t v1 = *(void *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t outlined init with take of JournalingSuggestion.ItemContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JournalingSuggestion.ItemContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for JournalingSuggestion.ItemContent(0) - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[6];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = partial apply for closure #1 in closure #1 in static JournalingSuggestion.StateOfMind.getAssetLoader(for:inside:);
  return closure #1 in closure #1 in JournalingSuggestion.content<A>(forType:)(a1, v7, v8, v9, v10, v4, v5);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2444F8280()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in static UIImage.getLoaderForImageUrlPair(_:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzlTRTu);
  return v6(a1, v4);
}

uint64_t getEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for JournalingSuggestion.MotionActivity.MovementType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2444F84DCLL);
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

unsigned char *destructiveInjectEnumTag for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.CodingKeys()
{
  return &unk_26F929F28;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningCodingKeys()
{
  return &unk_26F929F48;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.WalkingCodingKeys()
{
  return &unk_26F929F68;
}

void *type metadata accessor for JournalingSuggestion.MotionActivity.MovementType.eMoventTypeImpl.RunningWalkingCodingKeys()
{
  return &unk_26F929F88;
}

uint64_t closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for JournalingSuggestion.Contact(0);
  uint64_t v12[3] = v9;
  v12[4] = (uint64_t)&protocol witness table for JournalingSuggestion.Contact;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  outlined init with copy of URL?(a5, (uint64_t)boxed_opaque_existential_1 + *(int *)(v9 + 20));
  uint64_t *boxed_opaque_existential_1 = a3;
  boxed_opaque_existential_1[1] = a4;
  swift_bridgeObjectRetain();
  a1(v12, 0);
  return outlined destroy of JournalingSuggestionAsset?((uint64_t)v12);
}

uint64_t (*specialized static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void *a1))(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2 - 8);
  unsigned int v6 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  int v8 = &v28[-v7];
  id v9 = objc_msgSend(a1, sel_assetType);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v16 = specialized getMetadata<A>(_:key:as:)(a1, (void *)*MEMORY[0x263F563A8]);
  if (v17)
  {
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    assetImageContentToUrl(_:)(a1, v8);
    uint64_t v24 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v8, 0, 1, v24);
    outlined init with take of URL?((uint64_t)v8, (uint64_t)v6);
    unint64_t v25 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v18;
    *(void *)(v26 + 24) = v19;
    outlined init with take of URL?((uint64_t)v6, v26 + v25);
    return partial apply for closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:);
  }
  if (one-time initialization token for bridge != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.bridge);
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_2444BF000, v21, v22, "SuggestionContact asset should carry .contactName metadata", v23, 2u);
    MEMORY[0x245691070](v23, -1, -1);
  }

  return 0;
}

uint64_t sub_2444F8C90()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t partial apply for closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(void (*a1)(uint64_t *, void), uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                 - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return closure #1 in static JournalingSuggestion.Contact.getAssetLoader(for:inside:)(a1, a2, v6, v7, v8);
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t JournalingSuggestionsPicker.init(label:onCompletion:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  State.init(wrappedValue:)();
  *(unsigned char *)a4 = v11;
  *(void *)(a4 + 8) = v12;
  uint64_t v8 = type metadata accessor for JournalingSuggestionsPicker();
  uint64_t result = a1();
  uint64_t v10 = (void *)(a4 + *(int *)(v8 + 40));
  void *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t type metadata accessor for JournalingSuggestionsPicker()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t JournalingSuggestionsPicker.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  int v38 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v8 = *(void *)(v6 + 24);
  uint64_t v9 = type metadata accessor for Button();
  uint64_t v37 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v34 = (char *)&v33 - v10;
  type metadata accessor for SuggestionPickerModifier();
  uint64_t v11 = type metadata accessor for ModifiedContent();
  uint64_t v36 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v33 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v35 = (char *)&v33 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v7;
  *(void *)(v16 + 24) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v39 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v2;
  uint64_t v17 = v34;
  Button.init(action:label:)();
  uint64_t v18 = JournalingSuggestionsPicker.$_isPresented.getter();
  uint64_t v20 = v19;
  LOBYTE(v7) = v21;
  os_log_type_t v22 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  uint64_t v23 = *v22;
  uint64_t v24 = v22[1];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v33;
  View.journalingSuggestionsPicker(isPresented:onCompletion:)(v18, v20, v7 & 1, v23, v24, v9, WitnessTable);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v9);
  uint64_t v27 = lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionPickerModifier and conformance SuggestionPickerModifier, (void (*)(uint64_t))type metadata accessor for SuggestionPickerModifier);
  uint64_t v42 = WitnessTable;
  uint64_t v43 = v27;
  swift_getWitnessTable();
  int v29 = v35;
  uint64_t v28 = v36;
  int v30 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v30(v35, v26, v11);
  char v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  v31(v26, v11);
  v30(v38, v29, v11);
  return ((uint64_t (*)(char *, uint64_t))v31)(v29, v11);
}

uint64_t type metadata accessor for SuggestionPickerModifier()
{
  uint64_t result = type metadata singleton initialization cache for SuggestionPickerModifier;
  if (!type metadata singleton initialization cache for SuggestionPickerModifier) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t closure #1 in JournalingSuggestionsPicker.body.getter()
{
  return swift_release();
}

uint64_t sub_2444F9444()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for JournalingSuggestionsPicker() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[11], v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in JournalingSuggestionsPicker.body.getter()
{
  type metadata accessor for JournalingSuggestionsPicker();

  return closure #1 in JournalingSuggestionsPicker.body.getter();
}

uint64_t closure #2 in JournalingSuggestionsPicker.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + *(int *)(type metadata accessor for JournalingSuggestionsPicker() + 36);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, v9, a2);
  v10(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t partial apply for closure #2 in JournalingSuggestionsPicker.body.getter@<X0>(char *a1@<X8>)
{
  return closure #2 in JournalingSuggestionsPicker.body.getter(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t JournalingSuggestionsPicker.$_isPresented.getter()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for State<Bool>);
  State.projectedValue.getter();
  return v1;
}

uint64_t View.journalingSuggestionsPicker(isPresented:onCompletion:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (int *)type metadata accessor for SuggestionPickerModifier();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (uint64_t *)((char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (char *)v16 + v14[5];
  *(void *)uint64_t v17 = a1;
  *((void *)v17 + 1) = a2;
  v17[16] = a3;
  uint64_t v18 = (char *)v16 + v14[6];
  char v24 = 2;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
  State.init(wrappedValue:)();
  uint64_t v19 = v26;
  char *v18 = v25;
  *((void *)v18 + 1) = v19;
  uint64_t v20 = (uint64_t *)((char *)v16 + v14[7]);
  *uint64_t v20 = a4;
  v20[1] = a5;
  char v21 = (char *)v16 + v14[8];
  *(void *)char v21 = implicit closure #2 in implicit closure #1 in variable initialization expression of SuggestionPickerModifier._sheetManager;
  *((void *)v21 + 1) = 0;
  unsigned char v21[16] = 0;
  UUID.init()();
  MEMORY[0x245690220](v16, a6, v14, a7);
  return outlined destroy of SuggestionPickerModifier((uint64_t)v16);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance JournalingSuggestionsPicker<A>()
{
  return MEMORY[0x270F032C0]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance JournalingSuggestionsPicker<A>()
{
  return MEMORY[0x270F032D0]();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance JournalingSuggestionsPicker<A>()
{
  return static View._viewListCount(inputs:)();
}

uint64_t JournalingSuggestionsPicker<>.init(_:onCompletion:)@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  State.init(wrappedValue:)();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(unsigned char *)a3 = v10;
  *(void *)(a3 + 8) = v11;
  *(void *)(a3 + 16) = result;
  *(void *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 32) = v8 & 1;
  *(void *)(a3 + 40) = v9;
  *(void *)(a3 + 48) = a1;
  *(void *)(a3 + 56) = a2;
  return result;
}

__n128 JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  State.init(wrappedValue:)();
  closure #1 in JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)(a1, (uint64_t)&v15.n128_i64[1]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  uint64_t v10 = v16;
  char v11 = v17;
  uint64_t v12 = v18;
  __n128 result = v15;
  *(unsigned char *)a5 = v14;
  *(__n128 *)(a5 + 8) = result;
  *(void *)(a5 + 24) = v10;
  *(unsigned char *)(a5 + 32) = v11;
  *(void *)(a5 + 40) = v12;
  *(void *)(a5 + 48) = a2;
  *(void *)(a5 + 56) = a3;
  return result;
}

uint64_t closure #1 in JournalingSuggestionsPicker<>.init<A>(_:onCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = Text.init<A>(_:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

id implicit closure #2 in implicit closure #1 in variable initialization expression of SuggestionPickerModifier._sheetManager()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static SuggestionSheetManager.shared;

  return v0;
}

uint64_t SuggestionPickerModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v65 = a2;
  uint64_t v62 = type metadata accessor for ScenePhase();
  uint64_t v64 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v60 = (uint64_t)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SuggestionPickerModifier();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = v6 - 8;
  uint64_t v57 = v6 - 8;
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
  MEMORY[0x270FA5388](v53);
  uint64_t v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  uint64_t v58 = *(void *)(v13 - 8);
  uint64_t v59 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v54 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  MEMORY[0x270FA5388](v56);
  uint64_t v55 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  uint64_t v63 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v66 = (char *)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SuggestionPickerModifier(v2, (uint64_t)v10);
  uint64_t v17 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = ((v17 + 16) & ~v17) + v8;
  uint64_t v19 = (v17 + 16) & ~v17;
  uint64_t v20 = v17 | 7;
  uint64_t v21 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v21 + v19);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<SuggestionPickerModifier>);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v12, a1, v22);
  uint64_t v23 = (uint64_t (**)())&v12[*(int *)(v53 + 36)];
  *uint64_t v23 = partial apply for closure #1 in SuggestionPickerModifier.body(content:);
  v23[1] = (uint64_t (*)())v21;
  v23[2] = 0;
  void v23[3] = 0;
  uint64_t v24 = v3 + *(int *)(v9 + 28);
  uint64_t v25 = *(void *)v24;
  uint64_t v26 = *(void *)(v24 + 8);
  LOBYTE(v24) = *(unsigned char *)(v24 + 16);
  uint64_t v67 = v25;
  uint64_t v68 = v26;
  LOBYTE(v69) = v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x2456902C0](&v71, v27);
  LOBYTE(v67) = v71;
  v51[0] = v3;
  outlined init with copy of SuggestionPickerModifier(v3, (uint64_t)v10);
  uint64_t v28 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v28 + v19);
  lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  int v29 = v54;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  outlined destroy of URL?((uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
  outlined init with copy of SuggestionPickerModifier(v3, (uint64_t)v10);
  v51[2] = v18;
  v51[1] = v20;
  uint64_t v30 = swift_allocObject();
  uint64_t v52 = v19;
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v30 + v19);
  uint64_t v32 = v58;
  uint64_t v31 = v59;
  uint64_t v33 = (uint64_t)v55;
  uint64_t v34 = v29;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v55, v29, v59);
  uint64_t v35 = v56;
  uint64_t v36 = (void *)(v33 + *(int *)(v56 + 36));
  *uint64_t v36 = 0;
  v36[1] = 0;
  v36[2] = partial apply for closure #3 in SuggestionPickerModifier.body(content:);
  v36[3] = v30;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
  uint64_t v37 = v60;
  uint64_t v38 = v51[0];
  specialized Environment.wrappedValue.getter(v60);
  outlined init with copy of SuggestionPickerModifier(v38, (uint64_t)v10);
  uint64_t v39 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v39 + v19);
  unint64_t v40 = lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  uint64_t v41 = lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type ScenePhase and conformance ScenePhase, MEMORY[0x263F18460]);
  uint64_t v42 = v37;
  uint64_t v43 = v62;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v42, v43);
  outlined destroy of URL?(v33, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  uint64_t v44 = v38 + *(int *)(v57 + 32);
  char v45 = *(unsigned char *)v44;
  uint64_t v46 = *(void *)(v44 + 8);
  LOBYTE(v67) = v45;
  uint64_t v68 = v46;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  State.wrappedValue.getter();
  outlined init with copy of SuggestionPickerModifier(v38, (uint64_t)v10);
  uint64_t v47 = swift_allocObject();
  outlined init with take of SuggestionPickerModifier((uint64_t)v10, v47 + v52);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
  uint64_t v67 = v35;
  uint64_t v68 = v43;
  unint64_t v69 = v40;
  uint64_t v70 = v41;
  swift_getOpaqueTypeConformance2();
  lazy protocol witness table accessor for type Bool? and conformance <A> A?();
  uint64_t v48 = v61;
  int v49 = v66;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v49, v48);
}

uint64_t closure #1 in SuggestionPickerModifier.body(content:)()
{
  type metadata accessor for SuggestionPickerModifier();
  type metadata accessor for SuggestionSheetManager();
  lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (void (*)(uint64_t))type metadata accessor for SuggestionSheetManager);
  uint64_t v0 = (void *)StateObject.wrappedValue.getter();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  return State.wrappedValue.setter();
}

void SuggestionPickerModifier.updatePresentation()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for SuggestionPickerModifier();
  uint64_t v3 = *((void *)v2 - 1);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + v2[5];
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  LOBYTE(v9) = *(unsigned char *)(v9 + 16);
  uint64_t v32 = v10;
  uint64_t v33 = v11;
  char v34 = v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x2456902C0](&v35, v12);
  if (v35 == 1)
  {
    uint64_t v30 = v3;
    if (one-time initialization token for picker != -1) {
      swift_once();
    }
    uint64_t v31 = v5;
    uint64_t v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.picker);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2444BF000, v14, v15, "Presenting picker", v16, 2u);
      MEMORY[0x245691070](v16, -1, -1);
    }

    type metadata accessor for SuggestionSheetManager();
    lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (void (*)(uint64_t))type metadata accessor for SuggestionSheetManager);
    uint64_t v17 = (void *)StateObject.wrappedValue.getter();
    uint64_t v18 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v1 + v2[9], v31);
    uint64_t v19 = (uint64_t *)(v1 + v2[7]);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    outlined init with copy of SuggestionPickerModifier(v1, (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    uint64_t v23 = swift_allocObject();
    outlined init with take of SuggestionPickerModifier((uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t (*)(), uint64_t))((*MEMORY[0x263F8EED0] & *v17) + 0x148))(v8, v20, v21, partial apply for closure #1 in SuggestionPickerModifier.updatePresentation(), v23);

    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  }
  else
  {
    if (one-time initialization token for picker != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)static Logger.picker);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_2444BF000, v25, v26, "dismissing picker", v27, 2u);
      MEMORY[0x245691070](v27, -1, -1);
    }

    type metadata accessor for SuggestionSheetManager();
    lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (void (*)(uint64_t))type metadata accessor for SuggestionSheetManager);
    uint64_t v28 = (void *)StateObject.wrappedValue.getter();
    (*(void (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v28) + 0x150))(v1 + v2[9], 0);
  }
}

void closure #3 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionPickerModifier();
  type metadata accessor for SuggestionSheetManager();
  lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (void (*)(uint64_t))type metadata accessor for SuggestionSheetManager);
  uint64_t v3 = (void *)StateObject.wrappedValue.getter();
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x150))(a1 + *(int *)(v2 + 36), 1);
}

void closure #4 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionPickerModifier();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ScenePhase();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v20 - v10;
  specialized Environment.wrappedValue.getter((uint64_t)v20 - v10);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F18450], v5);
  char v12 = static ScenePhase.== infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
  outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v4);
  if (v12)
  {
    uint64_t v14 = &v4[*(int *)(v2 + 20)];
    uint64_t v15 = *(void *)v14;
    uint64_t v16 = *((void *)v14 + 1);
    LOBYTE(v14) = v14[16];
    v20[1] = v15;
    v20[2] = v16;
    char v21 = (char)v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
    MEMORY[0x2456902C0](&v22, v17);
    char v18 = v22;
    outlined destroy of SuggestionPickerModifier((uint64_t)v4);
    if (v18)
    {
      type metadata accessor for SuggestionSheetManager();
      lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type SuggestionSheetManager and conformance SuggestionSheetManager, (void (*)(uint64_t))type metadata accessor for SuggestionSheetManager);
      uint64_t v19 = (void *)StateObject.wrappedValue.getter();
      (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v19) + 0x158))();
    }
  }
  else
  {
    outlined destroy of SuggestionPickerModifier((uint64_t)v4);
  }
}

void closure #5 in SuggestionPickerModifier.body(content:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionPickerModifier();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1 + *(int *)(v3 + 24);
  char v7 = *(unsigned char *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  LOBYTE(v20) = v7;
  uint64_t v21 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State<Bool?>);
  State.wrappedValue.getter();
  int v9 = v23;
  uint64_t v10 = a1 + *(int *)(v2 + 20);
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(void *)(v10 + 8);
  LOBYTE(v10) = *(unsigned char *)(v10 + 16);
  uint64_t v20 = v11;
  uint64_t v21 = v12;
  char v22 = v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<Bool>);
  MEMORY[0x2456902C0](&v23);
  if (v9 == 2)
  {
    outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v5);
  }
  else
  {
    char v14 = v23 ^ v9;
    outlined init with copy of SuggestionPickerModifier(a1, (uint64_t)v5);
    if ((v14 & 1) == 0)
    {
      outlined destroy of SuggestionPickerModifier((uint64_t)v5);
      return;
    }
  }
  uint64_t v15 = &v5[*(int *)(v2 + 20)];
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  LOBYTE(v15) = v15[16];
  uint64_t v20 = v16;
  uint64_t v21 = v17;
  char v22 = (char)v15;
  MEMORY[0x2456902C0](&v23, v13);
  char v18 = v23;
  outlined destroy of SuggestionPickerModifier((uint64_t)v5);
  if (v18) {
    SuggestionPickerModifier.updatePresentation()();
  }
}

uint64_t closure #1 in SuggestionPickerModifier.updatePresentation()()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_2444FAF00()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t key path setter for EnvironmentValues.scenePhase : EnvironmentValues(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScenePhase();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.scenePhase.setter();
}

uint64_t outlined destroy of SuggestionPickerModifier(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t associated type witness table accessor for View.Body : View in JournalingSuggestionsPicker<A>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata instantiation function for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for JournalingSuggestionsPicker()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for JournalingSuggestionsPicker(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
    char v14 = (void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = v14[1];
    uint64_t v16 = (void *)((v7 + v11) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v16 = *v14;
    v16[1] = v15;
  }
  swift_retain();
  return v3;
}

uint64_t destroy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2)
{
  swift_release();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_release();
}

uint64_t initializeWithCopy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = (v7 + 16 + a1) & ~v7;
  uint64_t v9 = (v7 + 16 + a2) & ~v7;
  swift_retain();
  v5(v8, v9, v4);
  uint64_t v10 = *(void *)(v6 + 48) + 7;
  uint64_t v11 = (void *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 16 + a1) & ~v8;
  uint64_t v10 = (v8 + 16 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for JournalingSuggestionsPicker(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for JournalingSuggestionsPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 16 + a1) & ~v8;
  uint64_t v10 = (v8 + 16 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  *(_OWORD *)((*(void *)(v7 + 24) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v7 + 24) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JournalingSuggestionsPicker(_DWORD *a1, unsigned int a2, uint64_t a3)
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
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2444FB768);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  uint64_t v18 = ((unint64_t)a1 + v6 + 16) & ~v6;
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(v18);
  }
  unint64_t v19 = *(void *)((v8 + v18) & 0xFFFFFFFFFFFFFFF8);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void storeEnumTagSinglePayload for JournalingSuggestionsPicker(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v11 = ((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v15 = 0;
    int v16 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v11] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v11] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v21 = (void *)((v10 + v19) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v22 = a2 ^ 0x80000000;
                v21[1] = 0;
              }
              else
              {
                uint64_t v22 = a2 - 1;
              }
              *uint64_t v21 = v22;
            }
            else
            {
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = a3 - v8;
    if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  if (((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v18 = ~v8 + a2;
    bzero(a1, ((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 16);
    *(_DWORD *)a1 = v18;
  }
  switch(v15)
  {
    case 1:
      a1[v11] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v11] = v17;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x2444FB980);
    case 4:
      *(_DWORD *)&a1[v11] = v17;
      break;
    default:
      return;
  }
}

uint64_t sub_2444FB9A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2444FBA70()
{
  return swift_getWitnessTable();
}

void *initializeBufferWithCopyOfBuffer for SuggestionPickerModifier(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ScenePhase();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    unint64_t v11 = (char *)a1 + v9;
    unsigned int v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)unint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    v11[16] = v12[16];
    int v14 = (char *)a1 + v10;
    int v15 = (char *)a2 + v10;
    *int v14 = *v15;
    *((void *)v14 + 1) = *((void *)v15 + 1);
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    int v18 = (void *)((char *)a1 + v16);
    unint64_t v19 = (void *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (char *)a1 + v17;
    uint64_t v22 = *(void *)((char *)a2 + v17);
    uint64_t v23 = *(void *)((char *)a2 + v17 + 8);
    char v24 = *((unsigned char *)a2 + v17 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    outlined copy of StateObject<SuggestionSheetManager>.Storage(v22, v23, v24);
    *(void *)uint64_t v21 = v22;
    *((void *)v21 + 1) = v23;
    unsigned char v21[16] = v24;
    uint64_t v25 = a3[9];
    os_log_type_t v26 = (char *)a1 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = type metadata accessor for UUID();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  return a1;
}

uint64_t outlined copy of StateObject<SuggestionSheetManager>.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return MEMORY[0x270F9A8A0]();
  }
  else {
    return swift_retain();
  }
}

uint64_t destroy for SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ScenePhase();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined consume of StateObject<SuggestionSheetManager>.Storage(*(void *)(a1 + *(int *)(a2 + 32)), *(void *)(a1 + *(int *)(a2 + 32) + 8), *(unsigned char *)(a1 + *(int *)(a2 + 32) + 16));
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t outlined consume of StateObject<SuggestionSheetManager>.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return MEMORY[0x270F9A758]();
  }
  else {
    return swift_release();
  }
}

void *initializeWithCopy for SuggestionPickerModifier(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ScenePhase();
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
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  v9[16] = v10[16];
  unsigned int v12 = (char *)a1 + v8;
  uint64_t v13 = (char *)a2 + v8;
  *unsigned int v12 = *v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  unint64_t v19 = (char *)a1 + v15;
  uint64_t v20 = *(void *)((char *)a2 + v15);
  uint64_t v21 = *(void *)((char *)a2 + v15 + 8);
  char v22 = *((unsigned char *)a2 + v15 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  outlined copy of StateObject<SuggestionSheetManager>.Storage(v20, v21, v22);
  *(void *)unint64_t v19 = v20;
  *((void *)v19 + 1) = v21;
  v19[16] = v22;
  uint64_t v23 = a3[9];
  char v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

void *assignWithCopy for SuggestionPickerModifier(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    outlined destroy of URL?((uint64_t)a1, &demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ScenePhase();
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
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  v8[16] = v9[16];
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  unsigned int v12 = (char *)a2 + v10;
  *uint64_t v11 = *v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  unint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *((void *)v19 + 1);
  LOBYTE(v9) = v19[16];
  outlined copy of StateObject<SuggestionSheetManager>.Storage(*(void *)v19, v21, (char)v9);
  uint64_t v22 = *(void *)v18;
  uint64_t v23 = *((void *)v18 + 1);
  char v24 = v18[16];
  *(void *)uint64_t v18 = v20;
  *((void *)v18 + 1) = v21;
  v18[16] = (char)v9;
  outlined consume of StateObject<SuggestionSheetManager>.Storage(v22, v23, v24);
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24))(v26, v27, v28);
  return a1;
}

char *initializeWithTake for SuggestionPickerModifier(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ScenePhase();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)uint64_t v10 = v12;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v13 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  v14[16] = v15[16];
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

char *assignWithTake for SuggestionPickerModifier(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    outlined destroy of URL?((uint64_t)a1, &demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ScenePhase();
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
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  v9[16] = v10[16];
  uint64_t v11 = a3[6];
  long long v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *long long v12 = *v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  swift_release();
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  char v17 = v16[16];
  uint64_t v18 = *(void *)v15;
  uint64_t v19 = *((void *)v15 + 1);
  char v20 = v15[16];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[16] = v17;
  outlined consume of StateObject<SuggestionSheetManager>.Storage(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestionPickerModifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2444FC52C);
}

uint64_t sub_2444FC52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>);
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
    uint64_t v11 = type metadata accessor for UUID();
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 36);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for SuggestionPickerModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2444FC674);
}

uint64_t sub_2444FC674(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>);
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
    uint64_t v11 = type metadata accessor for UUID();
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 36);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void type metadata completion function for SuggestionPickerModifier()
{
  type metadata accessor for Environment<ScenePhase>.Content();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for Environment<ScenePhase>.Content()
{
  if (!lazy cache variable for type metadata for Environment<ScenePhase>.Content)
  {
    type metadata accessor for ScenePhase();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ScenePhase>.Content);
    }
  }
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in SuggestionPickerModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static ViewModifier._makeView(modifier:inputs:body:) in conformance SuggestionPickerModifier()
{
  return MEMORY[0x270EFF510]();
}

uint64_t protocol witness for static ViewModifier._makeViewList(modifier:inputs:body:) in conformance SuggestionPickerModifier()
{
  return MEMORY[0x270EFF520]();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance SuggestionPickerModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t outlined init with copy of SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of SuggestionPickerModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SuggestionPickerModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #1 in SuggestionPickerModifier.body(content:));
}

void partial apply for closure #2 in SuggestionPickerModifier.body(content:)()
{
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
    lazy protocol witness table accessor for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<SuggestionPickerModifier>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<SuggestionPickerModifier> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t partial apply for closure #3 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #3 in SuggestionPickerModifier.body(content:));
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Environment<ScenePhase>.Content(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ScenePhase();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    uint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x616850656E656353, 0xEA00000000006573, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_2444BF000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245691070](v18, -1, -1);
      MEMORY[0x245691070](v16, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t partial apply for closure #4 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #4 in SuggestionPickerModifier.body(content:));
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier>);
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<SuggestionPickerModifier>, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t partial apply for closure #5 in SuggestionPickerModifier.body(content:)()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #5 in SuggestionPickerModifier.body(content:));
}

unint64_t lazy protocol witness table accessor for type Bool? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type Bool? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type Bool? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Bool?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Bool? and conformance <A> A?);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_5Tm()
{
  uint64_t v1 = type metadata accessor for SuggestionPickerModifier();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ScenePhase();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined consume of StateObject<SuggestionSheetManager>.Storage(*(void *)(v5 + *(int *)(v1 + 32)), *(void *)(v5 + *(int *)(v1 + 32) + 8), *(unsigned char *)(v5 + *(int *)(v1 + 32) + 16));
  uint64_t v7 = v5 + *(int *)(v1 + 36);
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.updatePresentation()()
{
  return partial apply for closure #1 in SuggestionPickerModifier.body(content:)((uint64_t (*)(uint64_t))closure #1 in SuggestionPickerModifier.updatePresentation());
}

uint64_t partial apply for closure #1 in SuggestionPickerModifier.body(content:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for SuggestionPickerModifier() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t outlined init with copy of Environment<ScenePhase>.Content(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ScenePhase>.Content);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2444FD298()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.onChange<A>(of:initial:_:)>>.0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Bool?);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier>);
  type metadata accessor for ScenePhase();
  lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.onChange<A>(of:initial:_:)>>.0, _AppearanceActionModifier> and conformance <> ModifiedContent<A, B>();
  lazy protocol witness table accessor for type SuggestionPickerModifier and conformance SuggestionPickerModifier(&lazy protocol witness table cache variable for type ScenePhase and conformance ScenePhase, MEMORY[0x263F18460]);
  swift_getOpaqueTypeConformance2();
  lazy protocol witness table accessor for type Bool? and conformance <A> A?();
  return swift_getOpaqueTypeConformance2();
}

uint64_t DateInterval.init(start:end:)()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x270EEE338]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x270EF0700]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return MEMORY[0x270EFEDD0]();
}

uint64_t type metadata accessor for ScenePhase()
{
  return MEMORY[0x270EFEDE0]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t StateObject.wrappedValue.getter()
{
  return MEMORY[0x270EFF108]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x270EFF538]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x270F001A8]();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return MEMORY[0x270F00898]();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return MEMORY[0x270F008A8]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E0]();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return MEMORY[0x270F03228]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03250]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x270F04170]();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return MEMORY[0x270F041A0]();
}

uint64_t Color.init(_:)()
{
  return MEMORY[0x270F045A8]();
}

uint64_t Image.init(uiImage:)()
{
  return MEMORY[0x270F04630]();
}

uint64_t State.init(wrappedValue:)()
{
  return MEMORY[0x270F04818]();
}

uint64_t State.wrappedValue.getter()
{
  return MEMORY[0x270F04820]();
}

uint64_t State.wrappedValue.setter()
{
  return MEMORY[0x270F04830]();
}

uint64_t State.projectedValue.getter()
{
  return MEMORY[0x270F04848]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048B0]();
}

uint64_t type metadata accessor for Button()
{
  return MEMORY[0x270F04900]();
}

uint64_t Binding.wrappedValue.getter()
{
  return MEMORY[0x270F04B30]();
}

uint64_t Binding.wrappedValue.setter()
{
  return MEMORY[0x270F04B48]();
}

uint64_t Gradient.init(colors:)()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t type metadata accessor for TaskGroup()
{
  return MEMORY[0x270FA1E78]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t static TaskPriority.high.getter()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t HKStateOfMind.init(date:kind:valence:labels:associations:metadata:)()
{
  return MEMORY[0x270EF33D0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x270F9E810]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x270F9E830]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x270F9E838]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x270F9E840]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x270F9E860]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x270F9E880]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DC8](image);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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