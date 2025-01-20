ProtocolDescriptor *_transferRepresentationDescriptor()
{
  return &protocol descriptor for TransferRepresentation;
}

uint64_t _callVisitTransferRepresentationType1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _callVisitTransferRepresentationType2(a1, a2, a2, a3);
}

void sub_2128406F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2128407FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212840904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212840A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getNSDocumentTypeDocumentAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIFoundationLibrary();
  result = dlsym(v2, "NSDocumentTypeDocumentAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIFoundationLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!UIFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __UIFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264192408;
    uint64_t v5 = 0;
    UIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = UIFoundationLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!UIFoundationLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __UIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNSRTFTextDocumentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIFoundationLibrary();
  uint64_t result = dlsym(v2, "NSRTFTextDocumentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSRTFTextDocumentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNSRTFDTextDocumentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIFoundationLibrary();
  uint64_t result = dlsym(v2, "NSRTFDTextDocumentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSRTFDTextDocumentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNSHTMLTextDocumentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)UIFoundationLibrary();
  uint64_t result = dlsym(v2, "NSHTMLTextDocumentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNSHTMLTextDocumentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void static Never.transferRepresentation.getter()
{
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in Never()
{
  return &protocol witness table for Never;
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Item : Transferable in Never()
{
  return &protocol witness table for Never;
}

void protocol witness for static Transferable.transferRepresentation.getter in conformance Never()
{
}

uint64_t static Transferable.exportedContentTypes(visibility:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v6 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for UTType();
  uint64_t v42 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  v45 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v49 = static Transferable.resolvedRepresentations()(a2, a3);
  v50 = closure #1 in static Transferable.exportedContentTypes(visibility:);
  uint64_t v51 = 0;
  *(void *)(swift_allocObject() + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyFilterSequence<[ResolvedTransferRepresentation]>);
  LazyFilterSequence.filter(_:)();
  swift_release();
  uint64_t v11 = v52;
  v48 = v53;
  uint64_t v12 = *(void *)(v52 + 16);
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v52 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v15 = *(void *)(v6 + 72);
    while (1)
    {
      swift_retain();
      char v16 = v48(v14);
      swift_release();
      if (v16) {
        break;
      }
      ++v13;
      v14 += v15;
      if (v12 == v13)
      {
        uint64_t v13 = v12;
        break;
      }
    }
    uint64_t v17 = *(void *)(v11 + 16);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v18 = specialized LazyFilterSequence<>.distance(from:to:)(v13, v17, v11, v48);
  if (v18)
  {
    uint64_t v49 = MEMORY[0x263F8EE78];
    uint64_t v43 = v18;
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18 & ~(v18 >> 63), 0);
    unint64_t v20 = *(void *)(v11 + 16);
    if (v20)
    {
      unint64_t v21 = 0;
      uint64_t v22 = v11 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v23 = *(void *)(v6 + 72);
      while (1)
      {
        swift_retain();
        char v24 = v48(v22);
        uint64_t result = swift_release();
        if (v24) {
          break;
        }
        ++v21;
        v22 += v23;
        if (v20 == v21)
        {
          unint64_t v21 = v20;
          break;
        }
      }
    }
    else
    {
      unint64_t v21 = 0;
    }
    if ((v43 & 0x8000000000000000) == 0)
    {
      uint64_t v26 = 0;
      unint64_t v44 = v11 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v39 = v42 + 32;
      v40 = (void (**)(char *, char *, uint64_t))(v42 + 16);
      uint64_t v27 = v43;
      uint64_t v38 = v6;
      while (v26 != v27)
      {
        if ((v21 & 0x8000000000000000) != 0) {
          goto LABEL_40;
        }
        if (v21 >= *(void *)(v11 + 16)) {
          goto LABEL_41;
        }
        uint64_t v47 = v26;
        uint64_t v29 = v11;
        uint64_t v30 = *(void *)(v6 + 72);
        outlined init with copy of ResolvedTransferRepresentation(v44 + v30 * v21, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        (*v40)(v45, &v8[*(int *)(v41 + 20)], v46);
        outlined destroy of ResolvedTransferRepresentation((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v25 = v49;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v25 + 16) + 1, 1);
          uint64_t v25 = v49;
        }
        unint64_t v32 = *(void *)(v25 + 16);
        unint64_t v31 = *(void *)(v25 + 24);
        uint64_t v28 = v47;
        if (v32 >= v31 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
          uint64_t v28 = v47;
          uint64_t v25 = v49;
        }
        *(void *)(v25 + 16) = v32 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32))(v25+ ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(void *)(v42 + 72) * v32, v45, v46);
        uint64_t v49 = v25;
        if (v21 == v17) {
          goto LABEL_42;
        }
        unint64_t v33 = v21 + 1;
        unint64_t v21 = v17;
        if (v33 != v17)
        {
          uint64_t v34 = v44 + v30 * v33;
          unint64_t v21 = v33;
          while (v21 < *(void *)(v29 + 16))
          {
            outlined init with copy of ResolvedTransferRepresentation(v34, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            swift_retain();
            char v35 = v48((uint64_t)v8);
            swift_release();
            uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            if (v35) {
              goto LABEL_18;
            }
            unint64_t v36 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_38;
            }
            ++v21;
            v34 += v30;
            if (v36 == v17)
            {
              unint64_t v21 = v17;
LABEL_18:
              uint64_t v28 = v47;
              goto LABEL_19;
            }
          }
          __break(1u);
LABEL_38:
          __break(1u);
          break;
        }
LABEL_19:
        uint64_t v26 = v28 + 1;
        uint64_t v27 = v43;
        uint64_t v6 = v38;
        uint64_t v11 = v29;
        if (v26 == v43)
        {
          swift_release();
          swift_bridgeObjectRelease();
          return v25;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t static Transferable.resolvedRepresentations()(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - v14;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  swift_getDynamicType();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v13, AssociatedTypeWitness, (uint64_t)v9);
  _TransferRepresentationInputs.init()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v20, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v17 = v20;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, AssociatedTypeWitness);
  return v17;
}

BOOL closure #1 in static Transferable.exportedContentTypes(visibility:)(uint64_t a1)
{
  return *(void *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32)) != 0;
}

uint64_t sub_212841868()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t static Transferable.importedContentTypes()(uint64_t a1, uint64_t a2)
{
  return static Transferable.readableContentTypes.getter(a1, a2);
}

uint64_t static Transferable.readableContentTypes.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = type metadata accessor for UTType();
  uint64_t v54 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v60 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v64 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v58 = (uint64_t)&v52 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v53 = (char *)&v52 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v52 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = static Transferable.resolvedRepresentations()(a1, a2);
  uint64_t v19 = v18;
  unint64_t v20 = *(void *)(v18 + 16);
  if (!v20) {
    goto LABEL_47;
  }
  uint64_t v21 = 0;
  unint64_t v52 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v22 = *(void *)(v6 + 72);
  uint64_t v57 = v18 + v52;
  uint64_t v23 = v18 + v52;
  while (1)
  {
    outlined init with copy of ResolvedTransferRepresentation(v23, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v24 = *(void *)&v17[*(int *)(v5 + 36)];
    uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v24) {
      break;
    }
    ++v21;
    v23 += v22;
    if (v20 == v21) {
      goto LABEL_47;
    }
  }
  if (v20 < v21)
  {
    uint64_t v26 = -1;
    uint64_t v27 = v21;
    uint64_t v21 = v20;
    goto LABEL_10;
  }
  if (v20 == v21)
  {
LABEL_47:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v26 = 1;
  uint64_t v27 = v20;
LABEL_10:
  uint64_t v28 = 0;
  unint64_t v59 = v19 + v52;
  uint64_t v29 = v26;
  uint64_t v55 = v27;
  v56 = (void (**)(char *, uint64_t, uint64_t))v26;
  do
  {
    BOOL v31 = __OFADD__(v28, v26);
    v28 += v26;
    if (v31) {
      goto LABEL_54;
    }
    if (v21 == v20) {
      goto LABEL_55;
    }
    uint64_t v30 = v29;
    unint64_t v32 = v20;
    if (v21 + 1 != v20)
    {
      uint64_t v62 = v29;
      uint64_t v63 = v28;
      uint64_t v33 = v59 + v22 * (v21 + 1);
      unint64_t v32 = v21 + 1;
      while (v21 >= -1)
      {
        if (v32 >= *(void *)(v19 + 16)) {
          goto LABEL_51;
        }
        outlined init with copy of ResolvedTransferRepresentation(v33, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v34 = *(void *)&v15[*(int *)(v5 + 36)];
        uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        if (v34) {
          goto LABEL_11;
        }
        ++v32;
        v33 += v22;
        if (v20 == v32)
        {
          unint64_t v32 = v20;
LABEL_11:
          uint64_t v30 = v62;
          uint64_t v28 = v63;
          uint64_t v27 = v55;
          uint64_t v26 = (uint64_t)v56;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
LABEL_12:
    uint64_t v29 = v30 + v26;
    uint64_t v21 = v32;
  }
  while (v32 != v27);
  if (!v28) {
    goto LABEL_47;
  }
  uint64_t v62 = v30;
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v63 = v28;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28 & ~(v28 >> 63), 0);
  unint64_t v35 = 0;
  uint64_t v36 = v57;
  uint64_t v37 = (uint64_t)v53;
  while (1)
  {
    outlined init with copy of ResolvedTransferRepresentation(v36, v37, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v38 = *(void *)(v37 + *(int *)(v5 + 36));
    uint64_t result = outlined destroy of ResolvedTransferRepresentation(v37, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v38) {
      break;
    }
    unint64_t v39 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      goto LABEL_60;
    }
    ++v35;
    v36 += v22;
    if (v39 == v20)
    {
      unint64_t v35 = v20;
      break;
    }
  }
  uint64_t v40 = v54;
  uint64_t v41 = v62;
  if ((v63 & 0x8000000000000000) == 0)
  {
    unint64_t v42 = 0;
    uint64_t v55 = v54 + 32;
    v56 = (void (**)(char *, uint64_t, uint64_t))(v54 + 16);
    v53 = (char *)(v19 + v52);
    uint64_t v43 = (uint64_t)v64;
    while (v42 != v41)
    {
      if ((v35 & 0x8000000000000000) != 0) {
        goto LABEL_57;
      }
      if (v35 >= *(void *)(v19 + 16)) {
        goto LABEL_58;
      }
      unint64_t v59 = v42;
      uint64_t v44 = v58;
      outlined init with copy of ResolvedTransferRepresentation(v57 + v35 * v22, v58, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      (*v56)(v60, v44 + *(int *)(v5 + 20), v61);
      outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v45 = v65;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v45 + 16) + 1, 1);
        uint64_t v45 = v65;
      }
      unint64_t v47 = *(void *)(v45 + 16);
      unint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v46 > 1, v47 + 1, 1);
        uint64_t v45 = v65;
      }
      *(void *)(v45 + 16) = v47 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v40 + 32))(v45+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v47, v60, v61);
      uint64_t v65 = v45;
      if (v35 == v20) {
        goto LABEL_59;
      }
      unint64_t v48 = v35 + 1;
      unint64_t v35 = v20;
      if (v48 != v20)
      {
        uint64_t v49 = (uint64_t)&v53[v22 * v48];
        unint64_t v35 = v48;
        while (v35 < *(void *)(v19 + 16))
        {
          outlined init with copy of ResolvedTransferRepresentation(v49, v43, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          uint64_t v50 = *(void *)(v43 + *(int *)(v5 + 36));
          uint64_t result = outlined destroy of ResolvedTransferRepresentation(v43, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          if (v50) {
            goto LABEL_30;
          }
          unint64_t v51 = v35 + 1;
          if (__OFADD__(v35, 1)) {
            goto LABEL_53;
          }
          ++v35;
          v49 += v22;
          if (v51 == v20)
          {
            unint64_t v35 = v20;
LABEL_30:
            uint64_t v40 = v54;
            goto LABEL_31;
          }
        }
        goto LABEL_52;
      }
LABEL_31:
      unint64_t v42 = v59 + 1;
      uint64_t v41 = v62;
      if (v59 + 1 == v63)
      {
        swift_bridgeObjectRelease();
        return v45;
      }
    }
    goto LABEL_56;
  }
LABEL_61:
  __break(1u);
  return result;
}

uint64_t Transferable.exportedContentTypes(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for UTType();
  uint64_t v47 = *(void *)(v52 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v52);
  unint64_t v51 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = *a1;
  uint64_t v59 = static Transferable.resolvedRepresentations()(a2, a3);
  v60 = (uint64_t (*)(uint64_t))closure #1 in Transferable.exportedContentTypes(_:);
  uint64_t v61 = 0;
  *(void *)(swift_allocObject() + 16) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyFilterSequence<[ResolvedTransferRepresentation]>);
  LazyFilterSequence.filter(_:)();
  swift_release();
  long long v55 = v57;
  uint64_t v56 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a2);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  LazyFilterSequence.filter(_:)();
  swift_release();
  uint64_t v17 = v59;
  uint64_t v54 = v60;
  uint64_t v18 = *(void *)(v59 + 16);
  if (v18)
  {
    uint64_t v19 = 0;
    uint64_t v20 = v49;
    uint64_t v21 = v59 + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80));
    uint64_t v22 = *(void *)(v49 + 72);
    while (1)
    {
      swift_retain();
      char v23 = v54(v21);
      swift_release();
      if (v23) {
        break;
      }
      ++v19;
      v21 += v22;
      if (v18 == v19)
      {
        uint64_t v19 = v18;
        break;
      }
    }
    uint64_t v24 = *(void *)(v17 + 16);
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = v49;
  }
  uint64_t v25 = specialized LazyFilterSequence<>.distance(from:to:)(v19, v24, v17, v54);
  if (v25)
  {
    *(void *)&long long v57 = MEMORY[0x263F8EE78];
    uint64_t v48 = v25;
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v25 & ~(v25 >> 63), 0);
    unint64_t v27 = *(void *)(v17 + 16);
    if (v27)
    {
      unint64_t v28 = 0;
      uint64_t v29 = v17 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
      uint64_t v30 = *(void *)(v20 + 72);
      while (1)
      {
        swift_retain();
        char v31 = v54(v29);
        uint64_t result = swift_release();
        if (v31) {
          break;
        }
        ++v28;
        v29 += v30;
        if (v27 == v28)
        {
          unint64_t v28 = v27;
          break;
        }
      }
    }
    else
    {
      unint64_t v28 = 0;
    }
    if ((v48 & 0x8000000000000000) == 0)
    {
      uint64_t v33 = 0;
      unint64_t v50 = v17 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
      uint64_t v45 = (void (**)(char *, char *, uint64_t))(v47 + 16);
      v44[1] = v47 + 32;
      uint64_t v34 = v48;
      while (v33 != v34)
      {
        if ((v28 & 0x8000000000000000) != 0) {
          goto LABEL_40;
        }
        if (v28 >= *(void *)(v17 + 16)) {
          goto LABEL_41;
        }
        uint64_t v53 = v33;
        uint64_t v36 = v17;
        uint64_t v37 = *(void *)(v20 + 72);
        outlined init with copy of ResolvedTransferRepresentation(v50 + v37 * v28, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        (*v45)(v51, &v9[*(int *)(v46 + 20)], v52);
        outlined destroy of ResolvedTransferRepresentation((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v32 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v32 + 16) + 1, 1);
          uint64_t v32 = v57;
        }
        unint64_t v39 = *(void *)(v32 + 16);
        unint64_t v38 = *(void *)(v32 + 24);
        uint64_t v35 = v53;
        if (v39 >= v38 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          uint64_t v35 = v53;
          uint64_t v32 = v57;
        }
        *(void *)(v32 + 16) = v39 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v47 + 32))(v32+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(void *)(v47 + 72) * v39, v51, v52);
        *(void *)&long long v57 = v32;
        if (v28 == v24) {
          goto LABEL_42;
        }
        unint64_t v40 = v28 + 1;
        unint64_t v28 = v24;
        if (v40 != v24)
        {
          uint64_t v41 = v50 + v37 * v40;
          unint64_t v28 = v40;
          while (v28 < *(void *)(v36 + 16))
          {
            outlined init with copy of ResolvedTransferRepresentation(v41, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            swift_retain();
            char v42 = v54((uint64_t)v9);
            swift_release();
            uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            if (v42) {
              goto LABEL_18;
            }
            unint64_t v43 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_38;
            }
            ++v28;
            v41 += v37;
            if (v43 == v24)
            {
              unint64_t v28 = v24;
LABEL_18:
              uint64_t v35 = v53;
              goto LABEL_19;
            }
          }
          __break(1u);
LABEL_38:
          __break(1u);
          break;
        }
LABEL_19:
        uint64_t v33 = v35 + 1;
        uint64_t v34 = v48;
        uint64_t v20 = v49;
        uint64_t v17 = v36;
        if (v33 == v48)
        {
          swift_release();
          swift_bridgeObjectRelease();
          return v32;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t closure #3 in Transferable.exportedContentTypes(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = *(uint64_t (**)(uint64_t *))(a1
                                           + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  if (v9)
  {
    v13[3] = a3;
    v13[4] = a4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, a2, a3);
    swift_retain();
    char v11 = v9(v13);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  }
  else
  {
    char v11 = 1;
  }
  return v11 & 1;
}

uint64_t Transferable.importedContentTypes()(uint64_t a1, uint64_t a2)
{
  return static Transferable.readableContentTypes.getter(a1, a2);
}

uint64_t Transferable.init(importing:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v6[8] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URL();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.init(importing:contentType:), 0, 0);
}

uint64_t Transferable.init(importing:contentType:)()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[4];
  (*(void (**)(void, void, void))(v0[10] + 16))(v0[11], v0[3], v0[9]);
  outlined init with copy of UTType?(v2, v1, &demangling cache variable for type metadata for UTType?);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = Transferable.init(importing:contentType:);
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[2];
  return Transferable.init(_file:contentType:)(v8, v4, v5, v6, v7);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable.init(importing:contentType:);
  }
  else {
    uint64_t v2 = Transferable.init(importing:contentType:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[3];
  outlined destroy of UTType?(v0[4], &demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[3];
  outlined destroy of UTType?(v0[4], &demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  outlined init with copy of UTType?(v0[5], v0[9], &demangling cache variable for type metadata for UTType?);
  outlined copy of Data._Representation(v2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  *uint64_t v3 = v0;
  v3[1] = Transferable.init(importing:contentType:);
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v9 = v0[2];
  return Transferable.init(_:_:)(v9, v7, v8, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable.init(importing:contentType:);
  }
  else {
    uint64_t v2 = Transferable.init(importing:contentType:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[5];
  outlined consume of Data._Representation(v0[3], v0[4]);
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[5];
  outlined consume of Data._Representation(v0[3], v0[4]);
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t Transferable.init(_file:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[25] = a4;
  v5[26] = a5;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[27] = v6;
  v5[28] = *(void *)(v6 - 8);
  v5[29] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Optional();
  v5[30] = v7;
  v5[31] = *(void *)(v7 - 8);
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  v5[34] = v8;
  v5[35] = *(void *)(v8 - 8);
  v5[36] = swift_task_alloc();
  v5[37] = type metadata accessor for ReceivedTransferredFile(0);
  v5[38] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for ResolvedTransferRepresentation();
  v5[39] = v9;
  v5[40] = *(void *)(v9 - 8);
  v5[41] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for UTType();
  v5[42] = v10;
  v5[43] = *(void *)(v10 - 8);
  v5[44] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v5[45] = swift_task_alloc();
  v5[46] = swift_task_alloc();
  v5[47] = swift_task_alloc();
  v5[48] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.init(_file:contentType:), 0, 0);
}

uint64_t Transferable.init(_file:contentType:)()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 344);
  outlined init with copy of UTType?(*(void *)(v0 + 192), v2, &demangling cache variable for type metadata for UTType?);
  outlined init with copy of UTType?(v2, v1, &demangling cache variable for type metadata for UTType?);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v2) = v5(v1, 1, v3);
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  if (v2 == 1)
  {
    uint64_t v6 = *(void *)(v0 + 384);
    uint64_t v7 = *(void *)(v0 + 368);
    _contentType(for:)(v7);
    outlined destroy of UTType?(v6, &demangling cache variable for type metadata for UTType?);
    outlined init with take of URL?(v7, v6, &demangling cache variable for type metadata for UTType?);
  }
  uint64_t v8 = *(void *)(v0 + 360);
  uint64_t v9 = *(void *)(v0 + 336);
  outlined init with copy of UTType?(*(void *)(v0 + 384), v8, &demangling cache variable for type metadata for UTType?);
  if (v5(v8, 1, v9) == 1)
  {
    uint64_t v10 = *(void *)(v0 + 384);
    uint64_t v12 = *(void *)(v0 + 272);
    uint64_t v11 = *(void *)(v0 + 280);
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v13 = *(void *)(v0 + 192);
    outlined destroy of UTType?(*(void *)(v0 + 360), &demangling cache variable for type metadata for UTType?);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *unint64_t v15 = 0;
    swift_willThrow();
    outlined destroy of UTType?(v13, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v12);
LABEL_15:
    outlined destroy of UTType?(v10, &demangling cache variable for type metadata for UTType?);
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
    uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
    return v44();
  }
  uint64_t v16 = *(void *)(v0 + 368);
  uint64_t v18 = *(void *)(v0 + 344);
  uint64_t v17 = *(void *)(v0 + 352);
  uint64_t v19 = *(void *)(v0 + 336);
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v20 = *(void *)(v0 + 208);
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v17, *(void *)(v0 + 360), v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v17, v19);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v19);
  uint64_t v22 = static Transferable.resolvedRepresentations(for:)(v16, v21, v20);
  *(void *)(v0 + 392) = v22;
  outlined destroy of UTType?(v16, &demangling cache variable for type metadata for UTType?);
  uint64_t v23 = *(void *)(v22 + 16);
  *(void *)(v0 + 400) = v23;
  if (!v23)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v0 + 384);
    uint64_t v36 = *(void *)(v0 + 344);
    uint64_t v37 = *(void *)(v0 + 352);
    uint64_t v38 = *(void *)(v0 + 336);
    uint64_t v39 = *(void *)(v0 + 272);
    uint64_t v40 = *(void *)(v0 + 280);
    uint64_t v42 = *(void *)(v0 + 184);
    uint64_t v41 = *(void *)(v0 + 192);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *unint64_t v43 = 0;
    swift_willThrow();
    outlined destroy of UTType?(v41, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v39);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v38);
    goto LABEL_15;
  }
  uint64_t v24 = 0;
  uint64_t v25 = *(void *)(v0 + 320);
  *(_DWORD *)(v0 + 488) = *(_DWORD *)(v25 + 80);
  *(void *)(v0 + 408) = *(void *)(v25 + 72);
  uint64_t v26 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 416) = v24;
    uint64_t v27 = *(void *)(v0 + 328);
    uint64_t v28 = *(void *)(v0 + 312);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 488) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 488))+ *(void *)(v0 + 408) * v24, v27, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v29 = (int **)(v27 + *(int *)(v28 + 36));
    uint64_t v30 = *v29;
    *(void *)(v0 + 424) = *v29;
    *(void *)(v0 + 432) = v29[1];
    uint64_t v31 = *(void *)(v0 + 328);
    if (!v30)
    {
      outlined destroy of ResolvedTransferRepresentation(v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      goto LABEL_8;
    }
    uint64_t v32 = *(int *)(*(void *)(v0 + 312) + 28);
    *(_DWORD *)(v0 + 492) = v32;
    uint64_t v33 = *(void *)(v31 + v32);
    if (v33 == type metadata accessor for SentTransferredFile(0)) {
      break;
    }
    swift_retain();
    if (v33 == v26)
    {
      uint64_t v34 = Data.init(contentsOf:options:)();
      *(void *)(v0 + 456) = v34;
      *(void *)(v0 + 464) = v35;
      unint64_t v51 = *(int **)(v0 + 424);
      *(void *)(v0 + 80) = v26;
      *(void *)(v0 + 88) = &protocol witness table for Data;
      *(void *)(v0 + 56) = v34;
      *(void *)(v0 + 64) = v35;
      outlined copy of Data._Representation(v34, v35);
      long long v55 = (uint64_t (*)(uint64_t, uint64_t))((char *)v51 + *v51);
      uint64_t v52 = (void *)swift_task_alloc();
      *(void *)(v0 + 472) = v52;
      *uint64_t v52 = v0;
      v52[1] = Transferable.init(_file:contentType:);
      uint64_t v53 = v0 + 16;
      uint64_t v54 = v0 + 56;
      goto LABEL_19;
    }
    outlined destroy of ResolvedTransferRepresentation(v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v30);
LABEL_8:
    uint64_t v24 = *(void *)(v0 + 416) + 1;
    if (v24 == *(void *)(v0 + 400)) {
      goto LABEL_14;
    }
  }
  uint64_t v47 = *(void *)(v0 + 296);
  uint64_t v46 = *(void *)(v0 + 304);
  uint64_t v48 = *(void *)(v0 + 288);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v48, *(void *)(v0 + 184), *(void *)(v0 + 272));
  swift_retain();
  ReceivedTransferredFile.init(file:isOriginalFile:)(v48, 1, v46);
  *(void *)(v0 + 160) = v47;
  *(void *)(v0 + 168) = &protocol witness table for ReceivedTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
  outlined init with copy of ResolvedTransferRepresentation(v46, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
  long long v55 = (uint64_t (*)(uint64_t, uint64_t))((char *)v30 + *v30);
  unint64_t v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v50;
  *unint64_t v50 = v0;
  v50[1] = Transferable.init(_file:contentType:);
  uint64_t v53 = v0 + 96;
  uint64_t v54 = v0 + 136;
LABEL_19:
  return v55(v53, v54);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 448) = v0;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v3 = Transferable.init(_file:contentType:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 136);
    uint64_t v3 = Transferable.init(_file:contentType:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int **v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned char *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *boxed_opaque_existential_1;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  uint64_t v65;

  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 200);
  outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), type metadata accessor for ReceivedTransferredFile);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  uint64_t v3 = swift_dynamicCast();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v1, v3 ^ 1u, 1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v5 = *(void **)(v0 + 448);
    uint64_t v6 = *(int *)(v0 + 492);
    uint64_t v7 = *(void *)(v0 + 328);
    (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 240));
    uint64_t v8 = MEMORY[0x263F06F78];
    if (*(void *)(v7 + v6) == MEMORY[0x263F06F78]) {
      goto LABEL_4;
    }
LABEL_3:
    uint64_t v9 = *(void *)(v0 + 424);
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 328), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v9);
    while (1)
    {
      while (1)
      {
        uint64_t v24 = *(void *)(v0 + 416) + 1;
        if (v24 == *(void *)(v0 + 400))
        {
          swift_bridgeObjectRelease();
          uint64_t v40 = *(void *)(v0 + 384);
          uint64_t v41 = *(void *)(v0 + 344);
          uint64_t v42 = *(void *)(v0 + 352);
          unint64_t v43 = *(void *)(v0 + 336);
          uint64_t v44 = *(void *)(v0 + 272);
          uint64_t v45 = *(void *)(v0 + 280);
          uint64_t v47 = *(void *)(v0 + 184);
          uint64_t v46 = *(void *)(v0 + 192);
          lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
          swift_allocError();
          *uint64_t v48 = 0;
          swift_willThrow();
          outlined destroy of UTType?(v46, &demangling cache variable for type metadata for UTType?);
          (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v44);
          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v43);
          outlined destroy of UTType?(v40, &demangling cache variable for type metadata for UTType?);
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
          uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
          goto LABEL_16;
        }
        *(void *)(v0 + 416) = v24;
        uint64_t v25 = *(void *)(v0 + 328);
        uint64_t v26 = *(void *)(v0 + 312);
        outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 488) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 488))+ *(void *)(v0 + 408) * v24, v25, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v27 = (int **)(v25 + *(int *)(v26 + 36));
        uint64_t v28 = *v27;
        *(void *)(v0 + 424) = *v27;
        *(void *)(v0 + 432) = v27[1];
        uint64_t v29 = *(void *)(v0 + 328);
        if (v28) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(v29, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v30 = *(int *)(*(void *)(v0 + 312) + 28);
      *(_DWORD *)(v0 + 492) = v30;
      uint64_t v31 = *(void *)(v29 + v30);
      if (v31 == type metadata accessor for SentTransferredFile(0))
      {
        unint64_t v51 = *(void *)(v0 + 296);
        unint64_t v50 = *(void *)(v0 + 304);
        uint64_t v52 = *(void *)(v0 + 288);
        (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v52, *(void *)(v0 + 184), *(void *)(v0 + 272));
        swift_retain();
        ReceivedTransferredFile.init(file:isOriginalFile:)(v52, 1, v50);
        *(void *)(v0 + 160) = v51;
        *(void *)(v0 + 168) = &protocol witness table for ReceivedTransferredFile;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
        outlined init with copy of ResolvedTransferRepresentation(v50, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
        v64 = (uint64_t (*)(uint64_t, uint64_t))((char *)v28 + *v28);
        uint64_t v54 = (void *)swift_task_alloc();
        *(void *)(v0 + 440) = v54;
        *uint64_t v54 = v0;
        v54[1] = Transferable.init(_file:contentType:);
        long long v55 = v0 + 96;
        uint64_t v56 = v0 + 136;
        goto LABEL_21;
      }
      swift_retain();
      if (v31 != v8) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v10 = v5;
      uint64_t v11 = Data.init(contentsOf:options:)();
      *(void *)(v0 + 456) = v11;
      *(void *)(v0 + 464) = v12;
      if (!v5) {
        break;
      }
      uint64_t v14 = *(void *)(v0 + 224);
      uint64_t v13 = *(void *)(v0 + 232);
      unint64_t v15 = *(void *)(v0 + 216);
      uint64_t v16 = logger.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v16, v15);
      uint64_t v17 = Logger.logObject.getter();
      uint64_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_21283E000, v17, v18, "error", v19, 2u);
        MEMORY[0x216684270](v19, -1, -1);
      }
      uint64_t v20 = *(void *)(v0 + 328);
      uint64_t v21 = *(void *)(v0 + 224);
      uint64_t v22 = *(void *)(v0 + 232);
      uint64_t v23 = *(void *)(v0 + 216);
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 424));

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
      outlined destroy of ResolvedTransferRepresentation(v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v5 = 0;
    }
    long long v57 = *(int **)(v0 + 424);
    *(void *)(v0 + 80) = v8;
    *(void *)(v0 + 88) = &protocol witness table for Data;
    *(void *)(v0 + 56) = v11;
    *(void *)(v0 + 64) = v12;
    outlined copy of Data._Representation(v11, v12);
    v64 = (uint64_t (*)(uint64_t, uint64_t))((char *)v57 + *v57);
    uint64_t v58 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v58;
    *uint64_t v58 = v0;
    v58[1] = Transferable.init(_file:contentType:);
    long long v55 = v0 + 16;
    uint64_t v56 = v0 + 56;
LABEL_21:
    return v64(v55, v56);
  }
  else
  {
    uint64_t v32 = *(void *)(v0 + 344);
    uint64_t v34 = *(void *)(v0 + 328);
    uint64_t v33 = *(void *)(v0 + 336);
    uint64_t v36 = *(void *)(v0 + 272);
    unint64_t v35 = *(void *)(v0 + 280);
    uint64_t v63 = *(void *)(v0 + 264);
    uint64_t v37 = *(void *)(v0 + 192);
    uint64_t v61 = *(void *)(v0 + 384);
    uint64_t v62 = *(void *)(v0 + 200);
    uint64_t v38 = *(void *)(v0 + 184);
    uint64_t v59 = *(void *)(v0 + 352);
    v60 = *(void *)(v0 + 176);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 424));
    outlined destroy of UTType?(v37, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v38, v36);
    outlined destroy of ResolvedTransferRepresentation(v34, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v59, v33);
    outlined destroy of UTType?(v61, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v60, v63, v62);
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
    uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
LABEL_16:
    return v39();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 480) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = Transferable.init(_file:contentType:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = Transferable.init(_file:contentType:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned char *v25;
  void *v27;
  uint64_t v28;
  const char *v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  int **v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  int *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *boxed_opaque_existential_1;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  uint64_t v67;

  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 328);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 424));
  outlined consume of Data._Representation(v2, v1);
  outlined destroy of ResolvedTransferRepresentation(v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 344);
    uint64_t v62 = *(void *)(v0 + 352);
    uint64_t v61 = *(void *)(v0 + 336);
    uint64_t v6 = *(void *)(v0 + 272);
    uint64_t v5 = *(void *)(v0 + 280);
    uint64_t v7 = *(void *)(v0 + 256);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 184);
    uint64_t v63 = *(void *)(v0 + 176);
    v64 = *(void *)(v0 + 384);
    uint64_t v11 = *(void *)(v8 - 8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v8);
    outlined destroy of UTType?(v9, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v62, v61);
    outlined destroy of UTType?(v64, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v63, v7, v8);
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
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v12();
  }
  uint64_t v14 = *(void *)(v0 + 248);
  uint64_t v13 = *(void *)(v0 + 256);
  unint64_t v15 = *(void *)(v0 + 240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v0 + 200) - 8) + 56))(v13, 1, 1);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  uint64_t v16 = *(void *)(v0 + 416) + 1;
  if (v16 == *(void *)(v0 + 400))
  {
LABEL_4:
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(v0 + 384);
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v19 = *(void *)(v0 + 352);
    uint64_t v20 = *(void *)(v0 + 336);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v22 = *(void *)(v0 + 280);
    uint64_t v24 = *(void *)(v0 + 184);
    uint64_t v23 = *(void *)(v0 + 192);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v25 = 0;
    swift_willThrow();
    outlined destroy of UTType?(v23, &demangling cache variable for type metadata for UTType?);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v21);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
    outlined destroy of UTType?(v17, &demangling cache variable for type metadata for UTType?);
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
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  uint64_t v27 = *(void **)(v0 + 480);
  uint64_t v28 = MEMORY[0x263F06F78];
  uint64_t v29 = "error";
  uint64_t v30 = &dword_21283E000;
  while (1)
  {
    *(void *)(v0 + 416) = v16;
    uint64_t v31 = *(void *)(v0 + 328);
    uint64_t v32 = *(void *)(v0 + 312);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 488) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 488))+ *(void *)(v0 + 408) * v16, v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v33 = (int **)(v31 + *(int *)(v32 + 36));
    uint64_t v34 = *v33;
    *(void *)(v0 + 424) = *v33;
    *(void *)(v0 + 432) = v33[1];
    unint64_t v35 = *(void *)(v0 + 328);
    if (v34) {
      break;
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 328), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
LABEL_10:
    uint64_t v16 = *(void *)(v0 + 416) + 1;
    if (v16 == *(void *)(v0 + 400)) {
      goto LABEL_4;
    }
  }
  uint64_t v36 = *(int *)(*(void *)(v0 + 312) + 28);
  *(_DWORD *)(v0 + 492) = v36;
  uint64_t v37 = *(void *)(v35 + v36);
  if (v37 == type metadata accessor for SentTransferredFile(0))
  {
    uint64_t v53 = *(void *)(v0 + 296);
    uint64_t v52 = *(void *)(v0 + 304);
    uint64_t v54 = *(void *)(v0 + 288);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v54, *(void *)(v0 + 184), *(void *)(v0 + 272));
    swift_retain();
    ReceivedTransferredFile.init(file:isOriginalFile:)(v54, 1, v52);
    *(void *)(v0 + 160) = v53;
    *(void *)(v0 + 168) = &protocol witness table for ReceivedTransferredFile;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    outlined init with copy of ResolvedTransferRepresentation(v52, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
    v66 = (uint64_t (*)(uint64_t, uint64_t))((char *)v34 + *v34);
    uint64_t v56 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v56;
    *uint64_t v56 = v0;
    v56[1] = Transferable.init(_file:contentType:);
    long long v57 = v0 + 96;
    uint64_t v58 = v0 + 136;
    goto LABEL_20;
  }
  swift_retain();
  if (v37 != v28)
  {
    outlined destroy of ResolvedTransferRepresentation(v35, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v34);
    goto LABEL_10;
  }
  uint64_t v38 = Data.init(contentsOf:options:)();
  *(void *)(v0 + 456) = v38;
  *(void *)(v0 + 464) = v39;
  if (v27)
  {
    uint64_t v41 = *(void *)(v0 + 224);
    uint64_t v40 = *(void *)(v0 + 232);
    uint64_t v42 = *(void *)(v0 + 216);
    unint64_t v43 = logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v43, v42);
    uint64_t v44 = Logger.logObject.getter();
    uint64_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(v30, v44, v45, v29, v46, 2u);
      MEMORY[0x216684270](v46, -1, -1);
    }
    uint64_t v65 = *(void *)(v0 + 328);
    uint64_t v47 = v30;
    uint64_t v48 = v29;
    uint64_t v49 = *(void *)(v0 + 224);
    unint64_t v50 = *(void *)(v0 + 232);
    unint64_t v51 = *(void *)(v0 + 216);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 424));

    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v51);
    uint64_t v29 = v48;
    uint64_t v30 = v47;
    outlined destroy of ResolvedTransferRepresentation(v65, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v27 = 0;
    goto LABEL_10;
  }
  uint64_t v59 = *(int **)(v0 + 424);
  *(void *)(v0 + 80) = v28;
  *(void *)(v0 + 88) = &protocol witness table for Data;
  *(void *)(v0 + 56) = v38;
  *(void *)(v0 + 64) = v39;
  outlined copy of Data._Representation(v38, v39);
  v66 = (uint64_t (*)(uint64_t, uint64_t))((char *)v59 + *v59);
  v60 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v60;
  char *v60 = v0;
  v60[1] = Transferable.init(_file:contentType:);
  long long v57 = v0 + 16;
  uint64_t v58 = v0 + 56;
LABEL_20:
  return v66(v57, v58);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int **v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned char *v27;
  uint64_t (*v28)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *boxed_opaque_existential_1;
  int *v34;
  void *v35;
  uint64_t (*v36)();
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t v38;

  uint64_t v1 = v0 + 96;
  uint64_t v2 = v0 + 136;
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 200);
  outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), type metadata accessor for ReceivedTransferredFile);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = *(int *)(v0 + 492);
  uint64_t v6 = *(void *)(v0 + 328);
  (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 240));
  uint64_t v7 = MEMORY[0x263F06F78];
  if (*(void *)(v6 + v5) != MEMORY[0x263F06F78])
  {
    while (2)
    {
      uint64_t v8 = *(void *)(v0 + 424);
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 328), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v8);
      while (1)
      {
        uint64_t v16 = *(void *)(v0 + 416) + 1;
        if (v16 == *(void *)(v0 + 400))
        {
          swift_bridgeObjectRelease();
          uint64_t v19 = *(void *)(v0 + 384);
          uint64_t v20 = *(void *)(v0 + 344);
          uint64_t v21 = *(void *)(v0 + 352);
          uint64_t v22 = *(void *)(v0 + 336);
          uint64_t v23 = *(void *)(v0 + 272);
          uint64_t v24 = *(void *)(v0 + 280);
          uint64_t v26 = *(void *)(v0 + 184);
          uint64_t v25 = *(void *)(v0 + 192);
          lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
          swift_allocError();
          *uint64_t v27 = 0;
          swift_willThrow();
          outlined destroy of UTType?(v25, &demangling cache variable for type metadata for UTType?);
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v23);
          (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
          outlined destroy of UTType?(v19, &demangling cache variable for type metadata for UTType?);
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
          uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
          return v28();
        }
        *(void *)(v0 + 416) = v16;
        uint64_t v11 = *(void *)(v0 + 328);
        uint64_t v12 = *(void *)(v0 + 312);
        outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 488) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 488))+ *(void *)(v0 + 408) * v16, v11, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v13 = (int **)(v11 + *(int *)(v12 + 36));
        uint64_t v14 = *v13;
        *(void *)(v0 + 424) = *v13;
        *(void *)(v0 + 432) = v13[1];
        unint64_t v15 = *(void *)(v0 + 328);
        if (v14) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v17 = *(int *)(*(void *)(v0 + 312) + 28);
      *(_DWORD *)(v0 + 492) = v17;
      uint64_t v18 = *(void *)(v15 + v17);
      if (v18 == type metadata accessor for SentTransferredFile(0))
      {
        uint64_t v31 = *(void *)(v0 + 296);
        uint64_t v30 = *(void *)(v0 + 304);
        uint64_t v32 = *(void *)(v0 + 288);
        (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v32, *(void *)(v0 + 184), *(void *)(v0 + 272));
        swift_retain();
        ReceivedTransferredFile.init(file:isOriginalFile:)(v32, 1, v30);
        *(void *)(v0 + 160) = v31;
        *(void *)(v0 + 168) = &protocol witness table for ReceivedTransferredFile;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
        outlined init with copy of ResolvedTransferRepresentation(v30, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
        uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t))((char *)v14 + *v14);
        unint64_t v35 = (void *)swift_task_alloc();
        *(void *)(v0 + 440) = v35;
        *unint64_t v35 = v0;
        uint64_t v36 = Transferable.init(_file:contentType:);
        goto LABEL_15;
      }
      swift_retain();
      if (v18 != v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = Data.init(contentsOf:options:)();
  *(void *)(v0 + 456) = v9;
  *(void *)(v0 + 464) = v10;
  uint64_t v1 = v0 + 16;
  uint64_t v34 = *(int **)(v0 + 424);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = &protocol witness table for Data;
  *(void *)(v0 + 56) = v9;
  uint64_t v2 = v0 + 56;
  *(void *)(v0 + 64) = v10;
  outlined copy of Data._Representation(v9, v10);
  uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t))((char *)v34 + *v34);
  unint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v35;
  *unint64_t v35 = v0;
  uint64_t v36 = Transferable.init(_file:contentType:);
LABEL_15:
  v35[1] = v36;
  return v37(v1, v2);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int **v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned char *v36;
  uint64_t (*v37)(void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *boxed_opaque_existential_1;
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;

  outlined consume of Data._Representation(*(void *)(v0 + 456), *(void *)(v0 + 464));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  uint64_t v1 = *(void **)(v0 + 480);
  uint64_t v2 = MEMORY[0x263F06F78];
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v6 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_21283E000, v7, v8, "error", v9, 2u);
    MEMORY[0x216684270](v9, -1, -1);
  }
  uint64_t v10 = *(void *)(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 224);
  uint64_t v12 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 424));

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
LABEL_4:
  outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  while (1)
  {
    uint64_t v14 = *(void *)(v0 + 416) + 1;
    if (v14 == *(void *)(v0 + 400)) {
      break;
    }
    *(void *)(v0 + 416) = v14;
    unint64_t v15 = *(void *)(v0 + 328);
    uint64_t v16 = *(void *)(v0 + 312);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 392)+ ((*(unsigned __int8 *)(v0 + 488) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 488))+ *(void *)(v0 + 408) * v14, v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v17 = (int **)(v15 + *(int *)(v16 + 36));
    uint64_t v18 = *v17;
    *(void *)(v0 + 424) = *v17;
    *(void *)(v0 + 432) = v17[1];
    uint64_t v10 = *(void *)(v0 + 328);
    if (!v18) {
      goto LABEL_4;
    }
    uint64_t v19 = *(int *)(*(void *)(v0 + 312) + 28);
    *(_DWORD *)(v0 + 492) = v19;
    uint64_t v20 = *(void *)(v10 + v19);
    if (v20 == type metadata accessor for SentTransferredFile(0))
    {
      uint64_t v40 = *(void *)(v0 + 296);
      uint64_t v39 = *(void *)(v0 + 304);
      uint64_t v41 = *(void *)(v0 + 288);
      (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v41, *(void *)(v0 + 184), *(void *)(v0 + 272));
      swift_retain();
      ReceivedTransferredFile.init(file:isOriginalFile:)(v41, 1, v39);
      *(void *)(v0 + 160) = v40;
      *(void *)(v0 + 168) = &protocol witness table for ReceivedTransferredFile;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
      outlined init with copy of ResolvedTransferRepresentation(v39, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
      uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)v18 + *v18);
      unint64_t v43 = (void *)swift_task_alloc();
      *(void *)(v0 + 440) = v43;
      *unint64_t v43 = v0;
      v43[1] = Transferable.init(_file:contentType:);
      uint64_t v25 = v0 + 96;
      uint64_t v27 = v0 + 136;
      uint64_t v26 = v45;
      goto LABEL_15;
    }
    swift_retain();
    if (v20 == v2)
    {
      uint64_t v21 = Data.init(contentsOf:options:)();
      *(void *)(v0 + 456) = v21;
      *(void *)(v0 + 464) = v22;
      uint64_t v23 = *(int **)(v0 + 424);
      *(void *)(v0 + 80) = v2;
      *(void *)(v0 + 88) = &protocol witness table for Data;
      *(void *)(v0 + 56) = v21;
      *(void *)(v0 + 64) = v22;
      outlined copy of Data._Representation(v21, v22);
      uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t))((char *)v23 + *v23);
      uint64_t v24 = (void *)swift_task_alloc();
      *(void *)(v0 + 472) = v24;
      *uint64_t v24 = v0;
      v24[1] = Transferable.init(_file:contentType:);
      uint64_t v26 = v44;
      uint64_t v25 = v0 + 16;
      uint64_t v27 = v0 + 56;
LABEL_15:
      return v26(v25, v27);
    }
    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v18);
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void *)(v0 + 384);
  uint64_t v29 = *(void *)(v0 + 344);
  uint64_t v30 = *(void *)(v0 + 352);
  uint64_t v31 = *(void *)(v0 + 336);
  uint64_t v32 = *(void *)(v0 + 272);
  uint64_t v33 = *(void *)(v0 + 280);
  unint64_t v35 = *(void *)(v0 + 184);
  uint64_t v34 = *(void *)(v0 + 192);
  lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
  swift_allocError();
  *uint64_t v36 = 0;
  swift_willThrow();
  outlined destroy of UTType?(v34, &demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v32);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  outlined destroy of UTType?(v28, &demangling cache variable for type metadata for UTType?);
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
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t Transferable.export(to:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.export(to:contentType:), 0, 0);
}

uint64_t Transferable.export(to:contentType:)()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[3];
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v1, 0, 1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = Transferable.export(to:contentType:);
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[4];
  uint64_t v10 = v0[2];
  return Transferable._file(contentType:destinationDirectory:)(v10, v9, v6, v7, v8);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = *(void *)(*v1 + 64);
  uint64_t v3 = *v1;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  outlined destroy of UTType?(v2, &demangling cache variable for type metadata for URL?);
  if (v0)
  {
    return MEMORY[0x270FA2498](Transferable.export(to:contentType:), 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
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

uint64_t Transferable._file(contentType:destinationDirectory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[14] = a5;
  v6[15] = v5;
  v6[12] = a3;
  v6[13] = a4;
  v6[10] = a1;
  v6[11] = a2;
  uint64_t v7 = type metadata accessor for Logger();
  v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for UUID();
  v6[21] = v8;
  v6[22] = *(void *)(v8 - 8);
  v6[23] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v6[24] = v9;
  v6[25] = *(void *)(v9 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for ResolvedTransferRepresentation();
  v6[34] = v10;
  v6[35] = *(void *)(v10 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable._file(contentType:destinationDirectory:), 0, 0);
}

uint64_t Transferable._file(contentType:destinationDirectory:)()
{
  uint64_t v1 = static Transferable.resolvedRepresentations(for:)(*(void *)(v0 + 88), *(void *)(v0 + 104), *(void *)(v0 + 112));
  *(void *)(v0 + 320) = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 328) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 280);
    uint64_t v4 = type metadata accessor for SentTransferredFile(0);
    uint64_t v5 = 0;
    *(void *)(v0 + 336) = v4;
    *(_DWORD *)(v0 + 76) = *(_DWORD *)(v3 + 80);
    *(void *)(v0 + 344) = *(void *)(v3 + 72);
    uint64_t v6 = MEMORY[0x263F06F78];
    while (1)
    {
      *(void *)(v0 + 352) = v5;
      uint64_t v7 = *(void *)(v0 + 336);
      uint64_t v8 = *(void *)(v0 + 312);
      uint64_t v9 = *(void *)(v0 + 272);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v5, v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v10 = *(void *)(v8 + *(int *)(v9 + 28));
      if (v10 == v7) {
        break;
      }
      if (v10 == v6)
      {
        uint64_t v23 = swift_task_alloc();
        *(void *)(v0 + 392) = v23;
        *(void *)uint64_t v23 = v0;
        *(void *)(v23 + 8) = Transferable._file(contentType:destinationDirectory:);
        uint64_t v24 = *(void *)(v0 + 312);
        long long v25 = *(_OWORD *)(v0 + 104);
        *(void *)(v23 + 136) = *(void *)(v0 + 120);
        *(_OWORD *)(v23 + 120) = v25;
        *(void *)(v23 + 112) = v24;
        return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
      }
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 312), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v5 = *(void *)(v0 + 352) + 1;
      if (v5 == *(void *)(v0 + 328)) {
        goto LABEL_6;
      }
    }
    uint64_t v14 = *(void *)(v0 + 264);
    uint64_t v15 = *(void *)(v0 + 192);
    uint64_t v16 = *(void *)(v0 + 200);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    *(void *)(v0 + 360) = v17;
    *(void *)(v0 + 368) = (v16 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v17(v14, 1, 1, v15);
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v18;
    *uint64_t v18 = v0;
    v18[1] = Transferable._file(contentType:destinationDirectory:);
    uint64_t v19 = *(void *)(v0 + 312);
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v22 = *(void *)(v0 + 104);
    return Transferable.url(from:)(v20, v19, v22, v21);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v11 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable._file(contentType:destinationDirectory:);
  }
  else {
    uint64_t v2 = Transferable._file(contentType:destinationDirectory:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned char *v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  long long v38;
  uint64_t v39;

  uint64_t v1 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 192);
  outlined destroy of UTType?(v3, &demangling cache variable for type metadata for URL?);
  v1(v2, 0, 1, v4);
  outlined init with take of URL?(v2, v3, &demangling cache variable for type metadata for URL?);
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 192);
  uint64_t v7 = *(void *)(v0 + 200);
  outlined init with copy of UTType?(*(void *)(v0 + 264), v5, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v19 = *(void *)(v0 + 264);
    uint64_t v20 = *(void *)(v0 + 248);
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v22 = *(void *)(v0 + 192);
    uint64_t v23 = *(void *)(v0 + 200);
    uint64_t v24 = *(void *)(v0 + 96);
    long long v25 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v21, v20, v22);
    copyFile(from:to:)(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    outlined destroy of UTType?(v19, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(v18, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 248);
  outlined destroy of UTType?(*(void *)(v0 + 264), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of UTType?(v9, &demangling cache variable for type metadata for URL?);
  uint64_t v10 = *(void *)(v0 + 352) + 1;
  if (v10 == *(void *)(v0 + 328))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v16 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
    return v17();
  }
  uint64_t v11 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v10;
    uint64_t v12 = *(void *)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 312);
    uint64_t v14 = *(void *)(v0 + 272);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v10, v13, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v15 = *(void *)(v13 + *(int *)(v14 + 28));
    if (v15 == v12) {
      break;
    }
    if (v15 == v11)
    {
      uint64_t v36 = swift_task_alloc();
      *(void *)(v0 + 392) = v36;
      *(void *)uint64_t v36 = v0;
      *(void *)(v36 + 8) = Transferable._file(contentType:destinationDirectory:);
      uint64_t v37 = *(void *)(v0 + 312);
      uint64_t v38 = *(_OWORD *)(v0 + 104);
      *(void *)(v36 + 136) = *(void *)(v0 + 120);
      *(_OWORD *)(v36 + 120) = v38;
      *(void *)(v36 + 112) = v37;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 312), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v10 = *(void *)(v0 + 352) + 1;
    if (v10 == *(void *)(v0 + 328)) {
      goto LABEL_7;
    }
  }
  uint64_t v27 = *(void *)(v0 + 264);
  uint64_t v28 = *(void *)(v0 + 192);
  uint64_t v29 = *(void *)(v0 + 200);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
  *(void *)(v0 + 360) = v30;
  *(void *)(v0 + 368) = (v29 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v30(v27, 1, 1, v28);
  uint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v31;
  *uint64_t v31 = v0;
  v31[1] = Transferable._file(contentType:destinationDirectory:);
  uint64_t v32 = *(void *)(v0 + 312);
  uint64_t v33 = *(void *)(v0 + 256);
  uint64_t v34 = *(void *)(v0 + 112);
  unint64_t v35 = *(void *)(v0 + 104);
  return Transferable.url(from:)(v33, v32, v35, v34);
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(void);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned char *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  long long v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v87 = v0;
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 == 255)
  {
    outlined copy of Data._Representation(*(void *)(v0 + 400), *(void *)(v0 + 408));
  }
  else
  {
    *(_OWORD *)(v0 + 56) = *(_OWORD *)v1;
    uint64_t v4 = *(void *)(v0 + 400);
    uint64_t v3 = *(void *)(v0 + 408);
    uint64_t v5 = *(void *)(v0 + 120);
    *(unsigned char *)(v0 + 72) = v2 & 1;
    uint64_t v6 = *(_OWORD *)(v0 + 104);
    *(_OWORD *)(v0 + 40) = v6;
    uint64_t v7 = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, v5, v7);
    outlined copy of Data._Representation(v4, v3);
    ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(v0 + 16);
    uint64_t v10 = v9;
    outlined destroy of UTType?(v0 + 16, &demangling cache variable for type metadata for Transferable?);
    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = *(void *)(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 184);
  uint64_t v13 = *(void *)(v0 + 168);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v16 = *(void *)(v0 + 200);
  outlined init with copy of UTType?(*(void *)(v0 + 96), v14, &demangling cache variable for type metadata for URL?);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  uint64_t v18 = *(void *)(v0 + 240);
  if (v17 == 1)
  {
    backupDirectory()();
    outlined destroy of UTType?(v18, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 200) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 240), *(void *)(v0 + 192));
  }
  v83 = *(void **)(v0 + 416);
  uint64_t v19 = *(void *)(v0 + 216);
  uint64_t v20 = *(void *)(v0 + 200);
  uint64_t v21 = *(void *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 192);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v23(v21, v22);
  URL.appendingPathExtension(for:)();
  v23(v19, v22);
  uint64_t v24 = v83;
  Data.write(to:options:)();
  long long v25 = *(void *)(v0 + 400);
  uint64_t v26 = *(void *)(v0 + 408);
  uint64_t v27 = *(void *)(v0 + 224);
  if (!v83)
  {
    unint64_t v50 = *(void *)(v0 + 312);
    unint64_t v51 = *(void *)(v0 + 192);
    uint64_t v52 = *(void *)(v0 + 200);
    uint64_t v53 = *(void *)(v0 + 80);
    outlined consume of Data._Representation(*(void *)(v0 + 400), *(void *)(v0 + 408));
    outlined consume of Data._Representation(v25, v26);
    outlined destroy of ResolvedTransferRepresentation(v50, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v53, v27, v51);
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
LABEL_19:
    return v54();
  }
  v81 = *(void *)(v0 + 304);
  v84 = *(void *)(v0 + 312);
  uint64_t v28 = *(void *)(v0 + 160);
  uint64_t v30 = *(void *)(v0 + 128);
  uint64_t v29 = *(void *)(v0 + 136);
  v23(v27, *(void *)(v0 + 192));
  outlined consume of Data._Representation(v25, v26);
  uint64_t v31 = logger.unsafeMutableAddressor();
  uint64_t v32 = v30;
  uint64_t v33 = v24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v28, v31, v32);
  outlined init with copy of ResolvedTransferRepresentation(v84, v81, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v34 = v24;
  unint64_t v35 = v24;
  uint64_t v36 = Logger.logObject.getter();
  uint64_t v37 = static os_log_type_t.fault.getter();
  uint64_t v38 = os_log_type_enabled(v36, v37);
  uint64_t v39 = *(void *)(v0 + 400);
  uint64_t v40 = *(void *)(v0 + 304);
  uint64_t v41 = *(void *)(v0 + 312);
  if (v38)
  {
    v80 = *(void *)(v0 + 136);
    v82 = *(void *)(v0 + 128);
    v85 = *(void *)(v0 + 160);
    v78 = *(void *)(v0 + 408);
    v79 = *(void *)(v0 + 312);
    uint64_t v42 = swift_slowAlloc();
    unint64_t v43 = (void *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    v86 = v44;
    *(_DWORD *)uint64_t v42 = 136315394;
    uint64_t v45 = UTType.identifier.getter();
    *(void *)(v42 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v86);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v40, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v42 + 12) = 2112;
    uint64_t v47 = v24;
    uint64_t v48 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v42 + 14) = v48;
    *unint64_t v43 = v48;

    _os_log_impl(&dword_21283E000, v36, v37, "Error writing data for type identifier %s: %@", (uint8_t *)v42, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v43, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v44, -1, -1);
    MEMORY[0x216684270](v42, -1, -1);
    outlined consume of Data._Representation(v39, v78);

    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v85, v82);
    uint64_t v49 = v79;
  }
  else
  {
    long long v55 = *(void *)(v0 + 160);
    uint64_t v56 = *(void *)(v0 + 128);
    long long v57 = *(void *)(v0 + 136);
    outlined consume of Data._Representation(*(void *)(v0 + 400), *(void *)(v0 + 408));

    outlined destroy of ResolvedTransferRepresentation(v40, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
    uint64_t v49 = v41;
  }
  outlined destroy of ResolvedTransferRepresentation(v49, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v58 = *(void *)(v0 + 352) + 1;
  if (v58 == *(void *)(v0 + 328))
  {
LABEL_18:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    char *v64 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_19;
  }
  uint64_t v59 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v58;
    v60 = *(void *)(v0 + 336);
    uint64_t v61 = *(void *)(v0 + 312);
    uint64_t v62 = *(void *)(v0 + 272);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v58, v61, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v63 = *(void *)(v61 + *(int *)(v62 + 28));
    if (v63 == v60) {
      break;
    }
    if (v63 == v59)
    {
      v75 = swift_task_alloc();
      *(void *)(v0 + 392) = v75;
      *(void *)v75 = v0;
      *(void *)(v75 + 8) = Transferable._file(contentType:destinationDirectory:);
      v76 = *(void *)(v0 + 312);
      v77 = *(_OWORD *)(v0 + 104);
      *(void *)(v75 + 136) = *(void *)(v0 + 120);
      *(_OWORD *)(v75 + 120) = v77;
      *(void *)(v75 + 112) = v76;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 312), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v58 = *(void *)(v0 + 352) + 1;
    if (v58 == *(void *)(v0 + 328)) {
      goto LABEL_18;
    }
  }
  v66 = *(void *)(v0 + 264);
  v67 = *(void *)(v0 + 192);
  v68 = *(void *)(v0 + 200);
  v69 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56);
  *(void *)(v0 + 360) = v69;
  *(void *)(v0 + 368) = (v68 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v69(v66, 1, 1, v67);
  v70 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v70;
  *v70 = v0;
  v70[1] = Transferable._file(contentType:destinationDirectory:);
  v71 = *(void *)(v0 + 312);
  v72 = *(void *)(v0 + 256);
  v73 = *(void *)(v0 + 112);
  v74 = *(void *)(v0 + 104);
  return Transferable.url(from:)(v72, v71, v74, v73);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned char *v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  long long v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  uint64_t v63 = v0;
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v8 = v1;
  uint64_t v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.fault.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 384);
  uint64_t v14 = *(void *)(v0 + 296);
  if (v12)
  {
    uint64_t v15 = *(void *)(v0 + 136);
    v60 = *(void *)(v0 + 128);
    uint64_t v61 = *(void *)(v0 + 152);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v62 = v18;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v19 = UTType.identifier.getter();
    *(void *)(v16 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v62);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v16 + 12) = 2112;
    uint64_t v21 = v13;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v16 + 14) = v22;
    *uint64_t v17 = v22;

    _os_log_impl(&dword_21283E000, v10, v11, "Error loading URL for type identifier %s: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    MEMORY[0x216684270](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v61, v60);
  }
  else
  {
    uint64_t v23 = *(void *)(v0 + 152);
    uint64_t v24 = *(void *)(v0 + 128);
    long long v25 = *(void *)(v0 + 136);

    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  }
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v27 = *(void *)(v0 + 192);
  uint64_t v28 = *(void *)(v0 + 200);
  outlined init with copy of UTType?(*(void *)(v0 + 264), v26, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) != 1)
  {
    uint64_t v39 = *(void *)(v0 + 312);
    uint64_t v40 = *(void *)(v0 + 264);
    uint64_t v41 = *(void *)(v0 + 248);
    uint64_t v42 = *(void *)(v0 + 232);
    unint64_t v43 = *(void *)(v0 + 192);
    uint64_t v44 = *(void *)(v0 + 200);
    uint64_t v45 = *(void *)(v0 + 96);
    uint64_t v46 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v42, v41, v43);
    copyFile(from:to:)(v45, v46);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
    outlined destroy of UTType?(v40, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(v39, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(v0 + 312);
  uint64_t v30 = *(void *)(v0 + 248);
  outlined destroy of UTType?(*(void *)(v0 + 264), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v29, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of UTType?(v30, &demangling cache variable for type metadata for URL?);
  uint64_t v31 = *(void *)(v0 + 352) + 1;
  if (v31 == *(void *)(v0 + 328))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v37 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
LABEL_12:
    return v38();
  }
  uint64_t v32 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v31;
    uint64_t v33 = *(void *)(v0 + 336);
    uint64_t v34 = *(void *)(v0 + 312);
    unint64_t v35 = *(void *)(v0 + 272);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v31, v34, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v36 = *(void *)(v34 + *(int *)(v35 + 28));
    if (v36 == v33) {
      break;
    }
    if (v36 == v32)
    {
      long long v57 = swift_task_alloc();
      *(void *)(v0 + 392) = v57;
      *(void *)long long v57 = v0;
      *(void *)(v57 + 8) = Transferable._file(contentType:destinationDirectory:);
      uint64_t v58 = *(void *)(v0 + 312);
      uint64_t v59 = *(_OWORD *)(v0 + 104);
      *(void *)(v57 + 136) = *(void *)(v0 + 120);
      *(_OWORD *)(v57 + 120) = v59;
      *(void *)(v57 + 112) = v58;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 312), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v31 = *(void *)(v0 + 352) + 1;
    if (v31 == *(void *)(v0 + 328)) {
      goto LABEL_10;
    }
  }
  uint64_t v48 = *(void *)(v0 + 264);
  uint64_t v49 = *(void *)(v0 + 192);
  unint64_t v50 = *(void *)(v0 + 200);
  unint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56);
  *(void *)(v0 + 360) = v51;
  *(void *)(v0 + 368) = (v50 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v51(v48, 1, 1, v49);
  uint64_t v52 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v52;
  *uint64_t v52 = v0;
  v52[1] = Transferable._file(contentType:destinationDirectory:);
  uint64_t v53 = *(void *)(v0 + 312);
  uint64_t v54 = *(void *)(v0 + 256);
  long long v55 = *(void *)(v0 + 112);
  uint64_t v56 = *(void *)(v0 + 104);
  return Transferable.url(from:)(v54, v53, v56, v55);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned char *v33;
  uint64_t (*v34)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  long long v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  uint64_t v52 = v0;
  uint64_t v1 = *(void **)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v7 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v8 = v1;
  uint64_t v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.fault.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 416);
  uint64_t v14 = *(void *)(v0 + 312);
  uint64_t v15 = *(void *)(v0 + 288);
  uint64_t v16 = *(void *)(v0 + 136);
  if (v12)
  {
    uint64_t v49 = *(void *)(v0 + 128);
    unint64_t v50 = *(void *)(v0 + 144);
    uint64_t v48 = *(void *)(v0 + 312);
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    unint64_t v51 = v19;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v20 = UTType.identifier.getter();
    *(void *)(v17 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v51);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v22 = v13;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v17 + 14) = v23;
    *uint64_t v18 = v23;

    _os_log_impl(&dword_21283E000, v10, v11, "Error loading data for type identifier %s: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v19, -1, -1);
    MEMORY[0x216684270](v17, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v50, v49);
    uint64_t v24 = v48;
  }
  else
  {
    long long v25 = *(void *)(v0 + 144);
    uint64_t v26 = *(void *)(v0 + 128);

    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v25, v26);
    uint64_t v24 = v14;
  }
  outlined destroy of ResolvedTransferRepresentation(v24, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v27 = *(void *)(v0 + 352) + 1;
  if (v27 == *(void *)(v0 + 328))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v33 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
    return v34();
  }
  else
  {
    uint64_t v28 = MEMORY[0x263F06F78];
    while (1)
    {
      *(void *)(v0 + 352) = v27;
      uint64_t v29 = *(void *)(v0 + 336);
      uint64_t v30 = *(void *)(v0 + 312);
      uint64_t v31 = *(void *)(v0 + 272);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v27, v30, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v32 = *(void *)(v30 + *(int *)(v31 + 28));
      if (v32 == v29) {
        break;
      }
      if (v32 == v28)
      {
        uint64_t v45 = swift_task_alloc();
        *(void *)(v0 + 392) = v45;
        *(void *)uint64_t v45 = v0;
        *(void *)(v45 + 8) = Transferable._file(contentType:destinationDirectory:);
        uint64_t v46 = *(void *)(v0 + 312);
        uint64_t v47 = *(_OWORD *)(v0 + 104);
        *(void *)(v45 + 136) = *(void *)(v0 + 120);
        *(_OWORD *)(v45 + 120) = v47;
        *(void *)(v45 + 112) = v46;
        return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
      }
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 312), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v27 = *(void *)(v0 + 352) + 1;
      if (v27 == *(void *)(v0 + 328)) {
        goto LABEL_9;
      }
    }
    uint64_t v36 = *(void *)(v0 + 264);
    uint64_t v37 = *(void *)(v0 + 192);
    uint64_t v38 = *(void *)(v0 + 200);
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    *(void *)(v0 + 360) = v39;
    *(void *)(v0 + 368) = (v38 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v39(v36, 1, 1, v37);
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v40;
    *uint64_t v40 = v0;
    v40[1] = Transferable._file(contentType:destinationDirectory:);
    uint64_t v41 = *(void *)(v0 + 312);
    uint64_t v42 = *(void *)(v0 + 256);
    unint64_t v43 = *(void *)(v0 + 112);
    uint64_t v44 = *(void *)(v0 + 104);
    return Transferable.url(from:)(v42, v41, v44, v43);
  }
}

uint64_t Transferable._file(contentType:destinationDirectory:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[50] = a1;
  v4[51] = a2;
  v4[52] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = Transferable._file(contentType:destinationDirectory:);
  }
  else {
    uint64_t v5 = Transferable._file(contentType:destinationDirectory:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t Transferable.withExportedFile<A>(contentType:fileHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[10] = a7;
  v8[11] = v7;
  v8[8] = a4;
  v8[9] = a5;
  v8[6] = a2;
  v8[7] = a3;
  v8[5] = a1;
  uint64_t v9 = type metadata accessor for Logger();
  v8[12] = v9;
  v8[13] = *(void *)(v9 - 8);
  v8[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v8[15] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URL();
  v8[16] = v10;
  v8[17] = *(void *)(v10 - 8);
  v8[18] = swift_task_alloc();
  v8[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.withExportedFile<A>(contentType:fileHandler:), 0, 0);
}

uint64_t Transferable.withExportedFile<A>(contentType:fileHandler:)()
{
  uint64_t v1 = v0;
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[17] + 56))(v0[15], 1, 1, v0[16]);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[20] = v2;
  void *v2 = v1;
  v2[1] = Transferable.withExportedFile<A>(contentType:fileHandler:);
  uint64_t v3 = v1[19];
  uint64_t v4 = v1[15];
  uint64_t v5 = v1[10];
  uint64_t v6 = v1[9];
  uint64_t v7 = v1[6];
  return Transferable._file(contentType:destinationDirectory:)(v3, v7, v4, v6, v5);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;

  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  v2[21] = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[15];
  if (v0)
  {
    outlined destroy of UTType?(v4, &demangling cache variable for type metadata for URL?);
    return MEMORY[0x270FA2498](Transferable.withExportedFile<A>(contentType:fileHandler:), 0, 0);
  }
  else
  {
    uint64_t v5 = (int *)v2[7];
    outlined destroy of UTType?(v4, &demangling cache variable for type metadata for URL?);
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    v2[22] = v6;
    *uint64_t v6 = v3;
    v6[1] = Transferable.withExportedFile<A>(contentType:fileHandler:);
    uint64_t v7 = v2[19];
    uint64_t v8 = v2[5];
    return v10(v8, v7);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable.withExportedFile<A>(contentType:fileHandler:);
  }
  else {
    uint64_t v2 = Transferable.withExportedFile<A>(contentType:fileHandler:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  id v1;
  NSURL *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  id v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t (*v36)(void);
  void *v38;
  os_log_type_t type;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[2];
  void *v45;
  uint64_t v46;

  uint64_t v45 = v0;
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v2);
  uint64_t v4 = v3;
  v0[2] = 0;
  uint64_t v5 = objc_msgSend(v1, sel_removeItemAtURL_error_, v3, v0 + 2);

  uint64_t v6 = (void *)v0[2];
  uint64_t v7 = v0[19];
  if (v5)
  {
    uint64_t v8 = v0[16];
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0[17] + 8);
    uint64_t v10 = v6;
    v9(v7, v8);
  }
  else
  {
    uint64_t v11 = v0[17];
    uint64_t v42 = v0[18];
    uint64_t v12 = v0[16];
    uint64_t v13 = v0[13];
    uint64_t v14 = v0[14];
    uint64_t v15 = v0[12];
    uint64_t v16 = v6;
    uint64_t v17 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v18 = logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v14, v18, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v42, v7, v12);
    uint64_t v19 = v17;
    uint64_t v20 = v17;
    uint64_t v21 = Logger.logObject.getter();
    uint64_t v22 = static os_log_type_t.error.getter();
    uint64_t v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[18];
    long long v25 = v0[19];
    uint64_t v27 = v0[16];
    uint64_t v26 = v0[17];
    uint64_t v28 = v0[13];
    uint64_t v41 = v0[12];
    unint64_t v43 = v0[14];
    if (v23)
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v38 = (void *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v44[0] = v40;
      *(_DWORD *)uint64_t v29 = 136315394;
      type = v22;
      uint64_t v30 = URL.path.getter();
      v0[3] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v32(v24, v27);
      *(_WORD *)(v29 + 12) = 2112;
      uint64_t v33 = v17;
      uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
      v0[4] = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v38 = v34;

      _os_log_impl(&dword_21283E000, v21, type, "Failed to remove temporary file: %s Error: %@", (uint8_t *)v29, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x216684270](v38, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x216684270](v40, -1, -1);
      MEMORY[0x216684270](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v43, v41);
      v32(v25, v27);
    }
    else
    {

      unint64_t v35 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v35(v24, v27);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v43, v41);
      v35(v25, v27);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = (uint64_t (*)(void))v0[1];
  return v36();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[17] + 8))(v0[19], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t (*Transferable.suggestedFilename.getter(uint64_t a1, uint64_t a2))(unsigned char *)
{
  uint64_t v5 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = static Transferable.resolvedRepresentations()(a1, a2);
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v28 = a2;
    uint64_t v29 = a1;
    uint64_t v17 = v2;
    uint64_t v18 = v15 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v19 = *(void *)(v6 + 72);
    while (1)
    {
      outlined init with copy of ResolvedTransferRepresentation(v18, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      if (v8[16] != 255) {
        break;
      }
      outlined destroy of ResolvedTransferRepresentation((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      v18 += v19;
      if (!--v16)
      {
        uint64_t v20 = 1;
        goto LABEL_8;
      }
    }
    outlined init with take of ResolvedTransferRepresentation((uint64_t)v8, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v20 = 0;
LABEL_8:
    uint64_t v2 = v17;
    a2 = v28;
    a1 = v29;
  }
  else
  {
    uint64_t v20 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, v20, 1, v5);
  swift_bridgeObjectRelease();
  outlined init with copy of UTType?((uint64_t)v14, (uint64_t)v12, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
  {
    outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
    uint64_t v21 = (uint64_t)v12;
LABEL_14:
    outlined destroy of UTType?(v21, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
    return 0;
  }
  uint64_t v22 = *(void *)v12;
  uint64_t v23 = *((void *)v12 + 1);
  int v24 = v12[16];
  outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage?(*(void *)v12, v23, v12[16]);
  outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  if (v24 == 255)
  {
    uint64_t v21 = (uint64_t)v14;
    goto LABEL_14;
  }
  v30[5] = v22;
  v30[6] = v23;
  char v31 = v24 & 1;
  v30[3] = a1;
  v30[4] = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(boxed_opaque_existential_1, v2, a1);
  uint64_t v26 = ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)((uint64_t)v30);
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v22, v23, v24);
  outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  outlined destroy of UTType?((uint64_t)v30, &demangling cache variable for type metadata for Transferable?);
  return v26;
}

uint64_t Transferable.init(importing:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v7[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.init(importing:contentType:), 0, 0);
}

uint64_t Transferable.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[26] = a5;
  v6[27] = a6;
  v6[24] = a3;
  v6[25] = a4;
  v6[22] = a1;
  v6[23] = a2;
  v6[28] = type metadata accessor for SentTransferredFile(0);
  v6[29] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  v6[30] = v7;
  v6[31] = *(void *)(v7 - 8);
  v6[32] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  v6[33] = v8;
  v6[34] = *(void *)(v8 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Optional();
  v6[37] = v9;
  v6[38] = *(void *)(v9 - 8);
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for ResolvedTransferRepresentation();
  v6[41] = v10;
  v6[42] = *(void *)(v10 - 8);
  v6[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.init(_:_:), 0, 0);
}

uint64_t Transferable.init(_:_:)()
{
  uint64_t v1 = static Transferable.resolvedRepresentations(for:)(*(void *)(v0 + 200), *(void *)(v0 + 208), *(void *)(v0 + 216));
  *(void *)(v0 + 352) = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 360) = v2;
  if (!v2)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    unint64_t v14 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 200);
    uint64_t v16 = *(void *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v17 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v16, v14);
    outlined destroy of UTType?(v15, &demangling cache variable for type metadata for UTType?);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(v0 + 336);
  *(_DWORD *)(v0 + 448) = *(_DWORD *)(v4 + 80);
  *(void *)(v0 + 368) = *(void *)(v4 + 72);
  uint64_t v5 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 376) = v3;
    uint64_t v6 = *(void *)(v0 + 344);
    uint64_t v7 = *(void *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ *(void *)(v0 + 368) * v3, v6, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v8 = (int **)(v6 + *(int *)(v7 + 36));
    uint64_t v9 = *v8;
    *(void *)(v0 + 384) = *v8;
    *(void *)(v0 + 392) = v8[1];
    uint64_t v10 = *(void *)(v0 + 344);
    if (v9) {
      break;
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
LABEL_4:
    uint64_t v3 = *(void *)(v0 + 376) + 1;
    if (v3 == *(void *)(v0 + 360)) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = *(int *)(*(void *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 452) = v11;
  uint64_t v12 = *(void *)(v10 + v11);
  if (v12 == v5)
  {
    uint64_t v21 = *(void *)(v0 + 184);
    unint64_t v20 = *(void *)(v0 + 192);
    *(void *)(v0 + 160) = v5;
    *(void *)(v0 + 168) = &protocol witness table for Data;
    *(void *)(v0 + 136) = v21;
    *(void *)(v0 + 144) = v20;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v9);
    outlined copy of Data._Representation(v21, v20);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t))((char *)v9 + *v9);
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v22;
    *uint64_t v22 = v0;
    v22[1] = Transferable.init(_:_:);
    uint64_t v23 = v0 + 96;
    uint64_t v24 = v0 + 136;
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)(v0 + 224);
  swift_retain();
  if (v12 != v13)
  {
    outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v9);
    goto LABEL_4;
  }
  uint64_t v25 = *(void *)(v0 + 280);
  uint64_t v26 = *(void *)(v0 + 272);
  uint64_t v28 = *(void *)(v0 + 248);
  uint64_t v27 = *(void *)(v0 + 256);
  uint64_t v29 = *(void *)(v0 + 240);
  uint64_t v38 = *(void *)(v0 + 264);
  uint64_t v30 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  char v31 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  *(void *)(v0 + 416) = v31;
  *(void *)(v0 + 424) = (v26 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v31(v25, v38);
  Data.write(to:options:)();
  uint64_t v32 = *(int **)(v0 + 384);
  uint64_t v33 = *(void *)(v0 + 280);
  uint64_t v35 = *(void *)(v0 + 224);
  uint64_t v34 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 272) + 16))(v33, *(void *)(v0 + 288), *(void *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v33, 1, v34);
  *(void *)(v0 + 80) = v35;
  *(void *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v34, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t))((char *)v32 + *v32);
  uint64_t v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v37;
  *uint64_t v37 = v0;
  v37[1] = Transferable.init(_:_:);
  uint64_t v23 = v0 + 16;
  uint64_t v24 = v0 + 56;
LABEL_14:
  return v39(v23, v24);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 408) = v0;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v3 = Transferable.init(_:_:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 136);
    uint64_t v3 = Transferable.init(_:_:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  void (*v25)(uint64_t, uint64_t);
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *boxed_opaque_existential_1;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(void);
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned char *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  uint64_t v52;

  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 208);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  uint64_t v3 = swift_dynamicCast();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v1, v3 ^ 1u, 1, v2);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  uint64_t v6 = *(void *)(v0 + 344);
  if (v5 == 1)
  {
    uint64_t v7 = *(void **)(v0 + 408);
    uint64_t v8 = *(int *)(v0 + 452);
    (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 320), *(void *)(v0 + 296));
    if (*(void *)(v6 + v8) != *(void *)(v0 + 224))
    {
      uint64_t v9 = *(int **)(v0 + 384);
      uint64_t v10 = *(void *)(v0 + 344);
      uint64_t v11 = MEMORY[0x263F06F78];
      while (2)
      {
        outlined destroy of ResolvedTransferRepresentation(v10, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v9);
        while (1)
        {
          uint64_t v12 = *(void *)(v0 + 376) + 1;
          if (v12 == *(void *)(v0 + 360))
          {
            swift_bridgeObjectRelease();
            uint64_t v42 = *(void *)(v0 + 192);
            unint64_t v43 = *(void *)(v0 + 200);
            uint64_t v44 = *(void *)(v0 + 184);
            lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
            swift_allocError();
            char *v45 = 0;
            swift_willThrow();
            outlined consume of Data._Representation(v44, v42);
            outlined destroy of UTType?(v43, &demangling cache variable for type metadata for UTType?);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
            goto LABEL_18;
          }
          *(void *)(v0 + 376) = v12;
          uint64_t v13 = *(void *)(v0 + 344);
          unint64_t v14 = *(void *)(v0 + 328);
          outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ *(void *)(v0 + 368) * v12, v13, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          uint64_t v15 = (int **)(v13 + *(int *)(v14 + 36));
          uint64_t v9 = *v15;
          *(void *)(v0 + 384) = *v15;
          *(void *)(v0 + 392) = v15[1];
          uint64_t v10 = *(void *)(v0 + 344);
          if (v9) {
            break;
          }
          outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        }
        uint64_t v16 = *(int *)(*(void *)(v0 + 328) + 28);
        *(_DWORD *)(v0 + 452) = v16;
        uint64_t v17 = *(void *)(v10 + v16);
        if (v17 == v11)
        {
          uint64_t v47 = *(void *)(v0 + 184);
          uint64_t v46 = *(void *)(v0 + 192);
          *(void *)(v0 + 160) = v11;
          *(void *)(v0 + 168) = &protocol witness table for Data;
          *(void *)(v0 + 136) = v47;
          *(void *)(v0 + 144) = v46;
          outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v9);
          outlined copy of Data._Representation(v47, v46);
          unint64_t v51 = (uint64_t (*)(uint64_t, uint64_t))((char *)v9 + *v9);
          uint64_t v48 = (void *)swift_task_alloc();
          *(void *)(v0 + 400) = v48;
          *uint64_t v48 = v0;
          v48[1] = Transferable.init(_:_:);
          uint64_t v32 = v0 + 96;
          uint64_t v33 = v0 + 136;
LABEL_13:
          return v51(v32, v33);
        }
        uint64_t v18 = *(void *)(v0 + 224);
        swift_retain();
        if (v17 != v18) {
          continue;
        }
        break;
      }
    }
    uint64_t v19 = *(void *)(v0 + 280);
    unint64_t v20 = *(void *)(v0 + 272);
    uint64_t v22 = *(void *)(v0 + 248);
    uint64_t v21 = *(void *)(v0 + 256);
    unint64_t v50 = v7;
    uint64_t v23 = *(void *)(v0 + 240);
    uint64_t v49 = *(void *)(v0 + 264);
    uint64_t v24 = NSTemporaryDirectory();
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    URL.init(fileURLWithPath:isDirectory:)();
    swift_bridgeObjectRelease();
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    URL.appendingPathComponent(_:isDirectory:)();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    *(void *)(v0 + 416) = v25;
    *(void *)(v0 + 424) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v25(v19, v49);
    Data.write(to:options:)();
    if (v50) {

    }
    uint64_t v26 = *(int **)(v0 + 384);
    uint64_t v27 = *(void *)(v0 + 280);
    uint64_t v29 = *(void *)(v0 + 224);
    uint64_t v28 = *(void *)(v0 + 232);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 272) + 16))(v27, *(void *)(v0 + 288), *(void *)(v0 + 264));
    SentTransferredFile.init(_:allowAccessingOriginalFile:)(v27, 1, v28);
    *(void *)(v0 + 80) = v29;
    *(void *)(v0 + 88) = &protocol witness table for SentTransferredFile;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    outlined init with copy of ResolvedTransferRepresentation(v28, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
    unint64_t v51 = (uint64_t (*)(uint64_t, uint64_t))((char *)v26 + *v26);
    char v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 432) = v31;
    *char v31 = v0;
    v31[1] = Transferable.init(_:_:);
    uint64_t v32 = v0 + 16;
    uint64_t v33 = v0 + 56;
    goto LABEL_13;
  }
  uint64_t v36 = *(void *)(v0 + 192);
  uint64_t v35 = *(void *)(v0 + 200);
  uint64_t v37 = *(void *)(v0 + 184);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 384));
  outlined consume of Data._Representation(v37, v36);
  outlined destroy of UTType?(v35, &demangling cache variable for type metadata for UTType?);
  outlined destroy of ResolvedTransferRepresentation(v6, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v38 = *(void *)(v0 + 320);
  uint64_t v39 = *(void *)(v0 + 208);
  uint64_t v40 = *(void *)(v0 + 176);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v40, v38, v39);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
  return v41();
}

{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v3 = Transferable.init(_:_:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = Transferable.init(_:_:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int **v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  void (*v41)(uint64_t, uint64_t);
  int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *boxed_opaque_existential_1;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  uint64_t v51;

  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 208);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 384));
  outlined destroy of ResolvedTransferRepresentation(v6, type metadata accessor for SentTransferredFile);
  v1(v4, v5);
  outlined destroy of ResolvedTransferRepresentation(v2, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  uint64_t v8 = swift_dynamicCast();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v3, v8 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v3, 1, v7) != 1)
  {
    uint64_t v17 = *(void *)(v0 + 200);
    outlined consume of Data._Representation(*(void *)(v0 + 184), *(void *)(v0 + 192));
    outlined destroy of UTType?(v17, &demangling cache variable for type metadata for UTType?);
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v19 = *(void *)(v0 + 208);
    unint64_t v20 = *(void *)(v0 + 176);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v20, v18, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  uint64_t v10 = *(void **)(v0 + 440);
  (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 312), *(void *)(v0 + 296));
  uint64_t v11 = *(void *)(v0 + 376) + 1;
  if (v11 == *(void *)(v0 + 360))
  {
LABEL_3:
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v13 = *(void *)(v0 + 200);
    unint64_t v14 = *(void *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v15 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v14, v12);
    outlined destroy of UTType?(v13, &demangling cache variable for type metadata for UTType?);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v16();
  }
  uint64_t v22 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 376) = v11;
    uint64_t v23 = *(void *)(v0 + 344);
    uint64_t v24 = *(void *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ *(void *)(v0 + 368) * v11, v23, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v25 = (int **)(v23 + *(int *)(v24 + 36));
    uint64_t v26 = *v25;
    *(void *)(v0 + 384) = *v25;
    *(void *)(v0 + 392) = v25[1];
    uint64_t v27 = *(void *)(v0 + 344);
    if (v26) {
      break;
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
LABEL_10:
    uint64_t v11 = *(void *)(v0 + 376) + 1;
    if (v11 == *(void *)(v0 + 360)) {
      goto LABEL_3;
    }
  }
  uint64_t v28 = *(int *)(*(void *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 452) = v28;
  uint64_t v29 = *(void *)(v27 + v28);
  if (v29 == v22)
  {
    uint64_t v32 = *(void *)(v0 + 184);
    char v31 = *(void *)(v0 + 192);
    *(void *)(v0 + 160) = v22;
    *(void *)(v0 + 168) = &protocol witness table for Data;
    *(void *)(v0 + 136) = v32;
    *(void *)(v0 + 144) = v31;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v26);
    outlined copy of Data._Representation(v32, v31);
    unint64_t v50 = (uint64_t (*)(uint64_t, uint64_t))((char *)v26 + *v26);
    uint64_t v33 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v33;
    *uint64_t v33 = v0;
    v33[1] = Transferable.init(_:_:);
    uint64_t v34 = v0 + 96;
    uint64_t v35 = v0 + 136;
    goto LABEL_19;
  }
  uint64_t v30 = *(void *)(v0 + 224);
  swift_retain();
  if (v29 != v30)
  {
    outlined destroy of ResolvedTransferRepresentation(v27, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v26);
    goto LABEL_10;
  }
  uint64_t v36 = *(void *)(v0 + 280);
  uint64_t v37 = *(void *)(v0 + 272);
  uint64_t v49 = *(void *)(v0 + 264);
  uint64_t v39 = *(void *)(v0 + 248);
  uint64_t v38 = *(void *)(v0 + 256);
  uint64_t v48 = *(void *)(v0 + 240);
  uint64_t v40 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v48);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  *(void *)(v0 + 416) = v41;
  *(void *)(v0 + 424) = (v37 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v41(v36, v49);
  Data.write(to:options:)();
  if (v10) {

  }
  uint64_t v42 = *(int **)(v0 + 384);
  unint64_t v43 = *(void *)(v0 + 280);
  uint64_t v45 = *(void *)(v0 + 224);
  uint64_t v44 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 272) + 16))(v43, *(void *)(v0 + 288), *(void *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v43, 1, v44);
  *(void *)(v0 + 80) = v45;
  *(void *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v44, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  unint64_t v50 = (uint64_t (*)(uint64_t, uint64_t))((char *)v42 + *v42);
  uint64_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v47;
  *uint64_t v47 = v0;
  v47[1] = Transferable.init(_:_:);
  uint64_t v34 = v0 + 16;
  uint64_t v35 = v0 + 56;
LABEL_19:
  return v50(v34, v35);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  void (*v21)(uint64_t, uint64_t);
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *boxed_opaque_existential_1;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned char *v34;
  uint64_t (*v35)(void);
  unint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t v41;

  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 208);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = *(int *)(v0 + 452);
  uint64_t v4 = *(void *)(v0 + 344);
  (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  if (*(void *)(v4 + v3) != *(void *)(v0 + 224))
  {
    uint64_t v5 = *(int **)(v0 + 384);
    uint64_t v6 = *(void *)(v0 + 344);
    uint64_t v7 = MEMORY[0x263F06F78];
    while (2)
    {
      outlined destroy of ResolvedTransferRepresentation(v6, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v5);
      while (1)
      {
        uint64_t v8 = *(void *)(v0 + 376) + 1;
        if (v8 == *(void *)(v0 + 360))
        {
          swift_bridgeObjectRelease();
          char v31 = *(void *)(v0 + 192);
          uint64_t v32 = *(void *)(v0 + 200);
          uint64_t v33 = *(void *)(v0 + 184);
          lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
          swift_allocError();
          *uint64_t v34 = 0;
          swift_willThrow();
          outlined consume of Data._Representation(v33, v31);
          outlined destroy of UTType?(v32, &demangling cache variable for type metadata for UTType?);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
          return v35();
        }
        *(void *)(v0 + 376) = v8;
        uint64_t v9 = *(void *)(v0 + 344);
        uint64_t v10 = *(void *)(v0 + 328);
        outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ *(void *)(v0 + 368) * v8, v9, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v11 = (int **)(v9 + *(int *)(v10 + 36));
        uint64_t v5 = *v11;
        *(void *)(v0 + 384) = *v11;
        *(void *)(v0 + 392) = v11[1];
        uint64_t v6 = *(void *)(v0 + 344);
        if (v5) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v12 = *(int *)(*(void *)(v0 + 328) + 28);
      *(_DWORD *)(v0 + 452) = v12;
      uint64_t v13 = *(void *)(v6 + v12);
      if (v13 == v7)
      {
        uint64_t v37 = *(void *)(v0 + 184);
        uint64_t v36 = *(void *)(v0 + 192);
        *(void *)(v0 + 160) = v7;
        *(void *)(v0 + 168) = &protocol witness table for Data;
        *(void *)(v0 + 136) = v37;
        *(void *)(v0 + 144) = v36;
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v5);
        outlined copy of Data._Representation(v37, v36);
        uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
        uint64_t v38 = (void *)swift_task_alloc();
        *(void *)(v0 + 400) = v38;
        *uint64_t v38 = v0;
        v38[1] = Transferable.init(_:_:);
        uint64_t v28 = v0 + 96;
        uint64_t v29 = v0 + 136;
        goto LABEL_10;
      }
      unint64_t v14 = *(void *)(v0 + 224);
      swift_retain();
      if (v13 != v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v16 = *(void *)(v0 + 272);
  uint64_t v18 = *(void *)(v0 + 248);
  uint64_t v17 = *(void *)(v0 + 256);
  uint64_t v19 = *(void *)(v0 + 240);
  uint64_t v39 = *(void *)(v0 + 264);
  unint64_t v20 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  *(void *)(v0 + 416) = v21;
  *(void *)(v0 + 424) = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v15, v39);
  Data.write(to:options:)();
  uint64_t v22 = *(int **)(v0 + 384);
  uint64_t v23 = *(void *)(v0 + 280);
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v24 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 272) + 16))(v23, *(void *)(v0 + 288), *(void *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v23, 1, v24);
  *(void *)(v0 + 80) = v25;
  *(void *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v24, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t))((char *)v22 + *v22);
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v27;
  *uint64_t v27 = v0;
  v27[1] = Transferable.init(_:_:);
  uint64_t v28 = v0 + 16;
  uint64_t v29 = v0 + 56;
LABEL_10:
  return v40(v28, v29);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned char *v12;
  uint64_t (*v13)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int **v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  void (*v35)(uint64_t, uint64_t);
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *boxed_opaque_existential_1;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;

  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 208);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 384));
  outlined destroy of ResolvedTransferRepresentation(v6, type metadata accessor for SentTransferredFile);
  v1(v4, v5);
  outlined destroy of ResolvedTransferRepresentation(v2, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  (*(void (**)(void, void))(*(void *)(v0 + 304) + 8))(*(void *)(v0 + 312), *(void *)(v0 + 296));
  uint64_t v8 = *(void *)(v0 + 376) + 1;
  if (v8 == *(void *)(v0 + 360))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 184);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v12 = 0;
    swift_willThrow();
    outlined consume of Data._Representation(v11, v9);
    outlined destroy of UTType?(v10, &demangling cache variable for type metadata for UTType?);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  uint64_t v15 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 376) = v8;
    uint64_t v16 = *(void *)(v0 + 344);
    uint64_t v17 = *(void *)(v0 + 328);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 352)+ ((*(unsigned __int8 *)(v0 + 448) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 448))+ *(void *)(v0 + 368) * v8, v16, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v18 = (int **)(v16 + *(int *)(v17 + 36));
    uint64_t v19 = *v18;
    *(void *)(v0 + 384) = *v18;
    *(void *)(v0 + 392) = v18[1];
    unint64_t v20 = *(void *)(v0 + 344);
    if (v19) {
      break;
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
LABEL_7:
    uint64_t v8 = *(void *)(v0 + 376) + 1;
    if (v8 == *(void *)(v0 + 360)) {
      goto LABEL_2;
    }
  }
  uint64_t v21 = *(int *)(*(void *)(v0 + 328) + 28);
  *(_DWORD *)(v0 + 452) = v21;
  uint64_t v22 = *(void *)(v20 + v21);
  if (v22 == v15)
  {
    uint64_t v25 = *(void *)(v0 + 184);
    uint64_t v24 = *(void *)(v0 + 192);
    *(void *)(v0 + 160) = v15;
    *(void *)(v0 + 168) = &protocol witness table for Data;
    *(void *)(v0 + 136) = v25;
    *(void *)(v0 + 144) = v24;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v19);
    outlined copy of Data._Representation(v25, v24);
    uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)v19 + *v19);
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v26;
    *uint64_t v26 = v0;
    v26[1] = Transferable.init(_:_:);
    uint64_t v27 = v0 + 96;
    uint64_t v28 = v0 + 136;
    uint64_t v29 = v45;
    goto LABEL_14;
  }
  uint64_t v23 = *(void *)(v0 + 224);
  swift_retain();
  if (v22 != v23)
  {
    outlined destroy of ResolvedTransferRepresentation(v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v19);
    goto LABEL_7;
  }
  uint64_t v30 = *(void *)(v0 + 280);
  char v31 = *(void *)(v0 + 272);
  uint64_t v33 = *(void *)(v0 + 248);
  uint64_t v32 = *(void *)(v0 + 256);
  uint64_t v42 = *(void *)(v0 + 240);
  unint64_t v43 = *(void *)(v0 + 264);
  uint64_t v34 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v42);
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  *(void *)(v0 + 416) = v35;
  *(void *)(v0 + 424) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v35(v30, v43);
  Data.write(to:options:)();
  uint64_t v36 = *(int **)(v0 + 384);
  uint64_t v37 = *(void *)(v0 + 280);
  uint64_t v39 = *(void *)(v0 + 224);
  uint64_t v38 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 272) + 16))(v37, *(void *)(v0 + 288), *(void *)(v0 + 264));
  SentTransferredFile.init(_:allowAccessingOriginalFile:)(v37, 1, v38);
  *(void *)(v0 + 80) = v39;
  *(void *)(v0 + 88) = &protocol witness table for SentTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  outlined init with copy of ResolvedTransferRepresentation(v38, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SentTransferredFile);
  uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t))((char *)v36 + *v36);
  uint64_t v41 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v41;
  *uint64_t v41 = v0;
  v41[1] = Transferable.init(_:_:);
  uint64_t v29 = v44;
  uint64_t v27 = v0 + 16;
  uint64_t v28 = v0 + 56;
LABEL_14:
  return v29(v27, v28);
}

uint64_t Transferable.exported(as:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = type metadata accessor for UTType();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ResolvedTransferRepresentation();
  v4[9] = v6;
  v4[10] = *(void *)(v6 - 8);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  v4[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.exported(as:), 0, 0);
}

uint64_t Transferable.exported(as:)()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  outlined init with copy of UTType?(v0[2], v1, &demangling cache variable for type metadata for UTType?);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v4(v1, 1, v2) == 1)
  {
    uint64_t v5 = static Transferable.resolvedRepresentations()(v0[3], v0[4]);
    uint64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      uint64_t v8 = v0[9];
      uint64_t v7 = v0[10];
      uint64_t v9 = v5 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      uint64_t v10 = *(void *)(v7 + 72);
      while (1)
      {
        uint64_t v11 = v0[11];
        outlined init with copy of ResolvedTransferRepresentation(v9, v11, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        if (*(void *)(v11 + *(int *)(v8 + 32))) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(v0[11], (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        v9 += v10;
        if (!--v6) {
          goto LABEL_6;
        }
      }
      outlined init with take of ResolvedTransferRepresentation(v0[11], v0[12], (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v12 = 0;
    }
    else
    {
LABEL_6:
      uint64_t v12 = 1;
    }
    uint64_t v16 = v0[12];
    uint64_t v17 = v0[9];
    uint64_t v18 = v0[10];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, v12, 1, v17);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    {
      outlined destroy of UTType?(v0[12], &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v20 = v0[12];
      (*(void (**)(void, uint64_t, void))(v0[7] + 16))(v0[15], v20 + *(int *)(v0[9] + 20), v0[6]);
      outlined destroy of ResolvedTransferRepresentation(v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v19 = 0;
    }
    uint64_t v21 = v0[14];
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[7] + 56))(v0[15], v19, 1, v0[6]);
    outlined destroy of UTType?(v21, &demangling cache variable for type metadata for UTType?);
  }
  else
  {
    uint64_t v13 = v0[15];
    uint64_t v14 = v0[6];
    uint64_t v15 = v0[7];
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 32))(v13, v0[14], v14);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  }
  uint64_t v22 = v0[13];
  uint64_t v23 = v0[6];
  outlined init with copy of UTType?(v0[15], v22, &demangling cache variable for type metadata for UTType?);
  if (v4(v22, 1, v23) == 1)
  {
    outlined destroy of UTType?(v0[13], &demangling cache variable for type metadata for UTType?);
    lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
    swift_allocError();
    *uint64_t v24 = 1;
    swift_willThrow();
    outlined destroy of UTType?(v0[15], &demangling cache variable for type metadata for UTType?);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[7] + 32))(v0[8], v0[13], v0[6]);
    uint64_t v27 = (void *)swift_task_alloc();
    v0[16] = v27;
    *uint64_t v27 = v0;
    v27[1] = Transferable.exported(as:);
    uint64_t v28 = v0[8];
    uint64_t v29 = v0[4];
    uint64_t v30 = v0[3];
    return Transferable.data(contentType:)(v28, v30, v29);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t v1 = v0[15];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  return v2(v3, v4);
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  outlined destroy of UTType?(v0[15], &demangling cache variable for type metadata for UTType?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t Transferable.exported(as:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 136) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = Transferable.exported(as:);
  }
  else
  {
    *(void *)(v6 + 144) = a2;
    *(void *)(v6 + 152) = a1;
    uint64_t v7 = Transferable.exported(as:);
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t Transferable.data(contentType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = Transferable.data(contentType:);
  return Transferable._data(contentType:)(a1, a2, a3);
}

uint64_t Transferable.data(contentType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t Transferable.file(contentType:fileHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = Transferable.file(contentType:fileHandler:);
  return Transferable._file(contentType:fileHandler:)(a1, a2, a3, a4, a5);
}

uint64_t Transferable.file(contentType:fileHandler:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t Transferable._file(contentType:fileHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[15] = a5;
  v6[16] = v5;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  uint64_t v7 = type metadata accessor for Logger();
  v6[17] = v7;
  v6[18] = *(void *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for UUID();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v6[25] = v9;
  v6[26] = *(void *)(v9 - 8);
  v6[27] = swift_task_alloc();
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for ResolvedTransferRepresentation();
  v6[33] = v10;
  v6[34] = *(void *)(v10 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v6[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable._file(contentType:fileHandler:), 0, 0);
}

uint64_t Transferable._file(contentType:fileHandler:)()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v4, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  uint64_t v7 = static Transferable.resolvedRepresentations(for:)(v1, v3, v2);
  *(void *)(v0 + 320) = v7;
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  uint64_t v8 = *(void *)(v7 + 16);
  *(void *)(v0 + 328) = v8;
  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v10 = type metadata accessor for SentTransferredFile(0);
    uint64_t v11 = 0;
    *(void *)(v0 + 336) = v10;
    *(_DWORD *)(v0 + 76) = *(_DWORD *)(v9 + 80);
    *(void *)(v0 + 344) = *(void *)(v9 + 72);
    uint64_t v12 = MEMORY[0x263F06F78];
    while (1)
    {
      *(void *)(v0 + 352) = v11;
      uint64_t v13 = *(void *)(v0 + 336);
      uint64_t v14 = *(void *)(v0 + 304);
      uint64_t v15 = *(void *)(v0 + 264);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v11, v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v16 = *(void *)(v14 + *(int *)(v15 + 28));
      if (v16 == v13) {
        break;
      }
      if (v16 == v12)
      {
        uint64_t v29 = swift_task_alloc();
        *(void *)(v0 + 392) = v29;
        *(void *)uint64_t v29 = v0;
        *(void *)(v29 + 8) = Transferable._file(contentType:fileHandler:);
        uint64_t v30 = *(void *)(v0 + 304);
        long long v31 = *(_OWORD *)(v0 + 112);
        *(void *)(v29 + 136) = *(void *)(v0 + 128);
        *(_OWORD *)(v29 + 120) = v31;
        *(void *)(v29 + 112) = v30;
        return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
      }
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v11 = *(void *)(v0 + 352) + 1;
      if (v11 == *(void *)(v0 + 328)) {
        goto LABEL_6;
      }
    }
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v22 = *(void *)(v0 + 208);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
    *(void *)(v0 + 360) = v23;
    *(void *)(v0 + 368) = (v22 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v23(v20, 1, 1, v21);
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v24;
    *uint64_t v24 = v0;
    v24[1] = Transferable._file(contentType:fileHandler:);
    uint64_t v25 = *(void *)(v0 + 304);
    uint64_t v26 = *(void *)(v0 + 248);
    uint64_t v27 = *(void *)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 112);
    return Transferable.url(from:)(v26, v25, v28, v27);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v17 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable._file(contentType:fileHandler:);
  }
  else {
    uint64_t v2 = Transferable._file(contentType:fileHandler:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void (*v1)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned char *v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  long long v36;
  uint64_t v37;

  uint64_t v1 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 200);
  outlined destroy of UTType?(v3, &demangling cache variable for type metadata for URL?);
  v1(v2, 0, 1, v4);
  outlined init with take of URL?(v2, v3, &demangling cache variable for type metadata for URL?);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 208);
  outlined init with copy of UTType?(*(void *)(v0 + 256), v5, &demangling cache variable for type metadata for URL?);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  uint64_t v9 = *(void *)(v0 + 256);
  uint64_t v10 = *(void *)(v0 + 240);
  if (v8 != 1)
  {
    uint64_t v20 = *(void *)(v0 + 232);
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v22 = *(void *)(v0 + 208);
    uint64_t v23 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v20, v10, v21);
    v23(v20);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    outlined destroy of UTType?(v9, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
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
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  uint64_t v11 = *(void *)(v0 + 304);
  outlined destroy of UTType?(*(void *)(v0 + 256), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v11, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of UTType?(v10, &demangling cache variable for type metadata for URL?);
  uint64_t v12 = *(void *)(v0 + 352) + 1;
  if (v12 == *(void *)(v0 + 328))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v18 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
    return v19();
  }
  uint64_t v13 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v12;
    uint64_t v14 = *(void *)(v0 + 336);
    uint64_t v15 = *(void *)(v0 + 304);
    uint64_t v16 = *(void *)(v0 + 264);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v12, v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v17 = *(void *)(v15 + *(int *)(v16 + 28));
    if (v17 == v14) {
      break;
    }
    if (v17 == v13)
    {
      uint64_t v34 = swift_task_alloc();
      *(void *)(v0 + 392) = v34;
      *(void *)uint64_t v34 = v0;
      *(void *)(v34 + 8) = Transferable._file(contentType:fileHandler:);
      uint64_t v35 = *(void *)(v0 + 304);
      uint64_t v36 = *(_OWORD *)(v0 + 112);
      *(void *)(v34 + 136) = *(void *)(v0 + 128);
      *(_OWORD *)(v34 + 120) = v36;
      *(void *)(v34 + 112) = v35;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v12 = *(void *)(v0 + 352) + 1;
    if (v12 == *(void *)(v0 + 328)) {
      goto LABEL_7;
    }
  }
  uint64_t v25 = *(void *)(v0 + 256);
  uint64_t v26 = *(void *)(v0 + 200);
  uint64_t v27 = *(void *)(v0 + 208);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
  *(void *)(v0 + 360) = v28;
  *(void *)(v0 + 368) = (v27 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v28(v25, 1, 1, v26);
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v29;
  *uint64_t v29 = v0;
  v29[1] = Transferable._file(contentType:fileHandler:);
  uint64_t v30 = *(void *)(v0 + 304);
  long long v31 = *(void *)(v0 + 248);
  uint64_t v32 = *(void *)(v0 + 120);
  uint64_t v33 = *(void *)(v0 + 112);
  return Transferable.url(from:)(v31, v30, v33, v32);
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  id v47;
  NSURL *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned char *v65;
  uint64_t (*v66)(void);
  id v67;
  void *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  long long v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88[2];
  uint64_t v89;
  uint64_t v90;

  v89 = v0;
  v88[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 == 255)
  {
    outlined copy of Data._Representation(*(void *)(v0 + 400), *(void *)(v0 + 408));
  }
  else
  {
    *(_OWORD *)(v0 + 56) = *(_OWORD *)v1;
    uint64_t v4 = *(void *)(v0 + 400);
    uint64_t v3 = *(void *)(v0 + 408);
    uint64_t v5 = *(void *)(v0 + 128);
    *(unsigned char *)(v0 + 72) = v2 & 1;
    uint64_t v6 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 40) = v6;
    uint64_t v7 = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, v5, v7);
    outlined copy of Data._Representation(v4, v3);
    ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(v0 + 16);
    uint64_t v10 = v9;
    outlined destroy of UTType?(v0 + 16, &demangling cache variable for type metadata for Transferable?);
    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = *(void *)(v0 + 184);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 176);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_bridgeObjectRelease();
LABEL_5:
  v86 = *(void **)(v0 + 416);
  uint64_t v14 = *(void *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 200);
  uint64_t v15 = *(void *)(v0 + 208);
  uint64_t v17 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v18(v14, v16);
  uint64_t v19 = v86;
  Data.write(to:options:)();
  if (!v86)
  {
    uint64_t v45 = *(void *)(v0 + 224);
    uint64_t v46 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    v46(v45);
    uint64_t v47 = objc_msgSend(self, sel_defaultManager);
    URL._bridgeToObjectiveC()(v48);
    unint64_t v50 = v49;
    *(void *)(v0 + 80) = 0;
    unint64_t v51 = objc_msgSend(v47, sel_removeItemAtURL_error_, v49, v0 + 80);

    uint64_t v52 = *(void **)(v0 + 80);
    uint64_t v53 = *(void *)(v0 + 400);
    uint64_t v54 = *(void *)(v0 + 408);
    if (v51)
    {
      long long v55 = v52;
      outlined consume of Data._Representation(v53, v54);
      outlined consume of Data._Representation(v53, v54);
    }
    else
    {
      v67 = v52;
      v68 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
      outlined consume of Data._Representation(v53, v54);
      outlined consume of Data._Representation(v53, v54);
    }
    v18(*(void *)(v0 + 224), *(void *)(v0 + 200));
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
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
    swift_task_dealloc();
    v66 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_19;
  }
  uint64_t v20 = *(void *)(v0 + 400);
  uint64_t v21 = *(void *)(v0 + 408);
  uint64_t v23 = *(void *)(v0 + 296);
  uint64_t v22 = *(void *)(v0 + 304);
  uint64_t v24 = v18;
  uint64_t v25 = *(void *)(v0 + 168);
  uint64_t v26 = *(void *)(v0 + 136);
  uint64_t v27 = *(void *)(v0 + 144);
  v24(*(void *)(v0 + 224), *(void *)(v0 + 200));
  outlined consume of Data._Representation(v20, v21);
  uint64_t v28 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v28, v26);
  outlined init with copy of ResolvedTransferRepresentation(v22, v23, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v29 = v86;
  uint64_t v30 = v86;
  long long v31 = Logger.logObject.getter();
  uint64_t v32 = static os_log_type_t.fault.getter();
  uint64_t v33 = os_log_type_enabled(v31, v32);
  uint64_t v34 = *(void *)(v0 + 400);
  uint64_t v35 = *(void *)(v0 + 296);
  uint64_t v36 = *(void *)(v0 + 304);
  if (v33)
  {
    v84 = *(void *)(v0 + 144);
    v85 = *(void *)(v0 + 136);
    v87 = *(void *)(v0 + 168);
    v82 = *(void *)(v0 + 408);
    uint64_t v37 = swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    v83 = v36;
    uint64_t v39 = swift_slowAlloc();
    v88[0] = v39;
    *(_DWORD *)uint64_t v37 = 136315394;
    uint64_t v40 = UTType.identifier.getter();
    *(void *)(v37 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, v88);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v35, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v37 + 12) = 2112;
    uint64_t v42 = v19;
    unint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v37 + 14) = v43;
    *uint64_t v38 = v43;

    _os_log_impl(&dword_21283E000, v31, v32, "Error writing data for type identifier %s: %@", (uint8_t *)v37, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v38, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v39, -1, -1);
    MEMORY[0x216684270](v37, -1, -1);
    outlined consume of Data._Representation(v34, v82);

    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v87, v85);
    uint64_t v44 = v83;
  }
  else
  {
    uint64_t v56 = *(void *)(v0 + 168);
    long long v57 = *(void *)(v0 + 136);
    uint64_t v58 = *(void *)(v0 + 144);
    outlined consume of Data._Representation(*(void *)(v0 + 400), *(void *)(v0 + 408));

    outlined destroy of ResolvedTransferRepresentation(v35, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v57);
    uint64_t v44 = v36;
  }
  outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v59 = *(void *)(v0 + 352) + 1;
  if (v59 == *(void *)(v0 + 328))
  {
LABEL_16:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v65 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    v66 = *(uint64_t (**)(void))(v0 + 8);
LABEL_19:
    return v66();
  }
  v60 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v59;
    uint64_t v61 = *(void *)(v0 + 336);
    uint64_t v62 = *(void *)(v0 + 304);
    uint64_t v63 = *(void *)(v0 + 264);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v59, v62, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    v64 = *(void *)(v62 + *(int *)(v63 + 28));
    if (v64 == v61) {
      break;
    }
    if (v64 == v60)
    {
      v79 = swift_task_alloc();
      *(void *)(v0 + 392) = v79;
      *(void *)v79 = v0;
      *(void *)(v79 + 8) = Transferable._file(contentType:fileHandler:);
      v80 = *(void *)(v0 + 304);
      v81 = *(_OWORD *)(v0 + 112);
      *(void *)(v79 + 136) = *(void *)(v0 + 128);
      *(_OWORD *)(v79 + 120) = v81;
      *(void *)(v79 + 112) = v80;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v59 = *(void *)(v0 + 352) + 1;
    if (v59 == *(void *)(v0 + 328)) {
      goto LABEL_16;
    }
  }
  v70 = *(void *)(v0 + 256);
  v71 = *(void *)(v0 + 200);
  v72 = *(void *)(v0 + 208);
  v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56);
  *(void *)(v0 + 360) = v73;
  *(void *)(v0 + 368) = (v72 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v73(v70, 1, 1, v71);
  v74 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v74;
  *v74 = v0;
  v74[1] = Transferable._file(contentType:fileHandler:);
  v75 = *(void *)(v0 + 304);
  v76 = *(void *)(v0 + 248);
  v77 = *(void *)(v0 + 120);
  v78 = *(void *)(v0 + 112);
  return Transferable.url(from:)(v76, v75, v78, v77);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned char *v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  long long v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[2];
  uint64_t v61;
  uint64_t v62;

  uint64_t v61 = v0;
  v60[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v7 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v8 = v1;
  uint64_t v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.fault.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 384);
  uint64_t v14 = *(void *)(v0 + 288);
  if (v12)
  {
    uint64_t v15 = *(void *)(v0 + 144);
    uint64_t v58 = *(void *)(v0 + 136);
    uint64_t v59 = *(void *)(v0 + 160);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v60[0] = v18;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v19 = UTType.identifier.getter();
    *(void *)(v16 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, v60);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v16 + 12) = 2112;
    uint64_t v21 = v13;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v16 + 14) = v22;
    *uint64_t v17 = v22;

    _os_log_impl(&dword_21283E000, v10, v11, "Error loading URL for type identifier %s: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    MEMORY[0x216684270](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v59, v58);
  }
  else
  {
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 136);
    uint64_t v25 = *(void *)(v0 + 144);

    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  }
  uint64_t v26 = *(void *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 200);
  uint64_t v28 = *(void *)(v0 + 208);
  outlined init with copy of UTType?(*(void *)(v0 + 256), v26, &demangling cache variable for type metadata for URL?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) != 1)
  {
    uint64_t v39 = *(void *)(v0 + 256);
    uint64_t v40 = *(void *)(v0 + 232);
    uint64_t v41 = *(void *)(v0 + 240);
    uint64_t v42 = *(void *)(v0 + 200);
    unint64_t v43 = *(void *)(v0 + 208);
    uint64_t v44 = *(void (**)(uint64_t))(v0 + 96);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v40, v41, v42);
    v44(v40);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v40, v42);
    outlined destroy of UTType?(v39, &demangling cache variable for type metadata for URL?);
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
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
    swift_task_dealloc();
    uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(v0 + 304);
  uint64_t v30 = *(void *)(v0 + 240);
  outlined destroy of UTType?(*(void *)(v0 + 256), &demangling cache variable for type metadata for URL?);
  outlined destroy of ResolvedTransferRepresentation(v29, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  outlined destroy of UTType?(v30, &demangling cache variable for type metadata for URL?);
  long long v31 = *(void *)(v0 + 352) + 1;
  if (v31 == *(void *)(v0 + 328))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v37 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
LABEL_12:
    return v38();
  }
  uint64_t v32 = MEMORY[0x263F06F78];
  while (1)
  {
    *(void *)(v0 + 352) = v31;
    uint64_t v33 = *(void *)(v0 + 336);
    uint64_t v34 = *(void *)(v0 + 304);
    uint64_t v35 = *(void *)(v0 + 264);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v31, v34, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v36 = *(void *)(v34 + *(int *)(v35 + 28));
    if (v36 == v33) {
      break;
    }
    if (v36 == v32)
    {
      long long v55 = swift_task_alloc();
      *(void *)(v0 + 392) = v55;
      *(void *)long long v55 = v0;
      *(void *)(v55 + 8) = Transferable._file(contentType:fileHandler:);
      uint64_t v56 = *(void *)(v0 + 304);
      long long v57 = *(_OWORD *)(v0 + 112);
      *(void *)(v55 + 136) = *(void *)(v0 + 128);
      *(_OWORD *)(v55 + 120) = v57;
      *(void *)(v55 + 112) = v56;
      return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
    }
    outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    long long v31 = *(void *)(v0 + 352) + 1;
    if (v31 == *(void *)(v0 + 328)) {
      goto LABEL_10;
    }
  }
  uint64_t v46 = *(void *)(v0 + 256);
  uint64_t v47 = *(void *)(v0 + 200);
  uint64_t v48 = *(void *)(v0 + 208);
  uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56);
  *(void *)(v0 + 360) = v49;
  *(void *)(v0 + 368) = (v48 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v49(v46, 1, 1, v47);
  unint64_t v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v50;
  *unint64_t v50 = v0;
  v50[1] = Transferable._file(contentType:fileHandler:);
  unint64_t v51 = *(void *)(v0 + 304);
  uint64_t v52 = *(void *)(v0 + 248);
  uint64_t v53 = *(void *)(v0 + 120);
  uint64_t v54 = *(void *)(v0 + 112);
  return Transferable.url(from:)(v52, v51, v54, v53);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned char *v33;
  uint64_t (*v34)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  long long v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[2];
  uint64_t v52;
  uint64_t v53;

  uint64_t v52 = v0;
  v51[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v8 = v1;
  uint64_t v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.fault.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 416);
  uint64_t v14 = *(void *)(v0 + 304);
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v16 = *(void *)(v0 + 144);
  if (v12)
  {
    uint64_t v49 = *(void *)(v0 + 136);
    unint64_t v50 = *(void *)(v0 + 152);
    uint64_t v48 = *(void *)(v0 + 304);
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v51[0] = v19;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v20 = UTType.identifier.getter();
    *(void *)(v17 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v51);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v22 = v13;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v17 + 14) = v23;
    *uint64_t v18 = v23;

    _os_log_impl(&dword_21283E000, v10, v11, "Error loading data for type identifier %s: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v19, -1, -1);
    MEMORY[0x216684270](v17, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v50, v49);
    uint64_t v24 = v48;
  }
  else
  {
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v26 = *(void *)(v0 + 136);

    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v25, v26);
    uint64_t v24 = v14;
  }
  outlined destroy of ResolvedTransferRepresentation(v24, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v27 = *(void *)(v0 + 352) + 1;
  if (v27 == *(void *)(v0 + 328))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v33 = 1;
    swift_willThrow();
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
    swift_task_dealloc();
    uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
    return v34();
  }
  else
  {
    uint64_t v28 = MEMORY[0x263F06F78];
    while (1)
    {
      *(void *)(v0 + 352) = v27;
      uint64_t v29 = *(void *)(v0 + 336);
      uint64_t v30 = *(void *)(v0 + 304);
      long long v31 = *(void *)(v0 + 264);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 320)+ ((*(unsigned __int8 *)(v0 + 76) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 76))+ *(void *)(v0 + 344) * v27, v30, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v32 = *(void *)(v30 + *(int *)(v31 + 28));
      if (v32 == v29) {
        break;
      }
      if (v32 == v28)
      {
        uint64_t v45 = swift_task_alloc();
        *(void *)(v0 + 392) = v45;
        *(void *)uint64_t v45 = v0;
        *(void *)(v45 + 8) = Transferable._file(contentType:fileHandler:);
        uint64_t v46 = *(void *)(v0 + 304);
        uint64_t v47 = *(_OWORD *)(v0 + 112);
        *(void *)(v45 + 136) = *(void *)(v0 + 128);
        *(_OWORD *)(v45 + 120) = v47;
        *(void *)(v45 + 112) = v46;
        return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
      }
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v27 = *(void *)(v0 + 352) + 1;
      if (v27 == *(void *)(v0 + 328)) {
        goto LABEL_9;
      }
    }
    uint64_t v36 = *(void *)(v0 + 256);
    uint64_t v37 = *(void *)(v0 + 200);
    uint64_t v38 = *(void *)(v0 + 208);
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    *(void *)(v0 + 360) = v39;
    *(void *)(v0 + 368) = (v38 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v39(v36, 1, 1, v37);
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v40;
    *uint64_t v40 = v0;
    v40[1] = Transferable._file(contentType:fileHandler:);
    uint64_t v41 = *(void *)(v0 + 304);
    uint64_t v42 = *(void *)(v0 + 248);
    unint64_t v43 = *(void *)(v0 + 120);
    uint64_t v44 = *(void *)(v0 + 112);
    return Transferable.url(from:)(v42, v41, v44, v43);
  }
}

uint64_t Transferable._file(contentType:fileHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[50] = a1;
  v4[51] = a2;
  v4[52] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = Transferable._file(contentType:fileHandler:);
  }
  else {
    uint64_t v5 = Transferable._file(contentType:fileHandler:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t Transferable.init(data:contentType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v7[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.init(data:contentType:), 0, 0);
}

uint64_t Transferable.init(data:contentType:)()
{
  uint64_t v1 = v0[9];
  unint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[3];
  uint64_t v5 = type metadata accessor for UTType();
  v0[10] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v0[11] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v2, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  outlined copy of Data._Representation(v4, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  *uint64_t v7 = v0;
  v7[1] = Transferable.init(data:contentType:);
  uint64_t v8 = v0[9];
  uint64_t v9 = v0[6];
  uint64_t v10 = v0[7];
  uint64_t v11 = v0[3];
  uint64_t v12 = v0[4];
  uint64_t v13 = v0[2];
  return Transferable.init(_:_:)(v13, v11, v12, v8, v9, v10);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = Transferable.init(data:contentType:);
  }
  else {
    uint64_t v2 = Transferable.init(data:contentType:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  unint64_t v3 = v0[5];
  outlined consume of Data._Representation(v0[3], v0[4]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  unint64_t v3 = v0[5];
  outlined consume of Data._Representation(v0[3], v0[4]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t Transferable._data(contentType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SentTransferredFile(0);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ResolvedTransferRepresentation();
  v4[27] = v7;
  v4[28] = *(void *)(v7 - 8);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v4[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable._data(contentType:), 0, 0);
}

uint64_t Transferable._data(contentType:)()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v4, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  uint64_t v7 = static Transferable.resolvedRepresentations(for:)(v1, v3, v2);
  *(void *)(v0 + 272) = v7;
  outlined destroy of UTType?(v1, &demangling cache variable for type metadata for UTType?);
  uint64_t v8 = *(void *)(v7 + 16);
  *(void *)(v0 + 280) = v8;
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(v0 + 224);
    *(_DWORD *)(v0 + 384) = *(_DWORD *)(v10 + 80);
    uint64_t v11 = MEMORY[0x263F06F78];
    *(void *)(v0 + 288) = *(void *)(v10 + 72);
    while (1)
    {
      *(void *)(v0 + 296) = v9;
      uint64_t v12 = *(void *)(v0 + 256);
      uint64_t v13 = *(void *)(v0 + 216);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 384) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 384))+ *(void *)(v0 + 288) * v9, v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v14 = *(void *)(v12 + *(int *)(v13 + 28));
      if (v14 == v11) {
        break;
      }
      uint64_t v15 = *(void *)(v0 + 256);
      if (v14 == *(void *)(v0 + 168))
      {
        uint64_t v16 = *(void *)(v0 + 208);
        uint64_t v17 = *(void *)(v0 + 216);
        uint64_t v18 = *(void *)(v0 + 176);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 56);
        *(void *)(v0 + 336) = v19;
        *(void *)(v0 + 344) = (v18 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        v19(v16, 1, 1);
        uint64_t v20 = (int **)(v15 + *(int *)(v17 + 32));
        uint64_t v21 = *v20;
        *(void *)(v0 + 352) = *v20;
        *(void *)(v0 + 360) = v20[1];
        if (v21)
        {
          uint64_t v42 = *(void *)(v0 + 120);
          long long v43 = *(_OWORD *)(v0 + 104);
          *(_OWORD *)(v0 + 80) = v43;
          uint64_t v44 = v43;
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16))(boxed_opaque_existential_1, v42, v44);
          uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t))((char *)v21 + *v21);
          swift_retain();
          uint64_t v46 = (void *)swift_task_alloc();
          *(void *)(v0 + 368) = v46;
          *uint64_t v46 = v0;
          v46[1] = Transferable._data(contentType:);
          return v49(v0 + 16, v0 + 56);
        }
        uint64_t v22 = *(void *)(v0 + 200);
        uint64_t v23 = *(void *)(v0 + 168);
        outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        *(_OWORD *)(v0 + 16) = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        *(void *)(v0 + 48) = 0;
        outlined destroy of UTType?(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19)(v22, 1, 1, v23);
        outlined init with take of URL?(*(void *)(v0 + 200), *(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        uint64_t v24 = *(void *)(v0 + 192);
        uint64_t v25 = *(void *)(v0 + 168);
        uint64_t v26 = *(void *)(v0 + 176);
        outlined init with copy of UTType?(*(void *)(v0 + 208), v24, &demangling cache variable for type metadata for SentTransferredFile?);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
        {
          uint64_t v27 = *(void *)(v0 + 256);
          uint64_t v28 = *(void *)(v0 + 192);
          outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v27, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          outlined destroy of UTType?(v28, &demangling cache variable for type metadata for SentTransferredFile?);
        }
        else
        {
          outlined init with take of ResolvedTransferRepresentation(*(void *)(v0 + 192), *(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          uint64_t v29 = Data.init(contentsOf:options:)();
          unint64_t v31 = v30;
          uint64_t v32 = v29;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          switch(v30 >> 62)
          {
            case 1uLL:
              uint64_t v34 = (int)v29;
              uint64_t v33 = v29 >> 32;
              break;
            case 2uLL:
              uint64_t v34 = *(void *)(v29 + 16);
              uint64_t v33 = *(void *)(v29 + 24);
              break;
            case 3uLL:
              break;
            default:
              uint64_t v34 = 0;
              uint64_t v33 = BYTE6(v30);
              break;
          }
          uint64_t v35 = *(void *)(v0 + 256);
          uint64_t v36 = *(void *)(v0 + 208);
          outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          outlined destroy of UTType?(v36, &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v35, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          if (v34 != v33)
          {
            swift_bridgeObjectRelease();
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
            uint64_t v47 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
            return v47(v32, v31);
          }
          outlined consume of Data._Representation(v32, v31);
        }
      }
      else
      {
        outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v9 = *(void *)(v0 + 296) + 1;
      if (v9 == *(void *)(v0 + 280)) {
        goto LABEL_20;
      }
    }
    uint64_t v37 = swift_task_alloc();
    *(void *)(v0 + 304) = v37;
    *(void *)uint64_t v37 = v0;
    *(void *)(v37 + 8) = Transferable._data(contentType:);
    uint64_t v38 = *(void *)(v0 + 256);
    long long v39 = *(_OWORD *)(v0 + 104);
    *(void *)(v37 + 136) = *(void *)(v0 + 120);
    *(_OWORD *)(v37 + 120) = v39;
    *(void *)(v37 + 112) = v38;
    return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
  }
  else
  {
LABEL_20:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v40 = 0;
    swift_willThrow();
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
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(os_log_t, unint64_t);
  uint64_t v10;
  uint64_t v11;
  unsigned char *v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  int **v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  long long v66;
  uint64_t v67;
  long long v68;
  uint64_t v69;
  uint64_t *boxed_opaque_existential_1;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  os_log_t log;
  os_log_t logc;
  os_log_t loga;
  os_log_t logb;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v83 = v0;
  uint64_t v1 = *(void *)(v0 + 320);
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v4 = *(void *)(v0 + 312);
      uint64_t v5 = (int)v4;
      uint64_t v6 = v4 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v7 = *(void *)(v0 + 312);
      uint64_t v5 = *(void *)(v7 + 16);
      uint64_t v6 = *(void *)(v7 + 24);
LABEL_6:
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v2 = *(void *)(v0 + 312);
      uint64_t v3 = *(void *)(v0 + 320);
      if (v5 != v6) {
        goto LABEL_7;
      }
      goto LABEL_12;
    case 3uLL:
      uint64_t v10 = *(void *)(v0 + 312);
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v2 = v10;
      uint64_t v3 = v1;
      goto LABEL_12;
    default:
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v2 = *(void *)(v0 + 312);
      uint64_t v3 = *(void *)(v0 + 320);
      if ((v1 & 0xFF000000000000) != 0)
      {
LABEL_7:
        log = (os_log_t)v2;
        v77 = v3;
LABEL_8:
        swift_bridgeObjectRelease();
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
        uint64_t v8 = *(uint64_t (**)(os_log_t, unint64_t))(v0 + 8);
        return v8(log, v77);
      }
LABEL_12:
      outlined consume of Data._Representation(v2, v3);
      uint64_t v11 = *(void *)(v0 + 296) + 1;
      if (v11 == *(void *)(v0 + 280))
      {
LABEL_13:
        swift_bridgeObjectRelease();
        lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
        swift_allocError();
        *uint64_t v12 = 0;
        swift_willThrow();
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
        uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
        return v13();
      }
      uint64_t v14 = MEMORY[0x263F06F78];
      uint64_t v15 = *(void **)(v0 + 328);
      break;
  }
  while (1)
  {
    *(void *)(v0 + 296) = v11;
    uint64_t v16 = *(void *)(v0 + 256);
    uint64_t v17 = *(void *)(v0 + 216);
    outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 384) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 384))+ *(void *)(v0 + 288) * v11, v16, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v18 = *(void *)(v16 + *(int *)(v17 + 28));
    if (v18 == v14) {
      break;
    }
    uint64_t v19 = *(void *)(v0 + 256);
    if (v18 == *(void *)(v0 + 168))
    {
      uint64_t v20 = *(void *)(v0 + 208);
      uint64_t v21 = *(void *)(v0 + 216);
      uint64_t v22 = *(void *)(v0 + 176);
      uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 56);
      *(void *)(v0 + 336) = v23;
      *(void *)(v0 + 344) = (v22 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v23(v20, 1, 1);
      uint64_t v24 = (int **)(v19 + *(int *)(v21 + 32));
      uint64_t v25 = *v24;
      *(void *)(v0 + 352) = *v24;
      *(void *)(v0 + 360) = v24[1];
      if (v25)
      {
        v67 = *(void *)(v0 + 120);
        v68 = *(_OWORD *)(v0 + 104);
        *(_OWORD *)(v0 + 80) = v68;
        v69 = v68;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 16))(boxed_opaque_existential_1, v67, v69);
        logb = (os_log_t)((char *)v25 + *v25);
        swift_retain();
        v71 = (void *)swift_task_alloc();
        *(void *)(v0 + 368) = v71;
        *v71 = v0;
        v71[1] = Transferable._data(contentType:);
        return ((uint64_t (*)(uint64_t, uint64_t))logb)(v0 + 16, v0 + 56);
      }
      uint64_t v26 = *(void *)(v0 + 200);
      uint64_t v27 = *(void *)(v0 + 168);
      outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
      *(_OWORD *)(v0 + 16) = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      *(void *)(v0 + 48) = 0;
      outlined destroy of UTType?(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23)(v26, 1, 1, v27);
      outlined init with take of URL?(*(void *)(v0 + 200), *(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
      uint64_t v28 = *(void *)(v0 + 192);
      uint64_t v29 = *(void *)(v0 + 168);
      unint64_t v30 = *(void *)(v0 + 176);
      outlined init with copy of UTType?(*(void *)(v0 + 208), v28, &demangling cache variable for type metadata for SentTransferredFile?);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
      {
        unint64_t v31 = *(void *)(v0 + 256);
        uint64_t v32 = *(void *)(v0 + 192);
        outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        outlined destroy of ResolvedTransferRepresentation(v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        outlined destroy of UTType?(v32, &demangling cache variable for type metadata for SentTransferredFile?);
      }
      else
      {
        outlined init with take of ResolvedTransferRepresentation(*(void *)(v0 + 192), *(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
        uint64_t v33 = Data.init(contentsOf:options:)();
        if (v15)
        {
          logc = *(os_log_t *)(v0 + 256);
          uint64_t v35 = *(void *)(v0 + 232);
          uint64_t v36 = v15;
          uint64_t v37 = *(void *)(v0 + 136);
          uint64_t v38 = *(void *)(v0 + 144);
          long long v39 = *(void *)(v0 + 128);
          uint64_t v40 = logger.unsafeMutableAddressor();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v38, v40, v39);
          uint64_t v41 = v36;
          outlined init with copy of ResolvedTransferRepresentation((uint64_t)logc, v35, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          uint64_t v42 = v36;
          long long v43 = v36;
          uint64_t v44 = Logger.logObject.getter();
          uint64_t v45 = static os_log_type_t.fault.getter();
          loga = v44;
          uint64_t v46 = os_log_type_enabled(v44, v45);
          uint64_t v47 = *(void *)(v0 + 232);
          if (v46)
          {
            v74 = *(void *)(v0 + 136);
            v75 = *(void *)(v0 + 128);
            v76 = *(void *)(v0 + 144);
            uint64_t v48 = swift_slowAlloc();
            v72 = (void *)swift_slowAlloc();
            v73 = swift_slowAlloc();
            v82 = v73;
            *(_DWORD *)uint64_t v48 = 136315394;
            uint64_t v49 = UTType.identifier.getter();
            *(void *)(v48 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v82);
            swift_bridgeObjectRelease();
            outlined destroy of ResolvedTransferRepresentation(v47, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            *(_WORD *)(v48 + 12) = 2112;
            unint64_t v51 = v41;
            uint64_t v52 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v48 + 14) = v52;
            *v72 = v52;

            _os_log_impl(&dword_21283E000, v44, v45, "Error loading data for type identifier %s: %@", (uint8_t *)v48, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            swift_arrayDestroy();
            MEMORY[0x216684270](v72, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x216684270](v73, -1, -1);
            MEMORY[0x216684270](v48, -1, -1);

            (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v75);
          }
          else
          {
            uint64_t v56 = v41;
            uint64_t v58 = *(void *)(v0 + 136);
            long long v57 = *(void *)(v0 + 144);
            uint64_t v59 = *(void *)(v0 + 128);

            outlined destroy of ResolvedTransferRepresentation(v47, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
            (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
          }
          v60 = *(void *)(v0 + 256);
          uint64_t v61 = *(void *)(v0 + 208);
          outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          outlined destroy of UTType?(v61, &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v60, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v53 = v34;
          uint64_t v54 = 0;
          long long v55 = 0;
          switch(v34 >> 62)
          {
            case 1uLL:
              long long v55 = (int)v33;
              uint64_t v54 = v33 >> 32;
              break;
            case 2uLL:
              long long v55 = *(void *)(v33 + 16);
              uint64_t v54 = *(void *)(v33 + 24);
              break;
            case 3uLL:
              break;
            default:
              long long v55 = 0;
              uint64_t v54 = BYTE6(v34);
              break;
          }
          log = (os_log_t)v33;
          uint64_t v62 = *(void *)(v0 + 256);
          uint64_t v63 = *(void *)(v0 + 208);
          outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          outlined destroy of UTType?(v63, &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v62, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          if (v55 != v54)
          {
            v77 = v53;
            goto LABEL_8;
          }
          outlined consume of Data._Representation((uint64_t)log, v53);
          uint64_t v15 = 0;
        }
      }
    }
    else
    {
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    }
    uint64_t v11 = *(void *)(v0 + 296) + 1;
    if (v11 == *(void *)(v0 + 280)) {
      goto LABEL_13;
    }
  }
  v64 = swift_task_alloc();
  *(void *)(v0 + 304) = v64;
  *(void *)v64 = v0;
  *(void *)(v64 + 8) = Transferable._data(contentType:);
  uint64_t v65 = *(void *)(v0 + 256);
  v66 = *(_OWORD *)(v0 + 104);
  *(void *)(v64 + 136) = *(void *)(v0 + 120);
  *(_OWORD *)(v64 + 120) = v66;
  *(void *)(v64 + 112) = v65;
  return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v2 + 352));
  if (v0)
  {
    uint64_t v3 = Transferable._data(contentType:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = Transferable._data(contentType:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  int **v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned char *v62;
  uint64_t (*v63)(void);
  uint64_t v65;
  uint64_t v66;
  long long v67;
  uint64_t v68;
  long long v69;
  uint64_t v70;
  uint64_t *boxed_opaque_existential_1;
  void *v72;
  uint64_t (*v73)(uint64_t, unint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v80 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = &demangling cache variable for type metadata for SentTransferredFile?;
  outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  uint64_t v6 = swift_dynamicCast();
  v2(v3, v6 ^ 1u, 1, v4);
  uint64_t v7 = *(void **)(v0 + 376);
  uint64_t v8 = MEMORY[0x263F06F78];
  while (2)
  {
    outlined init with take of URL?(*(void *)(v0 + 200), *(void *)(v0 + 208), v5);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v11 = *(void *)(v0 + 176);
    outlined init with copy of UTType?(*(void *)(v0 + 208), v9, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      uint64_t v12 = *(void *)(v0 + 256);
      uint64_t v13 = *(void *)(v0 + 192);
      outlined destroy of UTType?(*(void *)(v0 + 208), v5);
      outlined destroy of ResolvedTransferRepresentation(v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      outlined destroy of UTType?(v13, v5);
      goto LABEL_15;
    }
    outlined init with take of ResolvedTransferRepresentation(*(void *)(v0 + 192), *(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
    uint64_t v14 = Data.init(contentsOf:options:)();
    uint64_t v16 = v7;
    if (v7)
    {
      v77 = v1;
      uint64_t v17 = *(void *)(v0 + 256);
      uint64_t v18 = *(void *)(v0 + 232);
      uint64_t v20 = *(void *)(v0 + 136);
      uint64_t v19 = *(void *)(v0 + 144);
      uint64_t v21 = *(void *)(v0 + 128);
      uint64_t v22 = logger.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
      outlined init with copy of ResolvedTransferRepresentation(v17, v18, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v23 = v16;
      uint64_t v24 = v16;
      uint64_t v25 = Logger.logObject.getter();
      uint64_t v26 = static os_log_type_t.fault.getter();
      uint64_t v27 = os_log_type_enabled(v25, v26);
      uint64_t v28 = *(void *)(v0 + 232);
      if (v27)
      {
        v74 = *(void *)(v0 + 136);
        v75 = *(void *)(v0 + 128);
        v76 = *(void *)(v0 + 144);
        uint64_t v29 = swift_slowAlloc();
        unint64_t v30 = (void *)swift_slowAlloc();
        unint64_t v31 = swift_slowAlloc();
        v79 = v31;
        *(_DWORD *)uint64_t v29 = 136315394;
        uint64_t v32 = UTType.identifier.getter();
        *(void *)(v29 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, &v79);
        swift_bridgeObjectRelease();
        outlined destroy of ResolvedTransferRepresentation(v28, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        *(_WORD *)(v29 + 12) = 2112;
        uint64_t v34 = v16;
        uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v29 + 14) = v35;
        *unint64_t v30 = v35;

        _os_log_impl(&dword_21283E000, v25, v26, "Error loading data for type identifier %s: %@", (uint8_t *)v29, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        uint64_t v36 = v30;
        uint64_t v5 = &demangling cache variable for type metadata for SentTransferredFile?;
        MEMORY[0x216684270](v36, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x216684270](v31, -1, -1);
        MEMORY[0x216684270](v29, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v75);
      }
      else
      {
        uint64_t v42 = *(void *)(v0 + 136);
        uint64_t v41 = *(void *)(v0 + 144);
        long long v43 = *(void *)(v0 + 128);

        outlined destroy of ResolvedTransferRepresentation(v28, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
      }
      uint64_t v44 = *(void *)(v0 + 256);
      uint64_t v45 = *(void *)(v0 + 208);
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
      outlined destroy of UTType?(v45, v5);
      outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v7 = 0;
      uint64_t v1 = v77;
      while (1)
      {
LABEL_15:
        uint64_t v49 = *(void *)(v0 + 296) + 1;
        if (v49 == *(void *)(v0 + 280))
        {
          swift_bridgeObjectRelease();
          lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
          swift_allocError();
          *uint64_t v62 = 0;
          swift_willThrow();
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
          uint64_t v63 = *(uint64_t (**)(void))(v0 + 8);
          return v63();
        }
        *(void *)(v0 + 296) = v49;
        uint64_t v50 = *(void *)(v0 + 256);
        unint64_t v51 = *(void *)(v0 + 216);
        outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 384) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 384))+ *(void *)(v0 + 288) * v49, v50, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v52 = *(void *)(v50 + *(int *)(v51 + 28));
        if (v52 == v8)
        {
          uint64_t v65 = swift_task_alloc();
          *(void *)(v0 + 304) = v65;
          *(void *)uint64_t v65 = v0;
          *(void *)(v65 + 8) = Transferable._data(contentType:);
          v66 = *(void *)(v0 + 256);
          v67 = *(_OWORD *)(v0 + 104);
          *(void *)(v65 + 136) = *(void *)(v0 + 120);
          *(_OWORD *)(v65 + 120) = v67;
          *(void *)(v65 + 112) = v66;
          return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
        }
        uint64_t v53 = *(void *)(v0 + 256);
        if (v52 == *(void *)(v0 + 168)) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v54 = *(void *)(v0 + 208);
      long long v55 = *(void *)(v0 + 216);
      uint64_t v56 = *(void *)(v0 + 176);
      long long v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 56);
      *(void *)(v0 + 336) = v57;
      *(void *)(v0 + 344) = (v56 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v57(v54, 1, 1);
      uint64_t v58 = (int **)(v53 + *(int *)(v55 + 32));
      uint64_t v59 = *v58;
      *(void *)(v0 + 352) = *v58;
      *(void *)(v0 + 360) = v58[1];
      if (!v59)
      {
        v60 = *(void *)(v0 + 200);
        uint64_t v61 = *(void *)(v0 + 168);
        outlined destroy of UTType?(*(void *)(v0 + 208), v5);
        *(_OWORD *)uint64_t v1 = 0u;
        *(_OWORD *)(v1 + 16) = 0u;
        *(void *)(v1 + 32) = 0;
        outlined destroy of UTType?(v1, &demangling cache variable for type metadata for TransferableCurrency?);
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v57)(v60, 1, 1, v61);
        continue;
      }
      v68 = *(void *)(v0 + 120);
      v69 = *(_OWORD *)(v0 + 104);
      *(_OWORD *)(v0 + 80) = v69;
      v70 = v69;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v70 - 8) + 16))(boxed_opaque_existential_1, v68, v70);
      v78 = (uint64_t (*)(uint64_t, uint64_t))((char *)v59 + *v59);
      swift_retain();
      v72 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v72;
      *v72 = v0;
      v72[1] = Transferable._data(contentType:);
      return v78(v1, v0 + 56);
    }
    else
    {
      uint64_t v37 = v15;
      uint64_t v38 = v5;
      long long v39 = 0;
      uint64_t v40 = 0;
      switch(v15 >> 62)
      {
        case 1uLL:
          uint64_t v40 = (int)v14;
          long long v39 = v14 >> 32;
          break;
        case 2uLL:
          uint64_t v40 = *(void *)(v14 + 16);
          long long v39 = *(void *)(v14 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v40 = 0;
          long long v39 = BYTE6(v15);
          break;
      }
      uint64_t v46 = v14;
      uint64_t v47 = *(void *)(v0 + 256);
      uint64_t v48 = *(void *)(v0 + 208);
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
      outlined destroy of UTType?(v48, v38);
      outlined destroy of ResolvedTransferRepresentation(v47, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      if (v40 == v39)
      {
        outlined consume of Data._Representation(v46, v37);
        uint64_t v7 = 0;
        uint64_t v5 = v38;
        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
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
      v73 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
      return v73(v46, v37);
    }
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned char *v27;
  uint64_t (*v28)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  int **v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  long long v58;
  uint64_t v59;
  long long v60;
  uint64_t v61;
  uint64_t *boxed_opaque_existential_1;
  void *v63;
  uint64_t (*v64)(uint64_t, unint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v69 = v0;
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  outlined init with copy of ResolvedTransferRepresentation(v2, v3, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v8 = v1;
  uint64_t v9 = v1;
  uint64_t v10 = Logger.logObject.getter();
  uint64_t v11 = static os_log_type_t.fault.getter();
  uint64_t v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 328);
  uint64_t v14 = *(void *)(v0 + 248);
  if (v12)
  {
    uint64_t v15 = *(void *)(v0 + 136);
    uint64_t v65 = *(void *)(v0 + 128);
    v66 = *(void *)(v0 + 160);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v68 = v18;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v19 = UTType.identifier.getter();
    *(void *)(v16 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v68);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v16 + 12) = 2112;
    uint64_t v21 = v13;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v16 + 14) = v22;
    *uint64_t v17 = v22;

    _os_log_impl(&dword_21283E000, v10, v11, "Error loading data for type identifier %s: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    MEMORY[0x216684270](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v66, v65);
  }
  else
  {
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 136);

    outlined destroy of ResolvedTransferRepresentation(v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  }
  outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v26 = *(void *)(v0 + 296) + 1;
  if (v26 == *(void *)(v0 + 280))
  {
LABEL_5:
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v27 = 0;
    swift_willThrow();
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
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
  else
  {
    unint64_t v30 = MEMORY[0x263F06F78];
    while (1)
    {
      *(void *)(v0 + 296) = v26;
      unint64_t v31 = *(void *)(v0 + 256);
      uint64_t v32 = *(void *)(v0 + 216);
      outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 384) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 384))+ *(void *)(v0 + 288) * v26, v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v33 = *(void *)(v31 + *(int *)(v32 + 28));
      if (v33 == v30) {
        break;
      }
      uint64_t v34 = *(void *)(v0 + 256);
      if (v33 == *(void *)(v0 + 168))
      {
        uint64_t v35 = *(void *)(v0 + 208);
        uint64_t v36 = *(void *)(v0 + 216);
        uint64_t v37 = *(void *)(v0 + 176);
        uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 56);
        *(void *)(v0 + 336) = v38;
        *(void *)(v0 + 344) = (v37 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        v38(v35, 1, 1);
        long long v39 = (int **)(v34 + *(int *)(v36 + 32));
        uint64_t v40 = *v39;
        *(void *)(v0 + 352) = *v39;
        *(void *)(v0 + 360) = v39[1];
        if (v40)
        {
          uint64_t v59 = *(void *)(v0 + 120);
          v60 = *(_OWORD *)(v0 + 104);
          *(_OWORD *)(v0 + 80) = v60;
          uint64_t v61 = v60;
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v61 - 8) + 16))(boxed_opaque_existential_1, v59, v61);
          v67 = (uint64_t (*)(uint64_t, uint64_t))((char *)v40 + *v40);
          swift_retain();
          uint64_t v63 = (void *)swift_task_alloc();
          *(void *)(v0 + 368) = v63;
          *uint64_t v63 = v0;
          v63[1] = Transferable._data(contentType:);
          return v67(v0 + 16, v0 + 56);
        }
        uint64_t v41 = *(void *)(v0 + 200);
        uint64_t v42 = *(void *)(v0 + 168);
        outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        *(_OWORD *)(v0 + 16) = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        *(void *)(v0 + 48) = 0;
        outlined destroy of UTType?(v0 + 16, &demangling cache variable for type metadata for TransferableCurrency?);
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v38)(v41, 1, 1, v42);
        outlined init with take of URL?(*(void *)(v0 + 200), *(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        long long v43 = *(void *)(v0 + 192);
        uint64_t v44 = *(void *)(v0 + 168);
        uint64_t v45 = *(void *)(v0 + 176);
        outlined init with copy of UTType?(*(void *)(v0 + 208), v43, &demangling cache variable for type metadata for SentTransferredFile?);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44) == 1)
        {
          uint64_t v46 = *(void *)(v0 + 256);
          uint64_t v47 = *(void *)(v0 + 192);
          outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v46, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          outlined destroy of UTType?(v47, &demangling cache variable for type metadata for SentTransferredFile?);
        }
        else
        {
          outlined init with take of ResolvedTransferRepresentation(*(void *)(v0 + 192), *(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          uint64_t v48 = Data.init(contentsOf:options:)();
          uint64_t v50 = v49;
          unint64_t v51 = v48;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          switch(v49 >> 62)
          {
            case 1uLL:
              uint64_t v53 = (int)v48;
              uint64_t v52 = v48 >> 32;
              break;
            case 2uLL:
              uint64_t v53 = *(void *)(v48 + 16);
              uint64_t v52 = *(void *)(v48 + 24);
              break;
            case 3uLL:
              break;
            default:
              uint64_t v53 = 0;
              uint64_t v52 = BYTE6(v49);
              break;
          }
          uint64_t v54 = *(void *)(v0 + 256);
          long long v55 = *(void *)(v0 + 208);
          outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
          outlined destroy of UTType?(v55, &demangling cache variable for type metadata for SentTransferredFile?);
          outlined destroy of ResolvedTransferRepresentation(v54, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          if (v53 != v52)
          {
            swift_bridgeObjectRelease();
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
            v64 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
            return v64(v51, v50);
          }
          outlined consume of Data._Representation(v51, v50);
        }
      }
      else
      {
        outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v26 = *(void *)(v0 + 296) + 1;
      if (v26 == *(void *)(v0 + 280)) {
        goto LABEL_5;
      }
    }
    uint64_t v56 = swift_task_alloc();
    *(void *)(v0 + 304) = v56;
    *(void *)uint64_t v56 = v0;
    *(void *)(v56 + 8) = Transferable._data(contentType:);
    long long v57 = *(void *)(v0 + 256);
    uint64_t v58 = *(_OWORD *)(v0 + 104);
    *(void *)(v56 + 136) = *(void *)(v0 + 120);
    *(_OWORD *)(v56 + 120) = v58;
    *(void *)(v56 + 112) = v57;
    return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  int **v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned char *v55;
  uint64_t (*v56)(void);
  uint64_t v58;
  uint64_t v59;
  long long v60;
  uint64_t v61;
  long long v62;
  uint64_t v63;
  uint64_t *boxed_opaque_existential_1;
  void *v65;
  uint64_t (*v66)(uint64_t, unint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t (*v70)(uint64_t, uint64_t *);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v72 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void **)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 136);
  v69 = (uint64_t *)(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  uint64_t v8 = logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
  outlined init with copy of ResolvedTransferRepresentation(v3, v4, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v9 = v2;
  uint64_t v10 = v2;
  uint64_t v11 = Logger.logObject.getter();
  uint64_t v12 = static os_log_type_t.fault.getter();
  uint64_t v13 = os_log_type_enabled(v11, v12);
  uint64_t v14 = *(void **)(v0 + 376);
  uint64_t v15 = *(void *)(v0 + 240);
  if (v13)
  {
    uint64_t v16 = *(void *)(v0 + 136);
    v67 = *(void *)(v0 + 128);
    v68 = *(void *)(v0 + 152);
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v71 = v19;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v20 = UTType.identifier.getter();
    *(void *)(v17 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v71);
    swift_bridgeObjectRelease();
    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v22 = v14;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v17 + 14) = v23;
    *uint64_t v18 = v23;

    _os_log_impl(&dword_21283E000, v11, v12, "Error loading URL for type identifier %s: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x216684270](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x216684270](v19, -1, -1);
    uint64_t v24 = v17;
    uint64_t v1 = v0 + 16;
    MEMORY[0x216684270](v24, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v68, v67);
  }
  else
  {
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v26 = *(void *)(v0 + 128);
    uint64_t v27 = *(void *)(v0 + 136);

    outlined destroy of ResolvedTransferRepresentation(v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
  }
  while (2)
  {
    uint64_t v28 = *(void *)(v0 + 192);
    uint64_t v29 = *(void *)(v0 + 168);
    unint64_t v30 = *(void *)(v0 + 176);
    outlined init with copy of UTType?(*(void *)(v0 + 208), v28, &demangling cache variable for type metadata for SentTransferredFile?);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
    {
      unint64_t v31 = *(void *)(v0 + 256);
      uint64_t v32 = *(void *)(v0 + 192);
      outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      outlined destroy of UTType?(v32, &demangling cache variable for type metadata for SentTransferredFile?);
    }
    else
    {
      outlined init with take of ResolvedTransferRepresentation(*(void *)(v0 + 192), *(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
      uint64_t v33 = Data.init(contentsOf:options:)();
      uint64_t v35 = v34;
      uint64_t v36 = v33;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      switch(v34 >> 62)
      {
        case 1uLL:
          uint64_t v38 = (int)v33;
          uint64_t v37 = v33 >> 32;
          break;
        case 2uLL:
          uint64_t v38 = *(void *)(v33 + 16);
          uint64_t v37 = *(void *)(v33 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v38 = 0;
          uint64_t v37 = BYTE6(v34);
          break;
      }
      long long v39 = *(void *)(v0 + 256);
      uint64_t v40 = *(void *)(v0 + 208);
      outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 184), type metadata accessor for SentTransferredFile);
      outlined destroy of UTType?(v40, &demangling cache variable for type metadata for SentTransferredFile?);
      outlined destroy of ResolvedTransferRepresentation(v39, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      if (v38 != v37)
      {
        swift_bridgeObjectRelease();
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
        v66 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
        return v66(v36, v35);
      }
      outlined consume of Data._Representation(v36, v35);
    }
    uint64_t v41 = *(void *)(v0 + 296) + 1;
    if (v41 == *(void *)(v0 + 280))
    {
LABEL_20:
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      swift_allocError();
      *long long v55 = 0;
      swift_willThrow();
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
      uint64_t v56 = *(uint64_t (**)(void))(v0 + 8);
      return v56();
    }
    else
    {
      uint64_t v42 = MEMORY[0x263F06F78];
      while (1)
      {
        *(void *)(v0 + 296) = v41;
        long long v43 = *(void *)(v0 + 256);
        uint64_t v44 = *(void *)(v0 + 216);
        outlined init with copy of ResolvedTransferRepresentation(*(void *)(v0 + 272)+ ((*(unsigned __int8 *)(v0 + 384) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 384))+ *(void *)(v0 + 288) * v41, v43, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v45 = *(void *)(v43 + *(int *)(v44 + 28));
        if (v45 == v42)
        {
          uint64_t v58 = swift_task_alloc();
          *(void *)(v0 + 304) = v58;
          *(void *)uint64_t v58 = v0;
          *(void *)(v58 + 8) = Transferable._data(contentType:);
          uint64_t v59 = *(void *)(v0 + 256);
          v60 = *(_OWORD *)(v0 + 104);
          *(void *)(v58 + 136) = *(void *)(v0 + 120);
          *(_OWORD *)(v58 + 120) = v60;
          *(void *)(v58 + 112) = v59;
          return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
        }
        uint64_t v46 = *(void *)(v0 + 256);
        if (v45 == *(void *)(v0 + 168)) {
          break;
        }
        outlined destroy of ResolvedTransferRepresentation(*(void *)(v0 + 256), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v41 = *(void *)(v0 + 296) + 1;
        if (v41 == *(void *)(v0 + 280)) {
          goto LABEL_20;
        }
      }
      uint64_t v47 = *(void *)(v0 + 208);
      uint64_t v48 = *(void *)(v0 + 216);
      uint64_t v49 = *(void *)(v0 + 176);
      uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 56);
      *(void *)(v0 + 336) = v50;
      *(void *)(v0 + 344) = (v49 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v50(v47, 1, 1);
      unint64_t v51 = (int **)(v46 + *(int *)(v48 + 32));
      uint64_t v52 = *v51;
      *(void *)(v0 + 352) = *v51;
      *(void *)(v0 + 360) = v51[1];
      if (!v52)
      {
        uint64_t v53 = *(void *)(v0 + 200);
        uint64_t v54 = *(void *)(v0 + 168);
        outlined destroy of UTType?(*(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        *(_OWORD *)uint64_t v1 = 0u;
        *(_OWORD *)(v1 + 16) = 0u;
        *(void *)(v1 + 32) = 0;
        outlined destroy of UTType?(v1, &demangling cache variable for type metadata for TransferableCurrency?);
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v50)(v53, 1, 1, v54);
        outlined init with take of URL?(*(void *)(v0 + 200), *(void *)(v0 + 208), &demangling cache variable for type metadata for SentTransferredFile?);
        continue;
      }
      uint64_t v61 = *(void *)(v0 + 120);
      uint64_t v62 = *(_OWORD *)(v0 + 104);
      *(_OWORD *)(v0 + 80) = v62;
      uint64_t v63 = v62;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v69);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 16))(boxed_opaque_existential_1, v61, v63);
      v70 = (uint64_t (*)(uint64_t, uint64_t *))((char *)v52 + *v52);
      swift_retain();
      uint64_t v65 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v65;
      *uint64_t v65 = v0;
      v65[1] = Transferable._data(contentType:);
      return v70(v1, v69);
    }
  }
}

uint64_t Transferable._data(contentType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[39] = a1;
  v4[40] = a2;
  v4[41] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = Transferable._data(contentType:);
  }
  else {
    uint64_t v5 = Transferable._data(contentType:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t static Transferable.writableContentTypes.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = type metadata accessor for UTType();
  uint64_t v54 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v60 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v64 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v58 = (uint64_t)&v52 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v53 = (char *)&v52 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v52 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = static Transferable.resolvedRepresentations()(a1, a2);
  uint64_t v19 = v18;
  unint64_t v20 = *(void *)(v18 + 16);
  if (!v20) {
    goto LABEL_47;
  }
  uint64_t v21 = 0;
  unint64_t v52 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v22 = *(void *)(v6 + 72);
  uint64_t v57 = v18 + v52;
  uint64_t v23 = v18 + v52;
  while (1)
  {
    outlined init with copy of ResolvedTransferRepresentation(v23, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v24 = *(void *)&v17[*(int *)(v5 + 32)];
    uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v24) {
      break;
    }
    ++v21;
    v23 += v22;
    if (v20 == v21) {
      goto LABEL_47;
    }
  }
  if (v20 < v21)
  {
    uint64_t v26 = -1;
    uint64_t v27 = v21;
    uint64_t v21 = v20;
    goto LABEL_10;
  }
  if (v20 == v21)
  {
LABEL_47:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v26 = 1;
  uint64_t v27 = v20;
LABEL_10:
  uint64_t v28 = 0;
  unint64_t v59 = v19 + v52;
  uint64_t v29 = v26;
  uint64_t v55 = v27;
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t))v26;
  do
  {
    BOOL v31 = __OFADD__(v28, v26);
    v28 += v26;
    if (v31) {
      goto LABEL_54;
    }
    if (v21 == v20) {
      goto LABEL_55;
    }
    uint64_t v30 = v29;
    unint64_t v32 = v20;
    if (v21 + 1 != v20)
    {
      uint64_t v62 = v29;
      uint64_t v63 = v28;
      uint64_t v33 = v59 + v22 * (v21 + 1);
      unint64_t v32 = v21 + 1;
      while (v21 >= -1)
      {
        if (v32 >= *(void *)(v19 + 16)) {
          goto LABEL_51;
        }
        outlined init with copy of ResolvedTransferRepresentation(v33, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v34 = *(void *)&v15[*(int *)(v5 + 32)];
        uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        if (v34) {
          goto LABEL_11;
        }
        ++v32;
        v33 += v22;
        if (v20 == v32)
        {
          unint64_t v32 = v20;
LABEL_11:
          uint64_t v30 = v62;
          uint64_t v28 = v63;
          uint64_t v27 = v55;
          uint64_t v26 = (uint64_t)v56;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
LABEL_12:
    uint64_t v29 = v30 + v26;
    uint64_t v21 = v32;
  }
  while (v32 != v27);
  if (!v28) {
    goto LABEL_47;
  }
  uint64_t v62 = v30;
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v63 = v28;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28 & ~(v28 >> 63), 0);
  unint64_t v35 = 0;
  uint64_t v36 = v57;
  uint64_t v37 = (uint64_t)v53;
  while (1)
  {
    outlined init with copy of ResolvedTransferRepresentation(v36, v37, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v38 = *(void *)(v37 + *(int *)(v5 + 32));
    uint64_t result = outlined destroy of ResolvedTransferRepresentation(v37, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v38) {
      break;
    }
    unint64_t v39 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      goto LABEL_60;
    }
    ++v35;
    v36 += v22;
    if (v39 == v20)
    {
      unint64_t v35 = v20;
      break;
    }
  }
  uint64_t v40 = v54;
  uint64_t v41 = v62;
  if ((v63 & 0x8000000000000000) == 0)
  {
    unint64_t v42 = 0;
    uint64_t v55 = v54 + 32;
    uint64_t v56 = (void (**)(char *, uint64_t, uint64_t))(v54 + 16);
    uint64_t v53 = (char *)(v19 + v52);
    uint64_t v43 = (uint64_t)v64;
    while (v42 != v41)
    {
      if ((v35 & 0x8000000000000000) != 0) {
        goto LABEL_57;
      }
      if (v35 >= *(void *)(v19 + 16)) {
        goto LABEL_58;
      }
      unint64_t v59 = v42;
      uint64_t v44 = v58;
      outlined init with copy of ResolvedTransferRepresentation(v57 + v35 * v22, v58, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      (*v56)(v60, v44 + *(int *)(v5 + 20), v61);
      outlined destroy of ResolvedTransferRepresentation(v44, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v45 = v65;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v45 + 16) + 1, 1);
        uint64_t v45 = v65;
      }
      unint64_t v47 = *(void *)(v45 + 16);
      unint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v46 > 1, v47 + 1, 1);
        uint64_t v45 = v65;
      }
      *(void *)(v45 + 16) = v47 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v40 + 32))(v45+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v47, v60, v61);
      uint64_t v65 = v45;
      if (v35 == v20) {
        goto LABEL_59;
      }
      unint64_t v48 = v35 + 1;
      unint64_t v35 = v20;
      if (v48 != v20)
      {
        uint64_t v49 = (uint64_t)&v53[v22 * v48];
        unint64_t v35 = v48;
        while (v35 < *(void *)(v19 + 16))
        {
          outlined init with copy of ResolvedTransferRepresentation(v49, v43, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          uint64_t v50 = *(void *)(v43 + *(int *)(v5 + 32));
          uint64_t result = outlined destroy of ResolvedTransferRepresentation(v43, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
          if (v50) {
            goto LABEL_30;
          }
          unint64_t v51 = v35 + 1;
          if (__OFADD__(v35, 1)) {
            goto LABEL_53;
          }
          ++v35;
          v49 += v22;
          if (v51 == v20)
          {
            unint64_t v35 = v20;
LABEL_30:
            uint64_t v40 = v54;
            goto LABEL_31;
          }
        }
        goto LABEL_52;
      }
LABEL_31:
      unint64_t v42 = v59 + 1;
      uint64_t v41 = v62;
      if (v59 + 1 == v63)
      {
        swift_bridgeObjectRelease();
        return v45;
      }
    }
    goto LABEL_56;
  }
LABEL_61:
  __break(1u);
  return result;
}

uint64_t static Transferable.resolvedRepresentations(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v33 = v6;
  uint64_t v34 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v32 = (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UTType();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = static Transferable.resolvedRepresentations()(a2, a3);
  outlined init with copy of UTType?(a1, (uint64_t)v17, &demangling cache variable for type metadata for UTType?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    outlined destroy of UTType?((uint64_t)v17, &demangling cache variable for type metadata for UTType?);
    if (*(void *)(v22 + 16))
    {
      uint64_t v23 = v34;
      outlined init with copy of ResolvedTransferRepresentation(v22 + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80)), (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 1;
      uint64_t v23 = v34;
    }
    uint64_t v27 = v33;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v14, v24, 1, v33);
    swift_bridgeObjectRelease();
    outlined init with copy of UTType?((uint64_t)v14, (uint64_t)v12, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v27) == 1)
    {
      outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
      return MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v28 = (uint64_t)v12;
      uint64_t v29 = v32;
      outlined init with take of ResolvedTransferRepresentation(v28, v32, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
      unint64_t v30 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_21287DA60;
      outlined init with take of ResolvedTransferRepresentation(v29, v26 + v30, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
    }
  }
  else
  {
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    MEMORY[0x270FA5388](v25);
    *(&v32 - 2) = (uint64_t)v21;
    uint64_t v26 = specialized _ArrayProtocol.filter(_:)((uint64_t (*)(char *))partial apply for closure #2 in static Transferable.resolvedRepresentations(for:), (uint64_t)(&v32 - 4), v22);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  return v26;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a3 + 16);
  if (v22)
  {
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    v20[1] = a2;
    uint64_t v21 = a3;
    v20[0] = a1;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v13 = *(void *)(v24 + 72);
      outlined init with copy of ResolvedTransferRepresentation(a3 + v16 + v13 * v14, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      char v17 = a1(v12);
      if (v3)
      {
        outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if (v17)
      {
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v12, v23, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v25;
        unint64_t v19 = *(void *)(v25 + 16);
        unint64_t v18 = *(void *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = outlined init with take of ResolvedTransferRepresentation(v23, v15 + v16 + v19 * v13, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = outlined destroy of ResolvedTransferRepresentation((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      if (v22 == ++v14)
      {
        uint64_t v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t Transferable.url(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v5[17] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SentTransferredFile(0);
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](Transferable.url(from:), 0, 0);
}

uint64_t Transferable.url(from:)()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = (int **)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v3 = *v2;
  *(void *)(v0 + 168) = *v2;
  *(void *)(v0 + 176) = v2[1];
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 128);
    long long v10 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v0 + 80) = v10;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(boxed_opaque_existential_1, v4);
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v6;
    *uint64_t v6 = v0;
    v6[1] = Transferable.url(from:);
    return v11(v0 + 16, v0 + 56);
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    unsigned char *v8 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = Transferable.url(from:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = Transferable.url(from:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  unsigned char *v10;
  uint64_t v12;

  uint64_t v1 = v0[19];
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v0[21]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v1 + 56);
  if (v2)
  {
    uint64_t v4 = v0[20];
    uint64_t v5 = v0[17];
    uint64_t v6 = v0[12];
    v3(v5, 0, 1, v0[18]);
    outlined init with take of ResolvedTransferRepresentation(v5, v4, type metadata accessor for SentTransferredFile);
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, v4, v7);
  }
  else
  {
    uint64_t v9 = v0[17];
    v3(v9, 1, 1, v0[18]);
    outlined destroy of UTType?(v9, &demangling cache variable for type metadata for SentTransferredFile?);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *long long v10 = 1;
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 168));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t Transferable.data(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  return MEMORY[0x270FA2498](Transferable.data(from:), 0, 0);
}

uint64_t Transferable.data(from:)()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = (int **)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v3 = *v2;
  *(void *)(v0 + 144) = *v2;
  *(void *)(v0 + 152) = v2[1];
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 136);
    long long v10 = *(_OWORD *)(v0 + 120);
    *(_OWORD *)(v0 + 80) = v10;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(boxed_opaque_existential_1, v4);
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v6;
    *uint64_t v6 = v0;
    v6[1] = Transferable.data(from:);
    return v11(v0 + 16, v0 + 56);
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    unsigned char *v8 = 1;
    swift_willThrow();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = Transferable.data(from:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = Transferable.data(from:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  unsigned char *v5;
  uint64_t (*v6)(void);
  uint64_t v7;

  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v0[18]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v0[12];
    uint64_t v2 = v0[13];
    uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v3(v1, v2);
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v5 = 1;
    swift_willThrow();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 144));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t _contentType(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  v18[3] = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URLResourceValues();
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v20 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.pathExtension.getter();
  static UTType.data.getter();
  UTType.init(filenameExtension:conformingTo:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v10, 1, v6) == 1)
  {
    uint64_t v11 = v19;
    v18[1] = v3;
    v18[2] = v1;
    outlined destroy of UTType?((uint64_t)v10, &demangling cache variable for type metadata for UTType?);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NSURLResourceKey>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21287DA60;
    uint64_t v13 = (void *)*MEMORY[0x263EFF608];
    *(void *)(inited + 32) = *MEMORY[0x263EFF608];
    id v14 = v13;
    specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    swift_setDeallocating();
    type metadata accessor for NSURLResourceKey();
    swift_arrayDestroy();
    uint64_t v15 = v20;
    URL.resourceValues(forKeys:)();
    swift_bridgeObjectRelease();
    URLResourceValues.contentType.getter();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v4);
  }
  else
  {
    uint64_t v16 = v21;
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v21, v10, v6);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = MEMORY[0x216683720](v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSURLResourceKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSURLResourceKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSURLResourceKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSURLResourceKey()
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

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NSURLResourceKey@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x216683720](*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSURLResourceKey(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
  uint64_t v3 = lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
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
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>, MEMORY[0x263F8F3A0]);
  *unint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  *unint64_t v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized LazyFilterSequence<>.distance(from:to:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  unint64_t v5 = a2;
  if (a2 >= result)
  {
    if (result == a2) {
      return 0;
    }
    uint64_t v6 = 1;
    uint64_t v7 = a2;
    unint64_t v5 = result;
  }
  else
  {
    uint64_t v6 = -1;
    uint64_t v7 = result;
  }
  uint64_t v8 = 0;
  unint64_t v9 = *(void *)(a3 + 16);
  while (1)
  {
    BOOL v10 = __OFADD__(v8, v6);
    v8 += v6;
    if (v10) {
      break;
    }
    if (v5 == v9) {
      goto LABEL_20;
    }
    unint64_t v11 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_21;
    }
    unint64_t v5 = v9;
    if (v11 != v9)
    {
      uint64_t v12 = type metadata accessor for ResolvedTransferRepresentation();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t result = v12 - 8;
      uint64_t v14 = v13;
      uint64_t v15 = a3 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      unint64_t v5 = v11;
      while (v5 < v9)
      {
        uint64_t v16 = v15 + *(void *)(v14 + 72) * v5;
        swift_retain();
        LOBYTE(v16) = a4(v16);
        uint64_t result = swift_release();
        if (v16) {
          goto LABEL_8;
        }
        if (v9 == ++v5)
        {
          unint64_t v5 = v9;
          goto LABEL_8;
        }
      }
      __break(1u);
      break;
    }
LABEL_8:
    if (v5 == v7) {
      return v8;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_212854F98()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL partial apply for closure #2 in static Transferable.exportedContentTypes(visibility:)(uint64_t a1)
{
  v3[1] = *(void *)(v1 + 16);
  v3[0] = *(void *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 44));
  return TransferRepresentationVisibility.conforms(to:)((CoreTransferable::TransferRepresentationVisibility)v3);
}

uint64_t sub_212854FFC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #3 in Transferable.exportedContentTypes(_:)(uint64_t a1)
{
  return closure #3 in Transferable.exportedContentTypes(_:)(a1, v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage?(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(result, a2, a3 & 1);
  }
  return result;
}

uint64_t outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
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

uint64_t outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(result, a2, a3 & 1);
  }
  return result;
}

uint64_t outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
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

unint64_t lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError()
{
  unint64_t result = lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError;
  if (!lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError;
  if (!lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableSupportError and conformance TransferableSupportError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TransferableError and conformance TransferableError()
{
  unint64_t result = lazy protocol witness table cache variable for type TransferableError and conformance TransferableError;
  if (!lazy protocol witness table cache variable for type TransferableError and conformance TransferableError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableError and conformance TransferableError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TransferableError and conformance TransferableError;
  if (!lazy protocol witness table cache variable for type TransferableError and conformance TransferableError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferableError and conformance TransferableError);
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t outlined init with take of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #2 in static Transferable.resolvedRepresentations(for:)()
{
  return static UTType.== infix(_:_:)() & 1;
}

uint64_t outlined destroy of UTType?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of UTType?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
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

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of ResolvedTransferRepresentation(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSURLResourceKey>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      id v7 = v6;
      String.hash(into:)();
      Swift::Int v8 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;
        if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v24 = v23;
          if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

void type metadata accessor for NSURLResourceKey()
{
  if (!lazy cache variable for type metadata for NSURLResourceKey)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSURLResourceKey);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
}

uint64_t base witness table accessor for Equatable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
}

uint64_t lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NSURLResourceKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static AttributedString.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v1 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  uint64_t v43 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v38 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v44 = (uint64_t)&v36 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
  uint64_t v40 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = (uint64_t)&v36 - v15;
  static UTType.flatRTFD.getter();
  uint64_t v16 = type metadata accessor for AttributedString();
  uint64_t v17 = lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type AttributedString and conformance AttributedString, MEMORY[0x263F06828]);
  DataRepresentation.init(contentType:exporting:importing:)(v3, &async function pointer to closure #1 in static AttributedString.flatRTFDRepresentation.getter, 0, &async function pointer to closure #2 in static AttributedString.flatRTFDRepresentation.getter, 0, v16, v17);
  uint64_t v18 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  TransferRepresentation.exportingCondition(_:)((uint64_t)closure #3 in static AttributedString.flatRTFDRepresentation.getter, 0, v4, v14);
  uint64_t v37 = v10;
  outlined destroy of UTType?((uint64_t)v10, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  uint64_t v39 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type _ConditionalTransferRepresentation<DataRepresentation<AttributedString>> and conformance _ConditionalTransferRepresentation<A>, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v14, v16, v11, v39);
  outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
  static UTType.rtf.getter();
  uint64_t v19 = v44;
  DataRepresentation.init(contentType:exporting:importing:)(v3, &async function pointer to closure #1 in static AttributedString.rtfRepresentation.getter, 0, &async function pointer to closure #2 in static AttributedString.rtfRepresentation.getter, 0, v16, v17);
  uint64_t v20 = v43;
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v19, v16, v43, v18);
  outlined destroy of UTType?(v19, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  static UTType.html.getter();
  uint64_t v21 = v38;
  DataRepresentation.init(importedContentType:importing:)((uint64_t)v3, (uint64_t)&async function pointer to closure #1 in static AttributedString.htmlRepresentation.getter, 0, v38);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v21, v16, v20, v18);
  outlined destroy of UTType?(v21, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  unint64_t v22 = lazy protocol witness table accessor for type String and conformance String();
  ProxyRepresentation.init(exporting:importing:)((uint64_t)closure #1 in static AttributedString.transferRepresentation.getter, 0, (uint64_t)closure #2 in static AttributedString.transferRepresentation.getter, 0, v16, MEMORY[0x263F8D310], v17, v22, &v46);
  uint64_t v23 = v46;
  uint64_t v24 = v48;
  uint64_t v25 = v50;
  v45[0] = v46;
  v45[1] = v47;
  v45[2] = v48;
  v45[3] = v49;
  v45[4] = v50;
  v45[5] = v51;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ProxyRepresentation<AttributedString, String>);
  uint64_t v27 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type ProxyRepresentation<AttributedString, String> and conformance ProxyRepresentation<A, B>, &demangling cache variable for type metadata for ProxyRepresentation<AttributedString, String>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v45, v16, v26, v27);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v23);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v24);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v25);
  uint64_t v28 = v52;
  uint64_t v29 = v54;
  uint64_t v30 = v56;
  uint64_t v46 = v52;
  uint64_t v47 = v53;
  uint64_t v48 = v54;
  uint64_t v49 = v55;
  uint64_t v50 = v56;
  uint64_t v51 = v57;
  uint64_t v35 = v26;
  uint64_t v31 = v41;
  uint64_t v32 = (uint64_t)v37;
  uint64_t v33 = v44;
  static TransferRepresentationBuilder.buildBlock<A, B, C, D>(_:_:_:_:)(v41, (uint64_t)v37, v44, (uint64_t)&v46, v16, v40, v43, v43, v42, v35, v39);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v28);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v29);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v30);
  outlined destroy of UTType?(v33, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  outlined destroy of UTType?(v32, &demangling cache variable for type metadata for DataRepresentation<AttributedString>);
  return outlined destroy of UTType?(v31, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<AttributedString>>);
}

uint64_t closure #1 in static AttributedString.transferRepresentation.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AttributedString.CharacterView();
  MEMORY[0x270FA5388](v2);
  AttributedString.characters.getter();
  lazy protocol witness table accessor for type AttributedString and conformance AttributedString(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, MEMORY[0x263F066D8]);
  uint64_t result = String.init<A>(_:)();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t closure #2 in static AttributedString.transferRepresentation.getter()
{
  uint64_t v0 = type metadata accessor for AttributeContainer();
  MEMORY[0x270FA5388](v0 - 8);
  swift_bridgeObjectRetain();
  AttributeContainer.init()();
  return AttributedString.init(_:attributes:)();
}

uint64_t closure #1 in static AttributedString.flatRTFDRepresentation.getter(uint64_t a1)
{
  v1[18] = a1;
  uint64_t v2 = type metadata accessor for AttributedString();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in static AttributedString.flatRTFDRepresentation.getter, 0, 0);
}

uint64_t closure #1 in static AttributedString.flatRTFDRepresentation.getter()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 152);
  type metadata accessor for NSAttributedString();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = NSAttributedString.init(_:)();
  id v6 = objc_msgSend(v5, sel_length);
  uint64_t v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21287DA60;
  uint64_t v9 = self;
  id v10 = v5;
  id v11 = objc_msgSend(v9, sel_documentType);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  *(void *)(v0 + 120) = v12;
  *(void *)(v0 + 128) = v14;
  uint64_t v15 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  id v16 = objc_msgSend(v9, sel_rtfd);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  *(void *)(inited + 96) = v15;
  *(void *)(inited + 72) = v17;
  *(void *)(inited + 80) = v19;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 136) = 0;
  id v21 = objc_msgSend(v7, sel_dataFromAttributedString_range_documentAttributes_error_, v10, 0, v6, isa, v0 + 136);

  id v22 = *(id *)(v0 + 136);
  if (v21)
  {
    uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v26(v23, v25);
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
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
    outlined init with copy of (AnyHashable, Any)(v6, (uint64_t)v15);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    void v3[2] = v14;
    v6 += 72;
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

{
  uint64_t v1;
  void *v3;
  unint64_t result;
  char v5;
  long long *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  long long v11;
  char v12;
  long long v13;

  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, __TupleTypeDescription<TransferRepresentationDescriptor>>);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  BOOL v13 = *(_OWORD *)(a1 + 32);
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(a1 + 32));
  if (v5)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v6 = (long long *)(a1 + 48);
  uint64_t v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    *(void *)(v3[7] + 8 * result) = *((void *)&v13 + 1);
    char v8 = v3[2];
    uint64_t v9 = __OFADD__(v8, 1);
    long long v10 = v8 + 1;
    if (v9) {
      break;
    }
    void v3[2] = v10;
    if (!v7) {
      goto LABEL_8;
    }
    long long v11 = *v6++;
    BOOL v13 = v11;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v11);
    --v7;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t closure #2 in static AttributedString.flatRTFDRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return MEMORY[0x270FA2498](closure #2 in static AttributedString.flatRTFDRepresentation.getter, 0, 0);
}

uint64_t closure #2 in static AttributedString.flatRTFDRepresentation.getter()
{
  uint64_t v1 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21287DA60;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_documentType);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  v0[15] = v6;
  v0[16] = v8;
  uint64_t v9 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  id v10 = objc_msgSend(v4, sel_rtfd);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  *(void *)(inited + 96) = v9;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  Class v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v0[17] = 0;
  id v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 17);

  uint64_t v16 = (void *)v0[17];
  if (v15)
  {
    id v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    id v19 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t closure #3 in static AttributedString.flatRTFDRepresentation.getter()
{
  return 1;
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

uint64_t closure #1 in static AttributedString.rtfRepresentation.getter(uint64_t a1)
{
  v1[18] = a1;
  uint64_t v2 = type metadata accessor for AttributedString();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in static AttributedString.rtfRepresentation.getter, 0, 0);
}

uint64_t closure #1 in static AttributedString.rtfRepresentation.getter()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 152);
  type metadata accessor for NSAttributedString();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  id v5 = NSAttributedString.init(_:)();
  id v6 = objc_msgSend(v5, sel_length);
  uint64_t v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21287DA60;
  uint64_t v9 = self;
  id v10 = v5;
  id v11 = objc_msgSend(v9, sel_documentType);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  *(void *)(v0 + 120) = v12;
  *(void *)(v0 + 128) = v14;
  uint64_t v15 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  id v16 = [v9 rtf];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  *(void *)(inited + 96) = v15;
  *(void *)(inited + 72) = v17;
  *(void *)(inited + 80) = v19;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 136) = 0;
  id v21 = objc_msgSend(v7, sel_dataFromAttributedString_range_documentAttributes_error_, v10, 0, v6, isa, v0 + 136);

  id v22 = *(id *)(v0 + 136);
  if (v21)
  {
    uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v26(v23, v25);
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

uint64_t closure #2 in static AttributedString.rtfRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return MEMORY[0x270FA2498](closure #2 in static AttributedString.rtfRepresentation.getter, 0, 0);
}

uint64_t closure #2 in static AttributedString.rtfRepresentation.getter()
{
  uint64_t v1 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21287DA60;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_documentType);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  v0[15] = v6;
  v0[16] = v8;
  uint64_t v9 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  id v10 = [v4 rtf];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  *(void *)(inited + 96) = v9;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  Class v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v0[17] = 0;
  id v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 17);

  id v16 = (void *)v0[17];
  if (v15)
  {
    id v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    id v19 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t closure #1 in static AttributedString.htmlRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[19] = a2;
  v3[20] = a3;
  v3[18] = a1;
  return MEMORY[0x270FA2498](closure #1 in static AttributedString.htmlRepresentation.getter, 0, 0);
}

uint64_t closure #1 in static AttributedString.htmlRepresentation.getter()
{
  uint64_t v1 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21287DA60;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_documentType);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  v0[15] = v6;
  v0[16] = v8;
  uint64_t v9 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  id v10 = objc_msgSend(v4, sel_html);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  *(void *)(inited + 96) = v9;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  Class v14 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v0[17] = 0;
  id v15 = objc_msgSend(v1, sel_attributedStringFromData_options_documentAttributes_error_, isa, v14, 0, v0 + 17);

  id v16 = (void *)v0[17];
  if (v15)
  {
    id v17 = v16;
    AttributedString.init(_:)();
  }
  else
  {
    id v19 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in AttributedString()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21285737C()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type TupleTransferRepresentation<AttributedString, (_ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, DataRepresentation<AttributedString>, DataRepresentation<AttributedString>, ProxyRepresentation<AttributedString, String>)> and conformance TupleTransferRepresentation<A, B>, &demangling cache variable for type metadata for TupleTransferRepresentation<AttributedString, (_ConditionalTransferRepresentation<DataRepresentation<AttributedString>>, DataRepresentation<AttributedString>, DataRepresentation<AttributedString>, ProxyRepresentation<AttributedString, String>)>);
}

uint64_t lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t lazy protocol witness table accessor for type AttributedString and conformance AttributedString(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

{
  uint64_t v2;
  uint64_t vars8;

  uint64_t v2 = static Hasher._hash(seed:_:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t outlined init with copy of (AnyHashable, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AnyHashable, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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
      char v7 = MEMORY[0x216683990](v9, a1);
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
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  unint64_t v4 = v2 + 64;
  id v5 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    char v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (uint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            uint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

unint64_t type metadata accessor for NSAttributedString()
{
  unint64_t result = lazy cache variable for type metadata for NSAttributedString;
  if (!lazy cache variable for type metadata for NSAttributedString)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSAttributedString);
  }
  return result;
}

uint64_t ResolvedTransferRepresentation.exporter.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.exporter.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v5);
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t ResolvedTransferRepresentation.importer.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.importer.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v5);
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, long long a10, long long a11, uint64_t a12, uint64_t a13)
{
  int v32 = a4;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v33 = a9;
  long long v28 = a11;
  long long v29 = a10;
  uint64_t v26 = a13;
  uint64_t v27 = a12;
  uint64_t v18 = type metadata accessor for UTType();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  uint64_t v22 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_21287DA60;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(a5);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(a7);
  ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v21, v30, v31, v32, a5, a6, a7, a8, v24 + v23, v29, *((uint64_t *)&v29 + 1), v28, *((uint64_t *)&v28 + 1), v27, v26);
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v24);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a7);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  *uint64_t v33 = v34;
  return result;
}

uint64_t TransferRepresentation.visibility(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  char v7 = (uint64_t *)MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v3, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a3, v9, a2);
  uint64_t result = type metadata accessor for _VisibleTransferRepresentation();
  *(void *)(a3 + *(int *)(result + 36)) = v10;
  return result;
}

uint64_t type metadata accessor for _VisibleTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v20[0] = a1;
  v20[1] = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = type metadata accessor for _VisibleTransferRepresentation();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)v20 - v15;
  (*(void (**)(char *, void, uint64_t))(v14 + 16))((char *)v20 - v15, v20[0], v13);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v16, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v12);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v25, v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = v16;
  uint64_t v17 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v18 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v21, v17);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v18);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 32);
  outlined init with copy of ResolvedTransferRepresentation(a1, a2);
  uint64_t v5 = *(void *)(v4 + *(int *)(type metadata accessor for _VisibleTransferRepresentation() + 36));
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  *(void *)(a2 + *(int *)(result + 44)) = v5;
  return result;
}

_UNKNOWN **associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in _VisibleTransferRepresentation<A>()
{
  return &protocol witness table for Never;
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in _VisibleTransferRepresentation<A>()
{
  return swift_getAssociatedConformanceWitness();
}

void protocol witness for TransferRepresentation.body.getter in conformance _VisibleTransferRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _VisibleTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _VisibleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _VisibleTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata completion function for _VisibleTransferRepresentation()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _VisibleTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t destroy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithCopy for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t initializeWithTake for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for _VisibleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t getEnumTagSinglePayload for _VisibleTransferRepresentation(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2128583C8);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for _VisibleTransferRepresentation(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            id v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x212858588);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

uint64_t sub_2128585B0()
{
  type metadata accessor for _VisibleTransferRepresentation();

  return swift_getWitnessTable();
}

uint64_t outlined init with copy of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static Data.transferRepresentation.getter()
{
  uint64_t v0 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<Data>);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  size_t v8 = (char *)&v13 - v7;
  static UTType.data.getter();
  unint64_t v9 = lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v10 = MEMORY[0x263F06F78];
  DataRepresentation.init(contentType:exporting:importing:)(v2, &async function pointer to closure #1 in static Data.transferRepresentation.getter, 0, &async function pointer to closure #2 in static Data.transferRepresentation.getter, 0, MEMORY[0x263F06F78], v9);
  uint64_t v11 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v6, v10, v3, v11);
  outlined destroy of UTType?((uint64_t)v6, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v8, v10, v3, v11);
  return outlined destroy of UTType?((uint64_t)v8, &demangling cache variable for type metadata for DataRepresentation<Data>);
}

uint64_t closure #1 in static Data.transferRepresentation.getter(uint64_t *a1)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  outlined copy of Data._Representation(*a1, v2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  return closure #1 in static Data.transferRepresentation.getter(v4, v1, v3, v2);
}

uint64_t closure #2 in static Data.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  void v3[2] = a1;
  return MEMORY[0x270FA2498](closure #2 in static Data.transferRepresentation.getter, 0, 0);
}

uint64_t closure #2 in static Data.transferRepresentation.getter()
{
  uint64_t v1 = v0[3];
  unint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  *uint64_t v3 = v1;
  v3[1] = v2;
  outlined copy of Data._Representation(v1, v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t protocol witness for static Transferable.transferRepresentation.getter in conformance Data(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<Data>);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v15 - v11;
  static UTType.data.getter();
  DataRepresentation.init(contentType:exporting:importing:)(v6, &async function pointer to closure #1 in static Data.transferRepresentation.getter, 0, &async function pointer to closure #2 in static Data.transferRepresentation.getter, 0, a1, a2);
  uint64_t v13 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v10, a1, v7, v13);
  outlined destroy of UTType?((uint64_t)v10, &demangling cache variable for type metadata for DataRepresentation<Data>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, a1, v7, v13);
  return outlined destroy of UTType?((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<Data>);
}

uint64_t static String.transferRepresentation.getter()
{
  uint64_t v0 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<String>);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  static UTType.utf8PlainText.getter();
  unint64_t v9 = lazy protocol witness table accessor for type String and conformance String();
  uint64_t v10 = MEMORY[0x263F8D310];
  DataRepresentation.init(contentType:exporting:importing:)(v2, &async function pointer to closure #1 in static String.transferRepresentation.getter, 0, &async function pointer to closure #2 in static String.transferRepresentation.getter, 0, MEMORY[0x263F8D310], v9);
  uint64_t v11 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v6, v10, v3, v11);
  outlined destroy of UTType?((uint64_t)v6, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v8, v10, v3, v11);
  return outlined destroy of UTType?((uint64_t)v8, &demangling cache variable for type metadata for DataRepresentation<String>);
}

uint64_t closure #1 in static String.transferRepresentation.getter(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for String.Encoding();
  v1[2] = v3;
  v1[3] = *(void *)(v3 - 8);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  v1[4] = v4;
  v1[5] = v5;
  v1[6] = v6;
  return MEMORY[0x270FA2498](closure #1 in static String.transferRepresentation.getter, 0, 0);
}

uint64_t closure #1 in static String.transferRepresentation.getter()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  static String.Encoding.utf8.getter();
  uint64_t v4 = String.data(using:allowLossyConversion:)();
  unint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v6 >> 60 == 15)
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
    return v10(v4, v6);
  }
}

uint64_t closure #2 in static String.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  void v3[2] = a1;
  type metadata accessor for String.Encoding();
  v3[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #2 in static String.transferRepresentation.getter, 0, 0);
}

uint64_t closure #2 in static String.transferRepresentation.getter()
{
  static String.Encoding.utf8.getter();
  uint64_t v1 = String.init(data:encoding:)();
  if (v2)
  {
    uint64_t v3 = *(uint64_t **)(v0 + 16);
    *uint64_t v3 = v1;
    v3[1] = v2;
  }
  else
  {
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    swift_allocError();
    *uint64_t v5 = 0;
    swift_willThrow();
  }
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t protocol witness for static Transferable.transferRepresentation.getter in conformance String(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<String>);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v15 - v11;
  static UTType.utf8PlainText.getter();
  DataRepresentation.init(contentType:exporting:importing:)(v6, &async function pointer to closure #1 in static String.transferRepresentation.getter, 0, &async function pointer to closure #2 in static String.transferRepresentation.getter, 0, a1, a2);
  uint64_t v13 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v10, a1, v7, v13);
  outlined destroy of UTType?((uint64_t)v10, &demangling cache variable for type metadata for DataRepresentation<String>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, a1, v7, v13);
  return outlined destroy of UTType?((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<String>);
}

uint64_t static URL.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  uint64_t v1 = MEMORY[0x270FA5388](v21);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v6 = type metadata accessor for UTType();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataRepresentation<URL>);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  int v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int v14 = (char *)&v21 - v13;
  static UTType.url.getter();
  uint64_t v15 = type metadata accessor for URL();
  unint64_t v16 = lazy protocol witness table accessor for type URL and conformance URL();
  DataRepresentation.init(contentType:exporting:importing:)(v8, &async function pointer to closure #1 in static URL.transferRepresentation.getter, 0, &async function pointer to partial apply for closure #2 in static URL.transferRepresentation.getter, 0, v15, v16);
  uint64_t v17 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<URL> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<URL>);
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v12, v15, v9, v17);
  outlined destroy of UTType?((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<URL>);
  static UTType.fileURL.getter();
  DataRepresentation.init(contentType:exporting:importing:)(v8, &async function pointer to closure #3 in static URL.transferRepresentation.getter, 0, &async function pointer to partial apply for closure #4 in static URL.transferRepresentation.getter, 0, v15, v16);
  TransferRepresentation.exportingCondition(_:)((uint64_t)closure #5 in static URL.transferRepresentation.getter, 0, v9, v3);
  outlined destroy of UTType?((uint64_t)v12, &demangling cache variable for type metadata for DataRepresentation<URL>);
  uint64_t v18 = lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type _ConditionalTransferRepresentation<DataRepresentation<URL>> and conformance _ConditionalTransferRepresentation<A>, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  uint64_t v19 = v21;
  static TransferRepresentationBuilder.buildExpression<A>(_:)(v3, v15, v21, v18);
  outlined destroy of UTType?((uint64_t)v3, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  static TransferRepresentationBuilder.buildBlock<A, B>(_:_:)((uint64_t)v14, (uint64_t)v5, v9, v19, v22);
  outlined destroy of UTType?((uint64_t)v5, &demangling cache variable for type metadata for _ConditionalTransferRepresentation<DataRepresentation<URL>>);
  return outlined destroy of UTType?((uint64_t)v14, &demangling cache variable for type metadata for DataRepresentation<URL>);
}

uint64_t closure #1 in static URL.transferRepresentation.getter(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = type metadata accessor for UTType();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in static URL.transferRepresentation.getter, 0, 0);
}

uint64_t closure #1 in static URL.transferRepresentation.getter()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  static UTType.url.getter();
  uint64_t v3 = swift_task_alloc();
  v0[8] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = closure #1 in static URL.transferRepresentation.getter;
  uint64_t v5 = MEMORY[0x263F06F78];
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x800000021287EF00, closure #1 in URL.data(contentType:)partial apply, v3, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = closure #1 in static URL.transferRepresentation.getter;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = closure #1 in static URL.transferRepresentation.getter;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t closure #2 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  void v3[2] = a1;
  uint64_t v4 = type metadata accessor for UTType();
  v3[5] = v4;
  void v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #2 in static URL.transferRepresentation.getter, 0, 0);
}

uint64_t closure #2 in static URL.transferRepresentation.getter()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  static UTType.url.getter();
  static URL.url(contentType:data:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t partial apply for closure #2 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = Transferable.file(contentType:fileHandler:);
  return closure #2 in static URL.transferRepresentation.getter(a1, a2, a3);
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

void static URL.url(contentType:data:)()
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v2 = UTType.identifier.getter();
  uint64_t v3 = (void *)MEMORY[0x216683720](v2);
  swift_bridgeObjectRelease();
  v8[0] = 0;
  id v4 = objc_msgSend(v0, sel_objectWithItemProviderData_typeIdentifier_error_, isa, v3, v8);

  id v5 = v8[0];
  if (v4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = v5;
  }
  else
  {
    id v7 = v8[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t closure #3 in static URL.transferRepresentation.getter(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = type metadata accessor for UTType();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #3 in static URL.transferRepresentation.getter, 0, 0);
}

uint64_t closure #3 in static URL.transferRepresentation.getter()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  static UTType.fileURL.getter();
  uint64_t v3 = swift_task_alloc();
  v0[8] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = closure #3 in static URL.transferRepresentation.getter;
  uint64_t v5 = MEMORY[0x263F06F78];
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x800000021287EF00, partial apply for closure #1 in URL.data(contentType:), v3, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = closure #3 in static URL.transferRepresentation.getter;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = closure #3 in static URL.transferRepresentation.getter;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t closure #4 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  void v3[2] = a1;
  uint64_t v4 = type metadata accessor for UTType();
  v3[5] = v4;
  void v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #4 in static URL.transferRepresentation.getter, 0, 0);
}

uint64_t closure #4 in static URL.transferRepresentation.getter()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  static UTType.fileURL.getter();
  static URL.url(contentType:data:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t partial apply for closure #4 in static URL.transferRepresentation.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #4 in static URL.transferRepresentation.getter(a1, a2, a3);
}

uint64_t closure #5 in static URL.transferRepresentation.getter()
{
  return URL.isFileURL.getter() & 1;
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in Data()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in String()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in URL()
{
  return swift_getOpaqueTypeConformance2();
}

void closure #1 in URL.data(contentType:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  URL._bridgeToObjectiveC()(&aBlock);
  uint64_t v6 = v5;
  uint64_t v7 = UTType.identifier.getter();
  uint64_t v8 = (void *)MEMORY[0x216683720](v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock._reserved = partial apply for closure #1 in closure #1 in URL.data(contentType:);
  uint64_t v14 = v10;
  aBlock.super.Class isa = (Class)MEMORY[0x263EF8330];
  aBlock._urlString = (NSString *)1107296256;
  aBlock._baseURL = (NSURL *)thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  aBlock._clients = &block_descriptor;
  uint64_t v11 = _Block_copy(&aBlock);
  swift_release();
  id v12 = objc_msgSend(v6, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v8, v11);
  _Block_release(v11);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);

  return swift_release();
}

uint64_t sub_21285A5BC()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<Data> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<Data>);
}

uint64_t sub_21285A5F8()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type DataRepresentation<String> and conformance DataRepresentation<A>, &demangling cache variable for type metadata for DataRepresentation<String>);
}

uint64_t sub_21285A634()
{
  return lazy protocol witness table accessor for type DataRepresentation<AttributedString> and conformance DataRepresentation<A>(&lazy protocol witness table cache variable for type TupleTransferRepresentation<URL, (DataRepresentation<URL>, _ConditionalTransferRepresentation<DataRepresentation<URL>>)> and conformance TupleTransferRepresentation<A, B>, &demangling cache variable for type metadata for TupleTransferRepresentation<URL, (DataRepresentation<URL>, _ConditionalTransferRepresentation<DataRepresentation<URL>>)>);
}

void partial apply for closure #1 in URL.data(contentType:)(uint64_t a1)
{
}

uint64_t sub_21285A678()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in URL.data(contentType:)(uint64_t a1, unint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      id v6 = a3;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      swift_allocError();
      unsigned char *v8 = 1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    outlined copy of Data._Representation(a1, a2);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    return CheckedContinuation.resume(returning:)();
  }
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t closure #1 in static Data.transferRepresentation.getter(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, a3);
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t AssociatedConformanceWitness;
  void v19[2];

  v19[1] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  id v6 = type metadata accessor for _TransferRepresentationValue();
  unint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v19 - v9;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  id v12 = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)v19 - v15;
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v14, AssociatedTypeWitness, (uint64_t)v10);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *))(AssociatedConformanceWitness + 48))(v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, AssociatedTypeWitness);
}

void TransferRepresentation.bodyError()()
{
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t static TransferRepresentationBuilder.buildExpression<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CodableRepresentation();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t static TransferRepresentationBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

uint64_t static TransferRepresentationBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)&v16 - v12;
  uint64_t v14 = (char *)&v16 + *(int *)(v11 + 48) - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v16 - v12, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v14, a2, a4);
  swift_getAssociatedConformanceWitness();
  return TupleTransferRepresentation.init(_:)((uint64_t)v13, TupleTypeMetadata2, a5);
}

uint64_t static TransferRepresentationBuilder.buildBlock<A, B, C, D>(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v27 = a5;
  uint64_t v28 = a9;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v23 = a2;
  uint64_t v26 = a11;
  uint64_t v29 = a6;
  uint64_t v30 = a7;
  uint64_t v31 = a8;
  uint64_t v32 = a10;
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v16 = (int *)MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v18 = (char *)&v23 - v17;
  uint64_t v19 = (char *)&v23 + v16[12] - v17;
  uint64_t v20 = (char *)&v23 + v16[16] - v17;
  uint64_t v21 = (char *)&v23 + v16[20] - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))((char *)&v23 - v17, a1, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16))(v19, v23, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 16))(v20, v24, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a10 - 8) + 16))(v21, v25, a10);
  swift_getAssociatedConformanceWitness();
  return TupleTransferRepresentation.init(_:)((uint64_t)v18, TupleTypeMetadata, v28);
}

uint64_t dispatch thunk of TransferRepresentation.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata instantiation function for TransferRepresentationBuilder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for TransferRepresentationBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AtomicBox.init(wrappedValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = specialized AtomicBox.init(wrappedValue:)(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

void AtomicBox.wrappedValue.getter(os_unfair_lock_s *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 4;
  uint64_t v6 = *(void *)(a2 - 8);
  unint64_t v7 = (char *)a1 + ((*(unsigned __int8 *)(v6 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  os_unfair_lock_lock(a1 + 4);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(a3, v7, a2);

  os_unfair_lock_unlock(v5);
}

void (*AtomicBox.wrappedValue.modify(os_unfair_lock_s **a1, os_unfair_lock_s *a2))(os_unfair_lock_s **a1)
{
  *a1 = a2;
  os_unfair_lock_lock(a2 + 4);
  return AtomicBox.wrappedValue.modify;
}

void AtomicBox.wrappedValue.modify(os_unfair_lock_s **a1)
{
}

uint64_t closure #2 in static AtomicBuffer.allocate(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v7, a3);
}

uint64_t AtomicBuffer.__deallocating_deinit()
{
  uint64_t v0 = UnsafeMutablePointer.deinitialize(count:)();
  uint64_t v1 = MEMORY[0x2166839F0](v0);

  return MEMORY[0x270FA0228](v1, 20, 7);
}

uint64_t specialized AtomicBox.init(wrappedValue:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AtomicBuffer();
  uint64_t v3 = static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
  closure #2 in static AtomicBuffer.allocate(value:)(v3+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v2 + class metadata base offset for AtomicBuffer) - 8) + 80)+ 20) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2+ class metadata base offset for AtomicBuffer)- 8)+ 80)), a1, *(void *)(v2 + class metadata base offset for AtomicBuffer));
  return v3;
}

uint64_t type metadata accessor for AtomicBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for AtomicBuffer()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for AtomicBuffer()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AtomicBuffer()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }
}

void partial apply for closure #1 in static AtomicBuffer.allocate(value:)(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t TransferRepresentation.exportingCondition(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v11, v4);
  uint64_t v12 = type metadata accessor for _ConditionalTransferRepresentation();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&a4[*(int *)(v12 + 36)], v11, a3);
  *(void *)a4 = a1;
  *((void *)a4 + 1) = a2;
  return swift_retain();
}

uint64_t type metadata accessor for _ConditionalTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v20[0] = a1;
  v20[1] = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = type metadata accessor for _ConditionalTransferRepresentation();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v20 - v15;
  (*(void (**)(char *, void, uint64_t))(v14 + 16))((char *)v20 - v15, v20[0], v13);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v16[*(int *)(v13 + 36)], a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v12);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v25, v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = v16;
  uint64_t v17 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v18 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v21, v17);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v18);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v23 = a2;
  uint64_t v7 = type metadata accessor for _ConditionalTransferRepresentation();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v12 = v11 - 8;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ResolvedTransferRepresentation(a1, a5);
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v23, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v17 = (v14 + *(unsigned __int8 *)(v8 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v25;
  *(void *)(v18 + 16) = v24;
  *(void *)(v18 + 24) = v19;
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v15, v18 + v16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v17, v10, v7);
  uint64_t v20 = (uint64_t *)(a5 + *(int *)(v12 + 48));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v20);
  *uint64_t v20 = (uint64_t)partial apply for closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
  v20[1] = v18;
  return result;
}

uint64_t partial apply for closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t (**a3)(char *))
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *(uint64_t (**)(uint64_t))(a2
                                          + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  if (!v11
    || (unint64_t v17 = a3,
        swift_retain(),
        char v12 = v11(a1),
        outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v11),
        a3 = v17,
        (v12 & 1) != 0))
  {
    uint64_t v14 = *a3;
    outlined init with copy of Transferable(a1, (uint64_t)v20);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
    swift_dynamicCast();
    char v13 = v14(v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

void protocol witness for TransferRepresentation.body.getter in conformance _ConditionalTransferRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _ConditionalTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _ConditionalTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for _ConditionalTransferRepresentation()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for _ConditionalTransferRepresentation(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *a2;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    *a1 = v7;
    a1 = (void *)(v7 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = v7;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    char v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t destroy for _ConditionalTransferRepresentation(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *initializeWithCopy for _ConditionalTransferRepresentation(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_retain();
  v6(v8, v9, v5);
  return a1;
}

void *assignWithCopy for _ConditionalTransferRepresentation(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

_OWORD *initializeWithTake for _ConditionalTransferRepresentation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_OWORD *assignWithTake for _ConditionalTransferRepresentation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for _ConditionalTransferRepresentation(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
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
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      uint64_t v15 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
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

void storeEnumTagSinglePayload for _ConditionalTransferRepresentation(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
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
      JUMPOUT(0x21285C6D4);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(v19);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v18 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
          }
          else
          {
            uint64_t v18 = a2 - 1;
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t sub_21285C6FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v14 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v5 = type metadata accessor for _ConditionalTransferRepresentation();
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v7 = *(void *)(*(void *)(v5 - 8) + 64);
  unsigned int v8 = (uint64_t *)(v0 + v4);
  int v9 = *(unsigned __int8 *)(v0 + v4 + 16);
  if (v9 != 255) {
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v8, v8[1], v9 & 1);
  }
  size_t v10 = (char *)v8 + v2[5];
  uint64_t v11 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  if (*(uint64_t *)((char *)v8 + v2[8])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[9])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[10])) {
    swift_release();
  }
  uint64_t v12 = (v4 + v14 + v6) & ~v6;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v12 + *(int *)(v5 + 36), v1);

  return MEMORY[0x270FA0238](v0, v12 + v7, v3 | v6 | 7);
}

uint64_t outlined init with take of ResolvedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for _ConditionalTransferRepresentation() - 8);
  uint64_t v7 = (uint64_t (**)(char *))(v1
                                       + ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));

  return closure #1 in closure #1 in static _ConditionalTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v1 + v4, v7);
}

uint64_t outlined init with copy of Transferable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TransferRepresentation.suggestedFileName(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v11, v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a3);
  uint64_t v12 = a4 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation() + 36);
  *(void *)uint64_t v12 = a1;
  *(void *)(v12 + 8) = a2;
  *(unsigned char *)(v12 + 16) = 0;
  return swift_bridgeObjectRetain();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v11, v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a3);
  uint64_t v12 = a4 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation() + 36);
  *(void *)uint64_t v12 = a1;
  *(void *)(v12 + 8) = a2;
  *(unsigned char *)(v12 + 16) = 1;
  return swift_retain();
}

uint64_t type metadata accessor for _FileNamedTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v20[0] = a1;
  v20[1] = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unsigned int v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = type metadata accessor for _FileNamedTransferRepresentation();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unsigned int v16 = (char *)v20 - v15;
  (*(void (**)(char *, void, uint64_t))(v14 + 16))((char *)v20 - v15, v20[0], v13);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v16, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v8, a2, (uint64_t)v12);
  (*(void (**)(uint64_t *__return_ptr, char *))(a3 + 48))(&v25, v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = v16;
  uint64_t v17 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v18 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v21, v17);
  swift_bridgeObjectRelease();
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v18);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  outlined init with copy of ResolvedTransferRepresentation(a1, a2);
  uint64_t v7 = (uint64_t *)(v6 + *(int *)(type metadata accessor for _FileNamedTransferRepresentation() + 36));
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v7[2])
  {
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v4;
    v10[3] = v5;
    v10[4] = v9;
    v10[5] = v8;
    uint64_t v11 = *(void *)a2;
    uint64_t v12 = *(void *)(a2 + 8);
    unsigned __int8 v13 = *(unsigned char *)(a2 + 16);
    swift_retain();
    uint64_t result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v11, v12, v13);
    *(void *)a2 = partial apply for closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
    *(void *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 16) = 1;
  }
  else
  {
    uint64_t v16 = *(void *)a2;
    uint64_t v15 = *(void *)(a2 + 8);
    unsigned __int8 v17 = *(unsigned char *)(a2 + 16);
    swift_bridgeObjectRetain();
    uint64_t result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v16, v15, v17);
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t (*a2)(char *))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v21 - v11;
  outlined init with copy of Transferable(a1, (uint64_t)v24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  int v13 = swift_dynamicCast();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v13)
  {
    v14(v9, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v9, AssociatedTypeWitness);
    uint64_t v15 = a2(v12);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
    return v15;
  }
  else
  {
    v14(v9, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    outlined init with copy of Transferable(a1, (uint64_t)v24);
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    uint64_t v22 = 0x6465746365707845;
    unint64_t v23 = 0xE900000000000020;
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 0x756F662074756220;
    v18._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v18);
    __swift_project_boxed_opaque_existential_1(v24, v24[3]);
    swift_getDynamicType();
    v19._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._object = (void *)0xE90000000000002ELL;
    v20._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v20);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance _FileNamedTransferRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance _FileNamedTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for _FileNamedTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for _FileNamedTransferRepresentation()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _FileNamedTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 17 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)(v11 + 8);
    char v14 = *(unsigned char *)(v11 + 16);
    outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)v11, v13, v14);
    *(void *)unint64_t v10 = v12;
    *(void *)(v10 + 8) = v13;
    *(unsigned char *)(v10 + 16) = v14;
  }
  return v4;
}

uint64_t destroy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)v4, *(void *)(v4 + 8), *(unsigned char *)(v4 + 16));
}

uint64_t initializeWithCopy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)v8, v10, v11);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  return a1;
}

uint64_t assignWithCopy for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  char v11 = *(unsigned char *)(v8 + 16);
  outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)v8, v10, v11);
  uint64_t v12 = *(void *)v7;
  uint64_t v13 = *(void *)(v7 + 8);
  char v14 = *(unsigned char *)(v7 + 16);
  *(void *)unint64_t v7 = v9;
  *(void *)(v7 + 8) = v10;
  *(unsigned char *)(v7 + 16) = v11;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  char v9 = *(unsigned char *)(v8 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v9;
  return a1;
}

uint64_t assignWithTake for _FileNamedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  char v9 = *(unsigned char *)(v8 + 16);
  uint64_t v10 = *(void *)v7;
  uint64_t v11 = *(void *)(v7 + 8);
  char v12 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = v9;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for _FileNamedTransferRepresentation(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
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
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
    unsigned int v9 = (a2 - v7 + 255) >> (8 * v8);
    if (v8 < 4) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = a1[v8];
        if (!a1[v8]) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)&a1[v8];
        if (*(_WORD *)&a1[v8]) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x21285DA70);
      case 4:
        int v13 = *(_DWORD *)&a1[v8];
        if (!v13) {
          break;
        }
LABEL_22:
        int v15 = (v13 - 1) << (8 * v8);
        if (v8 >= 4) {
          int v15 = 0;
        }
        if (((v6 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
          int v16 = *a1;
        }
        else {
          int v16 = *(_DWORD *)a1;
        }
        return v7 + (v16 | v15) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0xFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unsigned int v17 = *(unsigned __int8 *)(((unint64_t)&a1[v6 + 7] & 0xFFFFFFFFFFFFFFF8) + 16);
  if (v17 > 1) {
    return (v17 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for _FileNamedTransferRepresentation(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
  char v11 = 8 * v10;
  if (v8 >= a3)
  {
    int v15 = 0;
    if (v8 >= a2)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 3:
          goto LABEL_46;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_33;
        default:
LABEL_33:
          if (a2)
          {
LABEL_34:
            if (v7 < 0xFE)
            {
              unint64_t v21 = (unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8;
              if (a2 > 0xFE)
              {
                *(unsigned char *)(v21 + 16) = 0;
                *(void *)unint64_t v21 = a2 - 255;
                *(void *)(v21 + 8) = 0;
              }
              else
              {
                *(unsigned char *)(v21 + 16) = -(char)a2;
              }
            }
            else
            {
              Swift::String v20 = *(void (**)(void))(v6 + 56);
              v20();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = (a3 - v8 + 255) >> v11;
    if (v10 <= 3) {
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
    if (v8 >= a2) {
      goto LABEL_17;
    }
  }
  unsigned int v16 = ~v8 + a2;
  unsigned int v17 = (~(_BYTE)v8 + a2);
  if (v10 < 4) {
    int v18 = (v16 >> v11) + 1;
  }
  else {
    int v18 = 1;
  }
  if (v10 >= 4) {
    unsigned int v19 = v16;
  }
  else {
    unsigned int v19 = v17;
  }
  bzero(a1, v10);
  if (v10 == 1) {
    *a1 = v19;
  }
  else {
    *(_DWORD *)a1 = v19;
  }
  switch(v15)
  {
    case 1:
      a1[v10] = v18;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v18;
      break;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x21285DC9CLL);
    case 4:
      *(_DWORD *)&a1[v10] = v18;
      break;
    default:
      return;
  }
}

uint64_t destroy for _FileNamedTransferRepresentation.Storage(uint64_t a1)
{
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for _FileNamedTransferRepresentation.Storage(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for _FileNamedTransferRepresentation.Storage(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _FileNamedTransferRepresentation.Storage(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for _FileNamedTransferRepresentation.Storage(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for _FileNamedTransferRepresentation.Storage(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for _FileNamedTransferRepresentation.Storage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21285DEA8()
{
  type metadata accessor for _FileNamedTransferRepresentation();

  return swift_getWitnessTable();
}

uint64_t sub_21285DEF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  return closure #1 in closure #1 in static _FileNamedTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(uint64_t (**)(char *))(v1 + 32));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t CodableRepresentation.init<>(for:contentType:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v20 = a3;
  uint64_t v10 = type metadata accessor for UTType();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unsigned int v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  uint64_t v14 = type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t v22 = JSONEncoder.init()();
  uint64_t v15 = type metadata accessor for JSONDecoder();
  swift_allocObject();
  uint64_t v21 = JSONDecoder.init()();
  uint64_t v16 = lazy protocol witness table accessor for type JSONEncoder and conformance JSONEncoder(&lazy protocol witness table cache variable for type JSONEncoder and conformance JSONEncoder, MEMORY[0x263F061E0]);
  uint64_t v17 = lazy protocol witness table accessor for type JSONEncoder and conformance JSONEncoder(&lazy protocol witness table cache variable for type JSONDecoder and conformance JSONDecoder, MEMORY[0x263F06128]);
  CodableRepresentation.init(for:contentType:encoder:decoder:)(v17, (uint64_t)v13, (uint64_t)&v22, (uint64_t)&v21, a2, v14, v15, v20, a6, a4, v19, v16, v17);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
}

uint64_t CodableRepresentation.init(for:contentType:encoder:decoder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v63 = a4;
  uint64_t v64 = a8;
  uint64_t v60 = a5;
  uint64_t v62 = a13;
  uint64_t v56 = a12;
  uint64_t v57 = a3;
  uint64_t v65 = *(void *)(a7 - 8);
  uint64_t v59 = *(void *)(v65 + 64);
  uint64_t v54 = a11;
  uint64_t v55 = a10;
  uint64_t v17 = MEMORY[0x270FA5388](a1);
  uint64_t v58 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for UTType();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32);
  uint64_t v53 = a9;
  v24(a9, a2, v23);
  uint64_t v25 = v60;
  uint64_t v66 = v60;
  uint64_t v67 = a6;
  uint64_t v68 = a7;
  uint64_t v69 = v64;
  uint64_t v70 = a10;
  uint64_t v71 = a11;
  uint64_t v72 = a12;
  uint64_t v73 = v62;
  uint64_t v26 = type metadata accessor for CodableRepresentation();
  uint64_t v27 = *(int *)(v26 + 84);
  uint64_t v28 = v26;
  uint64_t v61 = v26;
  uint64_t v29 = v57;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(a9 + v27, v57, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(a9 + *(int *)(v28 + 88), v63, a7);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
  v30(v22, v29, a6);
  unint64_t v31 = (*(unsigned __int8 *)(v20 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v32 = (uint64_t (*)())swift_allocObject();
  *((void *)v32 + 2) = v25;
  *((void *)v32 + 3) = a6;
  uint64_t v33 = a6;
  uint64_t v52 = a6;
  uint64_t v34 = v64;
  *((void *)v32 + 4) = a7;
  *((void *)v32 + 5) = v34;
  uint64_t v36 = v54;
  uint64_t v35 = v55;
  *((void *)v32 + 6) = v55;
  *((void *)v32 + 7) = v36;
  uint64_t v37 = (char *)v32 + v31;
  uint64_t v38 = v56;
  uint64_t v39 = v62;
  *((void *)v32 + 8) = v56;
  *((void *)v32 + 9) = v39;
  v30(v37, (uint64_t)v22, v33);
  uint64_t v40 = v53;
  uint64_t v41 = (uint64_t (**)())(v53 + *(int *)(v61 + 92));
  *uint64_t v41 = partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v41[1] = v32;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 32);
  v65 += 32;
  uint64_t v42 = v65;
  uint64_t v44 = v58;
  v43(v58, v63, a7);
  unint64_t v45 = (*(unsigned __int8 *)(v42 + 48) + 80) & ~(unint64_t)*(unsigned __int8 *)(v42 + 48);
  uint64_t v46 = (uint64_t (*)())swift_allocObject();
  uint64_t v47 = v52;
  *((void *)v46 + 2) = v60;
  *((void *)v46 + 3) = v47;
  uint64_t v48 = v64;
  *((void *)v46 + 4) = a7;
  *((void *)v46 + 5) = v48;
  *((void *)v46 + 6) = v35;
  *((void *)v46 + 7) = v36;
  *((void *)v46 + 8) = v38;
  *((void *)v46 + 9) = v39;
  uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v43)((char *)v46 + v45, v44, a7);
  uint64_t v50 = (uint64_t (**)())(v40 + *(int *)(v61 + 96));
  *uint64_t v50 = partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v50[1] = v46;
  return result;
}

uint64_t lazy protocol witness table accessor for type JSONEncoder and conformance JSONEncoder(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for CodableRepresentation()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21285E528()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 80) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:)()
{
  uint64_t result = dispatch thunk of TopLevelEncoder.encode<A>(_:)();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_21285E628()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 80) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:)()
{
  return dispatch thunk of TopLevelDecoder.decode<A>(_:from:)();
}

uint64_t static CodableRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v56 = a4;
  uint64_t v57 = a7;
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v50 = a1;
  uint64_t v53 = a8;
  uint64_t v58 = a9;
  uint64_t v49 = type metadata accessor for UTType();
  uint64_t v16 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v18;
  uint64_t v61 = a2;
  uint64_t v62 = a3;
  uint64_t v63 = a4;
  uint64_t v64 = a5;
  uint64_t v19 = a5;
  uint64_t v65 = a6;
  uint64_t v66 = a7;
  uint64_t v67 = a9;
  uint64_t v68 = a10;
  uint64_t v20 = type metadata accessor for CodableRepresentation();
  uint64_t v60 = v20;
  uint64_t v52 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v48 - v21;
  uint64_t v59 = (char *)&v48 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))((char *)&v48 - v21, v50, v20);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, v22, v49);
  uint64_t v24 = (uint64_t *)&v22[*(int *)(v20 + 92)];
  uint64_t v25 = v24[1];
  uint64_t v49 = *v24;
  uint64_t v50 = v25;
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v28 = v54;
  uint64_t v27 = v55;
  v26[2] = v54;
  v26[3] = v27;
  uint64_t v30 = v56;
  uint64_t v29 = v57;
  v26[4] = v56;
  v26[5] = a5;
  v26[6] = a6;
  v26[7] = v29;
  uint64_t v31 = v58;
  v26[8] = v58;
  v26[9] = a10;
  uint64_t v48 = a10;
  v26[10] = v49;
  v26[11] = v25;
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v28;
  v32[3] = v27;
  v32[4] = v30;
  v32[5] = a5;
  uint64_t v33 = v30;
  v32[6] = a6;
  v32[7] = v29;
  uint64_t v34 = a6;
  v32[8] = v31;
  v32[9] = a10;
  v32[10] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  v32[11] = v26;
  uint64_t v35 = &v59[*(int *)(v60 + 96)];
  uint64_t v36 = *(void *)v35;
  uint64_t v37 = *((void *)v35 + 1);
  uint64_t v38 = (void *)swift_allocObject();
  uint64_t v39 = v54;
  uint64_t v40 = v55;
  v38[2] = v54;
  v38[3] = v40;
  v38[4] = v33;
  v38[5] = v19;
  v38[6] = v34;
  uint64_t v41 = v34;
  uint64_t v42 = v57;
  v38[7] = v57;
  v38[8] = v31;
  uint64_t v43 = v48;
  v38[9] = v48;
  v38[10] = v36;
  v38[11] = v37;
  uint64_t v44 = (void *)swift_allocObject();
  void v44[2] = v39;
  v44[3] = v40;
  v44[4] = v56;
  v44[5] = v19;
  v44[6] = v41;
  v44[7] = v42;
  v44[8] = v58;
  v44[9] = v43;
  v44[10] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error);
  v44[11] = v38;
  swift_retain();
  swift_retain();
  *(void *)&long long v47 = MEMORY[0x263F06F78];
  *((void *)&v47 + 1) = v19;
  *(void *)&long long v46 = v39;
  *((void *)&v46 + 1) = MEMORY[0x263F06F78];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v51, 0, 0, 2, (uint64_t)&async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error), (uint64_t)v32, (uint64_t)&async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error), (uint64_t)v44, v53, v46, v47, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v59, v60);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = a2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  return closure #1 in static Data.transferRepresentation.getter(v5, v2, v4, v3);
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  uint64_t v2 = (char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)
     + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  __asm { BR              X8; thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error) }
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return v7(a2);
}

{
  uint64_t v3;
  void *v5;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;

  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return v7(a2);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    uint64_t v8 = *(void **)(v6 + 16);
    void *v8 = a1;
    v8[1] = a2;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v2 = (char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)
     + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error) }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  a4(a2, a3);
  uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(v5);
}

uint64_t sub_21285F15C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v2 = (char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)
     + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error);
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error) }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = Transferable.file(contentType:fileHandler:);
  return v9(a1, v5, v6);
}

{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = Transferable.file(contentType:fileHandler:);
  return v9(a1, v5, v6);
}

void partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = Transferable.file(contentType:fileHandler:);
  uint64_t v2 = (char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)
     + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error);
  __asm { BR              X9; thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error) }
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in CodableRepresentation<A, B, C>(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 40);
}

void protocol witness for TransferRepresentation.body.getter in conformance CodableRepresentation<A, B, C>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance CodableRepresentation<A, B, C>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t *a3@<X8>)
{
  return static CodableRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a3, a2[8], a2[9]);
}

uint64_t instantiation function for generic protocol witness table for CodableRepresentation<A, B, C>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 88);
}

uint64_t type metadata completion function for CodableRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for CodableRepresentation(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = (v8 + v11) & ~v11;
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(v9 - 8);
  uint64_t v16 = *(_DWORD *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = *(void *)(v15 + 64) + 7;
  unint64_t v19 = ((((v18 + ((v14 + v16 + v13) & ~v16)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  unsigned int v20 = v16 | *(_DWORD *)(v7 + 80) & 0xF8 | v11;
  if (v20 > 7 || ((*(_DWORD *)(v15 + 80) | *(_DWORD *)(v10 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0 || v19 > 0x18)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    uint64_t v32 = (void *)(v23 + (((v20 | 7) + 16) & ~(unint64_t)(v20 | 7)));
  }
  else
  {
    uint64_t v24 = ~v11;
    uint64_t v25 = ~v16;
    uint64_t v26 = *(void *)(a3 + 24);
    uint64_t v42 = v9;
    (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
    uint64_t v27 = a2;
    uint64_t v28 = a1;
    unint64_t v29 = ((unint64_t)a1 + v12) & v24;
    unint64_t v30 = ((unint64_t)v27 + v12) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(v29, v30, v26);
    uint64_t v31 = v29 + v17;
    uint64_t v32 = v28;
    uint64_t v33 = v31 & v25;
    unint64_t v34 = (v30 + v17) & v25;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16))(v31 & v25, v34, v42);
    uint64_t v35 = (void *)((v18 + v33) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v36 = (void *)((v18 + v34) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = (void *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v39 = (void *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v40 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v40;
    swift_retain();
  }
  swift_retain();
  return v32;
}

uint64_t destroy for CodableRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTType();
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  uint64_t v6 = *(void *)(v5 + 56) + a1;
  uint64_t v7 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v8 = v7 + 8;
  unint64_t v9 = (v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  (*(void (**)(unint64_t))(v7 + 8))(v9);
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 32) - 8) + 8))((v9
                                                                                            + *(void *)(v8 + 56)
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 32) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 32) - 8) + 80));
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v7 + 48) + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 48);
  uint64_t v15 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v16 = v15 + 16;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = v14 + v17;
  uint64_t v19 = (v18 + v12) & ~v17;
  uint64_t v20 = (v18 + v13) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v19, v20);
  uint64_t v21 = *(void *)(v16 + 48) + 7;
  uint64_t v22 = (void *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)((v21 + v20) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v7 + 40) + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 40);
  uint64_t v15 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v16 = v15 + 24;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = v14 + v17;
  uint64_t v19 = (v18 + v12) & ~v17;
  uint64_t v20 = (v18 + v13) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v15 + 24))(v19, v20);
  uint64_t v21 = *(void *)(v16 + 40) + 7;
  uint64_t v22 = (void *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)((v21 + v20) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  swift_release();
  uint64_t v25 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v7 + 32) + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 32);
  uint64_t v15 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v16 = v15 + 32;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = v14 + v17;
  uint64_t v19 = (v18 + v12) & ~v17;
  uint64_t v20 = (v18 + v13) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v19, v20);
  uint64_t v21 = *(void *)(v16 + 32) + 7;
  uint64_t v22 = (_OWORD *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (_OWORD *)((v21 + v20) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v22 = *v23;
  *(_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for CodableRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v7 + 24) + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 24);
  uint64_t v15 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v16 = v15 + 40;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = v14 + v17;
  uint64_t v19 = (v18 + v12) & ~v17;
  uint64_t v20 = (v18 + v13) & ~v17;
  (*(void (**)(uint64_t, uint64_t))(v15 + 40))(v19, v20);
  uint64_t v21 = *(void *)(v16 + 24) + 7;
  uint64_t v22 = (_OWORD *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = v21 + v20;
  unint64_t v24 = (v23 & 0xFFFFFFFFFFFFFFF8) + 23;
  *uint64_t v22 = *(_OWORD *)(v23 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v24 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableRepresentation(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  uint64_t v13 = *(void *)(v9 - 8);
  if (v12 <= v8) {
    unsigned int v14 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v15 = *(unsigned int *)(v13 + 84);
  uint64_t v16 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = *(void *)(v10 + 64);
  uint64_t v18 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = *(void *)(v13 + 64);
  if (v15 <= v14) {
    unsigned int v20 = v14;
  }
  else {
    unsigned int v20 = v15;
  }
  if (v20 <= 0x7FFFFFFF) {
    unsigned int v20 = 0x7FFFFFFF;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v21 = *(void *)(*(void *)(v6 - 8) + 64) + v16;
  uint64_t v22 = v19 + 7;
  if (v20 < a2)
  {
    unint64_t v23 = ((((v22 + ((v17 + v18 + (v21 & ~v16)) & ~v18)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    if ((v23 & 0xFFFFFFF8) != 0) {
      unsigned int v24 = 2;
    }
    else {
      unsigned int v24 = a2 - v20 + 1;
    }
    if (v24 >= 0x10000) {
      unsigned int v25 = 4;
    }
    else {
      unsigned int v25 = 2;
    }
    if (v24 < 0x100) {
      unsigned int v25 = 1;
    }
    if (v24 >= 2) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    switch(v26)
    {
      case 1:
        int v27 = *((unsigned __int8 *)a1 + v23);
        if (!*((unsigned char *)a1 + v23)) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v27 = *(unsigned __int16 *)((char *)a1 + v23);
        if (*(_WORD *)((char *)a1 + v23)) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x212860294);
      case 4:
        int v27 = *(_DWORD *)((char *)a1 + v23);
        if (!v27) {
          break;
        }
LABEL_27:
        int v29 = v27 - 1;
        if ((v23 & 0xFFFFFFF8) != 0)
        {
          int v29 = 0;
          int v30 = *a1;
        }
        else
        {
          int v30 = 0;
        }
        return v20 + (v30 | v29) + 1;
      default:
        break;
    }
  }
  if (v8 == v20)
  {
    uint64_t v31 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v32 = a1;
    uint64_t v33 = *(unsigned int *)(v7 + 84);
    uint64_t v34 = v6;
    return v31(v32, v33, v34);
  }
  unint64_t v35 = ((unint64_t)a1 + v21) & ~v16;
  if (v12 == v20)
  {
    uint64_t v36 = *(uint64_t (**)(unint64_t))(v11 + 48);
    return v36(v35);
  }
  else
  {
    uint64_t v32 = (_DWORD *)((v35 + v17 + v18) & ~v18);
    if (v15 == v20)
    {
      uint64_t v31 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
      uint64_t v33 = v15;
      uint64_t v34 = v9;
      return v31(v32, v33, v34);
    }
    unint64_t v37 = *(void *)(((unint64_t)v32 + v22) & 0xFFFFFFFFFFFFFFF8);
    if (v37 >= 0xFFFFFFFF) {
      LODWORD(v37) = -1;
    }
    return (v37 + 1);
  }
}

void storeEnumTagSinglePayload for CodableRepresentation(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(type metadata accessor for UTType() - 8);
  uint64_t v9 = v8;
  unsigned int v10 = *(_DWORD *)(v8 + 84);
  uint64_t v11 = *(void *)(a4 + 32);
  uint64_t v12 = *(void *)(*(void *)(a4 + 24) - 8);
  uint64_t v13 = v12;
  uint64_t v14 = *(unsigned int *)(v12 + 84);
  uint64_t v15 = *(void *)(v11 - 8);
  if (v14 <= v10) {
    unsigned int v16 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v16 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v17 = *(void *)(v11 - 8);
  uint64_t v18 = *(unsigned int *)(v15 + 84);
  uint64_t v19 = *(void *)(v8 + 64);
  uint64_t v20 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = *(void *)(v12 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v23 = *(void *)(v15 + 64);
  if (v18 <= v16) {
    unsigned int v24 = v16;
  }
  else {
    unsigned int v24 = v18;
  }
  if (v24 <= 0x7FFFFFFF) {
    unsigned int v24 = 0x7FFFFFFF;
  }
  uint64_t v25 = v23 + 7;
  size_t v26 = ((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v24 >= a3)
  {
    int v29 = 0;
    int v30 = a2 - v24;
    if (a2 <= v24)
    {
LABEL_22:
      switch(v29)
      {
        case 1:
          *((unsigned char *)a1 + v26) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_35;
        case 2:
          *(_WORD *)((char *)a1 + v26) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_35;
        case 3:
          goto LABEL_56;
        case 4:
          *(_DWORD *)((char *)a1 + v26) = 0;
          goto LABEL_34;
        default:
LABEL_34:
          if (a2)
          {
LABEL_35:
            if (v10 == v24)
            {
              uint64_t v33 = *(void (**)(_DWORD *, uint64_t))(v9 + 56);
              v33(a1, a2);
            }
            else
            {
              unint64_t v34 = ((unint64_t)a1 + v19 + v20) & ~v20;
              if (v14 == v24)
              {
                unint64_t v35 = *(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 56);
                v35(v34, a2, v14);
              }
              else
              {
                unint64_t v36 = (v34 + v21 + v22) & ~v22;
                if (v18 == v24)
                {
                  unint64_t v37 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
                  v37(v36, a2, v18, v11);
                }
                else
                {
                  uint64_t v38 = (void *)((v25 + v36) & 0xFFFFFFFFFFFFFFF8);
                  if ((a2 & 0x80000000) != 0)
                  {
                    uint64_t v39 = a2 ^ 0x80000000;
                    v38[1] = 0;
                  }
                  else
                  {
                    uint64_t v39 = (a2 - 1);
                  }
                  *uint64_t v38 = v39;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v27 = a3 - v24 + 1;
    else {
      unsigned int v27 = 2;
    }
    if (v27 >= 0x10000) {
      int v28 = 4;
    }
    else {
      int v28 = 2;
    }
    if (v27 < 0x100) {
      int v28 = 1;
    }
    if (v27 >= 2) {
      int v29 = v28;
    }
    else {
      int v29 = 0;
    }
    int v30 = a2 - v24;
    if (a2 <= v24) {
      goto LABEL_22;
    }
  }
  if (((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v31 = v30;
  else {
    int v31 = 1;
  }
  if (v26)
  {
    int v32 = ~v24 + a2;
    bzero(a1, v26);
    *a1 = v32;
  }
  switch(v29)
  {
    case 1:
      *((unsigned char *)a1 + v26) = v31;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v26) = v31;
      break;
    case 3:
LABEL_56:
      __break(1u);
      JUMPOUT(0x212860610);
    case 4:
      *(_DWORD *)((char *)a1 + v26) = v31;
      break;
    default:
      return;
  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t (*a1)(void))
{
  return a1();
}

void *static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v43 = a4;
  uint64_t v42 = a2;
  uint64_t v44 = a6;
  uint64_t v47 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v38 = *(void *)(v47 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v47);
  uint64_t v46 = (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v45 = (uint64_t)&v36 - v11;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  uint64_t v37 = *(void *)(v41 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v41);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unsigned int v16 = (char *)&v36 - v15;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v19 = (char *)&v36 - v18;
  uint64_t v40 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v39 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v21 = (char *)&v36 - v20;
  long long v22 = a1[1];
  v55[0] = *a1;
  v55[1] = v22;
  v55[2] = a1[2];
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(a5 + 24);
  outlined retain of ProxyRepresentation<A, B>(v55, (void (*)(void, void))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy);
  v23(a3, a5);
  _TransferRepresentationValue.init(_:)((uint64_t)v19, AssociatedTypeWitness, (uint64_t)v21);
  _TransferRepresentationInputs.init()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v54, v21);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v21, v40);
  uint64_t v49 = v42;
  uint64_t v50 = a3;
  uint64_t v51 = v43;
  uint64_t v52 = a5;
  uint64_t v53 = v55;
  uint64_t v25 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v48, v41);
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    uint64_t v27 = v25 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
    uint64_t v28 = *(void *)(v37 + 72);
    uint64_t v29 = v38;
    int v30 = (unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
    uint64_t v43 = v25;
    swift_bridgeObjectRetain();
    int v31 = (void *)MEMORY[0x263F8EE78];
    do
    {
      outlined init with copy of ResolvedTransferRepresentation?(v27, (uint64_t)v16);
      outlined init with take of ResolvedTransferRepresentation?((uint64_t)v16, (uint64_t)v14);
      if ((*v30)(v14, 1, v47) == 1)
      {
        outlined destroy of ResolvedTransferRepresentation?((uint64_t)v14);
      }
      else
      {
        uint64_t v32 = v45;
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v14, v45);
        outlined init with take of ResolvedTransferRepresentation(v32, v46);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int v31 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v31[2] + 1, 1, v31);
        }
        unint64_t v34 = v31[2];
        unint64_t v33 = v31[3];
        if (v34 >= v33 >> 1) {
          int v31 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1, v31);
        }
        v31[2] = v34 + 1;
        outlined init with take of ResolvedTransferRepresentation(v46, (uint64_t)v31+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(void *)(v29 + 72) * v34);
      }
      v27 += v28;
      --v26;
    }
    while (v26);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    int v31 = (void *)MEMORY[0x263F8EE78];
  }
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v31);
  return outlined retain of ProxyRepresentation<A, B>(v55, (void (*)(void, void))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe);
}

uint64_t closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v15 = *((void *)v14 - 1);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = a1;
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v17);
  uint64_t v19 = a2[2];
  uint64_t v18 = a2[3];
  uint64_t v62 = v15;
  uint64_t v63 = a7;
  uint64_t v61 = a2;
  uint64_t v65 = a5;
  uint64_t v66 = a4;
  uint64_t v64 = a3;
  if (v19)
  {
    uint64_t v20 = v18;
    uint64_t v21 = (void *)swift_allocObject();
    uint64_t v22 = v20;
    uint64_t v23 = v21;
    v21[2] = a3;
    v21[3] = a4;
    v21[4] = a5;
    v21[5] = a6;
    v21[6] = v19;
    v21[7] = v20;
    unsigned int v24 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error);
  }
  else
  {
    unsigned int v24 = (void *)*a2;
    if (!*a2) {
      goto LABEL_7;
    }
    uint64_t v23 = (void *)a2[1];
    uint64_t v25 = v18;
    swift_retain();
    uint64_t v22 = v25;
    a3 = v64;
  }
  uint64_t v26 = (uint64_t *)(v67 + v14[8]);
  uint64_t v27 = *v26;
  if (*v26)
  {
    uint64_t v28 = a3;
    uint64_t v29 = v26[1];
    uint64_t v60 = v22;
    int v30 = v14;
    int v31 = v17;
    uint64_t v32 = a6;
    unint64_t v33 = (void *)swift_allocObject();
    uint64_t v34 = v66;
    v33[2] = v28;
    v33[3] = v34;
    v33[4] = v65;
    v33[5] = v32;
    v33[6] = v24;
    v33[7] = v23;
    v33[8] = v27;
    v33[9] = v29;
    unint64_t v35 = (uint64_t *)&v31[v30[8]];
    uint64_t v36 = *v35;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v19);
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v27);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v36);
    *unint64_t v35 = (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v35[1] = (uint64_t)v33;
    a6 = v32;
    uint64_t v17 = v31;
    uint64_t v14 = v30;
    a2 = v61;
LABEL_7:
    uint64_t v37 = a2[4];
    if (!v37) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v19);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v24);
  uint64_t v37 = a2[4];
  if (!v37) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v38 = (uint64_t *)(v67 + v14[9]);
  uint64_t v39 = *v38;
  if (*v38)
  {
    uint64_t v40 = a2[5];
    uint64_t v60 = v38[1];
    uint64_t v41 = v60;
    uint64_t v42 = (void *)swift_allocObject();
    uint64_t v43 = v66;
    v42[2] = v64;
    v42[3] = v43;
    v42[4] = v65;
    v42[5] = a6;
    v42[6] = v39;
    v42[7] = v41;
    v42[8] = v37;
    v42[9] = v40;
    uint64_t v44 = (uint64_t *)&v17[v14[9]];
    uint64_t v45 = v14;
    uint64_t v46 = v17;
    uint64_t v47 = a6;
    uint64_t v48 = *v44;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v37);
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v39);
    uint64_t v49 = v48;
    a6 = v47;
    uint64_t v17 = v46;
    uint64_t v14 = v45;
    a2 = v61;
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v49);
    *uint64_t v44 = (uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v44[1] = (uint64_t)v42;
  }
LABEL_12:
  uint64_t v50 = v66;
  uint64_t v51 = (uint64_t *)(v67 + v14[10]);
  uint64_t v52 = *v51;
  if (*v51)
  {
    uint64_t v53 = v51[1];
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = v64;
    *(void *)(v54 + 24) = v50;
    *(void *)(v54 + 32) = v65;
    *(void *)(v54 + 40) = a6;
    long long v55 = *((_OWORD *)a2 + 1);
    *(_OWORD *)(v54 + 48) = *(_OWORD *)a2;
    *(_OWORD *)(v54 + 64) = v55;
    *(_OWORD *)(v54 + 80) = *((_OWORD *)a2 + 2);
    *(void *)(v54 + 96) = v52;
    *(void *)(v54 + 104) = v53;
    uint64_t v56 = (uint64_t *)&v17[v14[10]];
    uint64_t v57 = *v56;
    outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v52);
    outlined retain of ProxyRepresentation<A, B>(a2, (void (*)(void, void))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy, (void (*)(uint64_t, uint64_t))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v57);
    *uint64_t v56 = (uint64_t)partial apply for closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    v56[1] = v54;
  }
  uint64_t v58 = v63;
  outlined init with copy of ResolvedTransferRepresentation((uint64_t)v17, v63);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v62 + 56))(v58, 0, 1, v14);
  return outlined destroy of ResolvedTransferRepresentation((uint64_t)v17);
}

uint64_t partial apply for closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void **)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t outlined init with copy of ResolvedTransferRepresentation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of ResolvedTransferRepresentation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ResolvedTransferRepresentation?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *outlined retain of ProxyRepresentation<A, B>(void *a1, void (*a2)(void, void), void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t))
{
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  a2(*a1, a1[1]);
  a3(v7, v8);
  a4(v9, v10);
  return a1;
}

uint64_t closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[24] = a8;
  v8[25] = v13;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a2;
  v8[19] = a3;
  v8[17] = a1;
  v8[26] = *(void *)(a8 - 8);
  v8[27] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Optional();
  v8[28] = v10;
  v8[29] = *(void *)(v10 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = *(void *)(a7 - 8);
  v8[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:), 0, 0);
}

uint64_t closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  outlined init with copy of Transferable(v0[18], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[31];
    uint64_t v1 = v0[32];
    uint64_t v3 = v0[30];
    uint64_t v4 = v0[23];
    uint64_t v5 = (int *)v0[19];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[33] = v6;
    *uint64_t v6 = v0;
    v6[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    uint64_t v7 = v0[32];
    uint64_t v8 = v0[27];
    return v18(v8, v7);
  }
  else
  {
    uint64_t v10 = v0[30];
    uint64_t v11 = v0[28];
    uint64_t v12 = v0[29];
    uint64_t v13 = v0[18];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[31] + 56))(v10, 1, 1, v0[23]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    outlined init with copy of Transferable(v13, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 0x756F662074756220;
    v15._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v15);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._object = (void *)0xE90000000000002ELL;
    v17._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v17);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  else {
    uint64_t v2 = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *boxed_opaque_existential_1;
  void *v5;
  uint64_t v6;
  long long v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;

  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = *(int **)(v0 + 168);
  uint64_t v8 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 120) = v8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  (*(void (**)(uint64_t *, uint64_t, void))(v2 + 16))(boxed_opaque_existential_1, v1, v8);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v5;
  *uint64_t v5 = v0;
  v5[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  uint64_t v6 = *(void *)(v0 + 136);
  return v9(v6, v0 + 96);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 96);
    uint64_t v3 = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[23];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[24]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[23];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[24]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 12));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = a8;
  v8[22] = v17;
  v8[19] = a6;
  v8[20] = a7;
  v8[17] = a1;
  v8[18] = a5;
  uint64_t v12 = type metadata accessor for Optional();
  v8[23] = v12;
  v8[24] = *(void *)(v12 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = *(void *)(a8 - 8);
  v8[27] = swift_task_alloc();
  Swift::String v15 = (int *)((char *)a3 + *a3);
  uint64_t v13 = (void *)swift_task_alloc();
  v8[28] = v13;
  *uint64_t v13 = v8;
  v13[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  return ((uint64_t (*)(void *, uint64_t))v15)(v8 + 2, a2);
}

uint64_t closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  else {
    uint64_t v2 = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t *boxed_opaque_existential_1;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t (*v20)(uint64_t *, uint64_t);
  uint64_t v21;

  outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[26];
    uint64_t v1 = v0[27];
    uint64_t v3 = v0[25];
    uint64_t v4 = v0[21];
    uint64_t v5 = v0[22];
    uint64_t v6 = v0[20];
    uint64_t v8 = (uint64_t *)v0[17];
    uint64_t v7 = (int *)v0[18];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v8[3] = v6;
    v8[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
    uint64_t v20 = (uint64_t (*)(uint64_t *, uint64_t))((char *)v7 + *v7);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[30] = v10;
    *uint64_t v10 = v0;
    v10[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    uint64_t v11 = v0[27];
    return v20(boxed_opaque_existential_1, v11);
  }
  else
  {
    uint64_t v13 = v0[25];
    Swift::String v14 = v0[23];
    Swift::String v15 = v0[24];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[26] + 56))(v13, 1, 1, v0[21]);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 12));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x756F662074756220;
    v17._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v17);
    __swift_project_boxed_opaque_existential_1(v0 + 12, v0[15]);
    swift_getDynamicType();
    v18._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._object = (void *)0xE90000000000002ELL;
    v19._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v19);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  else {
    uint64_t v2 = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[21]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[17];
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[21]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = *(void *)(a5 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  Swift::String v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (void (*)(char *))v16[2];
  if (v23)
  {
    uint64_t v34 = v20;
    unint64_t v35 = v19;
    uint64_t v36 = v18;
    uint64_t v38 = v17;
    uint64_t v24 = v16[3];
    outlined init with copy of Transferable(a1, (uint64_t)v37);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
    swift_dynamicCast();
    char v25 = v24;
    v23(v15);
    if (v7)
    {
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v23);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a5);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, a5);
      v37[3] = a6;
      v37[4] = (uint64_t)v35;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
      uint64_t v32 = v34;
      (*(void (**)(uint64_t *, char *, uint64_t))(v34 + 16))(boxed_opaque_existential_1, v22, a6);
      char v25 = v38(v37);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v22, a6);
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    }
  }
  else
  {
    uint64_t v26 = *v16;
    if (*v16)
    {
      uint64_t v27 = v16[1];
      uint64_t v38 = v17;
      uint64_t v36 = v18;
      uint64_t v28 = v19;
      uint64_t v29 = type metadata accessor for MainActor();
      unint64_t v35 = &v34;
      MEMORY[0x270FA5388](v29);
      *(&v34 - 10) = a5;
      *(&v34 - 9) = a6;
      *(&v34 - 8) = a7;
      *(&v34 - 7) = (uint64_t)v28;
      *(&v34 - 6) = v26;
      *(&v34 - 5) = v27;
      int v30 = v38;
      *(&v34 - 4) = a1;
      *(&v34 - 3) = (uint64_t)v30;
      *(&v34 - 2) = v36;
      swift_retain();
      char v25 = specialized static MainActor.assumeIsolated<A>(_:file:line:)((uint64_t)partial apply for closure #1 in closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)(&v34 - 12), (char)"CoreTransferable/ProxyRepresentation.swift");
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v26);
    }
    else
    {
      char v25 = 1;
    }
  }
  return v25 & 1;
}

uint64_t closure #1 in closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t v36 = a2;
  uint64_t v37 = a8;
  uint64_t v33 = a5;
  int v30 = a4;
  int v31 = a9;
  uint64_t v35 = a1;
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  Swift::String v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Optional();
  uint64_t v32 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v29 - v18;
  uint64_t v34 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Transferable(a3, (uint64_t)v38);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  swift_dynamicCast();
  uint64_t v22 = v38[6];
  static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(v35, v36, (uint64_t)v15, a6, a7, v37, a10, (uint64_t)v19);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a6);
  if (!v22)
  {
    uint64_t v24 = v32;
    uint64_t v25 = v34;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v19, 1, a7) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v16);
      char v26 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v21, v19, a7);
      v38[3] = a7;
      v38[4] = a10;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
      (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 16))(boxed_opaque_existential_1, v21, a7);
      char v28 = v30(v38);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v21, a7);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      char v26 = v28 & 1;
    }
    *int v31 = v26;
  }
  return result;
}

uint64_t specialized static MainActor.assumeIsolated<A>(_:file:line:)(uint64_t a1, uint64_t a2, char a3)
{
  static MainActor.shared.getter();
  swift_release();
  swift_task_getMainExecutor();
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    partial apply for specialized thunk for @callee_guaranteed () -> (@out A, @error @owned Error)(v13);
    if (v3)
    {
      swift_release();
      return a3 & 1;
    }
    a3 = v13[0];
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return a3 & 1;
    }
    __break(1u);
  }
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(66);
  v10._object = (void *)0x800000021287F000;
  v10._countAndFlagsBits = 0xD00000000000003FLL;
  String.append(_:)(v10);
  v11._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 46;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

double ProxyRepresentation.init(importing:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = a1;
  v14[7] = a2;
  double result = 0.0;
  *(_OWORD *)a7 = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(void *)(a7 + 32) = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error);
  *(void *)(a7 + 40) = v14;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(v4);
}

double ProxyRepresentation.init(importing:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)(a3 + 32) = a1;
  *(void *)(a3 + 40) = a2;
  return result;
}

uint64_t ProxyRepresentation.init(exporting:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = result;
  a3[3] = a2;
  a3[4] = 0;
  a3[5] = 0;
  return result;
}

double ProxyRepresentation.init(exporting:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  return result;
}

void *ProxyRepresentation.init(exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  double result = (void *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a7;
  result[5] = a8;
  result[6] = a3;
  result[7] = a4;
  *a9 = 0;
  a9[1] = 0;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)partial apply;
  a9[5] = result;
  return result;
}

uint64_t ProxyRepresentation.init(exporting:importing:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = 0;
  a5[3] = 0;
  a5[4] = a3;
  a5[5] = a4;
  return result;
}

{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = result;
  a5[3] = a2;
  a5[4] = a3;
  a5[5] = a4;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance ProxyRepresentation<A, B>()
{
}

void *protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance ProxyRepresentation<A, B>@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  return static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

size_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  uint64_t v10 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  double result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_212863084()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(void (**)(uint64_t))(v2 + 48);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error)
                                                                              + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A, @error @owned Error));
  return v8(a1, a2, v6);
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in ProxyRepresentation<A, B>(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32);
}

uint64_t instantiation function for generic protocol witness table for ProxyRepresentation<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for ProxyRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t initializeBufferWithCopyOfBuffer for ProxyRepresentation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *destroy for ProxyRepresentation(void *result)
{
  uint64_t v1 = result;
  if (*result) {
    uint64_t result = (void *)swift_release();
  }
  if (v1[2]) {
    uint64_t result = (void *)swift_release();
  }
  if (v1[4])
  {
    return (void *)swift_release();
  }
  return result;
}

void *initializeWithCopy for ProxyRepresentation(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v7 = a2[4];
  if (v7)
  {
    uint64_t v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  return a1;
}

void *assignWithCopy for ProxyRepresentation(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v10 = a2[4];
  if (!a1[4])
  {
    if (v10)
    {
      uint64_t v12 = a2[5];
      a1[4] = v10;
      a1[5] = v12;
      swift_retain();
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v11 = a2[5];
  a1[4] = v10;
  a1[5] = v11;
  swift_retain();
  swift_release();
  return a1;
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

void *assignWithTake for ProxyRepresentation(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v10 = a2[4];
  if (!a1[4])
  {
    if (v10)
    {
      uint64_t v12 = a2[5];
      a1[4] = v10;
      a1[5] = v12;
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v11 = a2[5];
  a1[4] = v10;
  a1[5] = v11;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProxyRepresentation(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 48)) {
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

uint64_t storeEnumTagSinglePayload for ProxyRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for ProxyRepresentation()
{
  return swift_getGenericMetadata();
}

uint64_t outlined destroy of ResolvedTransferRepresentation(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ResolvedTransferRepresentation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2128636AC()
{
  if (v0[6]) {
    swift_release();
  }
  if (v0[8]) {
    swift_release();
  }
  if (v0[10]) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t partial apply for closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1)
{
  return closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, (uint64_t)(v1 + 6), v1[12], v1[13], v1[2], v1[3], v1[4]) & 1;
}

uint64_t partial apply for closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = (int *)v2[6];
  uint64_t v9 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v10 = v2[9];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = Transferable.file(contentType:fileHandler:);
  return closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v11, v10, v6, v7);
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  uint64_t v10 = v2[8];
  uint64_t v11 = v2[9];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v10, v11, v6, v7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error) + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B, @error @owned Error));
  return v13(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x216684270);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(char *a1@<X8>)
{
  return closure #1 in closure #3 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:)(*(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(uint64_t (**)(uint64_t *))(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1, *(void *)(v1 + 40));
}

uint64_t sub_212863AE4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *partial apply for specialized thunk for @callee_guaranteed () -> (@out A, @error @owned Error)@<X0>(unsigned char *a1@<X8>)
{
  __n128 result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t static DataTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v34 = a4;
  uint64_t v7 = type metadata accessor for UTType();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DataTransferRepresentation();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v30 - v12;
  uint64_t v33 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v30 - v12, a1, v11);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v32 = v10;
  v15(v10, v13, v7);
  unint64_t v16 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  v30[1] = v17;
  if (v18)
  {
    uint64_t v19 = (void *)swift_allocObject();
    uint64_t v20 = a2;
    v19[2] = a2;
    v19[3] = a3;
    v19[4] = v18;
    v19[5] = v17;
    int v31 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  }
  else
  {
    uint64_t v20 = a2;
    int v31 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v21 = a3;
  uint64_t v22 = (uint64_t *)&v13[*(int *)(v11 + 40)];
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  if (*v22)
  {
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v20;
    v25[3] = v21;
    v25[4] = v24;
    v25[5] = v23;
    char v26 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error);
  }
  else
  {
    char v26 = 0;
    uint64_t v25 = 0;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v24);
  *(void *)&long long v29 = MEMORY[0x263F06F78];
  *((void *)&v29 + 1) = v21;
  *(void *)&long long v28 = v20;
  *((void *)&v28 + 1) = MEMORY[0x263F06F78];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v32, 0, 0, 2, (uint64_t)v31, (uint64_t)v19, (uint64_t)v26, (uint64_t)v25, v34, v28, v29, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v13, v11);
}

uint64_t type metadata accessor for DataTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_212863FE8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = Transferable.file(contentType:fileHandler:);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error)
                                                         + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@guaranteed Data) -> (@out A, @error @owned Error));
  return v8(a1, a2, v6);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error)
                                                       + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed A) -> (@owned Data, @error @owned Error));
  return v8(a1, a2, v6);
}

uint64_t DataTransferRepresentation.init(contentType:exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t result = type metadata accessor for DataTransferRepresentation();
  uint64_t v14 = (void *)(a6 + *(int *)(result + 36));
  *uint64_t v14 = a2;
  v14[1] = a3;
  uint64_t v15 = (void *)(a6 + *(int *)(result + 40));
  *uint64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t DataTransferRepresentation.init(exportedContentType:exporter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  *(void *)(v12 + 24) = a5;

  return DataTransferRepresentation.init(contentType:exporter:importer:)(a1, a2, a3, (uint64_t)&async function pointer to partial apply for closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:), v12, a6);
}

uint64_t closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:)()
{
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:), 0, 0);
}

{
  uint64_t v0;
  unsigned char *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
  swift_allocError();
  uint64_t *v1 = 0;
  swift_willThrow();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2128643D4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:), 0, 0);
}

uint64_t DataTransferRepresentation.init(importedContentType:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  *(void *)(v12 + 24) = a5;

  return DataTransferRepresentation.init(contentType:exporter:importer:)(a1, (uint64_t)&async function pointer to partial apply for closure #1 in DataTransferRepresentation.init(importedContentType:importer:), v12, a2, a3, a6);
}

uint64_t closure #1 in DataTransferRepresentation.init(importedContentType:importer:)()
{
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(importedContentType:importer:), 0, 0);
}

{
  uint64_t v0;
  unsigned char *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
  swift_allocError();
  void *v1 = 1;
  swift_willThrow();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2128645D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in DataTransferRepresentation.init(importedContentType:importer:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@owned Data, @error @owned Error);
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(importedContentType:importer:), 0, 0);
}

uint64_t associated type witness table accessor for TransferRepresentation.Item : Transferable in DataTransferRepresentation<A>(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

void protocol witness for TransferRepresentation.body.getter in conformance DataTransferRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance DataTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  return static DataTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for DataTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata instantiation function for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for DataTransferRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DataTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UTType();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    if (*v10)
    {
      uint64_t v11 = v10[1];
      *uint64_t v9 = *v10;
      v9[1] = v11;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    }
    uint64_t v13 = *(int *)(a3 + 40);
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    if (*v15)
    {
      uint64_t v16 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v16;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
  }
  return a1;
}

uint64_t destroy for DataTransferRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  if (*(void *)(a1 + *(int *)(a2 + 36))) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + *(int *)(a2 + 40)))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  if (*v9)
  {
    uint64_t v10 = v9[1];
    void *v8 = *v9;
    v8[1] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  uint64_t v11 = *(int *)(a3 + 40);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  if (*v13)
  {
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t assignWithCopy for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7);
  uint64_t v11 = *(void *)(a2 + v7);
  if (v10)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(v9 + 8);
      void *v8 = v11;
      v8[1] = v12;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = *(void *)(v9 + 8);
    void *v8 = v11;
    v8[1] = v13;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
LABEL_8:
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *(void *)(a1 + v14);
  uint64_t v18 = *v16;
  if (!v17)
  {
    if (v18)
    {
      uint64_t v20 = v16[1];
      *uint64_t v15 = v18;
      v15[1] = v20;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    return a1;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v19 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  if (*v9)
  {
    uint64_t v11 = v9[1];
    void *v8 = v10;
    v8[1] = v11;
  }
  else
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  if (*v14)
  {
    uint64_t v16 = v14[1];
    *uint64_t v13 = v15;
    v13[1] = v16;
  }
  else
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  }
  return a1;
}

uint64_t assignWithTake for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7);
  uint64_t v11 = *(void *)(a2 + v7);
  if (v10)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(v9 + 8);
      void *v8 = v11;
      v8[1] = v12;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = *(void *)(v9 + 8);
    void *v8 = v11;
    v8[1] = v13;
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
LABEL_8:
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *(void *)(a1 + v14);
  uint64_t v18 = *v16;
  if (!v17)
  {
    if (v18)
    {
      uint64_t v20 = v16[1];
      *uint64_t v15 = v18;
      v15[1] = v20;
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    return a1;
  }
  if (!v18)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v19 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v19;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_212864D54);
}

uint64_t sub_212864D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36));
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

uint64_t storeEnumTagSinglePayload for DataTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_212864E34);
}

uint64_t sub_212864E34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UTType();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = a2;
  }
  return result;
}

uint64_t static DataRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v34 = a4;
  uint64_t v7 = type metadata accessor for UTType();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DataRepresentation();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v30 - v12;
  uint64_t v33 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v30 - v12, a1, v11);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v32 = v10;
  v15(v10, v13, v7);
  uint64_t v16 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  v30[1] = v17;
  if (v18)
  {
    uint64_t v19 = (void *)swift_allocObject();
    uint64_t v20 = a2;
    v19[2] = a2;
    v19[3] = a3;
    v19[4] = v18;
    v19[5] = v17;
    int v31 = &_sx10Foundation4DataVs5Error_pIeghHnozo_xACsAD_pIeghHnrzo_16CoreTransferable0E0RzlTRTATu_0;
  }
  else
  {
    uint64_t v20 = a2;
    int v31 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v21 = a3;
  uint64_t v22 = (uint64_t *)&v13[*(int *)(v11 + 40)];
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  if (*v22)
  {
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v20;
    v25[3] = v21;
    v25[4] = v24;
    v25[5] = v23;
    char v26 = &_s10Foundation4DataVxs5Error_pIeghHgrzo_ACxsAD_pIeghHnrzo_16CoreTransferable0E0RzlTRTATu_0;
  }
  else
  {
    char v26 = 0;
    uint64_t v25 = 0;
  }
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v24);
  *(void *)&long long v29 = MEMORY[0x263F06F78];
  *((void *)&v29 + 1) = v21;
  *(void *)&long long v28 = v20;
  *((void *)&v28 + 1) = MEMORY[0x263F06F78];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v32, 0, 0, 2, (uint64_t)v31, (uint64_t)v19, (uint64_t)v26, (uint64_t)v25, v34, v28, v29, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v13, v11);
}

uint64_t type metadata accessor for DataRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2128651C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t DataRepresentation.init(_:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t result = type metadata accessor for DataRepresentation();
  uint64_t v14 = (void *)(a6 + *(int *)(result + 36));
  *uint64_t v14 = a2;
  v14[1] = a3;
  uint64_t v15 = (void *)(a6 + *(int *)(result + 40));
  *uint64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return DataRepresentation.init(_:exporting:importing:)(a1, a2, a3, 0, 0, a4);
}

uint64_t DataRepresentation.init(importedContentType:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return DataRepresentation.init(_:exporting:importing:)(a1, 0, 0, a2, a3, a4);
}

void protocol witness for TransferRepresentation.body.getter in conformance DataRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance DataRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  return static DataRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for DataRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for DataRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21286541C);
}

uint64_t sub_21286541C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36));
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

uint64_t storeEnumTagSinglePayload for DataRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128654FC);
}

uint64_t sub_2128654FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UTType();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = a2;
  }
  return result;
}

uint64_t SentTransferredFile.allowAccessingOriginalFile.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SentTransferredFile(0) + 20));
}

uint64_t type metadata accessor for SentTransferredFile(uint64_t a1)
{
  return type metadata accessor for SentTransferredFile(a1, (uint64_t *)&type metadata singleton initialization cache for SentTransferredFile);
}

uint64_t SentTransferredFile.init(_:allowAccessingOriginalFile:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for SentTransferredFile(0);
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t SentTransferredFile.file.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ReceivedTransferredFile.isOriginalFile.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ReceivedTransferredFile(0) + 20));
}

uint64_t type metadata accessor for ReceivedTransferredFile(uint64_t a1)
{
  return type metadata accessor for SentTransferredFile(a1, (uint64_t *)&type metadata singleton initialization cache for ReceivedTransferredFile);
}

uint64_t type metadata accessor for SentTransferredFile(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ReceivedTransferredFile.init(file:isOriginalFile:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for ReceivedTransferredFile(0);
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t static FileRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v32 = a2;
  uint64_t v33 = a4;
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for FileRepresentation();
  uint64_t v10 = *((void *)v9 - 1);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - v11;
  (*(void (**)(char *, uint64_t, int *))(v10 + 16))((char *)&v28 - v11, a1, v9);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v12, v5);
  uint64_t v13 = v9[10];
  uint64_t v14 = (uint64_t *)&v12[v9[9]];
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = v9[12];
  uint64_t v18 = (uint64_t *)&v12[v9[11]];
  uint64_t v19 = *v18;
  if (*v18) {
    uint64_t v20 = v18[1];
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v29 = v20;
  uint64_t v30 = v15;
  uint64_t v21 = *(void *)&v12[v17];
  if (v21) {
    uint64_t v22 = *(void *)&v12[v17 + 8];
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v28 = v22;
  int v23 = v12[v13];
  swift_bridgeObjectRetain();
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v19);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v21);
  uint64_t v24 = type metadata accessor for SentTransferredFile(0);
  *(void *)&long long v27 = type metadata accessor for ReceivedTransferredFile(0);
  *((void *)&v27 + 1) = v31;
  *((void *)&v26 + 1) = v24;
  *(void *)&long long v26 = v32;
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v8, v30, v16, v23, v19, v29, v21, v28, v33, v26, v27, (uint64_t)&protocol witness table for SentTransferredFile, (uint64_t)&protocol witness table for ReceivedTransferredFile);
  return (*(uint64_t (**)(char *, int *))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for FileRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t FileRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for FileRepresentation();
  uint64_t v15 = v14[10];
  uint64_t v16 = type metadata accessor for UTType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a7, a1, v16);
  *(unsigned char *)(a7 + v15) = a2;
  uint64_t v18 = (void *)(a7 + v14[9]);
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v19 = (void *)(a7 + v14[11]);
  *uint64_t v19 = a3;
  v19[1] = a4;
  uint64_t v20 = (void *)(a7 + v14[12]);
  *uint64_t v20 = a5;
  v20[1] = a6;
  return result;
}

uint64_t FileRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporting:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for FileRepresentation();
  uint64_t v11 = v10[10];
  uint64_t v12 = type metadata accessor for UTType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a5, a1, v12);
  *(unsigned char *)(a5 + v11) = a2;
  uint64_t v14 = (void *)(a5 + v10[9]);
  *uint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v15 = (void *)(a5 + v10[11]);
  *uint64_t v15 = a3;
  v15[1] = a4;
  uint64_t v16 = (void *)(a5 + v10[12]);
  *uint64_t v16 = 0;
  v16[1] = 0;
  return result;
}

uint64_t FileRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importing:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for FileRepresentation();
  uint64_t v11 = v10[10];
  uint64_t v12 = type metadata accessor for UTType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a5, a1, v12);
  *(unsigned char *)(a5 + v11) = a2;
  uint64_t v14 = (void *)(a5 + v10[9]);
  *uint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v15 = (void *)(a5 + v10[11]);
  *uint64_t v15 = 0;
  v15[1] = 0;
  uint64_t v16 = (void *)(a5 + v10[12]);
  *uint64_t v16 = a3;
  v16[1] = a4;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance FileRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance FileRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return static FileRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for FileRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void *initializeBufferWithCopyOfBuffer for SentTransferredFile(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for SentTransferredFile(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SentTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ReceivedTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2128660C4);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for ReceivedTransferredFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128661AC);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata completion function for SentTransferredFile()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata instantiation function for FileRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t type metadata completion function for FileRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for FileRepresentation(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UTType();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[9];
    uint64_t v9 = a3[10];
    unsigned int v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *unsigned int v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v13 = a3[11];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    if (v16)
    {
      uint64_t v17 = *((void *)v15 + 1);
      *uint64_t v14 = v16;
      v14[1] = v17;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
    uint64_t v19 = a3[12];
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    if (*v21)
    {
      uint64_t v22 = v21[1];
      *uint64_t v20 = *v21;
      v20[1] = v22;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    }
  }
  return a1;
}

uint64_t destroy for FileRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + *(int *)(a2 + 44))) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + *(int *)(a2 + 48)))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = (void *)(a1 + v7);
  unsigned int v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v12 = a3[11];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12);
  swift_bridgeObjectRetain();
  if (v15)
  {
    uint64_t v16 = *(void *)(v14 + 8);
    *uint64_t v13 = v15;
    v13[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  }
  uint64_t v17 = a3[12];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  if (*v19)
  {
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  return a1;
}

uint64_t assignWithCopy for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v10 = a3[11];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)(a1 + v10);
  uint64_t v14 = *(void *)(a2 + v10);
  if (v13)
  {
    if (v14)
    {
      uint64_t v15 = *(void *)(v12 + 8);
      *uint64_t v11 = v14;
      v11[1] = v15;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v14)
  {
    uint64_t v16 = *(void *)(v12 + 8);
    *uint64_t v11 = v14;
    v11[1] = v16;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
LABEL_8:
  uint64_t v17 = a3[12];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *(void *)(a1 + v17);
  uint64_t v21 = *v19;
  if (!v20)
  {
    if (v21)
    {
      uint64_t v23 = v19[1];
      *uint64_t v18 = v21;
      v18[1] = v23;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    return a1;
  }
  if (!v21)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v22 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = v10[1];
    *uint64_t v9 = v11;
    v9[1] = v12;
  }
  else
  {
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  }
  uint64_t v13 = a3[12];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[1];
    *uint64_t v14 = v16;
    v14[1] = v17;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  return a1;
}

uint64_t assignWithTake for FileRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12);
  if (*(void *)(a1 + v12))
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(v14 + 8);
      *uint64_t v13 = v15;
      v13[1] = v16;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v15)
  {
    uint64_t v17 = *(void *)(v14 + 8);
    *uint64_t v13 = v15;
    v13[1] = v17;
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
LABEL_8:
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *(void *)(a1 + v18);
  uint64_t v22 = *v20;
  if (!v21)
  {
    if (v22)
    {
      uint64_t v24 = v20[1];
      *uint64_t v19 = v22;
      v19[1] = v24;
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    return a1;
  }
  if (!v22)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v23 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v23;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_212866A1C);
}

uint64_t sub_212866A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
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

uint64_t storeEnumTagSinglePayload for FileRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_212866B00);
}

uint64_t sub_212866B00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UTType();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = a2;
  }
  return result;
}

uint64_t _TransferRepresentationValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t _TransferRepresentationValue.applying<A>(offset:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v14 = v6;
  uint64_t v15 = a4;
  uint64_t v16 = a1;
  _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v9, (uint64_t)partial apply for closure #1 in _TransferRepresentationValue.applying<A>(offset:to:), (uint64_t)v13, v6, MEMORY[0x263F8E628], a4, MEMORY[0x263F8E658], v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t partial apply for closure #1 in _TransferRepresentationValue.applying<A>(offset:to:)()
{
  return UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)();
}

uint64_t _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

void *__TupleType.indices.getter(void *result)
{
  if (*result != 769) {
    return 0;
  }
  if ((result[1] & 0x8000000000000000) == 0) {
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t __TupleType.type(at:)(uint64_t result, void *a2)
{
  if (*a2 != 769 || a2[1] <= result) {
    return (uint64_t)a2;
  }
  if (result + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)(2 * result - 0x1000000000000000) >> 61 == 7)
  {
    return a2[2 * result + 3];
  }
  __break(1u);
  return result;
}

Swift::Int __swiftcall __TupleType.offset(at:)(Swift::Int at)
{
  if (*(void *)(v1 + 8) > at)
  {
    if (at + 0x4000000000000000 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)(2 * at - 0x1000000000000000) >> 61 == 7)
    {
      return *(void *)(v1 + 16 * at + 32);
    }
    __break(1u);
  }
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance __TypeMetadata@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance __TypeMetadata(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t type metadata completion function for _TransferRepresentationValue()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _TransferRepresentationValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t initializeWithCopy for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithCopy for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t initializeWithTake for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for _TransferRepresentationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for _TransferRepresentationValue(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void storeEnumTagSinglePayload for _TransferRepresentationValue(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x2128675B8);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for _TransferRepresentationValue()
{
  return __swift_instantiateGenericMetadata();
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for __TupleType()
{
  return &type metadata for __TupleType;
}

ValueMetadata *type metadata accessor for __EmptyTypeMetadata()
{
  return &type metadata for __EmptyTypeMetadata;
}

uint64_t getEnumTagSinglePayload for __TupleType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for __TupleType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for __TypeMetadata()
{
  return &type metadata for __TypeMetadata;
}

uint64_t static FileTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v32 = a2;
  uint64_t v33 = a4;
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  size_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v9 = (int *)type metadata accessor for FileTransferRepresentation();
  uint64_t v10 = *((void *)v9 - 1);
  MEMORY[0x270FA5388](v9);
  unsigned int v12 = (char *)&v28 - v11;
  (*(void (**)(char *, uint64_t, int *))(v10 + 16))((char *)&v28 - v11, a1, v9);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v12, v5);
  uint64_t v13 = v9[10];
  unsigned int v14 = (uint64_t *)&v12[v9[9]];
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = v9[12];
  uint64_t v18 = (uint64_t *)&v12[v9[11]];
  uint64_t v19 = *v18;
  if (*v18) {
    uint64_t v20 = v18[1];
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v29 = v20;
  uint64_t v30 = v15;
  uint64_t v21 = *(void *)&v12[v17];
  if (v21) {
    uint64_t v22 = *(void *)&v12[v17 + 8];
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v28 = v22;
  int v23 = v12[v13];
  swift_bridgeObjectRetain();
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v19);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v21);
  uint64_t v24 = type metadata accessor for SentTransferredFile(0);
  *(void *)&long long v27 = type metadata accessor for ReceivedTransferredFile(0);
  *((void *)&v27 + 1) = v31;
  *((void *)&v26 + 1) = v24;
  *(void *)&long long v26 = v32;
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v8, v30, v16, v23, v19, v29, v21, v28, v33, v26, v27, (uint64_t)&protocol witness table for SentTransferredFile, (uint64_t)&protocol witness table for ReceivedTransferredFile);
  return (*(uint64_t (**)(char *, int *))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for FileTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v14 = (int *)type metadata accessor for FileTransferRepresentation();
  uint64_t v15 = v14[10];
  uint64_t v16 = type metadata accessor for UTType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a7, a1, v16);
  *(unsigned char *)(a7 + v15) = a2;
  uint64_t v18 = (void *)(a7 + v14[9]);
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v19 = (void *)(a7 + v14[11]);
  *uint64_t v19 = a3;
  v19[1] = a4;
  uint64_t v20 = (void *)(a7 + v14[12]);
  *uint64_t v20 = a5;
  v20[1] = a6;
  return result;
}

uint64_t FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  *(void *)(v14 + 24) = a6;

  return FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)(a1, a2, a3, a4, (uint64_t)&async function pointer to partial apply for closure #1 in FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:), v14, a7);
}

uint64_t sub_212867ABC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in FileTransferRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporter:)()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = Transferable.file(contentType:fileHandler:);
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(exportedContentType:exporter:), 0, 0);
}

uint64_t FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  *(void *)(v14 + 24) = a6;

  return FileTransferRepresentation.init(contentType:shouldAttemptToOpenInPlace:exporter:importer:)(a1, a2, (uint64_t)&async function pointer to partial apply for closure #1 in FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:), v14, a3, a4, a7);
}

uint64_t sub_212867C1C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in FileTransferRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importer:)()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return MEMORY[0x270FA2498](closure #1 in DataTransferRepresentation.init(importedContentType:importer:), 0, 0);
}

void protocol witness for TransferRepresentation.body.getter in conformance FileTransferRepresentation<A>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance FileTransferRepresentation<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  return static FileTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t instantiation function for generic protocol witness table for FileTransferRepresentation<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata completion function for FileTransferRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FileTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_212867E10);
}

uint64_t sub_212867E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    size_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
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

uint64_t storeEnumTagSinglePayload for FileTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_212867EF4);
}

uint64_t sub_212867EF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UTType();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = a2;
  }
  return result;
}

uint64_t CodableTransferRepresentation.init<>(for:contentType:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v20 = a3;
  uint64_t v10 = type metadata accessor for UTType();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  uint64_t v14 = type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t v22 = JSONEncoder.init()();
  uint64_t v15 = type metadata accessor for JSONDecoder();
  swift_allocObject();
  uint64_t v21 = JSONDecoder.init()();
  uint64_t v16 = lazy protocol witness table accessor for type JSONEncoder and conformance JSONEncoder(&lazy protocol witness table cache variable for type JSONEncoder and conformance JSONEncoder, MEMORY[0x263F061E0]);
  uint64_t v17 = lazy protocol witness table accessor for type JSONEncoder and conformance JSONEncoder(&lazy protocol witness table cache variable for type JSONDecoder and conformance JSONDecoder, MEMORY[0x263F06128]);
  CodableTransferRepresentation.init(for:contentType:encoder:decoder:)(v17, (uint64_t)v13, (uint64_t)&v22, (uint64_t)&v21, a2, v14, v15, v20, a6, a4, v19, v16, v17);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
}

uint64_t CodableTransferRepresentation.init(for:contentType:encoder:decoder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v63 = a4;
  uint64_t v64 = a8;
  uint64_t v60 = a5;
  uint64_t v62 = a13;
  uint64_t v56 = a12;
  uint64_t v57 = a3;
  uint64_t v65 = *(void *)(a7 - 8);
  uint64_t v59 = *(void *)(v65 + 64);
  uint64_t v54 = a11;
  uint64_t v55 = a10;
  uint64_t v17 = MEMORY[0x270FA5388](a1);
  uint64_t v58 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for UTType();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32);
  uint64_t v53 = a9;
  v24(a9, a2, v23);
  uint64_t v25 = v60;
  uint64_t v66 = v60;
  uint64_t v67 = a6;
  uint64_t v68 = a7;
  uint64_t v69 = v64;
  uint64_t v70 = a10;
  uint64_t v71 = a11;
  uint64_t v72 = a12;
  uint64_t v73 = v62;
  uint64_t v26 = type metadata accessor for CodableTransferRepresentation();
  uint64_t v27 = *(int *)(v26 + 84);
  uint64_t v28 = v26;
  uint64_t v61 = v26;
  uint64_t v29 = v57;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(a9 + v27, v57, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(a9 + *(int *)(v28 + 88), v63, a7);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
  v30(v22, v29, a6);
  unint64_t v31 = (*(unsigned __int8 *)(v20 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v32 = (uint64_t (*)())swift_allocObject();
  *((void *)v32 + 2) = v25;
  *((void *)v32 + 3) = a6;
  uint64_t v33 = a6;
  uint64_t v52 = a6;
  uint64_t v34 = v64;
  *((void *)v32 + 4) = a7;
  *((void *)v32 + 5) = v34;
  uint64_t v36 = v54;
  uint64_t v35 = v55;
  *((void *)v32 + 6) = v55;
  *((void *)v32 + 7) = v36;
  uint64_t v37 = (char *)v32 + v31;
  uint64_t v38 = v56;
  uint64_t v39 = v62;
  *((void *)v32 + 8) = v56;
  *((void *)v32 + 9) = v39;
  v30(v37, (uint64_t)v22, v33);
  uint64_t v40 = v53;
  uint64_t v41 = (uint64_t (**)())(v53 + *(int *)(v61 + 92));
  *uint64_t v41 = partial apply for closure #1 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v41[1] = v32;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 32);
  v65 += 32;
  uint64_t v42 = v65;
  uint64_t v44 = v58;
  v43(v58, v63, a7);
  unint64_t v45 = (*(unsigned __int8 *)(v42 + 48) + 80) & ~(unint64_t)*(unsigned __int8 *)(v42 + 48);
  uint64_t v46 = (uint64_t (*)())swift_allocObject();
  uint64_t v47 = v52;
  *((void *)v46 + 2) = v60;
  *((void *)v46 + 3) = v47;
  uint64_t v48 = v64;
  *((void *)v46 + 4) = a7;
  *((void *)v46 + 5) = v48;
  *((void *)v46 + 6) = v35;
  *((void *)v46 + 7) = v36;
  *((void *)v46 + 8) = v38;
  *((void *)v46 + 9) = v39;
  uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v43)((char *)v46 + v45, v44, a7);
  uint64_t v50 = (uint64_t (**)())(v40 + *(int *)(v61 + 96));
  *uint64_t v50 = partial apply for closure #2 in CodableRepresentation.init(for:contentType:encoder:decoder:);
  v50[1] = v46;
  return result;
}

uint64_t type metadata accessor for CodableTransferRepresentation()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21286851C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 80) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2128685A4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 80) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t static CodableTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v56 = a4;
  uint64_t v57 = a7;
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v50 = a1;
  uint64_t v53 = a8;
  uint64_t v58 = a9;
  uint64_t v49 = type metadata accessor for UTType();
  uint64_t v16 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v18;
  uint64_t v61 = a2;
  uint64_t v62 = a3;
  uint64_t v63 = a4;
  uint64_t v64 = a5;
  uint64_t v19 = a5;
  uint64_t v65 = a6;
  uint64_t v66 = a7;
  uint64_t v67 = a9;
  uint64_t v68 = a10;
  uint64_t v20 = type metadata accessor for CodableTransferRepresentation();
  uint64_t v60 = v20;
  uint64_t v52 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v48 - v21;
  uint64_t v59 = (char *)&v48 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))((char *)&v48 - v21, v50, v20);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, v22, v49);
  uint64_t v24 = (uint64_t *)&v22[*(int *)(v20 + 92)];
  uint64_t v25 = v24[1];
  uint64_t v49 = *v24;
  uint64_t v50 = v25;
  uint64_t v26 = (void *)swift_allocObject();
  uint64_t v28 = v54;
  uint64_t v27 = v55;
  v26[2] = v54;
  v26[3] = v27;
  uint64_t v30 = v56;
  uint64_t v29 = v57;
  v26[4] = v56;
  v26[5] = a5;
  v26[6] = a6;
  v26[7] = v29;
  uint64_t v31 = v58;
  v26[8] = v58;
  v26[9] = a10;
  uint64_t v48 = a10;
  v26[10] = v49;
  v26[11] = v25;
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v28;
  v32[3] = v27;
  v32[4] = v30;
  v32[5] = a5;
  uint64_t v33 = v30;
  v32[6] = a6;
  v32[7] = v29;
  uint64_t v34 = a6;
  v32[8] = v31;
  v32[9] = a10;
  v32[10] = &_sx10Foundation4DataVs5Error_pIeghnozo_xACsAD_pIeghHnozo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0;
  v32[11] = v26;
  uint64_t v35 = &v59[*(int *)(v60 + 96)];
  uint64_t v36 = *(void *)v35;
  uint64_t v37 = *((void *)v35 + 1);
  uint64_t v38 = (void *)swift_allocObject();
  uint64_t v39 = v54;
  uint64_t v40 = v55;
  v38[2] = v54;
  v38[3] = v40;
  v38[4] = v33;
  v38[5] = v19;
  v38[6] = v34;
  uint64_t v41 = v34;
  uint64_t v42 = v57;
  uint64_t v38[7] = v57;
  v38[8] = v31;
  uint64_t v43 = v48;
  v38[9] = v48;
  v38[10] = v36;
  v38[11] = v37;
  uint64_t v44 = (void *)swift_allocObject();
  void v44[2] = v39;
  v44[3] = v40;
  v44[4] = v56;
  v44[5] = v19;
  v44[6] = v41;
  v44[7] = v42;
  v44[8] = v58;
  v44[9] = v43;
  v44[10] = &_s10Foundation4DataVxs5Error_pIeghgrzo_ACxsAD_pIeghHgrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0;
  v44[11] = v38;
  swift_retain();
  swift_retain();
  *(void *)&long long v47 = MEMORY[0x263F06F78];
  *((void *)&v47 + 1) = v19;
  *(void *)&long long v46 = v39;
  *((void *)&v46 + 1) = MEMORY[0x263F06F78];
  _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporter:importer:)((uint64_t)v51, 0, 0, 2, (uint64_t)&_sx10Foundation4DataVs5Error_pIeghHnozo_xACsAD_pIeghHnrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0, (uint64_t)v32, (uint64_t)&_s10Foundation4DataVxs5Error_pIeghHgrzo_ACxsAD_pIeghHnrzo_16CoreTransferable0E0RzSeRzSERz7Combine15TopLevelEncoderR_AG0gH7DecoderR0_AC6OutputRt_AC5InputRt0_r1_lTRTATu_0, (uint64_t)v44, v53, v46, v47, (uint64_t)&protocol witness table for Data, (uint64_t)&protocol witness table for Data);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v59, v60);
}

uint64_t sub_2128689B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void protocol witness for TransferRepresentation.body.getter in conformance CodableTransferRepresentation<A, B, C>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance CodableTransferRepresentation<A, B, C>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, void *a3@<X8>)
{
  return static CodableTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a3, a2[8], a2[9]);
}

uint64_t instantiation function for generic protocol witness table for CodableTransferRepresentation<A, B, C>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CodableTransferRepresentation(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  uint64_t v13 = *(void *)(v9 - 8);
  if (v12 <= v8) {
    unsigned int v14 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v15 = *(unsigned int *)(v13 + 84);
  uint64_t v16 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = *(void *)(v10 + 64);
  uint64_t v18 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = *(void *)(v13 + 64);
  if (v15 <= v14) {
    unsigned int v20 = v14;
  }
  else {
    unsigned int v20 = v15;
  }
  if (v20 <= 0x7FFFFFFF) {
    unsigned int v20 = 0x7FFFFFFF;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v21 = *(void *)(*(void *)(v6 - 8) + 64) + v16;
  uint64_t v22 = v19 + 7;
  if (v20 < a2)
  {
    unint64_t v23 = ((((v22 + ((v17 + v18 + (v21 & ~v16)) & ~v18)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    if ((v23 & 0xFFFFFFF8) != 0) {
      unsigned int v24 = 2;
    }
    else {
      unsigned int v24 = a2 - v20 + 1;
    }
    if (v24 >= 0x10000) {
      unsigned int v25 = 4;
    }
    else {
      unsigned int v25 = 2;
    }
    if (v24 < 0x100) {
      unsigned int v25 = 1;
    }
    if (v24 >= 2) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    switch(v26)
    {
      case 1:
        int v27 = *((unsigned __int8 *)a1 + v23);
        if (!*((unsigned char *)a1 + v23)) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v27 = *(unsigned __int16 *)((char *)a1 + v23);
        if (*(_WORD *)((char *)a1 + v23)) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x212868D9CLL);
      case 4:
        int v27 = *(_DWORD *)((char *)a1 + v23);
        if (!v27) {
          break;
        }
LABEL_27:
        int v29 = v27 - 1;
        if ((v23 & 0xFFFFFFF8) != 0)
        {
          int v29 = 0;
          int v30 = *a1;
        }
        else
        {
          int v30 = 0;
        }
        return v20 + (v30 | v29) + 1;
      default:
        break;
    }
  }
  if (v8 == v20)
  {
    uint64_t v31 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v32 = a1;
    uint64_t v33 = *(unsigned int *)(v7 + 84);
    uint64_t v34 = v6;
    return v31(v32, v33, v34);
  }
  unint64_t v35 = ((unint64_t)a1 + v21) & ~v16;
  if (v12 == v20)
  {
    uint64_t v36 = *(uint64_t (**)(unint64_t))(v11 + 48);
    return v36(v35);
  }
  else
  {
    uint64_t v32 = (_DWORD *)((v35 + v17 + v18) & ~v18);
    if (v15 == v20)
    {
      uint64_t v31 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
      uint64_t v33 = v15;
      uint64_t v34 = v9;
      return v31(v32, v33, v34);
    }
    unint64_t v37 = *(void *)(((unint64_t)v32 + v22) & 0xFFFFFFFFFFFFFFF8);
    if (v37 >= 0xFFFFFFFF) {
      LODWORD(v37) = -1;
    }
    return (v37 + 1);
  }
}

void storeEnumTagSinglePayload for CodableTransferRepresentation(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(type metadata accessor for UTType() - 8);
  uint64_t v9 = v8;
  unsigned int v10 = *(_DWORD *)(v8 + 84);
  uint64_t v11 = *(void *)(a4 + 32);
  uint64_t v12 = *(void *)(*(void *)(a4 + 24) - 8);
  uint64_t v13 = v12;
  uint64_t v14 = *(unsigned int *)(v12 + 84);
  uint64_t v15 = *(void *)(v11 - 8);
  if (v14 <= v10) {
    unsigned int v16 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v16 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v17 = *(void *)(v11 - 8);
  uint64_t v18 = *(unsigned int *)(v15 + 84);
  uint64_t v19 = *(void *)(v8 + 64);
  uint64_t v20 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = *(void *)(v12 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v23 = *(void *)(v15 + 64);
  if (v18 <= v16) {
    unsigned int v24 = v16;
  }
  else {
    unsigned int v24 = v18;
  }
  if (v24 <= 0x7FFFFFFF) {
    unsigned int v24 = 0x7FFFFFFF;
  }
  uint64_t v25 = v23 + 7;
  size_t v26 = ((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v24 >= a3)
  {
    int v29 = 0;
    int v30 = a2 - v24;
    if (a2 <= v24)
    {
LABEL_22:
      switch(v29)
      {
        case 1:
          *((unsigned char *)a1 + v26) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_35;
        case 2:
          *(_WORD *)((char *)a1 + v26) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_35;
        case 3:
          goto LABEL_56;
        case 4:
          *(_DWORD *)((char *)a1 + v26) = 0;
          goto LABEL_34;
        default:
LABEL_34:
          if (a2)
          {
LABEL_35:
            if (v10 == v24)
            {
              uint64_t v33 = *(void (**)(_DWORD *, uint64_t))(v9 + 56);
              v33(a1, a2);
            }
            else
            {
              unint64_t v34 = ((unint64_t)a1 + v19 + v20) & ~v20;
              if (v14 == v24)
              {
                unint64_t v35 = *(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 56);
                v35(v34, a2, v14);
              }
              else
              {
                unint64_t v36 = (v34 + v21 + v22) & ~v22;
                if (v18 == v24)
                {
                  unint64_t v37 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
                  v37(v36, a2, v18, v11);
                }
                else
                {
                  uint64_t v38 = (void *)((v25 + v36) & 0xFFFFFFFFFFFFFFF8);
                  if ((a2 & 0x80000000) != 0)
                  {
                    uint64_t v39 = a2 ^ 0x80000000;
                    v38[1] = 0;
                  }
                  else
                  {
                    uint64_t v39 = (a2 - 1);
                  }
                  *uint64_t v38 = v39;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v27 = a3 - v24 + 1;
    else {
      unsigned int v27 = 2;
    }
    if (v27 >= 0x10000) {
      int v28 = 4;
    }
    else {
      int v28 = 2;
    }
    if (v27 < 0x100) {
      int v28 = 1;
    }
    if (v27 >= 2) {
      int v29 = v28;
    }
    else {
      int v29 = 0;
    }
    int v30 = a2 - v24;
    if (a2 <= v24) {
      goto LABEL_22;
    }
  }
  if (((((v25 + ((v21 + v22 + ((v19 + v20) & ~v20)) & ~v22)) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v31 = v30;
  else {
    int v31 = 1;
  }
  if (v26)
  {
    int v32 = ~v24 + a2;
    bzero(a1, v26);
    *a1 = v32;
  }
  switch(v29)
  {
    case 1:
      *((unsigned char *)a1 + v26) = v31;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v26) = v31;
      break;
    case 3:
LABEL_56:
      __break(1u);
      JUMPOUT(0x212869118);
    case 4:
      *(_DWORD *)((char *)a1 + v26) = v31;
      break;
    default:
      return;
  }
}

uint64_t _TransferRepresentationOutputs.storage.getter()
{
  return swift_bridgeObjectRetain();
}

CoreTransferable::_TransferRepresentationOutputs __swiftcall _TransferRepresentationOutputs.init()()
{
  *uint64_t v0 = MEMORY[0x263F8EE78];
  return result;
}

CoreTransferable::_TransferRepresentationOutputs __swiftcall _TransferRepresentationOutputs.init(_:)(CoreTransferable::_TransferRepresentationOutputs result)
{
  v1->storage._rawValue = result.storage._rawValue;
  return result;
}

uint64_t _TransferRepresentationOutputs.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, long long a10, long long a11, uint64_t a12, uint64_t a13)
{
  int v32 = a4;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v33 = a9;
  long long v28 = a11;
  long long v29 = a10;
  uint64_t v26 = a13;
  uint64_t v27 = a12;
  uint64_t v18 = type metadata accessor for UTType();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ResolvedTransferRepresentation>);
  uint64_t v22 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_21287DA60;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(a5);
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(a7);
  ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)((uint64_t)v21, v30, v31, v32, a5, a6, a7, a8, v24 + v23, v29, *((uint64_t *)&v29 + 1), v28, *((uint64_t *)&v28 + 1), v27, v26);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a7);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(a5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  *uint64_t v33 = v24;
  return result;
}

uint64_t type metadata accessor for ResolvedTransferRepresentation()
{
  uint64_t result = type metadata singleton initialization cache for ResolvedTransferRepresentation;
  if (!type metadata singleton initialization cache for ResolvedTransferRepresentation) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)a9 = 0;
  *(void *)(a9 + 8) = 0;
  *(unsigned char *)(a9 + 16) = -1;
  uint64_t v20 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v21 = (uint64_t *)(a9 + v20[8]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  uint64_t v22 = (uint64_t *)(a9 + v20[9]);
  *uint64_t v22 = 0;
  v22[1] = 0;
  unint64_t v23 = (void *)(a9 + v20[10]);
  *unint64_t v23 = 0;
  v23[1] = 0;
  uint64_t v24 = v20[11];
  *(void *)(a9 + v24) = *(void *)TransferRepresentationVisibility.all.unsafeMutableAddressor();
  uint64_t v25 = (void *)(a9 + v20[12]);
  *uint64_t v25 = 0;
  v25[1] = 0;
  uint64_t v26 = a9 + v20[5];
  uint64_t v27 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v26, a1, v27);
  if (a3)
  {
    *(void *)a9 = a2;
    *(void *)(a9 + 8) = a3;
    *(unsigned char *)(a9 + 16) = 0;
  }
  *(unsigned char *)(a9 + v20[6]) = a4;
  long long v28 = (void *)(a9 + v20[7]);
  *long long v28 = a11;
  v28[1] = a14;
  if (a5)
  {
    long long v29 = (void *)swift_allocObject();
    v29[2] = a10;
    v29[3] = a11;
    v29[4] = a12;
    v29[5] = a13;
    v29[6] = a14;
    v29[7] = a15;
    v29[8] = a5;
    v29[9] = a6;
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v21);
    uint64_t v30 = &async function pointer to partial apply for closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  else
  {
    uint64_t v30 = 0;
    long long v29 = 0;
  }
  *uint64_t v21 = (uint64_t)v30;
  v21[1] = (uint64_t)v29;
  if (a7)
  {
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = a10;
    v31[3] = a11;
    v31[4] = a12;
    v31[5] = a13;
    v31[6] = a14;
    v31[7] = a15;
    v31[8] = a7;
    v31[9] = a8;
    int v32 = &async function pointer to partial apply for closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  else
  {
    int v32 = 0;
    uint64_t v31 = 0;
  }
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v22);
  *uint64_t v22 = (uint64_t)v32;
  v22[1] = (uint64_t)v31;
  return result;
}

Swift::Void __swiftcall _TransferRepresentationOutputs.append(_:)(CoreTransferable::_TransferRepresentationOutputs a1)
{
  size_t v1 = swift_bridgeObjectRetain();

  specialized Array.append<A>(contentsOf:)(v1);
}

size_t specialized Array.append<A>(contentsOf:)(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v11, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    void v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t _TransferRepresentationOutputs.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[2] = *v3;
  v10[2] = a3;
  v10[3] = a1;
  v10[4] = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ResolvedTransferRepresentation]);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  unint64_t v7 = lazy protocol witness table accessor for type [ResolvedTransferRepresentation] and conformance [A]();
  uint64_t v8 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed ResolvedTransferRepresentation) -> (@out A, @error @owned Error), (uint64_t)v10, v5, a3, v6, v7, MEMORY[0x263F8E4E0], (uint64_t)v11);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = dispatch thunk of Collection.count.getter();
  if (!v18) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v19 = v18;
  uint64_t v43 = Array.init()();
  uint64_t v32 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v19);
  uint64_t v36 = v8;
  uint64_t result = dispatch thunk of Collection.startIndex.getter();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v34 = (void (**)(char *))(v33 + 2);
    unint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v22 = v12;
      unint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t (*ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(uint64_t a1))(unsigned char *)
{
  uint64_t v2 = *(uint64_t (**)(unsigned char *))v1;
  uint64_t v3 = *(void *)(v1 + 8);
  if (*(unsigned char *)(v1 + 16))
  {
    outlined init with copy of Transferable?(a1, (uint64_t)&v6);
    if (v7)
    {
      outlined init with take of Transferable(&v6, (uint64_t)v8);
      swift_retain();
      uint64_t v4 = v2(v8);
      outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage((uint64_t)v2, v3, 1);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
      return (uint64_t (*)(unsigned char *))v4;
    }
    else
    {
      outlined destroy of Transferable?((uint64_t)&v6);
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t ResolvedTransferRepresentation.suggestedFileNameStorage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage?(v2, v3, v4);
}

uint64_t ResolvedTransferRepresentation.suggestedFileNameStorage.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage?(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.suggestedFileNameStorage.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 20);
  uint64_t v4 = type metadata accessor for UTType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t ResolvedTransferRepresentation.contentType.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 20);
  uint64_t v4 = type metadata accessor for UTType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*ResolvedTransferRepresentation.contentType.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 24));
}

uint64_t ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.setter(char a1)
{
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.shouldAttemptToOpenInPlace.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.representationType.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 28));
}

uint64_t ResolvedTransferRepresentation.representationType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  long long v6 = (void *)(v2 + *(int *)(result + 28));
  *long long v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.representationType.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.exporting : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v4 = *v3;
  if (*v3) {
    uint64_t v5 = v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v4;
  a2[1] = v5;

  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.exporting : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    uint64_t v3 = a1[1];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v5 = *v4;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v2);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v5);
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t ResolvedTransferRepresentation.exporting.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.exporting.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.exporting.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.importing : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  uint64_t v4 = *v3;
  if (*v3) {
    uint64_t v5 = v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = v4;
  a2[1] = v5;

  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.importing : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    uint64_t v3 = a1[1];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  uint64_t v5 = *v4;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v2);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v5);
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t ResolvedTransferRepresentation.importing.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.importing.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 36));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.importing.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t key path getter for ResolvedTransferRepresentation.exportingCondition : ResolvedTransferRepresentation@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (*v3)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@unowned Bool, @error @owned Error);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;

  return outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v4);
}

uint64_t key path setter for ResolvedTransferRepresentation.exportingCondition : ResolvedTransferRepresentation(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@out Bool, @error @owned Error);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  uint64_t v8 = *v7;
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v3);
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v8);
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  return result;
}

uint64_t ResolvedTransferRepresentation.exportingCondition.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v1);
  return v1;
}

uint64_t ResolvedTransferRepresentation.exportingCondition.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 40));
  uint64_t result = outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.exportingCondition.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.visibility.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  *a1 = *(void *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t ResolvedTransferRepresentation.visibility.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for ResolvedTransferRepresentation();
  *(void *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.visibility.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t ResolvedTransferRepresentation.suggestedFileName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResolvedTransferRepresentation.suggestedFileName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 48));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ResolvedTransferRepresentation.suggestedFileName.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a6;
  v6[18] = v11;
  v6[15] = a4;
  v6[16] = a5;
  v6[13] = a2;
  v6[14] = a3;
  v6[12] = a1;
  uint64_t v8 = type metadata accessor for Optional();
  v6[19] = v8;
  v6[20] = *(void *)(v8 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = *(void *)(a5 - 8);
  v6[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:), 0, 0);
}

uint64_t closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)()
{
  outlined init with copy of Transferable(*(void *)(v0 + 104), v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v2 = *(void *)(v0 + 176);
    uint64_t v1 = *(void *)(v0 + 184);
    uint64_t v3 = *(void *)(v0 + 168);
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v5 = *(int **)(v0 + 112);
    uint64_t v6 = *(void *)(v0 + 96);
    long long v19 = *(_OWORD *)(v0 + 136);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    *(_OWORD *)(v6 + 24) = v19;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v6);
    uint64_t v20 = (uint64_t (*)(uint64_t *, uint64_t))((char *)v5 + *v5);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v8;
    void *v8 = v0;
    v8[1] = closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
    uint64_t v9 = *(void *)(v0 + 184);
    return v20(boxed_opaque_existential_1, v9);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 168);
    uint64_t v12 = *(void *)(v0 + 152);
    uint64_t v13 = *(void *)(v0 + 160);
    uint64_t v14 = *(void *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 176) + 56))(v11, 1, 1, *(void *)(v0 + 128));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    outlined init with copy of Transferable(v14, v0 + 56);
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0x756F662074756220;
    v16._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v16);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
    swift_getDynamicType();
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._object = (void *)0xE90000000000002ELL;
    v18._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v18);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  else {
    uint64_t v2 = closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[12];
  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[16]);
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[17] = a7;
  v8[18] = a8;
  v8[15] = a4;
  v8[16] = a5;
  v8[13] = a2;
  v8[14] = a3;
  v8[12] = a1;
  uint64_t v10 = type metadata accessor for Optional();
  v8[19] = v10;
  v8[20] = *(void *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = *(void *)(a7 - 8);
  v8[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:), 0, 0);
}

uint64_t closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)()
{
  outlined init with copy of Transferable(v0[13], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[22];
    uint64_t v1 = v0[23];
    uint64_t v3 = v0[21];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[18];
    uint64_t v6 = v0[16];
    uint64_t v7 = (int *)v0[14];
    uint64_t v8 = (uint64_t *)v0[12];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v8[3] = v6;
    v8[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
    uint64_t v21 = (uint64_t (*)(uint64_t *, uint64_t))((char *)v7 + *v7);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[24] = v10;
    *uint64_t v10 = v0;
    v10[1] = closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
    uint64_t v11 = v0[23];
    return v21(boxed_opaque_existential_1, v11);
  }
  else
  {
    uint64_t v13 = v0[21];
    uint64_t v14 = v0[19];
    uint64_t v15 = v0[20];
    uint64_t v16 = v0[13];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[22] + 56))(v13, 1, 1, v0[17]);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    outlined init with copy of Transferable(v16, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 0x756F662074756220;
    v18._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v18);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v19._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._object = (void *)0xE90000000000002ELL;
    v20._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v20);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  else {
    uint64_t v2 = closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[12];
  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[17]);
  __swift_deallocate_boxed_opaque_existential_1(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_21286B38C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t partial apply for closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = v2[8];
  uint64_t v9 = v2[9];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = Transferable.file(contentType:fileHandler:);
  return closure #2 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(a1, a2, v10, v9, v6, v11, v7, v8);
}

uint64_t partial apply for closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[8];
  uint64_t v8 = v2[9];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in ResolvedTransferRepresentation.init<A, B, C>(contentType:suggestedFileName:shouldAttemptToOpenInPlace:exporting:importing:)(a1, a2, v9, v8, v6, v7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed ResolvedTransferRepresentation) -> (@out A, @error @owned Error)(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 24))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [ResolvedTransferRepresentation] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A];
  if (!lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [ResolvedTransferRepresentation]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [ResolvedTransferRepresentation] and conformance [A]);
  }
  return result;
}

uint64_t outlined init with copy of Transferable?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Transferable?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with take of Transferable(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

ValueMetadata *type metadata accessor for _TransferRepresentationOutputs()
{
  return &type metadata for _TransferRepresentationOutputs;
}

unint64_t initializeBufferWithCopyOfBuffer for ResolvedTransferRepresentation(unint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *(void *)a2;
    *(void *)unint64_t v4 = *(void *)a2;
    unint64_t v4 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int v7 = *(unsigned __int8 *)(a2 + 16);
    if (v7 == 255)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    }
    else
    {
      char v9 = v7 & 1;
      uint64_t v10 = *(void *)a2;
      uint64_t v11 = *(void *)(a2 + 8);
      outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a2, v11, v7 & 1);
      *(void *)unint64_t v4 = v10;
      *(void *)(v4 + 8) = v11;
      *(unsigned char *)(v4 + 16) = v9;
    }
    uint64_t v12 = a3[5];
    uint64_t v13 = v4 + v12;
    uint64_t v14 = a2 + v12;
    uint64_t v15 = type metadata accessor for UTType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    *(unsigned char *)(v4 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
    *(_OWORD *)(v4 + v16) = *(_OWORD *)(a2 + v16);
    uint64_t v17 = a3[8];
    Swift::String v18 = (void *)(v4 + v17);
    Swift::String v19 = (void *)(a2 + v17);
    if (*v19)
    {
      uint64_t v20 = v19[1];
      *Swift::String v18 = *v19;
      v18[1] = v20;
      swift_retain();
    }
    else
    {
      *(_OWORD *)Swift::String v18 = *(_OWORD *)v19;
    }
    uint64_t v21 = a3[9];
    uint64_t v22 = (void *)(v4 + v21);
    unint64_t v23 = (void *)(a2 + v21);
    if (*v23)
    {
      uint64_t v24 = v23[1];
      *uint64_t v22 = *v23;
      v22[1] = v24;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    }
    uint64_t v25 = a3[10];
    uint64_t v26 = (void *)(v4 + v25);
    uint64_t v27 = (void *)(a2 + v25);
    if (*v27)
    {
      uint64_t v28 = v27[1];
      *uint64_t v26 = *v27;
      v26[1] = v28;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    }
    uint64_t v29 = a3[12];
    *(void *)(v4 + a3[11]) = *(void *)(a2 + a3[11]);
    uint64_t v30 = (void *)(v4 + v29);
    uint64_t v31 = (void *)(a2 + v29);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ResolvedTransferRepresentation(uint64_t a1, int *a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 16);
  if (v4 != 255) {
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a1, *(void *)(a1 + 8), v4 & 1);
  }
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  if (*(void *)(a1 + a2[8])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[9])) {
    swift_release();
  }
  if (*(void *)(a1 + a2[10])) {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ResolvedTransferRepresentation(uint64_t a1, uint64_t *a2, int *a3)
{
  int v6 = *((unsigned __int8 *)a2 + 16);
  if (v6 == 255)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  }
  else
  {
    char v7 = v6 & 1;
    uint64_t v8 = *a2;
    uint64_t v9 = a2[1];
    outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*a2, v9, v6 & 1);
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = v9;
    *(unsigned char *)(a1 + 16) = v7;
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t)a2 + v10;
  uint64_t v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)((char *)a2 + v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v15);
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
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)((char *)a2 + v19);
  if (*v21)
  {
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  }
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)((char *)a2 + v23);
  if (*v25)
  {
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  }
  uint64_t v27 = a3[12];
  *(void *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ResolvedTransferRepresentation(uint64_t a1, long long *a2, int *a3)
{
  int v6 = *((unsigned __int8 *)a2 + 16);
  if (*(unsigned __int8 *)(a1 + 16) == 255)
  {
    if (v6 == 255)
    {
      long long v8 = *a2;
      *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
      *(_OWORD *)a1 = v8;
    }
    else
    {
      char v15 = v6 & 1;
      uint64_t v16 = *(void *)a2;
      uint64_t v17 = *((void *)a2 + 1);
      outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a2, v17, v6 & 1);
      *(void *)a1 = v16;
      *(void *)(a1 + 8) = v17;
      *(unsigned char *)(a1 + 16) = v15;
    }
  }
  else if (v6 == 255)
  {
    outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(a1);
    char v7 = *((unsigned char *)a2 + 16);
    *(_OWORD *)a1 = *a2;
    *(unsigned char *)(a1 + 16) = v7;
  }
  else
  {
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)a2;
    uint64_t v11 = *((void *)a2 + 1);
    outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a2, v11, v6 & 1);
    uint64_t v12 = *(void *)a1;
    uint64_t v13 = *(void *)(a1 + 8);
    char v14 = *(unsigned char *)(a1 + 16);
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v11;
    *(unsigned char *)(a1 + 16) = v9;
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v12, v13, v14);
  }
  uint64_t v18 = a3[5];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t)a2 + v18;
  uint64_t v21 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *(unsigned char *)(a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(_OWORD *)(a1 + a3[7]) = *(long long *)((char *)a2 + a3[7]);
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t)a2 + v22;
  uint64_t v25 = *(void *)(a1 + v22);
  uint64_t v26 = *(void *)((char *)a2 + v22);
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = *(void *)(v24 + 8);
      *uint64_t v23 = v26;
      v23[1] = v27;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v26)
  {
    uint64_t v28 = *(void *)(v24 + 8);
    *uint64_t v23 = v26;
    v23[1] = v28;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
LABEL_15:
  uint64_t v29 = a3[9];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t)a2 + v29;
  uint64_t v32 = *(void *)(a1 + v29);
  uint64_t v33 = *(void *)((char *)a2 + v29);
  if (v32)
  {
    if (v33)
    {
      uint64_t v34 = *(void *)(v31 + 8);
      *uint64_t v30 = v33;
      v30[1] = v34;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v33)
  {
    uint64_t v35 = *(void *)(v31 + 8);
    *uint64_t v30 = v33;
    v30[1] = v35;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
LABEL_22:
  uint64_t v36 = a3[10];
  unint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (uint64_t)a2 + v36;
  uint64_t v39 = *(void *)(a1 + v36);
  uint64_t v40 = *(void *)((char *)a2 + v36);
  if (!v39)
  {
    if (v40)
    {
      uint64_t v42 = *(void *)(v38 + 8);
      *unint64_t v37 = v40;
      v37[1] = v42;
      swift_retain();
      goto LABEL_29;
    }
LABEL_28:
    *(_OWORD *)unint64_t v37 = *(_OWORD *)v38;
    goto LABEL_29;
  }
  if (!v40)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v41 = *(void *)(v38 + 8);
  *unint64_t v37 = v40;
  v37[1] = v41;
  swift_retain();
  swift_release();
LABEL_29:
  *(void *)(a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  uint64_t v43 = a3[12];
  uint64_t v44 = (void *)(a1 + v43);
  unint64_t v45 = (void *)((char *)a2 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    *uint64_t v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  if (*v18)
  {
    uint64_t v20 = v18[1];
    *uint64_t v17 = v19;
    v17[1] = v20;
  }
  else
  {
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  }
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  if (*v23)
  {
    uint64_t v25 = v23[1];
    *uint64_t v22 = v24;
    v22[1] = v25;
  }
  else
  {
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  }
  uint64_t v26 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  return a1;
}

uint64_t assignWithTake for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 16);
  if (v6 == 255) {
    goto LABEL_4;
  }
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (v7 == 255)
  {
    outlined destroy of ResolvedTransferRepresentation.SuggestedFileNameStorage(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v8, v9, v6 & 1);
LABEL_6:
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for UTType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a1 + v15);
  uint64_t v19 = *(void *)(a2 + v15);
  if (v18)
  {
    if (v19)
    {
      uint64_t v20 = *(void *)(v17 + 8);
      *uint64_t v16 = v19;
      v16[1] = v20;
      swift_release();
      goto LABEL_13;
    }
    swift_release();
  }
  else if (v19)
  {
    uint64_t v21 = *(void *)(v17 + 8);
    *uint64_t v16 = v19;
    v16[1] = v21;
    goto LABEL_13;
  }
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
LABEL_13:
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = a2 + v22;
  uint64_t v25 = *(void *)(a1 + v22);
  uint64_t v26 = *(void *)(a2 + v22);
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = *(void *)(v24 + 8);
      *uint64_t v23 = v26;
      v23[1] = v27;
      swift_release();
      goto LABEL_20;
    }
    swift_release();
  }
  else if (v26)
  {
    uint64_t v28 = *(void *)(v24 + 8);
    *uint64_t v23 = v26;
    v23[1] = v28;
    goto LABEL_20;
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
LABEL_20:
  uint64_t v29 = a3[10];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = a2 + v29;
  uint64_t v32 = *(void *)(a1 + v29);
  uint64_t v33 = *(void *)(a2 + v29);
  if (!v32)
  {
    if (v33)
    {
      uint64_t v35 = *(void *)(v31 + 8);
      *uint64_t v30 = v33;
      v30[1] = v35;
      goto LABEL_27;
    }
LABEL_26:
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    goto LABEL_27;
  }
  if (!v33)
  {
    swift_release();
    goto LABEL_26;
  }
  uint64_t v34 = *(void *)(v31 + 8);
  *uint64_t v30 = v33;
  v30[1] = v34;
  swift_release();
LABEL_27:
  uint64_t v36 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  unint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (uint64_t *)(a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *unint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21286C134);
}

uint64_t sub_21286C134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UTType();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ResolvedTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21286C20C);
}

uint64_t sub_21286C20C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UTType();
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
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata completion function for ResolvedTransferRepresentation()
{
  uint64_t result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ResolvedTransferRepresentation.SuggestedFileNameStorage(uint64_t a1)
{
  return outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

ValueMetadata *type metadata accessor for ResolvedTransferRepresentation.SuggestedFileNameStorage()
{
  return &type metadata for ResolvedTransferRepresentation.SuggestedFileNameStorage;
}

ValueMetadata *type metadata accessor for _TransferRepresentationInputs()
{
  return &type metadata for _TransferRepresentationInputs;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@out Bool, @error @owned Error)()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&var1);
  if (!v1) {
    char v2 = var1;
  }
  return v2 & 1;
}

uint64_t sub_21286C400()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Transferable) -> (@unowned Bool, @error @owned Error)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  if (!v2) {
    *a1 = result & 1;
  }
  return result;
}

uint64_t one-time initialization function for transferableRunLoopMode()
{
  uint64_t result = MEMORY[0x216683720](0xD000000000000017, 0x800000021287F1E0);
  static CFRunLoopMode.transferableRunLoopMode = result;
  return result;
}

uint64_t RunLoopSource.__deallocating_deinit()
{
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(*(void *)(v0 + 120));

  return MEMORY[0x270FA0228](v0, 136, 7);
}

uint64_t closure #1 in closure #1 in variable initialization expression of performCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[5] = v6;
  v4[6] = v5;
  return MEMORY[0x270FA2498](closure #1 in closure #1 in variable initialization expression of performCallback, v6, v5);
}

uint64_t closure #1 in closure #1 in variable initialization expression of performCallback()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(int **)(v1 + 120);
  *(void *)(v0 + 56) = v2;
  if (v2)
  {
    *(void *)(v0 + 64) = *(void *)(v1 + 128);
    uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
    swift_retain();
    long long v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v3;
    *long long v3 = v0;
    v3[1] = closure #1 in closure #1 in variable initialization expression of performCallback;
    return v6();
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 56) == 0;
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v2);
  long long v3 = *(void *)(v1 + 48);
  int v4 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](closure #1 in closure #1 in variable initialization expression of performCallback, v4, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 56) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZytSg_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of TaskPriority?(a1, (uint64_t)v8);
  uint64_t v9 = type metadata accessor for TaskPriority();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of TaskPriority?((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ()?);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t @objc closure #1 in variable initialization expression of performCallback(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  uint64_t result = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_retain();
    static TaskPriority.userInitiated.getter();
    uint64_t v6 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
    type metadata accessor for MainActor();
    swift_retain();
    uint64_t v7 = static MainActor.shared.getter();
    uint64_t v8 = (void *)swift_allocObject();
    uint64_t v9 = MEMORY[0x263F8F500];
    id v8[2] = v7;
    v8[3] = v9;
    v8[4] = a1;
    _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZytSg_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in variable initialization expression of performCallback, (uint64_t)v8);
    swift_release();
    swift_release();
    return outlined destroy of TaskPriority?((uint64_t)v5);
  }
  return result;
}

uint64_t LegacyExporterCaller.MainQueueDrainingFlag.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

void static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v91 = a7;
  uint64_t v90 = a6;
  uint64_t v88 = a3;
  uint64_t v92 = a2;
  uint64_t v89 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v102 = type metadata accessor for Result();
  uint64_t v93 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v93 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v93);
  uint64_t v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v87 = (char *)&v76 - v17;
  uint64_t v86 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v85 = v18;
  uint64_t v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for DispatchWorkItemFlags();
  v103 = *(__CFString **)(v20 - 8);
  uint64_t v104 = v20;
  MEMORY[0x270FA5388](v20);
  v100 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for DispatchQoS();
  uint64_t v99 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  v98 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for Date();
  uint64_t v96 = *(void *)(v23 - 8);
  uint64_t v97 = v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = CFRunLoopGetMain();
  if (v26)
  {
    uint64_t v27 = v26;
    v80 = v15;
    v78 = v19;
    uint64_t v84 = a4;
    uint64_t v79 = v12;
    uint64_t v81 = a8;
    uint64_t v94 = a5;
    uint64_t v82 = v8;
    if (one-time initialization token for transferableRunLoopMode != -1) {
      swift_once();
    }
    uint64_t v28 = (void *)static CFRunLoopMode.transferableRunLoopMode;
    type metadata accessor for RunLoopSource();
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 96) = 0u;
    *(_OWORD *)(v29 + 112) = 0u;
    *(void *)(v29 + 128) = 0;
    *(void *)(v29 + 104) = v27;
    *(void *)(v29 + 112) = v28;
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = v29;
    *(_OWORD *)(v29 + 32) = 0u;
    *(_OWORD *)(v29 + 48) = 0u;
    *(void *)(v29 + 64) = 0;
    *(void *)(v29 + 72) = @objc closure #1 in variable initialization expression of scheduleCallback;
    *(void *)(v29 + 80) = @objc closure #1 in variable initialization expression of cancelCallback;
    *(void *)(v29 + 88) = @objc closure #1 in variable initialization expression of performCallback;
    id v30 = v28;
    uint64_t v31 = v27;
    uint64_t v32 = (__CFString *)v30;
    context.version = 0;
    context.info = (void *)v29;
    v95 = (void *)v29;
    memset(&context.retain, 0, 40);
    context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))@objc closure #1 in variable initialization expression of scheduleCallback;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))@objc closure #1 in variable initialization expression of cancelCallback;
    context.perform = (void (__cdecl *)(void *))@objc closure #1 in variable initialization expression of performCallback;
    CFRunLoopAddCommonMode(v31, v32);
    CFRunLoopSourceRef v33 = CFRunLoopSourceCreate(0, 0, &context);
    uint64_t v34 = *(void **)(v29 + 96);
    *(void *)(v29 + 96) = v33;

    v77 = (CFRunLoopSourceRef *)(v29 + 96);
    uint64_t v35 = (__CFRunLoopSource *)*(id *)(v29 + 96);
    CFRunLoopAddSource(v31, v35, v32);

    v83 = v31;
    static Date.distantFuture.getter();
    Date.timeIntervalSinceNow.getter();
    CFTimeInterval v37 = v36;
    (*(void (**)(char *, uint64_t))(v96 + 8))(v25, v97);
    type metadata accessor for LegacyExporterCaller.MainQueueDrainingFlag();
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 1;
    type metadata accessor for OS_dispatch_queue();
    uint64_t v39 = (void *)static OS_dispatch_queue.main.getter();
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))partial apply for closure #1 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
    context.equal = (Boolean (__cdecl *)(const void *, const void *))v38;
    context.version = MEMORY[0x263EF8330];
    context.info = (void *)1107296256;
    context.retain = (const void *(__cdecl *)(const void *))thunk for @escaping @callee_guaranteed @Sendable () -> ();
    context.release = (void (__cdecl *)(const void *))&block_descriptor_0;
    uint64_t v40 = _Block_copy(&context);
    swift_retain();
    uint64_t v41 = v98;
    static DispatchQoS.unspecified.getter();
    uint64_t v106 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    uint64_t v42 = v100;
    uint64_t v43 = v104;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x216683910](0, v41, v42, v40);
    _Block_release(v40);

    ((void (*)(char *, uint64_t))v103->info)(v42, v43);
    (*(void (**)(char *, uint64_t))(v99 + 8))(v41, v101);
    swift_release();
    if (CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished
      && CFRunLoopRunInMode(v32, 0.001, 0) != kCFRunLoopRunFinished)
    {
      CFRunLoopRunInMode(v32, 0.001, 0);
    }
    uint64_t v44 = v84;
    if (*(unsigned char *)(v38 + 16) == 1)
    {
      swift_release();
      swift_release();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v81, 1, 1);
    }
    else
    {
      v100 = (char *)v38;
      uint64_t v45 = v93;
      uint64_t v46 = swift_allocBox();
      uint64_t v104 = v47;
      uint64_t v101 = *(void *)(v102 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v101 + 56))(v47, 1, 1, v102);
      uint64_t v48 = v86;
      uint64_t v49 = v78;
      (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v78, v88, v44);
      uint64_t v50 = *(unsigned __int8 *)(v48 + 80);
      v103 = v32;
      uint64_t v51 = (v50 + 72) & ~v50;
      unint64_t v52 = (v85 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v53 = (char *)swift_allocObject();
      uint64_t v54 = v94;
      *((void *)v53 + 2) = v44;
      *((void *)v53 + 3) = v54;
      uint64_t v55 = v91;
      *((void *)v53 + 4) = v90;
      *((void *)v53 + 5) = v55;
      uint64_t v56 = v89;
      *((void *)v53 + 6) = v46;
      *((void *)v53 + 7) = v56;
      *((void *)v53 + 8) = v92;
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v53[v51], v49, v44);
      uint64_t v57 = v83;
      *(void *)&v53[v52] = v83;
      uint64_t v58 = v95;
      uint64_t v59 = v95[15];
      v95[15] = &async function pointer to partial apply for closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
      v58[16] = v53;
      v98 = v57;
      uint64_t v99 = v46;
      swift_retain();
      swift_retain();
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v59);
      uint64_t v60 = (__CFRunLoopSource *)v58[12];
      swift_retain();
      CFRunLoopSourceSignal(v60);
      CFRunLoopWakeUp((CFRunLoopRef)v58[13]);
      swift_release();
      uint64_t v61 = v104;
      swift_beginAccess();
      uint64_t v62 = v79;
      uint64_t v63 = v87;
      uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 16);
      v64(v87, v61, v45);
      uint64_t v65 = *(uint64_t (**)(char *, uint64_t))(v101 + 48);
      uint64_t v66 = v102;
      uint64_t v67 = v101 + 48;
      int v68 = v65(v63, 1);
      uint64_t v69 = *(void (**)(char *, uint64_t))(v62 + 8);
      if (v68 == 1)
      {
        do
        {
          v69(v63, v45);
          CFRunLoopRunInMode(v103, v37, 0);
          v64(v63, v104, v45);
        }
        while (((unsigned int (*)(char *, uint64_t, uint64_t))v65)(v63, 1, v66) == 1);
      }
      uint64_t v101 = v67;
      v69(v63, v45);
      uint64_t v70 = (__CFRunLoop *)v95[13];
      if (v70)
      {
        if (*v77)
        {
          CFStringRef v71 = (const __CFString *)v95[14];
          if (v71) {
            CFRunLoopRemoveSource(v70, *v77, v71);
          }
        }
      }
      uint64_t v72 = v80;
      v64(v80, v104, v45);
      uint64_t v73 = v102;
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v65)(v72, 1, v102) == 1)
      {
        __break(1u);
      }
      else
      {
        uint64_t v74 = v81;
        uint64_t v75 = v82;
        _ss6ResultOsRi_zrlE3getxyq_YKF(v73, (uint64_t)&v106, v81);
        swift_release();
        swift_release();
        if (v75)
        {
          swift_release();
        }
        else
        {

          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v94 - 8) + 56))(v74, 0, 1);
          swift_release();
        }
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(a8, 1, 1, a5);
  }
}

uint64_t type metadata accessor for RunLoopSource()
{
  return self;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v5[9] = type metadata accessor for Result();
  uint64_t v8 = type metadata accessor for Optional();
  v5[10] = v8;
  v5[11] = *(void *)(v8 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  v5[13] = v9;
  v5[14] = swift_projectBox();
  v5[15] = type metadata accessor for MainActor();
  v5[16] = static MainActor.shared.getter();
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v10 = (void *)swift_task_alloc();
  v5[17] = v10;
  *uint64_t v10 = v5;
  v10[1] = closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
  return v12(v9, a4);
}

uint64_t closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
  }
  else {
    uint64_t v4 = closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:);
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 72);
  swift_release();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 0, 1, v5);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(v1, v2, v3);
  CFRunLoopStop(*(CFRunLoopRef *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void **)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  swift_release();
  *uint64_t v3 = v1;
  swift_storeEnumTagMultiPayload();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 0, 1, v6);
  swift_beginAccess();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 40))(v2, v3, v5);
  CFRunLoopStop(*(CFRunLoopRef *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t _ss6ResultOsRi_zrlE3getxyq_YKF@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (swift_getEnumCaseMultiPayload() != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 32))(a3, v3);
  }
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(*(void *)(a1 + 24) - 8) + 32))(a2, v3, *(void *)(a1 + 24));
  return swift_willThrowTypedImpl();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TQ0_;
  return v5(v2 + 32);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TQ0_()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t type metadata accessor for LegacyExporterCaller.MainQueueDrainingFlag()
{
  return self;
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

void partial apply for closure #1 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  *(unsigned char *)(v0 + 16) = 0;
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

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t sub_21286E170()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t partial apply for closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[2] - 8) + 80);
  uint64_t v3 = v0[6];
  uint64_t v4 = (int *)v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = (uint64_t)v0 + v2;
  uint64_t v7 = *(void *)((char *)v0 + ((*(void *)(*(void *)(v0[2] - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  void *v8 = v1;
  v8[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #2 in static LegacyExporterCaller.callSynchronously<A, B>(_:item:)(v3, v4, v5, v6, v7);
}

ValueMetadata *type metadata accessor for LegacyExporterCaller()
{
  return &type metadata for LegacyExporterCaller;
}

void type metadata accessor for CFRunLoopMode(uint64_t a1)
{
}

void type metadata accessor for CFRunLoopSourceRef(uint64_t a1)
{
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CFRunLoopSourceContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CFRunLoopSourceContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void type metadata accessor for CFRunLoopSourceContext(uint64_t a1)
{
}

void type metadata accessor for CFRunLoopRef(uint64_t a1)
{
}

uint64_t sub_21286E4B8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in closure #1 in variable initialization expression of performCallback(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = Transferable.file(contentType:fileHandler:);
  return closure #1 in closure #1 in variable initialization expression of performCallback(a1, v5, v6, v4);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of TaskPriority?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21286E660()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = Transferable.file(contentType:fileHandler:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRytSg_TG5Tu);
  return v6(a1, v4);
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
}

void type metadata accessor for CFRunLoopMode(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v41 = a3;
  uint64_t v45 = a2;
  uint64_t v47 = a6;
  uint64_t v53 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v39 = *(void *)(v53 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v53);
  uint64_t v52 = (uint64_t)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v51 = (uint64_t)&v38 - v10;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  uint64_t v38 = *(void *)(v44 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v44);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v18 = (char *)&v38 - v17;
  uint64_t v43 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v42 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v21 = *a1;
  uint64_t v48 = a1[1];
  uint64_t v23 = a1[2];
  uint64_t v22 = a1[3];
  uint64_t v49 = v22;
  uint64_t v50 = v21;
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(a5 + 24);
  ((void (*)(void))_sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy)();
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOy(v23, v22);
  uint64_t v24 = v41;
  v40(v41, a5);
  _TransferRepresentationValue.init(_:)((uint64_t)v18, AssociatedTypeWitness, (uint64_t)v20);
  _TransferRepresentationInputs.init()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v63, v20);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v43);
  uint64_t v55 = v45;
  uint64_t v56 = v24;
  uint64_t v57 = v46;
  uint64_t v58 = a5;
  uint64_t v59 = v50;
  uint64_t v60 = v48;
  uint64_t v61 = v23;
  uint64_t v62 = v49;
  uint64_t v26 = _TransferRepresentationOutputs.map<A>(_:)((uint64_t)partial apply for closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v54, v44);
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(v26 + 16);
  if (v27)
  {
    uint64_t v46 = v23;
    uint64_t v28 = v26;
    uint64_t v29 = v26 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
    uint64_t v30 = *(void *)(v38 + 72);
    uint64_t v31 = v39;
    uint64_t v32 = (unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
    uint64_t v45 = v28;
    swift_bridgeObjectRetain();
    CFRunLoopSourceRef v33 = (void *)MEMORY[0x263F8EE78];
    do
    {
      outlined init with copy of ResolvedTransferRepresentation?(v29, (uint64_t)v15);
      outlined init with take of ResolvedTransferRepresentation?((uint64_t)v15, (uint64_t)v13);
      if ((*v32)(v13, 1, v53) == 1)
      {
        outlined destroy of ResolvedTransferRepresentation?((uint64_t)v13);
      }
      else
      {
        uint64_t v34 = v51;
        outlined init with take of ResolvedTransferRepresentation((uint64_t)v13, v51);
        outlined init with take of ResolvedTransferRepresentation(v34, v52);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          CFRunLoopSourceRef v33 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v33[2] + 1, 1, v33);
        }
        unint64_t v36 = v33[2];
        unint64_t v35 = v33[3];
        if (v36 >= v35 >> 1) {
          CFRunLoopSourceRef v33 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1, v33);
        }
        v33[2] = v36 + 1;
        outlined init with take of ResolvedTransferRepresentation(v52, (uint64_t)v33+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v36);
      }
      v29 += v30;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease_n();
    uint64_t v23 = v46;
  }
  else
  {
    swift_bridgeObjectRelease();
    CFRunLoopSourceRef v33 = (void *)MEMORY[0x263F8EE78];
  }
  _TransferRepresentationOutputs.init(_:)((Swift::OpaquePointer)v33);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(v50, v48);
  return _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(v23, v49);
}

uint64_t closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v39 = a7;
  uint64_t v40 = a8;
  uint64_t v37 = a10;
  uint64_t v38 = a6;
  uint64_t v16 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ResolvedTransferRepresentation(a1, (uint64_t)v19);
  if (a2)
  {
    uint64_t v36 = a5;
    swift_retain();
    uint64_t v20 = ResolvedTransferRepresentation.exporter.getter();
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = v21;
      uint64_t v24 = (void *)swift_allocObject();
      uint64_t v25 = v39;
      v24[2] = v38;
      v24[3] = v25;
      uint64_t v26 = v37;
      v24[4] = v40;
      void v24[5] = v26;
      v24[6] = a2;
      v24[7] = a3;
      v24[8] = v22;
      v24[9] = v23;
      ResolvedTransferRepresentation.exporter.setter((uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v24);
    }
    else
    {
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(a2, a3);
    }
    a5 = v36;
  }
  if (a4)
  {
    swift_retain();
    uint64_t v27 = ResolvedTransferRepresentation.importer.getter();
    if (v27)
    {
      uint64_t v29 = v27;
      uint64_t v30 = v28;
      uint64_t v31 = (void *)swift_allocObject();
      uint64_t v32 = v39;
      v31[2] = v38;
      v31[3] = v32;
      uint64_t v33 = v37;
      v31[4] = v40;
      v31[5] = v33;
      v31[6] = v29;
      v31[7] = v30;
      v31[8] = a4;
      v31[9] = a5;
      ResolvedTransferRepresentation.importer.setter((uint64_t)&async function pointer to partial apply for closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), (uint64_t)v31);
    }
    else
    {
      _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lyxq_Iseghnrzo_Sg16CoreTransferable0C0RzAcDR_r0_lWOe(a4, a5);
    }
  }
  outlined init with take of ResolvedTransferRepresentation((uint64_t)v19, a9);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a9, 0, 1, v16);
}

uint64_t partial apply for closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, v2[6], v2[7], v2[8], v2[9], v2[2], v2[3], v2[4], a2, v2[5]);
}

uint64_t closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[24] = a8;
  v8[25] = v13;
  v8[22] = a6;
  v8[23] = a7;
  v8[20] = a4;
  v8[21] = a5;
  v8[18] = a2;
  v8[19] = a3;
  v8[17] = a1;
  v8[26] = *(void *)(a8 - 8);
  v8[27] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Optional();
  v8[28] = v10;
  v8[29] = *(void *)(v10 - 8);
  v8[30] = swift_task_alloc();
  v8[31] = *(void *)(a7 - 8);
  v8[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:), 0, 0);
}

uint64_t closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  outlined init with copy of Transferable(v0[18], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[31];
    uint64_t v1 = v0[32];
    uint64_t v3 = v0[30];
    uint64_t v4 = v0[23];
    uint64_t v5 = (int *)v0[19];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[33] = v6;
    *uint64_t v6 = v0;
    v6[1] = closure #1 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    uint64_t v7 = v0[32];
    uint64_t v8 = v0[27];
    return v18(v8, v7);
  }
  else
  {
    uint64_t v10 = v0[30];
    uint64_t v11 = v0[28];
    uint64_t v12 = v0[29];
    uint64_t v13 = v0[18];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[31] + 56))(v10, 1, 1, v0[23]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    outlined init with copy of Transferable(v13, (uint64_t)(v0 + 7));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 0x756F662074756220;
    v15._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v15);
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    swift_getDynamicType();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._object = (void *)0xE90000000000002ELL;
    v17._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v17);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

uint64_t closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = a8;
  v8[22] = v17;
  v8[19] = a6;
  v8[20] = a7;
  v8[17] = a1;
  v8[18] = a5;
  uint64_t v12 = type metadata accessor for Optional();
  v8[23] = v12;
  v8[24] = *(void *)(v12 - 8);
  v8[25] = swift_task_alloc();
  v8[26] = *(void *)(a8 - 8);
  v8[27] = swift_task_alloc();
  Swift::String v15 = (int *)((char *)a3 + *a3);
  uint64_t v13 = (void *)swift_task_alloc();
  v8[28] = v13;
  *uint64_t v13 = v8;
  v13[1] = closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
  return ((uint64_t (*)(void *, uint64_t))v15)(v8 + 2, a2);
}

uint64_t closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  else {
    uint64_t v2 = closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t *boxed_opaque_existential_1;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t (*v20)(uint64_t *, uint64_t);
  uint64_t v21;

  outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[26];
    uint64_t v1 = v0[27];
    uint64_t v3 = v0[25];
    uint64_t v4 = v0[21];
    uint64_t v5 = v0[22];
    uint64_t v6 = v0[20];
    uint64_t v8 = (uint64_t *)v0[17];
    uint64_t v7 = (int *)v0[18];
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
    v8[3] = v6;
    v8[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
    uint64_t v20 = (uint64_t (*)(uint64_t *, uint64_t))((char *)v7 + *v7);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[30] = v10;
    *uint64_t v10 = v0;
    v10[1] = closure #2 in closure #1 in static ProxyRepresentation._decomposedTransferRepresentation(_:inputs:);
    uint64_t v11 = v0[27];
    return v20(boxed_opaque_existential_1, v11);
  }
  else
  {
    uint64_t v13 = v0[25];
    Swift::String v14 = v0[23];
    Swift::String v15 = v0[24];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[26] + 56))(v13, 1, 1, v0[21]);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 12));
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x756F662074756220;
    v17._object = (void *)0xEB0000000020646ELL;
    String.append(_:)(v17);
    __swift_project_boxed_opaque_existential_1(v0 + 12, v0[15]);
    swift_getDynamicType();
    v18._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._object = (void *)0xE90000000000002ELL;
    v19._countAndFlagsBits = 0x64616574736E6920;
    String.append(_:)(v19);
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

void *ProxyTransferRepresentation.init(importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  __n128 result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a1;
  result[7] = a2;
  *a7 = 0;
  a7[1] = 0;
  a7[2] = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A);
  a7[3] = result;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data) -> (@out A, @error @owned Error)(v4);
}

void *ProxyTransferRepresentation.init(exporter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  __n128 result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a1;
  result[7] = a2;
  *a7 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B);
  a7[1] = result;
  a7[2] = 0;
  a7[3] = 0;
  return result;
}

void *ProxyTransferRepresentation.init(exporter:importer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a5;
  v18[3] = a6;
  void v18[4] = a7;
  v18[5] = a8;
  v18[6] = a1;
  v18[7] = a2;
  __n128 result = (void *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a7;
  result[5] = a8;
  result[6] = a3;
  result[7] = a4;
  *a9 = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B)partial apply;
  a9[1] = v18;
  a9[2] = &thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)partial apply;
  a9[3] = result;
  return result;
}

void protocol witness for TransferRepresentation.body.getter in conformance ProxyTransferRepresentation<A, B>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance ProxyTransferRepresentation<A, B>@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  return static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_21286FC98()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A)
                                                                              + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed B) -> (@out A));
  return v8(a1, a2, v6);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B) + async function pointer to thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed A) -> (@out B));
  return v13(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t instantiation function for generic protocol witness table for ProxyTransferRepresentation<A, B>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

void *destroy for ProxyTransferRepresentation(void *result)
{
  uint64_t v1 = result;
  if (*result) {
    uint64_t result = (void *)swift_release();
  }
  if (v1[2])
  {
    return (void *)swift_release();
  }
  return result;
}

void *initializeWithCopy for ProxyTransferRepresentation(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

void *assignWithCopy for ProxyTransferRepresentation(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
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

void *assignWithTake for ProxyTransferRepresentation(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProxyTransferRepresentation(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for ProxyTransferRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for ProxyTransferRepresentation()
{
  return swift_getGenericMetadata();
}

uint64_t partial apply for closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = (int *)v2[6];
  uint64_t v9 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v10 = v2[9];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = Transferable.file(contentType:fileHandler:);
  return closure #2 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v11, v10, v6, v7);
}

uint64_t partial apply for closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  uint64_t v10 = v2[8];
  uint64_t v11 = v2[9];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static ProxyTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, a2, v8, v9, v10, v11, v6, v7);
}

void *static __TupleDescriptor.tupleDescription(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v15 = (void *)v6;
  uint64_t v8 = *(void *)(a3 + 8);
  uint64_t v9 = type metadata accessor for __TupleTypeDescription();
  MEMORY[0x2166836F0](v14, &v15, v7, MEMORY[0x263F8D1F0], v9, MEMORY[0x263F8D1F8]);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)v14[0];
  if (!v14[0])
  {
    uint64_t v10 = __TupleTypeDescription.init(_:)(a1, a2, v8);
    v14[4] = v6;
    uint64_t v15 = v10;
    uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 32);
    swift_bridgeObjectRetain();
    uint64_t v12 = (void (*)(void *, void))v11(v14, a2, a3);
    type metadata accessor for Dictionary();
    Dictionary.subscript.setter();
    v12(v14, 0);
  }
  return v10;
}

uint64_t type metadata accessor for __TupleTypeDescription()
{
  return __swift_instantiateGenericMetadata();
}

void *__TupleTypeDescription.init(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for TypeConformance();
  swift_getTupleTypeMetadata2();
  uint64_t v6 = Array.init()();
  __n128 result = __TupleType.indices.getter(a1);
  if (result == v8) {
    return (void *)v6;
  }
  uint64_t v9 = (uint64_t)result;
  uint64_t v10 = v8;
  if ((uint64_t)v8 < (uint64_t)result)
  {
    __break(1u);
  }
  else if ((uint64_t)result < (uint64_t)v8)
  {
    do
    {
      uint64_t v11 = __TupleType.type(at:)(v9, a1);
      (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
      if (swift_conformsToProtocol()) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        type metadata accessor for Array();
        Array.append(_:)();
      }
      ++v9;
    }
    while (v10 != (void *)v9);
    return (void *)v6;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TypeConformance()
{
  return __swift_instantiateGenericMetadata();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TypeConformance(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for TypeConformance(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

void TupleTransferRepresentation.body.getter()
{
}

uint64_t TupleTransferRepresentation.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t TupleTransferRepresentation.value.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 40))(v2, a1);
}

uint64_t (*TupleTransferRepresentation.value.modify())()
{
  return destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage;
}

uint64_t TupleTransferRepresentation.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1);
}

uint64_t static TupleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, void *a3@<X8>)
{
  uint64_t v31 = a1;
  v33[3] = *MEMORY[0x263EF8340];
  type metadata accessor for TupleTransferRepresentation();
  uint64_t v5 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = type metadata accessor for TupleTransferRepresentation.Visitor();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v25 - v11;
  uint64_t v13 = (void *)destructiveProjectEnumData for _FileNamedTransferRepresentation.Storage(a2);
  uint64_t v14 = static __TupleDescriptor.tupleDescription(_:)(v13, (uint64_t)&type metadata for TransferRepresentationDescriptor, (uint64_t)&protocol witness table for TransferRepresentationDescriptor);
  _TransferRepresentationOutputs.init()();
  uint64_t v15 = v14[2];
  if (v15)
  {
    uint64_t v25 = v14;
    uint64_t v26 = a3;
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v30 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v27 = v13;
    uint64_t v28 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v16 = v8;
    uint64_t v17 = v5;
    uint64_t v18 = v14 + 6;
    do
    {
      Swift::Int v19 = *(v18 - 2);
      uint64_t v20 = *(v18 - 1);
      uint64_t v21 = *v18;
      v18 += 3;
      Swift::Int v22 = __TupleType.offset(at:)(v19);
      (*v30)(v16, v31, v17);
      _TransferRepresentationOutputs.init()();
      uint64_t v23 = v33[0];
      (*v29)(v12, v16, v17);
      *(void *)&v12[*(int *)(v9 + 44)] = v22;
      *(void *)&v12[*(int *)(v9 + 48)] = v23;
      v33[0] = v12;
      v33[1] = v9;
      v33[2] = &protocol witness table for TupleTransferRepresentation<A, B>.Visitor;
      _callVisitTransferRepresentationType1((uint64_t)v33, v20, v21);
      v33[0] = *(void *)&v12[*(int *)(v9 + 48)];
      _TransferRepresentationOutputs.append(_:)((CoreTransferable::_TransferRepresentationOutputs)v33);
      (*v28)(v12, v9);
      --v15;
    }
    while (v15);
    uint64_t result = swift_bridgeObjectRelease();
    a3 = v26;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  *a3 = v32;
  return result;
}

uint64_t type metadata accessor for TupleTransferRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TupleTransferRepresentation.Visitor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TupleTransferRepresentation.Visitor.visit<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a3;
  uint64_t v6 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *(void *)(a2 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = *(void *)(v3 + *(int *)(a1 + 44));
  type metadata accessor for TupleTransferRepresentation();
  uint64_t v18 = type metadata accessor for _TransferRepresentationValue();
  _TransferRepresentationValue.applying<A>(offset:to:)(v17, a2, v18, a2);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, a2);
  _TransferRepresentationValue.init(_:)((uint64_t)v14, a2, (uint64_t)v10);
  (*(void (**)(uint64_t *__return_ptr, char *))(v21 + 48))(&v23, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v22 = v23;
  _TransferRepresentationOutputs.append(_:)((CoreTransferable::_TransferRepresentationOutputs)&v22);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, a2);
}

uint64_t protocol witness for TransferRepresentationTypeVisitor.visit<A>(type:) in conformance TupleTransferRepresentation<A, B>.Visitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return TupleTransferRepresentation.Visitor.visit<A>(type:)(a4, a2, a3);
}

void protocol witness for TransferRepresentation.body.getter in conformance TupleTransferRepresentation<A, B>()
{
}

uint64_t protocol witness for static TransferRepresentation._decomposedTransferRepresentation(_:inputs:) in conformance TupleTransferRepresentation<A, B>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  return static TupleTransferRepresentation._decomposedTransferRepresentation(_:inputs:)(a1, *(void *)(a2 + 24), a3);
}

void PrimitiveTransferRepresentation.body.getter()
{
}

uint64_t _callVisitTransferRepresentationType2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 16) + 8))(a3, a3, a4, *(void *)(a1 + 8));
}

uint64_t one-time initialization function for _typeCache()
{
  unint64_t v2 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  uint64_t result = AtomicBox.init(wrappedValue:)((uint64_t)&v2, v0);
  static TransferRepresentationDescriptor._typeCache = result;
  return result;
}

uint64_t associated type witness table accessor for TransferRepresentation.Body : TransferRepresentation in TupleTransferRepresentation<A, B>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static __TupleDescriptor.typeCache.getter in conformance TransferRepresentationDescriptor()
{
  if (one-time initialization token for _typeCache != -1) {
    swift_once();
  }
  uint64_t v0 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  AtomicBox.wrappedValue.getter(v0, v1, (uint64_t)&v3);
  return v3;
}

uint64_t protocol witness for static __TupleDescriptor.typeCache.setter in conformance TransferRepresentationDescriptor(uint64_t a1)
{
  if (one-time initialization token for _typeCache != -1) {
    swift_once();
  }
  unint64_t v2 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  uint64_t v3 = AtomicBox.wrappedValue.modify(v6, v2);
  *int v4 = a1;
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(os_unfair_lock_s **, void))v3)(v6, 0);
}

uint64_t (*protocol witness for static __TupleDescriptor.typeCache.modify in conformance TransferRepresentationDescriptor(os_unfair_lock_s ***a1))()
{
  unint64_t v2 = (os_unfair_lock_s **)malloc(0x28uLL);
  *a1 = v2;
  if (one-time initialization token for _typeCache != -1) {
    swift_once();
  }
  uint64_t v3 = (os_unfair_lock_s *)static TransferRepresentationDescriptor._typeCache;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ObjectIdentifier : __TupleTypeDescription<TransferRepresentationDescriptor>]);
  v2[4] = (os_unfair_lock_s *)AtomicBox.wrappedValue.modify(v2, v3);
  return protocol witness for static __TupleDescriptor.typeCache.modify in conformance TransferRepresentationDescriptor;
}

void static TransferRepresentationDescriptor.typeCache.modify(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t type metadata completion function for TupleTransferRepresentation()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TupleTransferRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t destroy for TupleTransferRepresentation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
}

uint64_t initializeWithCopy for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithCopy for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t initializeWithTake for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for TupleTransferRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for TupleTransferRepresentation(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void storeEnumTagSinglePayload for TupleTransferRepresentation(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x212871704);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

ValueMetadata *type metadata accessor for TransferRepresentationDescriptor()
{
  return &type metadata for TransferRepresentationDescriptor;
}

uint64_t sub_21287173C()
{
  type metadata accessor for TupleTransferRepresentation();

  return swift_getWitnessTable();
}

uint64_t type metadata completion function for TupleTransferRepresentation.Visitor()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TupleTransferRepresentation.Visitor(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unsigned int v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    int v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *unsigned int v10 = *v11;
    *(void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for TupleTransferRepresentation.Visitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TupleTransferRepresentation.Visitor(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
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
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x212871D74);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void storeEnumTagSinglePayload for TupleTransferRepresentation.Visitor(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  size_t v9 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  size_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
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
          goto LABEL_56;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v21 = (void *)((((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v22 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v22 = a2 - 1;
              }
              *uint64_t v21 = v22;
            }
            else if (v7 >= a2)
            {
              uint64_t v23 = *(void (**)(void))(v6 + 56);
              v23();
            }
            else
            {
              if (v9 <= 3) {
                int v18 = ~(-1 << (8 * v9));
              }
              else {
                int v18 = -1;
              }
              if (v9)
              {
                int v19 = v18 & (~v7 + a2);
                if (v9 <= 3) {
                  int v20 = v9;
                }
                else {
                  int v20 = 4;
                }
                bzero(a1, v9);
                switch(v20)
                {
                  case 2:
                    *(_WORD *)a1 = v19;
                    break;
                  case 3:
                    *(_WORD *)a1 = v19;
                    a1[2] = BYTE2(v19);
                    break;
                  case 4:
                    *(_DWORD *)a1 = v19;
                    break;
                  default:
                    *a1 = v19;
                    break;
                }
              }
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
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
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
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v17 = ~v8 + a2;
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
LABEL_56:
      __break(1u);
      JUMPOUT(0x212872010);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

BOOL static TransferableError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void TransferableError.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int TransferableError.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TransferableError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void protocol witness for Hashable.hash(into:) in conformance TransferableError()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Error._domain.getter in conformance TransferableError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance TransferableError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance TransferableError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance TransferableError()
{
  return MEMORY[0x270F9FB30]();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TransferableError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TransferableError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *TransferRepresentationVisibility.all.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.all;
}

void static TransferRepresentationVisibility.all.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void *TransferRepresentationVisibility.team.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.team;
}

void static TransferRepresentationVisibility.team.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static TransferRepresentationVisibility.group.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void *TransferRepresentationVisibility.ownProcess.unsafeMutableAddressor()
{
  return &static TransferRepresentationVisibility.ownProcess;
}

void static TransferRepresentationVisibility.ownProcess.getter(void *a1@<X8>)
{
  *a1 = 3;
}

BOOL static TransferRepresentationVisibility.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TransferRepresentationVisibility(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t dispatch thunk of static Transferable.transferRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TransferableError()
{
  return &type metadata for TransferableError;
}

uint64_t getEnumTagSinglePayload for TransferableError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TransferableError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x212872660);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for TransferableSupportError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for TransferableSupportError(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransferableSupportError()
{
  return &type metadata for TransferableSupportError;
}

ValueMetadata *type metadata accessor for TransferRepresentationVisibility()
{
  return &type metadata for TransferRepresentationVisibility;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, unint64_t a2, void *a3, void (*a4)(uint64_t *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v15 = type metadata accessor for Result();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  int v18 = (uint64_t *)((char *)&v30 - v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
LABEL_9:
    if (a3)
    {
      uint64_t v27 = (uint64_t)a3;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      uint64_t v27 = swift_allocError();
      *uint64_t v28 = 0;
    }
    *int v18 = v27;
    swift_storeEnumTagMultiPayload();
    id v29 = a3;
    a4(v18);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    uint64_t v22 = a9;
    switch(a2 >> 62)
    {
      case 1uLL:
        if ((int)a1 == a1 >> 32) {
          goto LABEL_9;
        }
        goto LABEL_6;
      case 2uLL:
        if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
          goto LABEL_9;
        }
LABEL_6:
        outlined copy of Data._Representation(a1, a2);
        uint64_t v22 = a9;
        goto LABEL_7;
      case 3uLL:
        goto LABEL_4;
      default:
        if ((a2 & 0xFF000000000000) == 0)
        {
LABEL_4:
          outlined consume of Data?(a1, a2);
          goto LABEL_9;
        }
LABEL_7:
        uint64_t v23 = v22;
        uint64_t v24 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v21, 1, 1, v24);
        uint64_t v25 = (void *)swift_allocObject();
        v25[2] = 0;
        v25[3] = 0;
        v25[4] = a8;
        v25[5] = v23;
        v25[6] = v30;
        v25[7] = v31;
        v25[8] = a1;
        v25[9] = a2;
        v25[10] = a4;
        v25[11] = a5;
        swift_retain();
        swift_retain();
        _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v21, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), (uint64_t)v25);
        uint64_t result = swift_release();
        break;
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[17] = v13;
  v8[18] = v14;
  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v9 = type metadata accessor for Result();
  v8[19] = v9;
  v8[20] = *(void *)(v9 - 8);
  v8[21] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Optional();
  v8[22] = v10;
  v8[23] = *(void *)(v10 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(void *)(v14 - 8);
  v8[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), 0, 0);
}

uint64_t closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v1 = v0[14];
  unint64_t v2 = v0[15];
  int v3 = (int *)v0[12];
  v0[10] = MEMORY[0x263F06F78];
  v0[11] = &protocol witness table for Data;
  v0[7] = v1;
  v0[8] = v2;
  outlined copy of Data._Representation(v1, v2);
  unsigned int v6 = (int *)((char *)v3 + *v3);
  unsigned int v4 = (void *)swift_task_alloc();
  v0[27] = v4;
  *unsigned int v4 = v0;
  v4[1] = closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return ((uint64_t (*)(void *, void *))v6)(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  unint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    int v3 = closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    int v3 = closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *);
  uint64_t v18;
  unsigned char *v19;
  uint64_t (*v20)(void);
  void (*v22)(uint64_t);
  uint64_t v23;

  uint64_t v1 = v0[25];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  unint64_t v2 = swift_dynamicCast();
  int v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if (v2)
  {
    uint64_t v5 = v0[25];
    unsigned int v4 = v0[26];
    unsigned int v6 = v0[24];
    int v8 = v0[20];
    uint64_t v7 = v0[21];
    uint64_t v10 = v0[18];
    uint64_t v9 = v0[19];
    uint64_t v22 = (void (*)(uint64_t))v0[16];
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v22(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    uint64_t v12 = v0[23];
    unsigned int v11 = v0[24];
    uint64_t v14 = (uint64_t *)v0[21];
    uint64_t v13 = v0[22];
    uint64_t v15 = v0[19];
    uint64_t v16 = v0[20];
    uint64_t v17 = (void (*)(uint64_t *))v0[16];
    v3(v11, 1, 1, v0[18]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    int v18 = swift_allocError();
    *uint64_t v19 = 0;
    *uint64_t v14 = v18;
    swift_storeEnumTagMultiPayload();
    v17(v14);
    (*(void (**)(uint64_t *, uint64_t))(v16 + 8))(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *);
  id v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = (void *)v0[28];
  int v3 = v0[20];
  unint64_t v2 = (void *)v0[21];
  unsigned int v4 = v0[19];
  uint64_t v5 = (void (*)(void *))v0[16];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  os_unfair_lock_s *v2 = v1;
  swift_storeEnumTagMultiPayload();
  unsigned int v6 = v1;
  v5(v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
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
  outlined destroy of UTType?(a1, &demangling cache variable for type metadata for TaskPriority?);
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

uint64_t closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, int a2, void *a3, void (*a4)(uint64_t *), void (*a5)(uint64_t *), uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v56 = a6;
  uint64_t v57 = a7;
  uint64_t v59 = a4;
  uint64_t v60 = a5;
  uint64_t v50 = a3;
  int v51 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v55 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ReceivedTransferredFile(0);
  uint64_t v52 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v52 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v53 = (uint64_t)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v58 = (uint64_t)&v49 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v54 = a8;
  uint64_t v17 = type metadata accessor for Result();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (uint64_t *)((char *)&v49 - v19);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for URL();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v49 - v29;
  outlined init with copy of URL?(a1, (uint64_t)v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    uint64_t v31 = v59;
    outlined destroy of UTType?((uint64_t)v23, &demangling cache variable for type metadata for URL?);
    uint64_t v32 = v50;
    if (v50)
    {
      uint64_t v33 = (uint64_t)v50;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      uint64_t v33 = swift_allocError();
      *uint64_t v47 = 0;
    }
    *uint64_t v20 = v33;
    swift_storeEnumTagMultiPayload();
    id v48 = v32;
    v31(v20);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v18 + 8))(v20, v17);
  }
  else
  {
    uint64_t v50 = a9;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v30, v23, v24);
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v28, v30, v24);
    uint64_t v34 = v58;
    ReceivedTransferredFile.init(file:isOriginalFile:)((uint64_t)v28, v51 & 1, v58);
    uint64_t v35 = type metadata accessor for TaskPriority();
    uint64_t v36 = (uint64_t)v55;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v55, 1, 1, v35);
    uint64_t v37 = v53;
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v34, v53, type metadata accessor for ReceivedTransferredFile);
    unint64_t v38 = (*(unsigned __int8 *)(v52 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    unint64_t v39 = (v14 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v40 = (void *)swift_allocObject();
    v40[2] = 0;
    v40[3] = 0;
    uint64_t v41 = v50;
    v40[4] = v54;
    v40[5] = v41;
    uint64_t v42 = (uint64_t)v40 + v38;
    uint64_t v43 = v57;
    v40[6] = v56;
    v40[7] = v43;
    _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v37, v42, type metadata accessor for ReceivedTransferredFile);
    uint64_t v44 = (void (**)(uint64_t *))((char *)v40 + v39);
    uint64_t v45 = v60;
    *uint64_t v44 = v59;
    v44[1] = v45;
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v36, (uint64_t)&async function pointer to partial apply for closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), (uint64_t)v40);
    swift_release();
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v58, type metadata accessor for ReceivedTransferredFile);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v30, v24);
  }
}

uint64_t closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[16] = a8;
  v8[17] = v13;
  v8[14] = a6;
  v8[15] = a7;
  v8[12] = a4;
  v8[13] = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v9 = type metadata accessor for Result();
  v8[18] = v9;
  v8[19] = *(void *)(v9 - 8);
  v8[20] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Optional();
  v8[21] = v10;
  v8[22] = *(void *)(v10 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = *(void *)(v13 - 8);
  v8[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), 0, 0);
}

uint64_t closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v1 = v0[14];
  unint64_t v2 = (int *)v0[12];
  v0[10] = type metadata accessor for ReceivedTransferredFile(0);
  v0[11] = (uint64_t)&protocol witness table for ReceivedTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
  uint64_t v6 = (uint64_t (*)(uint64_t *, uint64_t *))((char *)v2 + *v2);
  unsigned int v4 = (void *)swift_task_alloc();
  v0[26] = (uint64_t)v4;
  *unsigned int v4 = v0;
  v4[1] = closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return v6(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  unint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    int v3 = closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    int v3 = closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *);
  uint64_t v18;
  unsigned char *v19;
  uint64_t (*v20)(void);
  void (*v22)(uint64_t);
  uint64_t v23;

  uint64_t v1 = v0[24];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  unint64_t v2 = swift_dynamicCast();
  int v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if (v2)
  {
    uint64_t v5 = v0[24];
    unsigned int v4 = v0[25];
    uint64_t v6 = v0[23];
    uint64_t v8 = v0[19];
    uint64_t v7 = v0[20];
    uint64_t v10 = v0[17];
    uint64_t v9 = v0[18];
    uint64_t v22 = (void (*)(uint64_t))v0[15];
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v22(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    uint64_t v12 = v0[22];
    uint64_t v11 = v0[23];
    uint64_t v14 = (uint64_t *)v0[20];
    uint64_t v13 = v0[21];
    uint64_t v15 = v0[18];
    uint64_t v16 = v0[19];
    uint64_t v17 = (void (*)(uint64_t *))v0[15];
    v3(v11, 1, 1, v0[17]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    uint64_t v18 = swift_allocError();
    *uint64_t v19 = 0;
    *uint64_t v14 = v18;
    swift_storeEnumTagMultiPayload();
    v17(v14);
    (*(void (**)(uint64_t *, uint64_t))(v16 + 8))(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *);
  id v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = (void *)v0[27];
  int v3 = v0[19];
  unint64_t v2 = (void *)v0[20];
  unsigned int v4 = v0[18];
  uint64_t v5 = (void (*)(void *))v0[15];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  int *v2 = v1;
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = v1;
  v5(v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  swift_retain();
  id v14 = a4;
  v11(v10, a3, a4);
  swift_release();

  return outlined destroy of UTType?((uint64_t)v10, &demangling cache variable for type metadata for URL?);
}

uint64_t closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(void (*a1)(char *, char *, uint64_t), void *a2, void (*a3)(uint64_t *), void (*a4)(uint64_t *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v62 = a8;
  uint64_t v63 = a5;
  uint64_t v64 = a6;
  uint64_t v69 = a3;
  uint64_t v70 = a4;
  uint64_t v57 = a2;
  uint64_t v66 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v68 = (uint64_t)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ReceivedTransferredFile(0);
  uint64_t v59 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v58 = (uint64_t)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v67 = (uint64_t)&v55 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v61 = a7;
  uint64_t v15 = type metadata accessor for Result();
  uint64_t v56 = *(uint64_t (**)(uint64_t))(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (uint64_t *)((char *)&v55 - v16);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v55 - v22;
  uint64_t v24 = type metadata accessor for URL();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void *)(v25 + 64);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v55 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v65 = (uint64_t)&v55 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v55 - v31;
  outlined init with copy of URL?((uint64_t)v66, (uint64_t)v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    outlined destroy of UTType?((uint64_t)v23, &demangling cache variable for type metadata for URL?);
    uint64_t v33 = v57;
    if (v57)
    {
      uint64_t v34 = (uint64_t)v57;
    }
    else
    {
      lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
      uint64_t v34 = swift_allocError();
      unsigned char *v53 = 0;
    }
    *uint64_t v17 = v34;
    swift_storeEnumTagMultiPayload();
    id v54 = v33;
    v69(v17);
    return (*((uint64_t (**)(uint64_t *, uint64_t))v56 + 1))(v17, v15);
  }
  else
  {
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    uint64_t v57 = (void *)(v25 + 32);
    uint64_t v66 = v35;
    uint64_t v55 = v32;
    v35(v32, v23, v24);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v21, 1, 1, v24);
    uint64_t v36 = v65;
    copyFile(from:to:)((uint64_t)v21, v65);
    outlined destroy of UTType?((uint64_t)v21, &demangling cache variable for type metadata for URL?);
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
    v37(v28, v36, v24);
    uint64_t v38 = v67;
    ReceivedTransferredFile.init(file:isOriginalFile:)((uint64_t)v28, 0, v67);
    uint64_t v39 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v68, 1, 1, v39);
    v37(v28, v36, v24);
    uint64_t v56 = type metadata accessor for ReceivedTransferredFile;
    uint64_t v40 = v58;
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v38, v58, type metadata accessor for ReceivedTransferredFile);
    unint64_t v41 = (*(unsigned __int8 *)(v25 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    unint64_t v42 = (v26 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v43 = (*(unsigned __int8 *)(v59 + 80) + v42 + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    uint64_t v44 = v70;
    unint64_t v45 = (v60 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v46 = (char *)swift_allocObject();
    *((void *)v46 + 2) = 0;
    *((void *)v46 + 3) = 0;
    uint64_t v47 = v62;
    *((void *)v46 + 4) = v61;
    *((void *)v46 + 5) = v47;
    v66(&v46[v41], v28, v24);
    id v48 = &v46[v42];
    uint64_t v49 = v64;
    *(void *)id v48 = v63;
    *((void *)v48 + 1) = v49;
    _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v40, (uint64_t)&v46[v43], v56);
    uint64_t v50 = (void (**)(uint64_t *))&v46[v45];
    *uint64_t v50 = v69;
    v50[1] = v44;
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v68, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), (uint64_t)v46);
    swift_release();
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v67, type metadata accessor for ReceivedTransferredFile);
    int v51 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v51(v65, v24);
    return ((uint64_t (*)(char *, uint64_t))v51)(v55, v24);
  }
}

void copyFile(from:to:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v74 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL.DirectoryHint();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v72 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v73 = (char *)&v70 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v70 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v70 - v21;
  id v79 = objc_msgSend(self, sel_defaultManager);
  outlined init with copy of URL?(a1, (uint64_t)v11);
  int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  uint64_t v78 = v13;
  if (v23 == 1)
  {
    uint64_t v24 = v12;
    backupDirectory()();
    outlined destroy of UTType?((uint64_t)v11, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    uint64_t v24 = v12;
    v25(v22, v11, v12);
  }
  id v80 = (id)URL.lastPathComponent.getter();
  uint64_t v81 = v26;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v27 = v77;
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v28 = URL.path.getter();
  uint64_t v29 = (void *)MEMORY[0x216683720](v28);
  swift_bridgeObjectRelease();
  id v30 = v79;
  unsigned int v31 = objc_msgSend(v79, sel_fileExistsAtPath_, v29);

  uint64_t v33 = v22;
  uint64_t v34 = v24;
  uint64_t v35 = v78;
  if (v31)
  {
    URL.deletingPathExtension()();
    uint64_t v36 = (void *)URL.lastPathComponent.getter();
    uint64_t v37 = v24;
    uint64_t v38 = v33;
    uint64_t v40 = v39;
    CFStringRef v71 = *(void (**)(char *, uint64_t))(v35 + 8);
    v71(v20, v24);
    id v80 = v36;
    uint64_t v81 = v40;
    v41._countAndFlagsBits = 45;
    v41._object = (void *)0xE100000000000000;
    String.append(_:)(v41);
    unint64_t v42 = v74;
    UUID.init()();
    uint64_t v43 = UUID.uuidString.getter();
    unint64_t v45 = v44;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v42, v76);
    v46._countAndFlagsBits = v43;
    v46._object = v45;
    String.append(_:)(v46);
    uint64_t v33 = v38;
    id v30 = v79;
    swift_bridgeObjectRelease();
    uint64_t v47 = v72;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    URL.pathExtension.getter();
    id v48 = v73;
    URL.appendingPathExtension(_:)();
    swift_bridgeObjectRelease();
    uint64_t v49 = (void (*)(uint64_t, uint64_t))v71;
    v71(v47, v37);
    v49(v27, v37);
    uint64_t v35 = v78;
    uint64_t v34 = v37;
    (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v27, v48, v37);
  }
  URL._bridgeToObjectiveC()(v32);
  int v51 = v50;
  URL._bridgeToObjectiveC()(v52);
  id v54 = v53;
  id v80 = 0;
  unsigned int v55 = objc_msgSend(v30, sel_copyItemAtURL_toURL_error_, v51, v53, &v80);

  if (v55)
  {
    uint64_t v56 = *(void (**)(char *, uint64_t))(v35 + 8);
    id v57 = v80;
    v56(v33, v34);
  }
  else
  {
    uint64_t v58 = v33;
    id v59 = v80;
    uint64_t v60 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v61 = type metadata accessor for Logger();
    __swift_project_value_buffer(v61, (uint64_t)logger);
    id v62 = v60;
    id v63 = v60;
    uint64_t v64 = Logger.logObject.getter();
    os_log_type_t v65 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v77 = v34;
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v66 = 138412290;
      id v68 = v60;
      uint64_t v69 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v80 = v69;
      uint64_t v34 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v67 = v69;

      _os_log_impl(&dword_21283E000, v64, v65, "Error copying file: %@", v66, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x216684270](v67, -1, -1);
      MEMORY[0x216684270](v66, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v58, v34);
  }
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[17] = v13;
  v8[18] = v14;
  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v9 = type metadata accessor for Result();
  v8[19] = v9;
  v8[20] = *(void *)(v9 - 8);
  v8[21] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Optional();
  v8[22] = v10;
  v8[23] = *(void *)(v10 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(void *)(v14 - 8);
  v8[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:), 0, 0);
}

uint64_t closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v1 = v0[15];
  unint64_t v2 = (int *)v0[13];
  v0[10] = type metadata accessor for ReceivedTransferredFile(0);
  v0[11] = (uint64_t)&protocol witness table for ReceivedTransferredFile;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for ReceivedTransferredFile);
  uint64_t v6 = (uint64_t (*)(uint64_t *, uint64_t *))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[27] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  return v6(v0 + 2, v0 + 7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  unint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *);
  uint64_t v18;
  unsigned char *v19;
  uint64_t (*v20)(void);
  void (*v22)(uint64_t);
  uint64_t v23;

  uint64_t v1 = v0[25];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transferable);
  unint64_t v2 = swift_dynamicCast();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  if (v2)
  {
    uint64_t v5 = v0[25];
    uint64_t v4 = v0[26];
    uint64_t v6 = v0[24];
    uint64_t v8 = v0[20];
    uint64_t v7 = v0[21];
    uint64_t v10 = v0[18];
    uint64_t v9 = v0[19];
    uint64_t v22 = (void (*)(uint64_t))v0[16];
    v3(v6, 0, 1, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v4, v6, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v4, v10);
    swift_storeEnumTagMultiPayload();
    v22(v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  }
  else
  {
    uint64_t v12 = v0[23];
    uint64_t v11 = v0[24];
    uint64_t v14 = (uint64_t *)v0[21];
    uint64_t v13 = v0[22];
    uint64_t v15 = v0[19];
    uint64_t v16 = v0[20];
    uint64_t v17 = (void (*)(uint64_t *))v0[16];
    v3(v11, 1, 1, v0[18]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    lazy protocol witness table accessor for type TransferableError and conformance TransferableError();
    uint64_t v18 = swift_allocError();
    *uint64_t v19 = 0;
    *uint64_t v14 = v18;
    swift_storeEnumTagMultiPayload();
    v17(v14);
    (*(void (**)(uint64_t *, uint64_t))(v16 + 8))(v14, v15);
  }
  $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *);
  id v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = (void *)v0[28];
  uint64_t v3 = v0[20];
  unint64_t v2 = (void *)v0[21];
  uint64_t v4 = v0[19];
  uint64_t v5 = (void (*)(void *))v0[16];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  int *v2 = v1;
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = v1;
  v5(v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

void $defer #1 <A>() in closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v1);
  uint64_t v3 = v2;
  v9[0] = 0;
  unsigned int v4 = objc_msgSend(v0, sel_removeItemAtURL_error_, v2, v9);

  id v5 = v9[0];
  if (v4)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = v9[0];
    uint64_t v8 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return outlined destroy of UTType?((uint64_t)v8, &demangling cache variable for type metadata for URL?);
}

uint64_t static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[24] = a6;
  v7[25] = a7;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  return MEMORY[0x270FA2498](static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:), 0, 0);
}

uint64_t static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:)()
{
  uint64_t v1 = *(int **)(v0 + 152);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 168);
    long long v7 = *(_OWORD *)(v0 + 192);
    *(_OWORD *)(v0 + 80) = v7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, v2);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)v1 + *v1);
    swift_retain();
    unsigned int v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v4;
    *unsigned int v4 = v0;
    v4[1] = static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:);
    return v8(v0 + 16, v0 + 56);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  void (*v1)(uint64_t, unint64_t, void);
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v1 = (void (*)(uint64_t, unint64_t, void))v0[22];
  uint64_t v2 = v0[19];
  outlined init with copy of Transferable((uint64_t)(v0 + 2), (uint64_t)(v0 + 12));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  uint64_t v3 = swift_dynamicCast();
  if (v3) {
    unsigned int v4 = v0[17];
  }
  else {
    unsigned int v4 = 0;
  }
  if (v3) {
    id v5 = v0[18];
  }
  else {
    id v5 = 0xF000000000000000;
  }
  v1(v4, v5, 0);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v2);
  outlined consume of Data?(v4, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

{
  void *v0;
  void *v1;
  void (*v2)(void, unint64_t, void *);
  uint64_t v3;
  id v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = (void (*)(void, unint64_t, void *))v0[22];
  uint64_t v3 = v0[19];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  unsigned int v4 = v1;
  v2(0, 0xF000000000000000, v1);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v3);

  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[22] = a6;
  v7[23] = a7;
  v7[20] = a4;
  v7[21] = a5;
  v7[18] = a2;
  v7[19] = a3;
  v7[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SentTransferredFile?);
  v7[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:), 0, 0);
}

uint64_t static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)()
{
  uint64_t v1 = *(int **)(v0 + 136);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 152);
    long long v7 = *(_OWORD *)(v0 + 176);
    *(_OWORD *)(v0 + 80) = v7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, v2);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)v1 + *v1);
    swift_retain();
    unsigned int v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v4;
    *unsigned int v4 = v0;
    v4[1] = static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:);
    return v8(v0 + 16, v0 + 56);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 56);
    uint64_t v3 = static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void (*v3)(void, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v13;

  outlined init with copy of Transferable(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TransferableCurrency);
  uint64_t v1 = type metadata accessor for SentTransferredFile(0);
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 56);
  unsigned int v4 = *(void *)(v0 + 208);
  id v5 = *(void *)(v0 + 192);
  if (v2)
  {
    v3(*(void *)(v0 + 192), 0, 1, v1);
    uint64_t v6 = type metadata accessor for URL();
    long long v7 = *(void *)(v6 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v5, v6);
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v5, type metadata accessor for SentTransferredFile);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  }
  else
  {
    v3(*(void *)(v0 + 192), 1, 1, v1);
    outlined destroy of UTType?(v5, &demangling cache variable for type metadata for SentTransferredFile?);
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  }
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v10 = *(void *)(v0 + 136);
  (*(void (**)(uint64_t, uint64_t, void))(v0 + 160))(v9, 1, 0);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v10);
  outlined destroy of UTType?(v9, &demangling cache variable for type metadata for URL?);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, void *);
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = v0[25];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, void *))v0[20];
  unsigned int v4 = v0[17];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  id v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  uint64_t v6 = v1;
  v3(v2, 1, v1);
  outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v4);

  outlined destroy of UTType?(v2, &demangling cache variable for type metadata for URL?);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t static NSItemProvider.Loader.shouldExport<A>(condition:item:)(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    void v11[3] = a4;
    v11[4] = a5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a3, a4);
    swift_retain();
    char v9 = a1(v11);
    outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)a1);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  }
  else
  {
    char v9 = 1;
  }
  return v9 & 1;
}

id NSItemProvider.init<A>(transferable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  char v9 = (void *)swift_allocObject();
  id v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  id v10 = v8;
  swift_retain();
  NSItemProvider.register<A>(_:)((void (*)(void))partial apply for implicit closure #1 in NSItemProvider.init<A>(transferable:), (uint64_t)v9, a3, a4);
  swift_release();

  swift_release();
  return v10;
}

uint64_t NSItemProvider.register<A>(_:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v110 = a2;
  v118 = a1;
  uint64_t v126 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  v123 = (char *)&v104 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v129 = (uint64_t)&v104 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v108 = (uint64_t)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = type metadata accessor for Optional();
  uint64_t v112 = *(void *)(v113 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v113);
  v119 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v106 = (char *)&v104 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v107 = (char *)&v104 - v16;
  MEMORY[0x270FA5388](v15);
  v117 = (char *)&v104 - v17;
  uint64_t v111 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v120 = *(void *)(v111 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v111);
  uint64_t v20 = (char *)&v104 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  int v23 = (char *)&v104 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v109 = (uint64_t)&v104 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v104 - v26;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v130 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v122 = *(void *)(v130 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v130);
  v121 = (uint64_t *)((char *)&v104 - v30);
  uint64_t v31 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v104 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v104 - v35;
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  swift_getDynamicType();
  uint64_t v116 = v31;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v115 = v36;
  v37(v34, v36, AssociatedTypeWitness);
  uint64_t v38 = v121;
  _TransferRepresentationValue.init(_:)((uint64_t)v34, AssociatedTypeWitness, (uint64_t)v121);
  _TransferRepresentationInputs.init()();
  uint64_t v127 = a3;
  v128 = (uint64_t (*)(uint64_t, uint64_t))a4;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(long long *__return_ptr, uint64_t *))(AssociatedConformanceWitness + 48))(&aBlock, v38);
  (*(void (**)(uint64_t *, uint64_t))(v122 + 8))(v38, v130);
  uint64_t v40 = *(void *)(aBlock + 16);
  if (!v40)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v115, AssociatedTypeWitness);
  }
  uint64_t v41 = aBlock + ((*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80));
  uint64_t v130 = *(void *)(v120 + 72);
  uint64_t v114 = aBlock;
  swift_bridgeObjectRetain();
  uint64_t v42 = v41;
  uint64_t v43 = v40;
  uint64_t v44 = (int *)v111;
  do
  {
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v42, (uint64_t)v27, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v45 = *(void *)&v27[v44[8]];
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v45)
    {
      swift_bridgeObjectRelease();
      Swift::String v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v126 + 56);
      v46(v117, 1, 1, v127);
      swift_bridgeObjectRetain();
      uint64_t v47 = v41;
      uint64_t v48 = v40;
      uint64_t v122 = (uint64_t)v46;
      while (1)
      {
        _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v47, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        if (v23[16] != 255) {
          break;
        }
        _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        v47 += v130;
        if (!--v48)
        {
          uint64_t v49 = 1;
          uint64_t v50 = v119;
          uint64_t v51 = v108;
          goto LABEL_12;
        }
      }
      uint64_t v51 = v108;
      _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0((uint64_t)v23, v108, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v49 = 0;
      uint64_t v50 = v119;
LABEL_12:
      uint64_t v52 = v120;
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v120 + 56))(v51, v49, 1, v44);
      swift_bridgeObjectRelease();
      int v53 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(v52 + 48))(v51, 1, v44);
      uint64_t v105 = AssociatedTypeWitness;
      if (v53 == 1)
      {
        outlined destroy of UTType?(v51, &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
        uint64_t v54 = v127;
      }
      else
      {
        uint64_t v55 = v109;
        uint64_t v56 = _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v51, v109, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        id v57 = v107;
        ((void (*)(uint64_t))v118)(v56);
        uint64_t v58 = v112;
        id v59 = v117;
        uint64_t v60 = v113;
        v121 = *(uint64_t **)(v112 + 8);
        uint64_t v120 = v112 + 8;
        ((void (*)(char *, uint64_t))v121)(v117, v113);
        ((void (*)(char *, void, uint64_t, uint64_t))v122)(v57, 0, 1, v127);
        uint64_t v61 = v57;
        uint64_t v62 = v60;
        (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v59, v61, v60);
        int v63 = *(unsigned __int8 *)(v55 + 16);
        if (v63 == 255)
        {
          uint64_t v64 = 0;
          uint64_t v54 = v127;
          uint64_t v50 = v119;
        }
        else
        {
          uint64_t v65 = *(void *)v55;
          uint64_t v66 = *(void *)(v55 + 8);
          uint64_t v131 = *(void *)v55;
          uint64_t v132 = v66;
          LODWORD(v122) = v63 & 1;
          char v133 = v63 & 1;
          uint64_t v67 = v106;
          (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v106, v59, v62);
          uint64_t v68 = v126;
          uint64_t v69 = v127;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v126 + 48))(v67, 1, v127) == 1)
          {
            outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(v65, v66, v122);
            ((void (*)(char *, uint64_t))v121)(v67, v62);
            v136 = 0;
            long long aBlock = 0u;
            long long v135 = 0u;
          }
          else
          {
            *((void *)&v135 + 1) = v69;
            v136 = v128;
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&aBlock);
            (*(void (**)(uint64_t *, char *, uint64_t))(v68 + 32))(boxed_opaque_existential_1, v67, v69);
            outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(v65, v66, v122);
          }
          uint64_t v54 = v69;
          uint64_t v50 = v119;
          CFStringRef v71 = ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)((uint64_t)&aBlock);
          uint64_t v73 = v72;
          outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v131, v132, v133);
          outlined destroy of UTType?((uint64_t)&aBlock, &demangling cache variable for type metadata for Transferable?);
          if (v73)
          {
            uint64_t v64 = (void *)MEMORY[0x216683720](v71, v73);
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v64 = 0;
          }
        }
        objc_msgSend(v125, sel_setSuggestedName_, v64);

        _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v109, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      }
      uint64_t v74 = v113;
      uint64_t v75 = v112;
      (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v50, v117, v113);
      uint64_t v76 = v126;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v126 + 48))(v50, 1, v54) == 1)
      {
        v118();
        (*(void (**)(char *, uint64_t))(v75 + 8))(v50, v74);
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v129, v50, v54);
      }
      uint64_t v120 = v76 + 16;
      v119 = (char *)(v76 + 32);
      v118 = (void (*)(void))&v135;
      while (1)
      {
        _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v41, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        v87 = (uint64_t *)&v20[v44[8]];
        uint64_t v88 = *v87;
        if (*v87)
        {
          uint64_t v89 = v87[1];
          uint64_t v90 = &v20[v44[10]];
          uint64_t v91 = *(uint64_t (**)(uint64_t *))v90;
          uint64_t v92 = *((void *)v90 + 1);
          outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v88);
          outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?((uint64_t)v91);
          char v93 = static NSItemProvider.Loader.shouldExport<A>(condition:item:)(v91, v92, v129, v54, (uint64_t)v128);
          outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v91);
          if ((v93 & 1) == 0) {
            goto LABEL_35;
          }
          uint64_t v94 = *(void *)&v20[v44[7]];
          if (v94 == MEMORY[0x263F06F78])
          {
            uint64_t v77 = UTType.identifier.getter();
            uint64_t v122 = MEMORY[0x216683720](v77);
            swift_bridgeObjectRelease();
            *(void *)&long long aBlock = *(void *)&v20[v44[11]];
            v121 = (uint64_t *)TransferRepresentationVisibility.itemProviderVisibility.getter();
            uint64_t v78 = v126;
            id v79 = v123;
            (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v123, v129, v54);
            unint64_t v80 = (*(unsigned __int8 *)(v78 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
            uint64_t v81 = (char *)swift_allocObject();
            uint64_t v82 = v127;
            uint64_t v83 = (uint64_t)v128;
            *((void *)v81 + 2) = v127;
            *((void *)v81 + 3) = v83;
            *((void *)v81 + 4) = v88;
            *((void *)v81 + 5) = v89;
            (*(void (**)(char *, char *, uint64_t))(v78 + 32))(&v81[v80], v79, v82);
            v136 = partial apply for closure #3 in NSItemProvider.register<A>(_:);
            v137 = v81;
            *(void *)&long long aBlock = MEMORY[0x263EF8330];
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v135 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
            *((void *)&v135 + 1) = &block_descriptor_9;
            uint64_t v84 = _Block_copy(&aBlock);
            swift_retain();
            uint64_t v54 = v127;
            swift_release();
            uint64_t v85 = (void *)v122;
            objc_msgSend(v125, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v122, v121, v84);
            uint64_t v86 = v84;
          }
          else
          {
            if (v94 != type metadata accessor for SentTransferredFile(0))
            {
LABEL_35:
              _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
              outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v88);
              goto LABEL_30;
            }
            uint64_t v122 = v20[v44[6]] & 1;
            uint64_t v95 = UTType.identifier.getter();
            v121 = (uint64_t *)MEMORY[0x216683720](v95);
            swift_bridgeObjectRelease();
            *(void *)&long long aBlock = *(void *)&v20[v44[11]];
            uint64_t v110 = TransferRepresentationVisibility.itemProviderVisibility.getter();
            uint64_t v96 = v126;
            uint64_t v97 = v123;
            (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v123, v129, v54);
            unint64_t v98 = (*(unsigned __int8 *)(v96 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
            uint64_t v99 = (char *)swift_allocObject();
            uint64_t v100 = v127;
            uint64_t v101 = (uint64_t)v128;
            *((void *)v99 + 2) = v127;
            *((void *)v99 + 3) = v101;
            *((void *)v99 + 4) = v88;
            *((void *)v99 + 5) = v89;
            (*(void (**)(char *, char *, uint64_t))(v96 + 32))(&v99[v98], v97, v100);
            v136 = partial apply for closure #4 in NSItemProvider.register<A>(_:);
            v137 = v99;
            *(void *)&long long aBlock = MEMORY[0x263EF8330];
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v135 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
            *((void *)&v135 + 1) = &block_descriptor_1;
            uint64_t v102 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            uint64_t v85 = v121;
            objc_msgSend(v125, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, v121, v122, v110, v102);
            uint64_t v86 = v102;
            uint64_t v54 = v127;
          }
          _Block_release(v86);

          outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v88);
        }
        _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
LABEL_30:
        v41 += v130;
        if (!--v40)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v129, v54);
          (*(void (**)(char *, uint64_t))(v112 + 8))(v117, v113);
          uint64_t AssociatedTypeWitness = v105;
          return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v115, AssociatedTypeWitness);
        }
      }
    }
    v42 += v130;
    --v43;
  }
  while (v43);
  swift_bridgeObjectRelease_n();
  return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v115, AssociatedTypeWitness);
}

uint64_t TransferRepresentationVisibility.itemProviderVisibility.getter()
{
  TransferRepresentationVisibility.all.unsafeMutableAddressor();
  lazy protocol witness table accessor for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility();
  if (dispatch thunk of static Equatable.== infix(_:_:)()) {
    return 0;
  }
  TransferRepresentationVisibility.ownProcess.unsafeMutableAddressor();
  if (dispatch thunk of static Equatable.== infix(_:_:)()) {
    return 3;
  }
  TransferRepresentationVisibility.team.unsafeMutableAddressor();
  if (dispatch thunk of static Equatable.== infix(_:_:)()) {
    return 1;
  }
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v23 = a7;
  uint64_t v24 = a1;
  uint64_t v12 = *(void *)(a6 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a5, a6);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  uint64_t v20 = v23;
  *((void *)v19 + 4) = a6;
  *((void *)v19 + 5) = v20;
  *((void *)v19 + 6) = a3;
  *((void *)v19 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v19[v18], (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
  uint64_t v21 = &v19[(v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = a2;
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in NSItemProvider.register<A>(_:), (uint64_t)v19);
  return swift_release();
}

uint64_t closure #1 in closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  v14[24] = v17;
  v14[25] = v18;
  v14[22] = a7;
  v14[23] = a8;
  v14[20] = a5;
  v14[21] = a6;
  v14[19] = a4;
  return MEMORY[0x270FA2498](static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:), 0, 0);
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_26C3BFC20, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ());
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

uint64_t closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v23 = a7;
  uint64_t v24 = a1;
  uint64_t v12 = *(void *)(a6 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TaskPriority.userInitiated.getter();
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a5, a6);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  uint64_t v20 = v23;
  *((void *)v19 + 4) = a6;
  *((void *)v19 + 5) = v20;
  *((void *)v19 + 6) = a3;
  *((void *)v19 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v19[v18], (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a6);
  uint64_t v21 = &v19[(v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = a2;
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #4 in NSItemProvider.register<A>(_:), (uint64_t)v19);
  return swift_release();
}

uint64_t closure #1 in closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(a4, a5, a6, a7, a8, v17, v18);
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_26C3BFC70, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ());
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_retain();
  uint64_t v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();

  return v8;
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v10);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    uint64_t v14 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3) {
    uint64_t v16 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v16 = 0;
  }
  (*(void (**)(uint64_t, void *, void, void *))(a4 + 16))(a4, v14, a2 & 1, v16);
}

uint64_t NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[22] = a4;
  v5[23] = v4;
  v5[20] = a2;
  v5[21] = a3;
  v5[19] = a1;
  uint64_t v6 = *(void *)(a3 - 8);
  v5[24] = v6;
  v5[25] = *(void *)(v6 + 64);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResolvedTransferRepresentation?);
  v5[28] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Optional();
  v5[29] = v7;
  v5[30] = *(void *)(v7 - 8);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ResolvedTransferRepresentation();
  v5[35] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[36] = v9;
  v5[37] = *(void *)(v9 + 64);
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[43] = AssociatedTypeWitness;
  uint64_t v11 = type metadata accessor for _TransferRepresentationValue();
  v5[44] = v11;
  v5[45] = *(void *)(v11 - 8);
  v5[46] = swift_task_alloc();
  v5[47] = *(void *)(AssociatedTypeWitness - 8);
  v5[48] = swift_task_alloc();
  v5[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](NSItemProvider.registerTransferable<A>(_:), 0, 0);
}

uint64_t NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v125 = v0;
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v120 = *(void *)(v0 + 352);
  uint64_t v6 = *(void *)(v0 + 344);
  (*(void (**)(void, void))(*(void *)(v0 + 176) + 24))(*(void *)(v0 + 168), *(void *)(v0 + 176));
  swift_getDynamicType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v6);
  _TransferRepresentationValue.init(_:)(v2, v6, v3);
  _TransferRepresentationInputs.init()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(AssociatedConformanceWitness + 48))(&v122, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v120);
  uint64_t v8 = v122;
  uint64_t v9 = *(void *)(v122 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  v117 = (uint64_t *)(v0 + 112);
  uint64_t v11 = *(void *)(v0 + 280);
  uint64_t v10 = *(void *)(v0 + 288);
  unint64_t v108 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v122 + v108;
  uint64_t v13 = *(void *)(v10 + 72);
  swift_bridgeObjectRetain();
  uint64_t v14 = v8 + v108;
  uint64_t v15 = v9;
  while (1)
  {
    uint64_t v16 = *(void *)(v0 + 336);
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v14, v16, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v17 = *(void *)(v16 + *(int *)(v11 + 32));
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v16, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    if (v17) {
      break;
    }
    v14 += v13;
    if (!--v15)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_37;
    }
  }
  uint64_t v119 = v11;
  uint64_t v18 = *(void *)(v0 + 320);
  uint64_t v19 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 192);
  uint64_t v21 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v22(v19, 1, 1, v21);
  swift_bridgeObjectRetain();
  uint64_t v23 = v12;
  uint64_t v24 = v9;
  while (1)
  {
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v23, *(void *)(v0 + 320), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v25 = *(void *)(v0 + 320);
    if (*(unsigned __int8 *)(v18 + 16) != 255) {
      break;
    }
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v25, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    v23 += v13;
    if (!--v24)
    {
      uint64_t v26 = 1;
      goto LABEL_12;
    }
  }
  _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v25, *(void *)(v0 + 224), (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  uint64_t v26 = 0;
LABEL_12:
  uint64_t v28 = *(void *)(v0 + 280);
  uint64_t v27 = *(void *)(v0 + 288);
  uint64_t v29 = *(void *)(v0 + 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v29, v26, 1, v28);
  swift_bridgeObjectRelease();
  uint64_t v121 = v13;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v29, 1, v28) == 1)
  {
    outlined destroy of UTType?(*(void *)(v0 + 224), &demangling cache variable for type metadata for ResolvedTransferRepresentation?);
    uint64_t v30 = v119;
  }
  else
  {
    uint64_t v112 = v22;
    uint64_t v31 = *(void *)(v0 + 328);
    uint64_t v32 = *(void *)(v0 + 264);
    uint64_t v105 = *(void *)(v0 + 272);
    uint64_t v33 = *(void *)(v0 + 232);
    uint64_t v34 = *(void *)(v0 + 240);
    uint64_t v109 = *(void *)(v0 + 168);
    uint64_t v35 = *(void (**)(uint64_t))(v0 + 152);
    uint64_t v36 = _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(*(void *)(v0 + 224), v31, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    v35(v36);
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v37(v105, v33);
    v112(v32, 0, 1, v109);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v105, v32, v33);
    int v38 = *(unsigned __int8 *)(v31 + 16);
    if (v38 == 255)
    {
      uint64_t v39 = 0;
      uint64_t v30 = v119;
    }
    else
    {
      uint64_t v113 = v37;
      uint64_t v40 = *(void *)v31;
      uint64_t v41 = *(void *)(v31 + 8);
      uint64_t v42 = *(void *)(v0 + 272);
      uint64_t v43 = *(void *)(v0 + 256);
      uint64_t v44 = *(void *)(v0 + 232);
      uint64_t v45 = *(void *)(v0 + 240);
      uint64_t v46 = *(void *)(v0 + 192);
      uint64_t v47 = *(void *)(v0 + 168);
      uint64_t v122 = *(void *)v31;
      uint64_t v123 = v41;
      char v48 = v38 & 1;
      char v124 = v38 & 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v43, v42, v44);
      int v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v43, 1, v47);
      uint64_t v50 = *(void *)(v0 + 256);
      if (v49 == 1)
      {
        uint64_t v51 = *(void *)(v0 + 232);
        outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(v40, v41, v48);
        v113(v50, v51);
        uint64_t v52 = v0 + 112;
        *(void *)(v0 + 144) = 0;
        *(_OWORD *)v117 = 0u;
        *(_OWORD *)(v0 + 128) = 0u;
      }
      else
      {
        uint64_t v53 = *(void *)(v0 + 192);
        long long v114 = *(_OWORD *)(v0 + 168);
        *(_OWORD *)(v0 + 136) = v114;
        uint64_t v52 = v0 + 112;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v117);
        (*(void (**)(uint64_t *, uint64_t, void))(v53 + 32))(boxed_opaque_existential_1, v50, v114);
        outlined copy of ResolvedTransferRepresentation.SuggestedFileNameStorage(v40, v41, v48);
      }
      uint64_t v30 = v119;
      uint64_t v55 = ResolvedTransferRepresentation.SuggestedFileNameStorage.resolved(_:)(v52);
      uint64_t v57 = v56;
      outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(v122, v123, v124);
      outlined destroy of UTType?(v52, &demangling cache variable for type metadata for Transferable?);
      if (v57)
      {
        uint64_t v39 = (void *)MEMORY[0x216683720](v55, v57);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v39 = 0;
      }
    }
    uint64_t v58 = *(void *)(v0 + 328);
    objc_msgSend(*(id *)(v0 + 184), sel_setSuggestedName_, v39);

    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v58, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  }
  uint64_t v59 = *(void *)(v0 + 248);
  uint64_t v60 = *(void *)(v0 + 192);
  uint64_t v61 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 240) + 16))(v59, *(void *)(v0 + 272), *(void *)(v0 + 232));
  int v62 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v59, 1, v61);
  uint64_t v63 = *(void *)(v0 + 248);
  if (v62 == 1)
  {
    uint64_t v65 = *(void *)(v0 + 232);
    uint64_t v64 = *(void *)(v0 + 240);
    (*(void (**)(void))(v0 + 152))();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 216), *(void *)(v0 + 248), *(void *)(v0 + 168));
  }
  uint64_t v66 = *(int **)(v0 + 280);
  unint64_t v100 = *(void *)(v0 + 296) + v108;
  uint64_t v101 = *(void *)(v0 + 192);
  v118 = v66;
  do
  {
    uint64_t v67 = *(void *)(v0 + 312);
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v12, v67, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    uint64_t v68 = *(void *)(v0 + 312);
    if (*(void *)(v67 + *(int *)(v30 + 32)))
    {
      uint64_t v69 = *(void *)(v0 + 216);
      uint64_t v71 = *(void *)(v0 + 168);
      uint64_t v70 = *(void *)(v0 + 176);
      uint64_t v72 = (uint64_t *)(v68 + v66[10]);
      uint64_t v73 = (uint64_t (*)(uint64_t *))*v72;
      uint64_t v74 = v72[1];
      outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(*v72);
      LOBYTE(v69) = static NSItemProvider.Loader.shouldExport<A>(condition:item:)(v73, v74, v69, v71, v70);
      outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?((uint64_t)v73);
      uint64_t v68 = *(void *)(v0 + 312);
      if ((v69 & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v75 = *(void *)(v68 + v66[7]);
      if (v75 == MEMORY[0x263F06F78])
      {
        uint64_t v85 = *(void *)(v0 + 304);
        uint64_t v86 = *(void *)(v0 + 208);
        uint64_t v87 = *(void *)(v0 + 216);
        v107 = *(void **)(v0 + 184);
        long long v111 = *(_OWORD *)(v0 + 168);
        uint64_t v88 = UTType.identifier.getter();
        uint64_t v116 = MEMORY[0x216683720](v88);
        swift_bridgeObjectRelease();
        uint64_t v122 = *(void *)(v68 + v66[11]);
        uint64_t v104 = TransferRepresentationVisibility.itemProviderVisibility.getter();
        _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v68, v85, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        (*(void (**)(uint64_t, uint64_t, void))(v101 + 16))(v86, v87, v111);
        unint64_t v89 = (v100 + *(unsigned __int8 *)(v101 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80);
        uint64_t v90 = swift_allocObject();
        *(_OWORD *)(v90 + 16) = v111;
        uint64_t v66 = v118;
        _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v85, v90 + v108, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        unint64_t v91 = v90 + v89;
        uint64_t v83 = (void *)v116;
        (*(void (**)(unint64_t, uint64_t, void))(v101 + 32))(v91, v86, v111);
        *(void *)(v0 + 96) = partial apply for closure #3 in NSItemProvider.registerTransferable<A>(_:);
        *(void *)(v0 + 104) = v90;
        *(void *)(v0 + 64) = MEMORY[0x263EF8330];
        *(void *)(v0 + 72) = 1107296256;
        *(void *)(v0 + 80) = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
        *(void *)(v0 + 88) = &block_descriptor_21;
        uint64_t v84 = _Block_copy((const void *)(v0 + 64));
        swift_release();
        objc_msgSend(v107, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v116, v104, v84);
      }
      else
      {
        if (v75 != type metadata accessor for SentTransferredFile(0))
        {
LABEL_27:
          uint64_t v30 = v119;
          goto LABEL_28;
        }
        uint64_t v76 = *(void *)(v0 + 304);
        uint64_t v78 = *(void *)(v0 + 208);
        uint64_t v77 = *(void *)(v0 + 216);
        uint64_t v106 = *(void **)(v0 + 184);
        uint64_t v103 = *(unsigned char *)(v68 + v118[6]) & 1;
        long long v110 = *(_OWORD *)(v0 + 168);
        uint64_t v79 = UTType.identifier.getter();
        uint64_t v115 = MEMORY[0x216683720](v79);
        swift_bridgeObjectRelease();
        uint64_t v122 = *(void *)(v68 + v118[11]);
        uint64_t v102 = TransferRepresentationVisibility.itemProviderVisibility.getter();
        _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v68, v76, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        (*(void (**)(uint64_t, uint64_t, void))(v101 + 16))(v78, v77, v110);
        unint64_t v80 = (v100 + *(unsigned __int8 *)(v101 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80);
        uint64_t v81 = swift_allocObject();
        *(_OWORD *)(v81 + 16) = v110;
        _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v76, v81 + v108, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        unint64_t v82 = v81 + v80;
        uint64_t v83 = (void *)v115;
        (*(void (**)(unint64_t, uint64_t, void))(v101 + 32))(v82, v78, v110);
        *(void *)(v0 + 48) = partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:);
        *(void *)(v0 + 56) = v81;
        uint64_t v66 = v118;
        *(void *)(v0 + 16) = MEMORY[0x263EF8330];
        *(void *)(v0 + 24) = 1107296256;
        *(void *)(v0 + 32) = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
        *(void *)(v0 + 40) = &block_descriptor_15;
        uint64_t v84 = _Block_copy((const void *)(v0 + 16));
        swift_release();
        objc_msgSend(v106, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, v115, v103, v102, v84);
      }
      uint64_t v30 = v119;
      _Block_release(v84);

      uint64_t v68 = *(void *)(v0 + 312);
    }
LABEL_28:
    _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(v68, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    v12 += v121;
    --v9;
  }
  while (v9);
  uint64_t v92 = *(void *)(v0 + 272);
  uint64_t v93 = *(void *)(v0 + 232);
  uint64_t v94 = *(void *)(v0 + 240);
  uint64_t v95 = *(void *)(v0 + 216);
  uint64_t v96 = *(void *)(v0 + 192);
  uint64_t v97 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
  (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v92, v93);
LABEL_37:
  (*(void (**)(void, void))(*(void *)(v0 + 376) + 8))(*(void *)(v0 + 392), *(void *)(v0 + 344));
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
  swift_task_dealloc();
  unint64_t v98 = *(uint64_t (**)(void))(v0 + 8);
  return v98();
}

uint64_t closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v8 = *(void *)(a5 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(a3, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v25, a5);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (v12 + *(unsigned __int8 *)(v8 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  uint64_t v21 = v26;
  *((void *)v20 + 4) = a5;
  *((void *)v20 + 5) = v21;
  _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0((uint64_t)v13, (uint64_t)&v20[v18], (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  uint64_t v22 = &v20[(v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v23 = v28;
  *(void *)uint64_t v22 = v27;
  *((void *)v22 + 1) = v23;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:), (uint64_t)v20);
  return swift_release();
}

uint64_t closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v10;
  v8[4] = a6;
  v8[5] = a7;
  id v8[2] = a4;
  v8[3] = a5;
  return MEMORY[0x270FA2498](closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:), 0, 0);
}

uint64_t closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *(void *)uint64_t v5 = v0;
  *(void *)(v5 + 8) = closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:);
  long long v6 = *(_OWORD *)(v0 + 24);
  long long v7 = *(_OWORD *)(v0 + 40);
  *(void *)(v5 + 200) = *(void *)(v0 + 56);
  *(_OWORD *)(v5 + 184) = v7;
  *(_OWORD *)(v5 + 168) = v6;
  *(void *)(v5 + 152) = v4;
  *(void *)(v5 + 160) = v3;
  return MEMORY[0x270FA2498](static NSItemProvider.Loader.loadData<A>(exporting:transferable:completionHandler:), 0, 0);
}

uint64_t closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v8 = *(void *)(a5 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TaskPriority.userInitiated.getter();
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(a3, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v25, a5);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (v12 + *(unsigned __int8 *)(v8 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  uint64_t v21 = v26;
  *((void *)v20 + 4) = a5;
  *((void *)v20 + 5) = v21;
  _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0((uint64_t)v13, (uint64_t)&v20[v18], (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  uint64_t v22 = &v20[(v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v23 = v28;
  *(void *)uint64_t v22 = v27;
  *((void *)v22 + 1) = v23;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:), (uint64_t)v20);
  return swift_release();
}

uint64_t closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v10;
  v8[4] = a6;
  v8[5] = a7;
  id v8[2] = a4;
  v8[3] = a5;
  return MEMORY[0x270FA2498](closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:), 0, 0);
}

uint64_t closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ResolvedTransferRepresentation() + 32));
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  *uint64_t v5 = v0;
  v5[1] = closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:);
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[4];
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[3];
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(v4, v3, v10, v8, v9, v6, v7);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v72 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v71 = a5;
  uint64_t v11 = type metadata accessor for Result();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)&v60[-v13];
  uint64_t v15 = type metadata accessor for UTType();
  uint64_t v68 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v67 = &v60[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v18 = *(void *)(*((void *)v17 - 1) + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t result = MEMORY[0x270FA5388](v19);
  uint64_t v70 = &v60[-v23];
  uint64_t v73 = a1;
  if (*(void *)(a1 + 16) <= a2)
  {
    lazy protocol witness table accessor for type TransferableSupportError and conformance TransferableSupportError();
    uint64_t v35 = swift_allocError();
    *uint64_t v36 = 0;
    *uint64_t v14 = v35;
    swift_storeEnumTagMultiPayload();
    a3(v14);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    uint64_t v65 = a3;
    uint64_t v66 = a4;
    if (a2 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = v22;
      uint64_t v64 = v15;
      uint64_t v25 = *(unsigned __int8 *)(v21 + 80);
      uint64_t v26 = v70;
      _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v73 + ((v25 + 32) & ~v25) + *(void *)(v21 + 72) * a2, (uint64_t)v70, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      uint64_t v27 = &v26[v17[5]];
      uint64_t v28 = UTType.identifier.getter();
      uint64_t v29 = (void *)MEMORY[0x216683720](v28);
      swift_bridgeObjectRelease();
      id v30 = v69;
      unsigned int v31 = objc_msgSend(v69, sel_hasRepresentationConformingToTypeIdentifier_fileOptions_, v29, 0);

      if (v31 && (uint64_t v32 = (uint64_t *)&v26[v17[9]], (v33 = *v32) != 0))
      {
        uint64_t v62 = v32[1];
        uint64_t v63 = v33;
        if (*(void *)&v26[v17[7]] == MEMORY[0x263F06F78])
        {
          int v61 = 0;
        }
        else
        {
          if (v26[v17[6]]) {
            int v34 = 1;
          }
          else {
            int v34 = 2;
          }
          int v61 = v34;
        }
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v68 + 16))(v67, v27, v64);
        _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0((uint64_t)v26, v24, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        uint64_t v37 = (v25 + 48) & ~v25;
        unint64_t v38 = (v18 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v40 = (void *)swift_allocObject();
        uint64_t v41 = v72;
        v40[2] = v71;
        v40[3] = v41;
        uint64_t v42 = v66;
        v40[4] = v65;
        v40[5] = v42;
        _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(v24, (uint64_t)v40 + v37, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
        *(void *)((char *)v40 + v38) = v30;
        *(void *)((char *)v40 + v39) = v73;
        *(void *)((char *)v40 + ((v39 + 15) & 0xFFFFFFFFFFFFFFF8)) = a2;
        uint64_t v44 = v62;
        uint64_t v43 = v63;
        outlined copy of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed TransferableCurrency) -> (@out Transferable, @error @owned Error))?(v63);
        swift_retain();
        id v45 = v30;
        swift_bridgeObjectRetain();
        if ((_BYTE)v61)
        {
          uint64_t v46 = v67;
          if (v61 == 1)
          {
            uint64_t v47 = UTType.identifier.getter();
            char v48 = (void *)MEMORY[0x216683720](v47);
            swift_bridgeObjectRelease();
            int v49 = (void *)swift_allocObject();
            uint64_t v50 = v72;
            v49[2] = v71;
            v49[3] = v50;
            v49[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
            v49[5] = v40;
            v49[6] = v43;
            v49[7] = v44;
            uint64_t v78 = partial apply for closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
            uint64_t v79 = v49;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v75 = 1107296256;
            uint64_t v76 = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ();
            uint64_t v77 = &block_descriptor_36;
            uint64_t v51 = _Block_copy(&aBlock);
            swift_retain();
            swift_retain();
            swift_release();
            id v52 = objc_msgSend(v45, sel_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler_, v48, v51);
          }
          else
          {
            uint64_t v56 = UTType.identifier.getter();
            char v48 = (void *)MEMORY[0x216683720](v56);
            swift_bridgeObjectRelease();
            uint64_t v57 = (void *)swift_allocObject();
            uint64_t v58 = v72;
            v57[2] = v71;
            v57[3] = v58;
            v57[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
            v57[5] = v40;
            v57[6] = v43;
            v57[7] = v44;
            uint64_t v78 = partial apply for closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
            uint64_t v79 = v57;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v75 = 1107296256;
            uint64_t v76 = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @guaranteed Error?) -> ();
            uint64_t v77 = &block_descriptor_30;
            uint64_t v51 = _Block_copy(&aBlock);
            swift_retain();
            swift_retain();
            swift_release();
            id v52 = objc_msgSend(v45, sel_loadFileRepresentationForTypeIdentifier_completionHandler_, v48, v51);
          }
        }
        else
        {
          uint64_t v46 = v67;
          uint64_t v53 = UTType.identifier.getter();
          char v48 = (void *)MEMORY[0x216683720](v53);
          swift_bridgeObjectRelease();
          uint64_t v54 = (void *)swift_allocObject();
          uint64_t v55 = v72;
          v54[2] = v71;
          v54[3] = v55;
          v54[4] = partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:);
          v54[5] = v40;
          v54[6] = v43;
          v54[7] = v44;
          uint64_t v78 = partial apply for closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:);
          uint64_t v79 = v54;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v75 = 1107296256;
          uint64_t v76 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
          uint64_t v77 = &block_descriptor_42;
          uint64_t v51 = _Block_copy(&aBlock);
          swift_retain();
          swift_retain();
          swift_release();
          id v52 = objc_msgSend(v45, sel_loadDataRepresentationForTypeIdentifier_completionHandler_, v48, v51);
        }
        uint64_t v26 = v70;
        id v59 = v52;
        _Block_release(v51);

        swift_release();
        outlined consume of (@escaping @callee_guaranteed @Sendable @async (@in_guaranteed Transferable) -> (@out TransferableCurrency, @error @owned Error))?(v43);
        (*(void (**)(unsigned char *, uint64_t))(v68 + 8))(v46, v64);
      }
      else
      {
        NSItemProvider.load<A>(from:at:completionHandler:)(v73, a2 + 1, v65, v66, v71, v72);
      }
      return _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    }
  }
  return result;
}

void closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v42 = a5;
  uint64_t v43 = a7;
  uint64_t v41 = a6;
  uint64_t v44 = a4;
  id v45 = a2;
  uint64_t v40 = type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v12 = MEMORY[0x270FA5388](v40);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v18 = type metadata accessor for Result();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (void **)((char *)&v38 - v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v38 - v23, a1, v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = a8;
    uint64_t v39 = a3;
    uint64_t v25 = *v24;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)logger);
    _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(v44, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    id v27 = v25;
    id v28 = v25;
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v47 = v33;
      *(_DWORD *)uint64_t v31 = 136315394;
      uint64_t v34 = UTType.identifier.getter();
      uint64_t v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
      *(_WORD *)(v31 + 12) = 2112;
      id v36 = v25;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v46 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v32 = v37;

      _os_log_impl(&dword_21283E000, v29, v30, "Error loading %s: %@", (uint8_t *)v31, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x216684270](v32, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x216684270](v33, -1, -1);
      MEMORY[0x216684270](v31, -1, -1);
    }
    else
    {
      _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ResolvedTransferRepresentation);
    }
    if (__OFADD__(v43, 1))
    {
      __break(1u);
    }
    else
    {
      NSItemProvider.load<A>(from:at:completionHandler:)(v41, v43 + 1, v45, v39, v38, a9);
    }
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v15 + 32))(v17, v24, a8);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v22, v17, a8);
    swift_storeEnumTagMultiPayload();
    v45(v22);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a8);
  }
}

id NSItemProvider.loadTransferable<A>(type:completionHandler:)(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t v22 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = type metadata accessor for _TransferRepresentationValue();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v22 - v17;
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  swift_getDynamicType();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, AssociatedTypeWitness);
  _TransferRepresentationValue.init(_:)((uint64_t)v16, AssociatedTypeWitness, (uint64_t)v12);
  _TransferRepresentationInputs.init()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, char *))(AssociatedConformanceWitness + 48))(&v24, v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  NSItemProvider.load<A>(from:at:completionHandler:)(v24, 0, v22, v23, a4, a5);
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB8]), sel_init);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, AssociatedTypeWitness);
  return v20;
}

Swift::Bool __swiftcall TransferRepresentationVisibility.conforms(to:)(CoreTransferable::TransferRepresentationVisibility to)
{
  return *v1 >= *(void *)to.rawValue;
}

void backupDirectory()()
{
  v35[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v32 - v5;
  static URL.cachesDirectory.getter();
  id v7 = objc_msgSend(self, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v6, v0);
  id v10 = objc_msgSend(self, sel_defaultManager);
  uint64_t v11 = URL.path.getter();
  uint64_t v12 = (void *)MEMORY[0x216683720](v11);
  swift_bridgeObjectRelease();
  v35[0] = 0;
  unsigned int v13 = objc_msgSend(v10, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v12, 1, 0, v35);

  id v14 = v35[0];
  if (v13)
  {
    id v15 = v14;
  }
  else
  {
    id v33 = v35[0];
    id v16 = v35[0];
    uint64_t v17 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)logger);
    id v19 = v17;
    id v20 = v17;
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      id v33 = (id)swift_slowAlloc();
      v35[0] = v33;
      *(_DWORD *)uint64_t v23 = 136315394;
      static URL.cachesDirectory.getter();
      uint64_t v24 = URL.path.getter();
      uint64_t v25 = v4;
      unint64_t v27 = v26;
      v9(v25, v0);
      uint64_t v34 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v27, (uint64_t *)v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2112;
      id v28 = v17;
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v34 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      os_log_type_t v30 = v32;
      *uint64_t v32 = v29;

      _os_log_impl(&dword_21283E000, v21, v22, "Failed to create a directory in %s. Error: %@", (uint8_t *)v23, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x216684270](v30, -1, -1);
      id v31 = v33;
      swift_arrayDestroy();
      MEMORY[0x216684270](v31, -1, -1);
      MEMORY[0x216684270](v23, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21287AE28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for implicit closure #1 in NSItemProvider.init<A>(transferable:)()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t partial apply for closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.register<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, void, void, char *))closure #4 in NSItemProvider.register<A>(_:));
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

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #3 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.register<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, void, void, char *))closure #3 in NSItemProvider.register<A>(_:));
}

uint64_t partial apply for closure #4 in NSItemProvider.register<A>(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, void, void, char *))
{
  a3(a1, a2, *((void *)v3 + 4), *((void *)v3 + 5), &v3[(*(unsigned __int8 *)(*(void *)(*((void *)v3 + 2) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*((void *)v3 + 2) - 8) + 80)]);
  return 0;
}

unint64_t lazy protocol witness table accessor for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility()
{
  unint64_t result = lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility;
  if (!lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TransferRepresentationVisibility and conformance TransferRepresentationVisibility);
  }
  return result;
}

uint64_t partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))closure #4 in NSItemProvider.registerTransferable<A>(_:));
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v14 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  id v8 = (uint64_t *)(v0 + v4);
  int v9 = *(unsigned __int8 *)(v0 + v4 + 16);
  if (v9 != 255) {
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v8, v8[1], v9 & 1);
  }
  id v10 = (char *)v8 + v2[5];
  uint64_t v11 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  if (*(uint64_t *)((char *)v8 + v2[8])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[9])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[10])) {
    swift_release();
  }
  uint64_t v12 = (v4 + v14 + v6) & ~v6;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v12, v1);

  return MEMORY[0x270FA0238](v0, v12 + v7, v3 | v6 | 7);
}

uint64_t partial apply for closure #3 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(a1, a2, (void (*)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))closure #3 in NSItemProvider.registerTransferable<A>(_:));
}

uint64_t partial apply for closure #4 in NSItemProvider.registerTransferable<A>(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  a3(a1, a2, v3 + v10, v3+ ((v10 + *(void *)(v9 + 64) + *(unsigned __int8 *)(*(void *)(v7 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80)), v7, v8);
  return 0;
}

uint64_t sub_21287B36C()
{
  uint64_t v1 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_release();
  uint64_t v5 = (uint64_t *)(v0 + v3);
  int v6 = *(unsigned __int8 *)(v0 + v3 + 16);
  if (v6 != 255) {
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v5, v5[1], v6 & 1);
  }
  uint64_t v7 = (char *)v5 + v1[5];
  uint64_t v8 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  if (*(uint64_t *)((char *)v5 + v1[8])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v5 + v1[9])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v5 + v1[10])) {
    swift_release();
  }
  unint64_t v9 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

void partial apply for closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  closure #1 in NSItemProvider.load<A>(from:at:completionHandler:)(a1, *(void (**)(char *))(v1 + 32), *(void *)(v1 + 40), v1 + v6, *(void *)(v1 + v7), *(void *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), v3, v4);
}

uint64_t partial apply for closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(void (*a1)(char *, char *, uint64_t), void *a2)
{
  return closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, *(void (**)(uint64_t *))(v2 + 32), *(void (**)(uint64_t *))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t partial apply for closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, int a2, void *a3)
{
  return closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 32), *(void (**)(uint64_t *))(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 16), *(void **)(v3 + 24));
}

uint64_t objectdestroy_26Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(uint64_t a1, unint64_t a2, void *a3)
{
  return closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_21287B68C()
{
  swift_unknownObjectRelease();
  swift_release();
  outlined consume of Data._Representation(*(void *)(v0 + 64), *(void *)(v0 + 72));
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t partial apply for closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *unint64_t v7 = v1;
  v7[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #1 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_21287B7AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = Transferable.file(contentType:fileHandler:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t _s16CoreTransferable30ResolvedTransferRepresentationVWOcTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21287B904()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t _s16CoreTransferable30ResolvedTransferRepresentationVWObTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = v0 + v3;
  unint64_t v7 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *unint64_t v10 = v1;
  v10[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #2 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v10, v11, v12, v4, v5, v6, v8, v9);
}

uint64_t sub_21287BBA0()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7 + 16) & ~v7;
  uint64_t v9 = v3 | v7 | 7;
  unint64_t v10 = ((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  uint64_t v11 = v0 + v4;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v12(v11, v1);
  swift_release();
  v12(v0 + v8, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v10, v9);
}

uint64_t partial apply for closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(type metadata accessor for ReceivedTransferredFile(0) - 8);
  unint64_t v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + v4;
  uint64_t v9 = *(void *)(v0 + v4);
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v11 = v0 + v6;
  uint64_t v12 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  unsigned int v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  *unsigned int v13 = v1;
  v13[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #3 in static NSItemProvider.LoadingRequest.perform<A>(for:currency:provider:contentType:importing:completionHandler:)((uint64_t)v13, v14, v15, v7, v9, v10, v11, v12);
}

uint64_t partial apply for closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  long long v11 = *(_OWORD *)(v0 + 32);
  unint64_t v5 = (v3 + *(void *)(v2 + 64) + *(unsigned __int8 *)(*(void *)(v11 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80);
  unint64_t v6 = (*(void *)(*(void *)(v11 - 8) + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v5;
  uint64_t v8 = swift_task_alloc();
  long long v9 = *(_OWORD *)(v0 + v6);
  *(void *)(v1 + 16) = v8;
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = partial apply for closure #4 in static URL.transferRepresentation.getter;
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = v11;
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v7;
  return MEMORY[0x270FA2498](closure #1 in closure #3 in NSItemProvider.registerTransferable<A>(_:), 0, 0);
}

uint64_t objectdestroy_64Tm()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)type metadata accessor for ResolvedTransferRepresentation();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v14 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_unknownObjectRelease();
  uint64_t v8 = (uint64_t *)(v0 + v4);
  int v9 = *(unsigned __int8 *)(v0 + v4 + 16);
  if (v9 != 255) {
    outlined consume of ResolvedTransferRepresentation.SuggestedFileNameStorage(*v8, v8[1], v9 & 1);
  }
  uint64_t v10 = (char *)v8 + v2[5];
  uint64_t v11 = type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  if (*(uint64_t *)((char *)v8 + v2[8])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[9])) {
    swift_release();
  }
  if (*(uint64_t *)((char *)v8 + v2[10])) {
    swift_release();
  }
  uint64_t v12 = (v4 + v14 + v6) & ~v6;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v12, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | v6 | 7);
}

uint64_t partial apply for closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:)()
{
  uint64_t v2 = *(void *)(type metadata accessor for ResolvedTransferRepresentation() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  long long v11 = *(_OWORD *)(v0 + 32);
  unint64_t v5 = (v3 + *(void *)(v2 + 64) + *(unsigned __int8 *)(*(void *)(v11 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80);
  unint64_t v6 = (*(void *)(*(void *)(v11 - 8) + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v5;
  uint64_t v8 = swift_task_alloc();
  long long v9 = *(_OWORD *)(v0 + v6);
  *(void *)(v1 + 16) = v8;
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = Transferable.file(contentType:fileHandler:);
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = v11;
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v7;
  return MEMORY[0x270FA2498](closure #1 in closure #4 in NSItemProvider.registerTransferable<A>(_:), 0, 0);
}

uint64_t _s16CoreTransferable30ResolvedTransferRepresentationVWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21287C440()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3)
{
  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> ()(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t partial apply for closure #1 in closure #3 in NSItemProvider.register<A>(_:)()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80);
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = (uint64_t)v0 + v2;
  unint64_t v6 = (void *)((char *)v0 + ((*(void *)(*(void *)(v0[4] - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *long long v9 = v1;
  v9[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return closure #1 in closure #3 in NSItemProvider.register<A>(_:)((uint64_t)v9, v10, v11, v3, v4, v5, v7, v8);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3)
{
  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t objectdestroy_79Tm()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t partial apply for closure #1 in closure #4 in NSItemProvider.register<A>(_:)()
{
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  unint64_t v4 = (*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80);
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = (uint64_t)v0 + v4;
  uint64_t v8 = (void *)((char *)v0 + ((*(void *)(*(void *)(v3 - 8) + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v11;
  *uint64_t v11 = v1;
  v11[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  uint64_t v12 = (void *)swift_task_alloc();
  v11[2] = v12;
  *uint64_t v12 = v11;
  v12[1] = partial apply for closure #4 in static URL.transferRepresentation.getter;
  return static NSItemProvider.Loader.loadFile<A>(exporting:transferable:completionHandler:)(v5, v6, v7, v9, v10, v3, v2);
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

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t AttributedString.characters.getter()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t type metadata accessor for AttributedString()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t AttributedString.init(_:)()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t URLResourceValues.contentType.getter()
{
  return MEMORY[0x270FA1638]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t AttributeContainer.init()()
{
  return MEMORY[0x270EEF060]();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return MEMORY[0x270EEF070]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.isFileURL.getter()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t static URL.cachesDirectory.getter()
{
  return MEMORY[0x270EEFC90]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t URL.lastPathComponent.getter()
{
  return MEMORY[0x270EEFCE0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingPathExtension()()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t URL.appendingPathExtension(for:)()
{
  return MEMORY[0x270FA1650]();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x270EEFD70]();
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

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x270EEFF58]();
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

uint64_t static Date.distantFuture.getter()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t static UTType.utf8PlainText.getter()
{
  return MEMORY[0x270FA1728]();
}

uint64_t UTType.init(filenameExtension:conformingTo:)()
{
  return MEMORY[0x270FA1750]();
}

uint64_t static UTType.== infix(_:_:)()
{
  return MEMORY[0x270FA1798]();
}

uint64_t static UTType.rtf.getter()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t static UTType.url.getter()
{
  return MEMORY[0x270FA17D8]();
}

uint64_t static UTType.data.getter()
{
  return MEMORY[0x270FA1800]();
}

uint64_t static UTType.html.getter()
{
  return MEMORY[0x270FA1818]();
}

uint64_t static UTType.fileURL.getter()
{
  return MEMORY[0x270FA18C8]();
}

uint64_t static UTType.flatRTFD.getter()
{
  return MEMORY[0x270FA18F0]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x270FA1938]();
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

uint64_t dispatch thunk of TopLevelDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EE3BF8]();
}

uint64_t dispatch thunk of TopLevelEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EE3C00]();
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
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

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t UnsafeRawBufferPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x270F9DA40]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
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

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t NSAttributedString.init(_:)()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t ManagedBuffer.deinit()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t LazyFilterSequence.filter(_:)()
{
  return MEMORY[0x270F9F058]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
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

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void CFRunLoopAddCommonMode(CFRunLoopRef rl, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x270FA0210]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}