uint64_t WhereAmIView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  v3 = *(void *)(v1 + 24);
  v2 = *(void *)(v1 + 32);
  v4 = *(void *)(v1 + 56);
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(void *)(a1 + 56) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id WhereAmIView.logObject.getter()
{
  return *(id *)(v0 + 80);
}

uint64_t WhereAmIView.mapView.getter()
{
  type metadata accessor for MapAspectRatio();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, void))(v1 + 104))((char *)&v3 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F77600]);
  return MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
}

uint64_t WhereAmIView.personRFPin.getter()
{
  return RFMapMarker.init(coordinate:title:image:tint:)();
}

uint64_t WhereAmIView.shareButton.getter@<X0>(uint64_t a1@<X8>)
{
  v2 = v1;
  uint64_t v71 = a1;
  uint64_t v3 = type metadata accessor for SeparatorStyle();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  MEMORY[0x270FA5388](v3);
  v70 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for RFButtonStyle();
  uint64_t v65 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  v64 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for ButtonContainerView();
  uint64_t v63 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  v61 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v67 = *(void *)(v7 - 8);
  uint64_t v68 = v7;
  MEMORY[0x270FA5388](v7);
  v62 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WhereAmIView();
  uint64_t v58 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v59 = v10;
  uint64_t v60 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for CharacterSet();
  uint64_t v11 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v14 - 8);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for URL();
  uint64_t v17 = *(void *)(v76 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v76);
  v57 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v19;
  MEMORY[0x270FA5388](v18);
  v75 = (char *)&v56 - v20;
  v21 = v2[10];
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_24FF2E000, v21, v22, "RF Share Button", v23, 2u);
    MEMORY[0x25337C850](v23, -1, -1);
  }
  unint64_t v25 = v2[6];
  uint64_t v24 = v2[7];
  uint64_t v26 = v2[8];
  uint64_t v27 = v2[9];
  v28 = (char *)v2 + *(int *)(v9 + 36);
  uint64_t v29 = *(void *)v28;
  char v30 = v28[8];
  swift_bridgeObjectRetain();
  outlined copy of Environment<VRXIdiom>.Content(v29, v30);
  specialized Environment.wrappedValue.getter(v29, v30);
  outlined consume of Environment<VRXIdiom>.Content(v29, v30);
  unint64_t v77 = v25;
  uint64_t v78 = v24;
  uint64_t v79 = v26;
  uint64_t v80 = v27;
  char v31 = VRXIdiom.isWatchOS.getter();
  unint64_t v77 = StandardMapData.makePunchoutURI(includeLabel:)((v31 & 1) == 0);
  uint64_t v78 = v32;
  static CharacterSet.urlQueryAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  uint64_t v34 = v33;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v74);
  swift_bridgeObjectRelease();
  if (v34)
  {
    URL.init(string:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v35 = v76;
  }
  else
  {
    uint64_t v35 = v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v16, 1, 1, v76);
    swift_bridgeObjectRelease();
  }
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, v35);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    v37 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v38 = v75;
    v37(v75, v16, v35);
    v39 = v57;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v57, v38, v35);
    uint64_t v40 = v60;
    outlined init with copy of WhereAmIView((uint64_t)v2, v60);
    uint64_t v41 = v35;
    unint64_t v42 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    unint64_t v43 = (v56 + *(unsigned __int8 *)(v58 + 80) + v42) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
    uint64_t v44 = swift_allocObject();
    v37((char *)(v44 + v42), v39, v41);
    uint64_t v74 = v44;
    outlined init with take of WhereAmIView(v40, v44 + v43);
    v45 = v61;
    ButtonContainerView.init(buttons:)();
    v46 = v64;
    static PrimitiveButtonStyle<>.rfButton.getter();
    uint64_t v47 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
    uint64_t v48 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
    v49 = v62;
    unint64_t v50 = v66;
    uint64_t v51 = v69;
    View.buttonStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v46, v51);
    (*(void (**)(char *, unint64_t))(v63 + 8))(v45, v50);
    uint64_t v53 = v72;
    uint64_t v52 = v73;
    v54 = v70;
    (*(void (**)(char *, void, uint64_t))(v72 + 104))(v70, *MEMORY[0x263F76988], v73);
    unint64_t v77 = v50;
    uint64_t v78 = v51;
    uint64_t v79 = v47;
    uint64_t v80 = v48;
    swift_getOpaqueTypeConformance2();
    uint64_t v55 = v68;
    View.separators(_:isOverride:)();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v52);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v49, v55);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v75, v76);
    return swift_release();
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

uint64_t type metadata accessor for WhereAmIView()
{
  uint64_t result = type metadata singleton initialization cache for WhereAmIView;
  if (!type metadata singleton initialization cache for WhereAmIView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t closure #1 in WhereAmIView.shareButton.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  uint64_t v2 = type metadata accessor for Locale();
  uint64_t v62 = *(void *)(v2 - 8);
  uint64_t v63 = v2;
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v48 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v64 = (char *)&v48 - v5;
  uint64_t v54 = type metadata accessor for ButtonItemButtonStyle.Role();
  uint64_t v6 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WhereAmIView();
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v49 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v50 = v16;
  uint64_t v51 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v57 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
  MEMORY[0x270FA5388](v59);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.privacySensitive(_:)>>.0);
  uint64_t v58 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v56 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyView>);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_24FF4EB30;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v52, v12);
  outlined init with copy of WhereAmIView(v53, (uint64_t)v11);
  unint64_t v25 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v26 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)v11, v26 + v25);
  ShareLink<>.init<>(item:subject:message:onPresentationChanged:)();
  uint64_t v27 = v54;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F774E8], v54);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel> and conformance ShareLink<A, B, C, D>, &demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
  uint64_t v28 = v50;
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v27);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v28);
  uint64_t KeyPath = swift_getKeyPath();
  id v30 = objc_msgSend(self, sel_sharedPreferences);
  id v31 = objc_msgSend(v30, sel_languageCode);

  if (v31)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v33 = v62;
    uint64_t v32 = v63;
  }
  else
  {
    uint64_t v34 = v48;
    static Locale.current.getter();
    Locale.identifier.getter();
    uint64_t v33 = v62;
    uint64_t v35 = v34;
    uint64_t v32 = v63;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v35, v63);
  }
  v36 = v64;
  Locale.init(identifier:)();
  uint64_t v37 = v59;
  v38 = (uint64_t *)&v23[*(int *)(v59 + 36)];
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))((char *)v38 + *(int *)(v39 + 28), v36, v32);
  uint64_t *v38 = KeyPath;
  uint64_t v40 = v57;
  uint64_t v41 = v60;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v23, v21, v60);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v41);
  unint64_t v42 = lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>();
  unint64_t v43 = v56;
  View.privacySensitive(_:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v23, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
  uint64_t v65 = v37;
  unint64_t v66 = v42;
  swift_getOpaqueTypeConformance2();
  uint64_t v44 = v61;
  uint64_t v45 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v43, v44);
  uint64_t v46 = v55;
  *(void *)(v55 + 32) = v45;
  uint64_t v65 = v46;
  specialized Array._endMutation()();
  return v65;
}

void closure #1 in closure #1 in WhereAmIView.shareButton.getter(char a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + *(int *)(type metadata accessor for WhereAmIView() + 40));
  if ((a1 & 1) == 0)
  {
    if (v3)
    {
      id v4 = v3;
      dispatch thunk of Context.didEndEditing()();
      goto LABEL_6;
    }
LABEL_9:
    type metadata accessor for Context();
    lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
    EnvironmentObject.error()();
    __break(1u);
    return;
  }
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = v3;
  dispatch thunk of Context.willBeginEditing()();
LABEL_6:
}

uint64_t key path getter for EnvironmentValues.locale : EnvironmentValues()
{
  return EnvironmentValues.locale.getter();
}

uint64_t key path setter for EnvironmentValues.locale : EnvironmentValues(uint64_t a1)
{
  type metadata accessor for Locale();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.locale.setter();
}

uint64_t WhereAmIView.header.getter()
{
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t WhereAmIView.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for WhereAmIView() - 8);
  uint64_t v2 = *(void *)(v1 + 64);
  MEMORY[0x270FA5388]();
  outlined init with copy of WhereAmIView(v0, (uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v4 + v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  return ComponentStack.init(content:)();
}

uint64_t closure #1 in WhereAmIView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a1;
  uint64_t v82 = a2;
  uint64_t v2 = type metadata accessor for SeparatorStyle();
  uint64_t v74 = *(void *)(v2 - 8);
  uint64_t v75 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v73 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  uint64_t v81 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v72 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  uint64_t v85 = *(void *)(v80 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v80);
  uint64_t v76 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v84 = (char *)&v64 - v7;
  uint64_t v78 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v86 = *(void *)(v78 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v78);
  unint64_t v77 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v83 = (char *)&v64 - v10;
  uint64_t v11 = type metadata accessor for WhereAmIView();
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v65 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = type metadata accessor for MapAspectRatio();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for MapView();
  uint64_t v66 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0);
  uint64_t v68 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.mapScope(_:)>>.0);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  v23 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v87 = (uint64_t)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v88 = (uint64_t)&v64 - v27;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F77600], v13);
  MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
  outlined init with copy of WhereAmIView(v71, (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v28 = (*(unsigned __int8 *)(v65 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
  uint64_t v29 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28);
  uint64_t v30 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, MEMORY[0x263F77990]);
  View.onTapGesture(count:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v19, v17);
  Namespace.wrappedValue.getter();
  uint64_t v89 = v17;
  uint64_t v90 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v67;
  View.mapScope(_:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v21, v31);
  uint64_t v32 = static Alignment.center.getter();
  uint64_t v33 = v87;
  double v35 = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v87, 0.0, 1, 157.0, 0, v32, v34);
  (*(void (**)(char *, uint64_t, double))(v69 + 8))(v23, v70, v35);
  outlined init with take of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(v33, v88);
  v36 = v83;
  WhereAmIView.header.getter();
  uint64_t v37 = v72;
  WhereAmIView.shareButton.getter(v72);
  uint64_t v39 = v73;
  uint64_t v38 = v74;
  uint64_t v40 = v75;
  (*(void (**)(char *, void, uint64_t))(v74 + 104))(v73, *MEMORY[0x263F76988], v75);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v42 = type metadata accessor for ButtonContainerView();
  uint64_t v43 = type metadata accessor for RFButtonStyle();
  uint64_t v44 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
  uint64_t v45 = lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
  uint64_t v89 = v42;
  uint64_t v90 = v43;
  uint64_t v91 = v44;
  uint64_t v92 = v45;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v89 = v41;
  uint64_t v90 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v47 = v76;
  uint64_t v48 = v79;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v37, v48);
  uint64_t v49 = v84;
  uint64_t v50 = v85;
  uint64_t v51 = v47;
  uint64_t v52 = v80;
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v84, v47, v80);
  uint64_t v53 = v87;
  outlined init with copy of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(v88, v87);
  uint64_t v81 = *(void *)(v86 + 16);
  uint64_t v54 = v77;
  uint64_t v55 = v36;
  uint64_t v56 = v78;
  ((void (*)(char *, char *, uint64_t))v81)(v77, v55, v78);
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  uint64_t v58 = v52;
  v57(v51, v49, v52);
  uint64_t v59 = v82;
  outlined init with copy of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(v53, v82);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0));
  ((void (*)(uint64_t, char *, uint64_t))v81)(v59 + *(int *)(v60 + 48), v54, v56);
  v57((char *)(v59 + *(int *)(v60 + 64)), v51, v58);
  uint64_t v61 = *(void (**)(char *, uint64_t))(v85 + 8);
  v61(v84, v58);
  uint64_t v62 = *(void (**)(char *, uint64_t))(v86 + 8);
  v62(v83, v56);
  outlined destroy of Environment<Locale>.Content(v88, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  v61(v51, v58);
  v62(v54, v56);
  return outlined destroy of Environment<Locale>.Content(v87, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
}

uint64_t closure #1 in closure #1 in WhereAmIView.body.getter(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for WhereAmIView();
  ActionHandler.wrappedValue.getter();
  uint64_t v12 = type metadata accessor for StandardActionHandler();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) == 1) {
    return outlined destroy of Environment<Locale>.Content((uint64_t)v10, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  double v35 = v7;
  v36 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_24FF4EB30;
  uint64_t v16 = type metadata accessor for Command();
  uint64_t v17 = MEMORY[0x263F771C0];
  uint64_t v31 = v16;
  *(void *)(v15 + 56) = v16;
  *(void *)(v15 + 64) = v17;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 32));
  uint64_t v18 = a1[6];
  uint64_t v19 = a1[7];
  uint64_t v20 = a1[8];
  uint64_t v21 = a1[9];
  uint64_t v22 = (char *)a1 + *(int *)(v11 + 36);
  uint64_t v23 = *(void *)v22;
  char v24 = v22[8];
  swift_bridgeObjectRetain();
  outlined copy of Environment<VRXIdiom>.Content(v23, v24);
  specialized Environment.wrappedValue.getter(v23, v24);
  outlined consume of Environment<VRXIdiom>.Content(v23, v24);
  uint64_t v37 = v18;
  uint64_t v38 = v19;
  uint64_t v39 = v20;
  uint64_t v40 = v21;
  char v25 = VRXIdiom.isWatchOS.getter();
  StandardMapData.makePunchoutURI(includeLabel:)((v25 & 1) == 0);
  if (one-time initialization token for appName != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = boxed_opaque_existential_1;
  AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *, void))(*(void *)(v31 - 8) + 104))(v26, *MEMORY[0x263F77180]);
  uint64_t v27 = (uint64_t)v35;
  ActionProperty.init(_:)();
  uint64_t v28 = type metadata accessor for ActionProperty();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
  uint64_t v29 = type metadata accessor for InteractionType();
  uint64_t v30 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v36, 1, 1, v29);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content(v30, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content(v27, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v10, v34);
}

uint64_t WhereAmIView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + 56) = v6;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  *(void *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  uint64_t v7 = (int *)type metadata accessor for WhereAmIView();
  ActionHandler.init()();
  *(void *)(a2 + v7[7]) = 0;
  uint64_t v8 = (uint64_t *)(a2 + v7[8]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a2 + v7[9];
  *(void *)uint64_t v9 = swift_getKeyPath();
  *(unsigned char *)(v9 + 8) = 0;
  uint64_t v10 = (uint64_t *)(a2 + v7[10]);
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
  uint64_t result = EnvironmentObject.init()();
  *uint64_t v10 = result;
  v10[1] = v12;
  return result;
}

uint64_t key path getter for EnvironmentValues.currentIdiom : EnvironmentValues@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.currentIdiom.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.currentIdiom : EnvironmentValues()
{
  return EnvironmentValues.currentIdiom.setter();
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance WhereAmIView()
{
  return MEMORY[0x270F032C8]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance WhereAmIView()
{
  return MEMORY[0x270F032D8]();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance WhereAmIView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance WhereAmIView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388]();
  outlined init with copy of WhereAmIView(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of WhereAmIView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  return ComponentStack.init(content:)();
}

uint64_t static WhereAmIView_Previews.previews.getter()
{
  if (one-time initialization token for myLocation != -1) {
    swift_once();
  }
  type metadata accessor for WhereAmIView();
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type WhereAmIView and conformance WhereAmIView, (void (*)(uint64_t))type metadata accessor for WhereAmIView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static WhereAmIView_Previews.previews.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = v5;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  uint64_t v6 = (int *)type metadata accessor for WhereAmIView();
  ActionHandler.init()();
  *(void *)(a2 + v6[7]) = 0;
  uint64_t v7 = (uint64_t *)(a2 + v6[8]);
  *uint64_t v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = a2 + v6[9];
  *(void *)uint64_t v8 = swift_getKeyPath();
  *(unsigned char *)(v8 + 8) = 0;
  uint64_t v9 = (uint64_t *)(a2 + v6[10]);
  type metadata accessor for Context();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
  uint64_t result = EnvironmentObject.init()();
  *uint64_t v9 = result;
  v9[1] = v11;
  return result;
}

uint64_t protocol witness for static PreviewProvider.platform.getter in conformance WhereAmIView_Previews()
{
  return MEMORY[0x270F001E8]();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance WhereAmIView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews();
  return MEMORY[0x270F00210](a1, v2);
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance WhereAmIView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews();
  return MEMORY[0x270F00200](a1, v2);
}

double one-time initialization function for myLocation()
{
  myLocation.label._countAndFlagsBits = 0xD000000000000010;
  myLocation.label._object = (void *)0x800000024FF50AC0;
  double result = 37.3349;
  *(_OWORD *)&myLocation.latitude = xmmword_24FF4EB40;
  return result;
}

uint64_t specialized Environment.wrappedValue.getter(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x6D6F696449585256, 0xE800000000000000, &v14);
      _os_log_impl(&dword_24FF2E000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25337C850](v11, -1, -1);
      MEMORY[0x25337C850](v10, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    outlined consume of Environment<VRXIdiom>.Content(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t outlined copy of Environment<VRXIdiom>.Content(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of Environment<VRXIdiom>.Content(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
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

uint64_t outlined init with copy of WhereAmIView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WhereAmIView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FF36AEC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)type metadata accessor for WhereAmIView();
  uint64_t v7 = *(unsigned __int8 *)(*((void *)v6 - 1) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*((void *)v6 - 1) + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v10 = v0 + v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v11 = v0 + v8 + v6[6];
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v0 + v8 + v6[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(void *)(v10 + v6[9]), *(unsigned char *)(v10 + v6[9] + 8));

  return MEMORY[0x270FA0238](v0, v8 + v9, v3 | v7 | 7);
}

uint64_t outlined init with take of WhereAmIView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WhereAmIView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in WhereAmIView.shareButton.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for WhereAmIView() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return closure #1 in WhereAmIView.shareButton.getter(v0 + v2, v5);
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
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

uint64_t type metadata accessor for RFMapMarker(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in WhereAmIView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type WhereAmIView_Previews and conformance WhereAmIView_Previews()
{
  unint64_t result = lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews;
  if (!lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews;
  if (!lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WhereAmIView_Previews and conformance WhereAmIView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in WhereAmIView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for WhereAmIView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v9;
    uint64_t v10 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v10;
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    uint64_t v11 = (void *)a2[10];
    uint64_t v12 = a3[6];
    uint64_t v33 = (uint64_t)a2 + v12;
    uint64_t v34 = a1 + v12;
    *(void *)(a1 + 80) = v11;
    uint64_t v13 = type metadata accessor for ActionHandler();
    uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = v11;
    v32(v34, v33, v13);
    uint64_t v15 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = type metadata accessor for Locale();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      void *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (uint64_t)a2 + v20;
    uint64_t v23 = *(void *)v22;
    char v24 = *(unsigned char *)(v22 + 8);
    outlined copy of Environment<VRXIdiom>.Content(*(void *)v22, v24);
    *(void *)uint64_t v21 = v23;
    v21[8] = v24;
    uint64_t v25 = a3[10];
    uint64_t v26 = (void *)((char *)v4 + v25);
    uint64_t v27 = (uint64_t)a2 + v25;
    uint64_t v29 = *(void **)v27;
    uint64_t v28 = *(void *)(v27 + 8);
    *uint64_t v26 = v29;
    v26[1] = v28;
    id v30 = v29;
  }
  return v4;
}

void destroy for WhereAmIView(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(void *)(a1 + a2[9]), *(unsigned char *)(a1 + a2[9] + 8));
  uint64_t v8 = *(void **)(a1 + a2[10]);
}

uint64_t initializeWithCopy for WhereAmIView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v10 = *(void **)(a2 + 80);
  uint64_t v11 = a3[6];
  uint64_t v31 = a2 + v11;
  uint64_t v32 = a1 + v11;
  *(void *)(a1 + 80) = v10;
  uint64_t v12 = type metadata accessor for ActionHandler();
  id v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = v10;
  v30(v32, v31, v12);
  uint64_t v14 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = type metadata accessor for Locale();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  else
  {
    *uint64_t v15 = *v16;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)v20;
  char v22 = *(unsigned char *)(v20 + 8);
  outlined copy of Environment<VRXIdiom>.Content(*(void *)v20, v22);
  *(void *)uint64_t v19 = v21;
  *(unsigned char *)(v19 + 8) = v22;
  uint64_t v23 = a3[10];
  char v24 = (void *)(a1 + v23);
  uint64_t v25 = a2 + v23;
  uint64_t v27 = *(void **)v25;
  uint64_t v26 = *(void *)(v25 + 8);
  *char v24 = v27;
  v24[1] = v26;
  id v28 = v27;
  return a1;
}

void *assignWithCopy for WhereAmIView(void *a1, void *a2, int *a3)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  uint64_t v6 = (void *)a2[10];
  uint64_t v7 = (void *)a1[10];
  a1[10] = v6;
  id v8 = v6;

  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  if (a1 != a2)
  {
    uint64_t v13 = a3[8];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    outlined destroy of Environment<Locale>.Content((uint64_t)a1 + v13, &demangling cache variable for type metadata for Environment<Locale>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = type metadata accessor for Locale();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = *(void *)v19;
  char v21 = v19[8];
  outlined copy of Environment<VRXIdiom>.Content(*(void *)v19, v21);
  uint64_t v22 = *(void *)v18;
  char v23 = v18[8];
  *(void *)uint64_t v18 = v20;
  v18[8] = v21;
  outlined consume of Environment<VRXIdiom>.Content(v22, v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (char *)a2 + v24;
  uint64_t v27 = *(void **)((char *)a1 + v24);
  id v28 = *(void **)v26;
  *uint64_t v25 = *(void *)v26;
  id v29 = v28;

  v25[1] = *((void *)v26 + 1);
  return a1;
}

uint64_t initializeWithTake for WhereAmIView(uint64_t a1, long long *a2, int *a3)
{
  long long v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = a2[4];
  long long v8 = *a2;
  long long v7 = a2[1];
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t)a2 + v9;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v7;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = type metadata accessor for Locale();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[9];
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = (uint64_t)a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  *(_OWORD *)(a1 + v19) = *(long long *)((char *)a2 + v19);
  return a1;
}

uint64_t assignWithTake for WhereAmIView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v10 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  if (a1 != a2)
  {
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (const void *)(a2 + v15);
    outlined destroy of Environment<Locale>.Content(a1 + v15, &demangling cache variable for type metadata for Environment<Locale>.Content);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for Locale();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = *v22;
  LOBYTE(v22) = *((unsigned char *)v22 + 8);
  uint64_t v24 = *(void *)v21;
  char v25 = *(unsigned char *)(v21 + 8);
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = (_BYTE)v22;
  outlined consume of Environment<VRXIdiom>.Content(v24, v25);
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  id v28 = (void *)(a2 + v26);
  id v29 = *(void **)(a1 + v26);
  *uint64_t v27 = *v28;

  v27[1] = v28[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for WhereAmIView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FF37A98);
}

uint64_t sub_24FF37A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ActionHandler();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for WhereAmIView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FF37BDC);
}

uint64_t sub_24FF37BDC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ActionHandler();
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for WhereAmIView()
{
  type metadata accessor for ActionHandler();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Environment<Locale>.Content();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for Environment<Locale>.Content()
{
  if (!lazy cache variable for type metadata for Environment<Locale>.Content)
  {
    type metadata accessor for Locale();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<Locale>.Content);
    }
  }
}

ValueMetadata *type metadata accessor for WhereAmIView_Previews()
{
  return &type metadata for WhereAmIView_Previews;
}

uint64_t sub_24FF37E74()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type MapView and conformance MapView, MEMORY[0x263F77990]);
}

uint64_t sub_24FF37EBC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  type metadata accessor for ButtonContainerView();
  type metadata accessor for RFButtonStyle();
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
  lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24FF37FC8()
{
  return lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, MEMORY[0x263F777D8]);
}

uint64_t lazy protocol witness table accessor for type ButtonContainerView and conformance ButtonContainerView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FF38058()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>>);
}

uint64_t sub_24FF38094()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.WhereAmIDataModel, WhereAmIView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.WhereAmIDataModel, WhereAmIView>);
}

void type metadata accessor for VRXIdiom()
{
  if (!lazy cache variable for type metadata for VRXIdiom)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for VRXIdiom);
    }
  }
}

uint64_t partial apply for closure #1 in WhereAmIView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for WhereAmIView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return closure #1 in WhereAmIView.body.getter(v4, a1);
}

uint64_t partial apply for closure #1 in closure #1 in WhereAmIView.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for WhereAmIView() - 8);
  unint64_t v2 = (void *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return closure #1 in closure #1 in WhereAmIView.body.getter(v2);
}

uint64_t outlined init with take of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t objectdestroy_3Tm()
{
  uint64_t v1 = (int *)type metadata accessor for WhereAmIView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v6 = v0 + v3 + v1[6];
  uint64_t v7 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for Locale();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  outlined consume of Environment<VRXIdiom>.Content(*(void *)(v5 + v1[9]), *(unsigned char *)(v5 + v1[9] + 8));

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void partial apply for closure #1 in closure #1 in WhereAmIView.shareButton.getter(char a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for WhereAmIView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  closure #1 in closure #1 in WhereAmIView.shareButton.getter(a1, v4);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
    lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel> and conformance ShareLink<A, B, C, D>, &demangling cache variable for type metadata for ShareLink<CollectionOfOne<URL>, Never, Never, DefaultShareLinkLabel>);
    swift_getOpaqueTypeConformance2();
    lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Locale> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Locale>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonRole(_:)>>.0, _EnvironmentKeyWritingModifier<Locale>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t outlined destroy of Environment<Locale>.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
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

unint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      uint64_t result = _StringGuts.copyUTF8(into:)();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

double specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &demangling cache variable for type metadata for <<opaque return type of View.mapScope(_:)>>.0, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>).n128_u64[0];
  return result;
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    id v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v19 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  id v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *id v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t ParkingLocationView.model.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 72);
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(void *)(a1 + 40) = v2;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  *(void *)(a1 + 64) = v3;
  *(void *)(a1 + 72) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id ParkingLocationView.logObject.getter()
{
  return *(id *)(v0 + 80);
}

id ParkingLocationView.navCommand.getter()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F678F0]), sel_init);
  objc_msgSend(v1, sel_setLat_, *(double *)(v0 + 48));
  objc_msgSend(v1, sel_setLng_, *(double *)(v0 + 56));
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677B0]), sel_init);
  objc_msgSend(v2, sel_setLocation_, v1);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  char v5 = (void *)MEMORY[0x25337C1A0](v4, v3);
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setName_, v5);

  objc_msgSend(v2, sel_setDirectionsMode_, 2);
  return v2;
}

uint64_t ParkingLocationView.parkingPin.getter()
{
  type metadata accessor for RFMapMarker(0, &lazy cache variable for type metadata for RFMapMarker);
  id v0 = objc_allocWithZone(MEMORY[0x263F67578]);
  swift_bridgeObjectRetain();
  objc_msgSend(objc_msgSend(v0, sel_init), sel_setName_, 8);
  return RFMapMarker.init(coordinate:title:image:tint:)();
}

uint64_t ParkingLocationView.mapView.getter()
{
  uint64_t v0 = type metadata accessor for MapAspectRatio();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24FF4ED30;
  type metadata accessor for RFMapMarker(0, &lazy cache variable for type metadata for RFMapMarker);
  id v5 = objc_allocWithZone(MEMORY[0x263F67578]);
  swift_bridgeObjectRetain();
  objc_msgSend(objc_msgSend(v5, sel_init), sel_setName_, 8);
  *(void *)(v4 + 32) = RFMapMarker.init(coordinate:title:image:tint:)();
  v7[1] = v4;
  specialized Array._endMutation()();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F77600], v0);
  return MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)();
}

uint64_t ParkingLocationView.directionsButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v33 = type metadata accessor for SeparatorStyle();
  uint64_t v3 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v40 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for RFButtonStyle();
  uint64_t v34 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  unint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for ButtonContainerView();
  uint64_t v31 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  int64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  MEMORY[0x270FA5388](v9);
  long long v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ParkingLocationView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = *(NSObject **)(v2 + 80);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = v3;
    uint64_t v17 = v12;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_24FF2E000, v14, v15, "RF directions Button", v18, 2u);
    uint64_t v19 = v18;
    uint64_t v12 = v17;
    uint64_t v3 = v16;
    MEMORY[0x25337C850](v19, -1, -1);
  }
  outlined init with copy of ParkingLocationView(v2, (uint64_t)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  ButtonContainerView.init(buttons:)();
  static PrimitiveButtonStyle<>.rfButton.getter();
  uint64_t v22 = _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
  uint64_t v23 = _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
  uint64_t v24 = v32;
  uint64_t v25 = v35;
  uint64_t v26 = v39;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v26);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v25);
  uint64_t v27 = v40;
  uint64_t v28 = v33;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v40, *MEMORY[0x263F76988], v33);
  uint64_t v41 = v25;
  uint64_t v42 = v26;
  uint64_t v43 = v22;
  uint64_t v44 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v38;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v29);
  return swift_release();
}

uint64_t type metadata accessor for ParkingLocationView()
{
  uint64_t result = type metadata singleton initialization cache for ParkingLocationView;
  if (!type metadata singleton initialization cache for ParkingLocationView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t closure #1 in ParkingLocationView.directionsButton.getter(uint64_t a1)
{
  uint64_t v31 = type metadata accessor for ButtonItemButtonStyle.Role();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ParkingLocationView();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Label<Label<Text, Image>, EmptyView>>);
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonRole(_:)>>.0);
  uint64_t v27 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.privacySensitive(_:)>>.0);
  uint64_t v30 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyView>);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_24FF4EB30;
  outlined init with copy of ParkingLocationView(a1, (uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v15 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  uint64_t v32 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Label<Label<Text, Image>, EmptyView>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Label<Label<Text, Image>, EmptyView> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Label<Text, Image>, EmptyView>);
  Button.init(action:label:)();
  uint64_t v16 = v29;
  uint64_t v17 = v31;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v3, *MEMORY[0x263F774E8], v31);
  uint64_t v18 = lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Button<Label<Label<Text, Image>, EmptyView>> and conformance Button<A>, &demangling cache variable for type metadata for Button<Label<Label<Text, Image>, EmptyView>>);
  View.buttonRole(_:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
  uint64_t v33 = v6;
  uint64_t v34 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  View.privacySensitive(_:)();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v9);
  uint64_t v33 = v9;
  uint64_t v34 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v28;
  uint64_t v21 = View.eraseToAnyView()();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v20);
  uint64_t v22 = v25;
  *(void *)(v25 + 32) = v21;
  uint64_t v33 = v22;
  specialized Array._endMutation()();
  return v33;
}

uint64_t outlined init with copy of ParkingLocationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParkingLocationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of ParkingLocationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParkingLocationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in ParkingLocationView.directionsButton.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for ParkingLocationView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return closure #1 in ParkingLocationView.directionsButton.getter(v2);
}

uint64_t closure #1 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x270FA5388](v6 - 8);
  int64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ParkingLocationView();
  ActionHandler.wrappedValue.getter();
  uint64_t v9 = type metadata accessor for StandardActionHandler();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return outlined destroy of Environment<Locale>.Content((uint64_t)v8, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_24FF4EB30;
  uint64_t v13 = type metadata accessor for Command();
  uint64_t v14 = MEMORY[0x263F771C0];
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 32));
  uint64_t *boxed_opaque_existential_1 = (uint64_t)ParkingLocationView.navCommand.getter();
  *((unsigned char *)boxed_opaque_existential_1 + 8) = 0;
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F77160], v13);
  ActionProperty.init(_:)();
  uint64_t v16 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 0, 1, v16);
  uint64_t v17 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v2, 1, 1, v17);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v2, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v5, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v8, v9);
}

uint64_t closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type Label<Text, Image> and conformance Label<A, B>, &demangling cache variable for type metadata for Label<Text, Image>);
  return Label.init(title:icon:)();
}

uint64_t closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t ParkingLocationView.header.getter()
{
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t ParkingLocationView.body.getter()
{
  uint64_t v1 = type metadata accessor for ParkingLocationView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  outlined init with copy of ParkingLocationView(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  return ComponentStack.init(content:)();
}

uint64_t closure #1 in ParkingLocationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v1 = type metadata accessor for SeparatorStyle();
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v58 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v56 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  uint64_t v64 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v55 = (uint64_t)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.separators(_:isOverride:)>>.0);
  uint64_t v70 = *(void *)(v63 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v63);
  uint64_t v59 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v69 = (char *)&v55 - v6;
  uint64_t v61 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v71 = *(void *)(v61 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v61);
  uint64_t v60 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v67 = (char *)&v55 - v9;
  uint64_t v10 = type metadata accessor for MapView();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v55 - v22;
  uint64_t v68 = (uint64_t)&v55 - v22;
  ParkingLocationView.mapView.getter();
  _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type MapView and conformance MapView, MEMORY[0x263F77990]);
  View.onTapGesture(count:perform:)();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v24 = static Alignment.center.getter();
  uint64_t v66 = v21;
  __n128 v26 = specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v21, 0.0, 1, 157.0, 0, v24, v25, &demangling cache variable for type metadata for <<opaque return type of View.onTapGesture(count:perform:)>>.0, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(char *, uint64_t, __n128))(v15 + 8))(v17, v14, v26);
  outlined init with take of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>((uint64_t)v21, (uint64_t)v23);
  uint64_t v27 = v67;
  ParkingLocationView.header.getter();
  uint64_t v28 = v55;
  ParkingLocationView.directionsButton.getter(v55);
  uint64_t v30 = v56;
  uint64_t v29 = v57;
  uint64_t v31 = v58;
  (*(void (**)(char *, void, uint64_t))(v57 + 104))(v56, *MEMORY[0x263F76988], v58);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v33 = type metadata accessor for ButtonContainerView();
  uint64_t v34 = type metadata accessor for RFButtonStyle();
  uint64_t v35 = _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
  uint64_t v36 = _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
  uint64_t v72 = v33;
  uint64_t v73 = v34;
  uint64_t v74 = v35;
  uint64_t v75 = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v72 = v32;
  uint64_t v73 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = v59;
  uint64_t v39 = v62;
  View.separators(_:isOverride:)();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v28, v39);
  uint64_t v41 = v69;
  uint64_t v40 = v70;
  uint64_t v42 = v38;
  uint64_t v43 = v63;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v69, v38, v63);
  uint64_t v44 = (uint64_t)v66;
  outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(v68, (uint64_t)v66);
  uint64_t v64 = *(void *)(v71 + 16);
  uint64_t v45 = v60;
  uint64_t v46 = v61;
  ((void (*)(char *, char *, uint64_t))v64)(v60, v27, v61);
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  uint64_t v48 = v41;
  uint64_t v49 = v43;
  v47(v42, v48, v43);
  uint64_t v50 = v65;
  outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(v44, v65);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0));
  ((void (*)(uint64_t, char *, uint64_t))v64)(v50 + *(int *)(v51 + 48), v45, v46);
  v47((char *)(v50 + *(int *)(v51 + 64)), v42, v49);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v70 + 8);
  v52(v69, v49);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v71 + 8);
  v53(v67, v46);
  outlined destroy of Environment<Locale>.Content(v68, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  v52(v42, v49);
  v53(v45, v46);
  return outlined destroy of Environment<Locale>.Content((uint64_t)v66, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
}

void closure #1 in closure #1 in ParkingLocationView.body.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(self, sel_defaultWorkspace);
  if (v3)
  {
    uint64_t v4 = v3;
    URL.init(string:)();
    uint64_t v5 = type metadata accessor for URL();
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v8 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) != 1)
    {
      URL._bridgeToObjectiveC()(v7);
      uint64_t v8 = v9;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    }
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openSensitiveURL_withOptions_, v8, isa);
  }
  else
  {
    __break(1u);
  }
}

uint64_t ParkingLocationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(void *)(a2 + 64) = v5;
  *(void *)(a2 + 72) = v6;
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  *(void *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  type metadata accessor for ParkingLocationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for View.body.getter in conformance ParkingLocationView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  outlined init with copy of ParkingLocationView(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  outlined init with take of ParkingLocationView((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>, &demangling cache variable for type metadata for TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>);
  return ComponentStack.init(content:)();
}

uint64_t static ParkingLocationView_Previews.previews.getter()
{
  if (one-time initialization token for pickupTruck != -1) {
    swift_once();
  }
  type metadata accessor for ParkingLocationView();
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel();
  _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type ParkingLocationView and conformance ParkingLocationView, (void (*)(uint64_t))type metadata accessor for ParkingLocationView);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t pickupTruck.unsafeMutableAddressor()
{
  if (one-time initialization token for pickupTruck != -1) {
    swift_once();
  }
  return pickupTruck.note.value._countAndFlagsBits;
}

uint64_t implicit closure #1 in static ParkingLocationView_Previews.previews.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(void *)(a2 + 40) = v3;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(void *)(a2 + 64) = v4;
  *(void *)(a2 + 72) = v5;
  type metadata accessor for RFMapMarker(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(a2 + 80) = OS_os_log.init(subsystem:category:)();
  type metadata accessor for ParkingLocationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance ParkingLocationView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews();
  return MEMORY[0x270F00210](a1, v2);
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance ParkingLocationView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews();
  return MEMORY[0x270F00200](a1, v2);
}

double one-time initialization function for pickupTruck()
{
  uint64_t v0 = swift_slowAlloc();
  pickupTruck.note.value._countAndFlagsBits = v0;
  *(void *)uint64_t v0 = 0;
  *(void *)(v0 + 8) = 0;
  *(void *)(v0 + 16) = 0xD000000000000024;
  *(void *)(v0 + 24) = 0x800000024FF50A90;
  *(void *)(v0 + 32) = 0x432064656B726150;
  *(void *)(v0 + 40) = 0xEA00000000007261;
  double result = 37.3349;
  *(_OWORD *)(v0 + 48) = xmmword_24FF4EB40;
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in ParkingLocationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews()
{
  unint64_t result = lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews;
  if (!lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews;
  if (!lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParkingLocationView_Previews and conformance ParkingLocationView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in ParkingLocationView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ParkingLocationView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    uint64_t v9 = (void *)a2[10];
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v17 = a1 + v10;
    uint64_t v11 = (uint64_t)a2 + v10;
    *(void *)(a1 + 80) = v9;
    uint64_t v12 = type metadata accessor for ActionHandler();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v14 = v9;
    v13(v17, v11, v12);
  }
  return v3;
}

uint64_t destroy for ParkingLocationView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for ActionHandler();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void **)(a2 + 80);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v9;
  uint64_t v10 = a2 + v9;
  *(void *)(a1 + 80) = v8;
  uint64_t v11 = type metadata accessor for ActionHandler();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v13 = v8;
  v12(v15, v10, v11);
  return a1;
}

void *assignWithCopy for ParkingLocationView(void *a1, void *a2, uint64_t a3)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[10];
  uint64_t v7 = (void *)a1[10];
  a1[10] = v6;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t assignWithTake for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FF3BA2C);
}

uint64_t sub_24FF3BA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ActionHandler();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ParkingLocationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FF3BAF0);
}

uint64_t sub_24FF3BAF0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for ParkingLocationView()
{
  uint64_t result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParkingLocationView_Previews()
{
  return &type metadata for ParkingLocationView_Previews;
}

uint64_t sub_24FF3BC4C()
{
  return _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type MapView and conformance MapView, MEMORY[0x263F77990]);
}

uint64_t sub_24FF3BC94()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  type metadata accessor for ButtonContainerView();
  type metadata accessor for RFButtonStyle();
  _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type ButtonContainerView and conformance ButtonContainerView, MEMORY[0x263F77758]);
  _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type RFButtonStyle and conformance RFButtonStyle, MEMORY[0x263F775A8]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24FF3BDA0()
{
  return _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, MEMORY[0x263F777D8]);
}

uint64_t _s9SnippetUI19ButtonContainerViewVAC05SwiftB00E0AAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FF3BE30()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<TupleView<(ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)>>);
}

uint64_t sub_24FF3BE6C()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.ParkingLocationDataModel, ParkingLocationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.ParkingLocationDataModel, ParkingLocationView>);
}

uint64_t partial apply for closure #1 in ParkingLocationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for ParkingLocationView();
  return closure #1 in ParkingLocationView.body.getter(a1);
}

uint64_t outlined init with take of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.onTapGesture(count:perform:)>>.0, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  unint64_t v1 = (int *)(type metadata accessor for ParkingLocationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #1 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  type metadata accessor for ParkingLocationView();
  return closure #1 in closure #1 in ParkingLocationView.directionsButton.getter();
}

uint64_t partial apply for closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  return closure #2 in closure #1 in ParkingLocationView.directionsButton.getter();
}

uint64_t partial apply for closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter()
{
  return closure #1 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter();
}

double GeoParkedCar.latitude.getter()
{
  return *(double *)(v0 + 48);
}

double GeoParkedCar.longitude.getter()
{
  return *(double *)(v0 + 56);
}

uint64_t GeoParkedCar.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall GeoParkedCar.init(note:localizedAddress:locationInfo:)(GeoUIFramework::GeoParkedCar *__return_ptr retstr, Swift::String_optional note, Swift::String_optional localizedAddress, GeoUIFramework::StandardMapData locationInfo)
{
  uint64_t v4 = *(void *)locationInfo.label._countAndFlagsBits;
  uint64_t v5 = *(void **)(locationInfo.label._countAndFlagsBits + 8);
  retstr->note = note;
  retstr->localizedAddress = localizedAddress;
  retstr->locationInfo.label._countAndFlagsBits = v4;
  retstr->locationInfo.label._object = v5;
  *(_OWORD *)&retstr->locationInfo.latitude = *(_OWORD *)(locationInfo.label._countAndFlagsBits + 16);
}

uint64_t GeoParkedCar.note.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoParkedCar.localizedAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoParkedCar.locationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  *(void *)a1 = *(void *)(v1 + 32);
  *(void *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t GeoParkedCar.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 1702129518;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0x6E6F697461636F6CLL;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GeoParkedCar.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoParkedCar.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GeoParkedCar.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoParkedCar.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoParkedCar.CodingKeys()
{
  return GeoParkedCar.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoParkedCar.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoParkedCar.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GeoParkedCar.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoParkedCar.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoParkedCar.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoParkedCar.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoParkedCar.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoParkedCar.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v18 = v1[3];
  uint64_t v19 = v7;
  uint64_t v8 = v1[4];
  uint64_t v16 = v1[5];
  uint64_t v17 = v8;
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v21) = 0;
  uint64_t v11 = v20;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v11)
  {
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    LOBYTE(v21) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    uint64_t v21 = v12;
    uint64_t v22 = v13;
    uint64_t v23 = v9;
    uint64_t v24 = v10;
    char v25 = 2;
    lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData()
{
  unint64_t result = lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData;
  if (!lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData;
  if (!lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData and conformance StandardMapData);
  }
  return result;
}

uint64_t GeoParkedCar.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoParkedCar.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoParkedCar.CodingKeys and conformance GeoParkedCar.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  LOBYTE(v25) = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  LOBYTE(v25) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v22 = v12;
  char v29 = 2;
  lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
  swift_bridgeObjectRetain();
  uint64_t v23 = v14;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = v25;
  uint64_t v15 = v26;
  uint64_t v17 = v27;
  uint64_t v18 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v23;
  *a2 = v24;
  a2[1] = v11;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v16;
  a2[5] = v15;
  a2[6] = v17;
  a2[7] = v18;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoParkedCar@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoParkedCar.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoParkedCar(void *a1)
{
  return GeoParkedCar.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for GeoParkedCar(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GeoParkedCar()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoParkedCar(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GeoParkedCar(void *a1, void *a2)
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

uint64_t assignWithTake for GeoParkedCar(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoParkedCar(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoParkedCar(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoParkedCar()
{
  return &type metadata for GeoParkedCar;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GeoParkedCar.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GeoParkedCar.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24FF3CE78);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for GeoParkedCar.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for GeoParkedCar.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void *type metadata accessor for GeoParkedCar.CodingKeys()
{
  return &unk_270163F88;
}

uint64_t specialized GeoParkedCar.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1702129518 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024FF50B70 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461636F6CLL && a2 == 0xEC0000006F666E49)
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

uint64_t ContactDisambiguationView.model.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id ContactDisambiguationView.logObject.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v2 = type metadata accessor for ContactDisambiguationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v5 = *(void *)(v37 - 8);
  uint64_t v36 = *(void *)(v5 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v37);
  uint64_t v35 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v39 = (char *)&v30 - v8;
  uint64_t v34 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v9 = *(void *)(v34 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v34);
  uint64_t v33 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t v15 = *v1;
  uint64_t v14 = v1[1];
  uint64_t v54 = MEMORY[0x263F8D310];
  uint64_t v55 = MEMORY[0x263F779A0];
  uint64_t v52 = v15;
  uint64_t v53 = v14;
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v45 = 0;
  long long v44 = 0u;
  long long v43 = 0u;
  uint64_t v42 = 0;
  long long v41 = 0u;
  long long v40 = 0u;
  swift_bridgeObjectRetain();
  uint64_t v31 = v13;
  PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
  *(void *)&long long v49 = v1[2];
  uint64_t KeyPath = swift_getKeyPath();
  outlined init with copy of ContactDisambiguationView((uint64_t)v1, (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ContactDisambiguationView);
  unint64_t v16 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v17 = swift_allocObject();
  outlined init with take of ContactDisambiguationView((uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(void))type metadata accessor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type [GeoContact] and conformance [A], &demangling cache variable for type metadata for [GeoContact]);
  lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (void (*)(uint64_t))type metadata accessor for GeoContact);
  uint64_t v18 = type metadata accessor for SimpleItemRichView();
  uint64_t v19 = lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
  uint64_t v52 = v18;
  uint64_t v53 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v39;
  ForEach<>.init(_:id:content:)();
  uint64_t v21 = v33;
  uint64_t v22 = v34;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v33, v13, v34);
  uint64_t v23 = v35;
  uint64_t v24 = v20;
  uint64_t v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v35, v24, v37);
  unint64_t v26 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v27 = (v10 + *(unsigned __int8 *)(v5 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v28 + v26, v21, v22);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v28 + v27, v23, v25);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>> and conformance DisambiguationStandardView<A, B>, &demangling cache variable for type metadata for DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>);
  ComponentStack.init(content:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v39, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v31, v22);
}

uint64_t type metadata accessor for ContactDisambiguationView()
{
  uint64_t result = type metadata singleton initialization cache for ContactDisambiguationView;
  if (!type metadata singleton initialization cache for ContactDisambiguationView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t closure #1 in ContactDisambiguationView.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v81 = a3;
  uint64_t v4 = type metadata accessor for GeoContact();
  uint64_t v73 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v74 = v5;
  uint64_t v78 = (uint64_t)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ContactDisambiguationView();
  uint64_t v68 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v69 = v7;
  uint64_t v70 = (uint64_t)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SimpleItemRichView();
  uint64_t v79 = *(void *)(v8 - 8);
  uint64_t v80 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v75 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  uint64_t v76 = *(void *)(v10 - 8);
  uint64_t v77 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v71 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v66 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v65 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ImageElement.SourceType();
  v64[0] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v64 - v18;
  uint64_t v20 = type metadata accessor for ImageElement();
  MEMORY[0x270FA5388](v20 - 8);
  v64[1] = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for RFImageView();
  uint64_t v67 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v23 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = a1;
  GeoContact.image.getter();
  uint64_t v24 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  v24(v19, *MEMORY[0x263F766D8], v13);
  v64[2] = 0x800000024FF50A10;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, *MEMORY[0x263F765B0], v82);
  ImageElement.AppIcon.init(_:imageStyle:)();
  uint64_t v25 = v64[0];
  v24(v17, *MEMORY[0x263F766C8], v64[0]);
  static ImageElement.badgedImage(image:badge:)();
  unint64_t v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v25);
  v26(v19, v25);
  uint64_t v82 = (uint64_t)v23;
  RFImageView.init(_:)();
  uint64_t v27 = v84[3];
  uint64_t v28 = v84[4];
  uint64_t v110 = MEMORY[0x263F8D310];
  uint64_t v111 = MEMORY[0x263F779A0];
  uint64_t v108 = v27;
  uint64_t v109 = v28;
  uint64_t v107 = 0;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v104 = 0;
  unint64_t v29 = v84[9] & 0xFFFFFFFFFFFFFFFELL;
  long long v102 = 0u;
  long long v103 = 0u;
  if (v29 == 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      uint64_t v32 = 0;
      unint64_t v31 = 0xE000000000000000;
      goto LABEL_6;
    }
  }
  unint64_t v31 = 0xE300000000000000;
  uint64_t v32 = 5459283;
LABEL_6:
  uint64_t v98 = v32;
  unint64_t v99 = v31;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v33 = Text.init<A>(_:)();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  static Color.green.getter();
  uint64_t v38 = Text.foregroundColor(_:)();
  uint64_t v40 = v39;
  char v42 = v41;
  swift_release();
  char v43 = v42 & 1;
  outlined consume of Text.Storage(v33, v35, v37);
  swift_bridgeObjectRelease();
  static Font.title2.getter();
  uint64_t v44 = Text.font(_:)();
  uint64_t v46 = v45;
  char v48 = v47;
  uint64_t v50 = v49;
  swift_release();
  outlined consume of Text.Storage(v38, v40, v43);
  swift_bridgeObjectRelease();
  uint64_t v100 = MEMORY[0x263F1A838];
  uint64_t v101 = MEMORY[0x263F77350];
  uint64_t v51 = swift_allocObject();
  uint64_t v98 = v51;
  *(void *)(v51 + 16) = v44;
  *(void *)(v51 + 24) = v46;
  *(unsigned char *)(v51 + 32) = v48 & 1;
  *(void *)(v51 + 40) = v50;
  uint64_t v97 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v94 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v91 = 0;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v88 = 0;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v52 = v83;
  v85[3] = v83;
  v85[4] = MEMORY[0x263F77550];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v85);
  uint64_t v54 = v67;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v67 + 16))(boxed_opaque_existential_1, v82, v52);
  uint64_t v55 = v75;
  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
  uint64_t v56 = v70;
  outlined init with copy of ContactDisambiguationView(v72, v70, (uint64_t (*)(void))type metadata accessor for ContactDisambiguationView);
  uint64_t v57 = v78;
  outlined init with copy of ContactDisambiguationView((uint64_t)v84, v78, (uint64_t (*)(void))type metadata accessor for GeoContact);
  unint64_t v58 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  unint64_t v59 = (v69 + *(unsigned __int8 *)(v73 + 80) + v58) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
  uint64_t v60 = swift_allocObject();
  outlined init with take of ContactDisambiguationView(v56, v60 + v58, (uint64_t (*)(void))type metadata accessor for ContactDisambiguationView);
  outlined init with take of ContactDisambiguationView(v57, v60 + v59, (uint64_t (*)(void))type metadata accessor for GeoContact);
  lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
  uint64_t v61 = v71;
  uint64_t v62 = v80;
  View.componentTapped(isNavigation:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v55, v62);
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v82, v83);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v76 + 32))(v81, v61, v77);
}

uint64_t sub_24FF3E094()
{
  Swift::UInt v1 = (int *)(type metadata accessor for ContactDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #1 in ContactDisambiguationView.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ContactDisambiguationView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return closure #1 in ContactDisambiguationView.body.getter(a1, v6, a2);
}

uint64_t closure #1 in closure #1 in ContactDisambiguationView.body.getter(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_24FF2E000, v13, v14, "component tapped", v15, 2u);
    MEMORY[0x25337C850](v15, -1, -1);
  }
  type metadata accessor for ContactDisambiguationView();
  ActionHandler.wrappedValue.getter();
  uint64_t v16 = type metadata accessor for StandardActionHandler();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) == 1) {
    return outlined destroy of Environment<Locale>.Content((uint64_t)v12, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v19 = swift_allocObject();
  long long v29 = xmmword_24FF4EB30;
  *(_OWORD *)(v19 + 16) = xmmword_24FF4EB30;
  uint64_t v20 = a1[4];
  uint64_t v30 = a1[5];
  uint64_t v31 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v29;
  uint64_t v32 = 0x6E65697069636552;
  unint64_t v33 = 0xE900000000000074;
  uint64_t v22 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  uint64_t v24 = *(void *)(a2 + 56);
  uint64_t v23 = *(void *)(a2 + 64);
  *(void *)(inited + 96) = v22;
  *(void *)(inited + 72) = v24;
  *(void *)(inited + 80) = v23;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  uint64_t v25 = type metadata accessor for Command();
  uint64_t v26 = MEMORY[0x263F771C0];
  *(void *)(v19 + 56) = v25;
  *(void *)(v19 + 64) = v26;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v19 + 32));
  static Command.directInvocation(identifier:payload:isNavigation:)();
  swift_bridgeObjectRelease();
  ActionProperty.init(_:)();
  uint64_t v27 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 0, 1, v27);
  uint64_t v28 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 1, 1, v28);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v6, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v9, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v12, v16);
}

uint64_t closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v15[0] = a2;
  v15[1] = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  (*(void (**)(char *, void, uint64_t))(v5 + 16))((char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15[0], v4);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13 + v12, (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type PrimaryHeaderRichView and conformance PrimaryHeaderRichView, MEMORY[0x263F777D8]);
  lazy protocol witness table accessor for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>();
  return DisambiguationStandardView.init(header:content:)();
}

uint64_t sub_24FF3E878()
{
  uint64_t v1 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t partial apply for closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrimaryHeaderRichView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>)
                 - 8);
  uint64_t v7 = v1 + ((v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return closure #2 in ContactDisambiguationView.body.getter(v1 + v4, v7, a1);
}

uint64_t ContactDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  type metadata accessor for OS_os_log();
  *(void *)(a2 + 24) = OS_os_log.init(subsystem:category:)();
  *(void *)(a2 + 32) = 0xD00000000000002CLL;
  *(void *)(a2 + 40) = 0x800000024FF50B90;
  type metadata accessor for ContactDisambiguationView();
  return ActionHandler.init()();
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t static SampleView_Previews.previews.getter()
{
  if (one-time initialization token for testView1 != -1) {
    swift_once();
  }
  type metadata accessor for ContactDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
  lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (void (*)(uint64_t))type metadata accessor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static SampleView_Previews.previews.getter@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  *a2 = *a1;
  a2[1] = v3;
  a2[2] = v4;
  type metadata accessor for OS_os_log();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[3] = OS_os_log.init(subsystem:category:)();
  a2[4] = 0xD00000000000002CLL;
  a2[5] = 0x800000024FF50B90;
  type metadata accessor for ContactDisambiguationView();
  return ActionHandler.init()();
}

uint64_t protocol witness for static PreviewProvider.previews.getter in conformance SampleView_Previews()
{
  if (one-time initialization token for testView1 != -1) {
    swift_once();
  }
  type metadata accessor for ContactDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
  lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (void (*)(uint64_t))type metadata accessor for ContactDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance SampleView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews();
  return MEMORY[0x270F00210](a1, v2);
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance SampleView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews();
  return MEMORY[0x270F00200](a1, v2);
}

uint64_t one-time initialization function for BrandonBacon()
{
  uint64_t v0 = type metadata accessor for GeoContact();
  __swift_allocate_value_buffer(v0, BrandonBacon);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)BrandonBacon);
  uint64_t v2 = v1 + *(int *)(v0 + 40);
  uint64_t v3 = *MEMORY[0x263F764E0];
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v2, v3, v4);
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  strcpy((char *)(v1 + 24), "Brandon Bacon");
  *(_WORD *)(v1 + 38) = -4864;
  *(void *)(v1 + 40) = 16962;
  *(void *)(v1 + 48) = 0xE200000000000000;
  *(void *)(v1 + 56) = 0xD0000000000000FCLL;
  *(void *)(v1 + 64) = 0x800000024FF50CF0;
  *(void *)(v1 + 72) = 1;
  return result;
}

uint64_t one-time initialization function for TimBacon()
{
  uint64_t v0 = type metadata accessor for GeoContact();
  __swift_allocate_value_buffer(v0, TimBacon);
  uint64_t v1 = (void *)__swift_project_value_buffer(v0, (uint64_t)TimBacon);
  uint64_t v2 = (char *)v1 + *(int *)(v0 + 40);
  uint64_t v3 = *MEMORY[0x263F764E0];
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v2, v3, v4);
  *uint64_t v1 = 1;
  v1[1] = 0;
  v1[2] = 0;
  v1[3] = 0x6F636142206D6954;
  v1[4] = 0xE90000000000006ELL;
  v1[5] = 16980;
  v1[6] = 0xE200000000000000;
  v1[7] = 0xD0000000000000FCLL;
  v1[8] = 0x800000024FF50BF0;
  v1[9] = 2;
  return result;
}

uint64_t one-time initialization function for testView1()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GeoContact>);
  uint64_t v0 = type metadata accessor for GeoContact();
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = (_OWORD *)swift_allocObject();
  v3[1] = xmmword_24FF4F000;
  uint64_t v4 = (uint64_t)v3 + v2;
  if (one-time initialization token for BrandonBacon != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)BrandonBacon);
  outlined init with copy of ContactDisambiguationView(v5, v4, (uint64_t (*)(void))type metadata accessor for GeoContact);
  if (one-time initialization token for TimBacon != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v0, (uint64_t)TimBacon);
  uint64_t result = outlined init with copy of ContactDisambiguationView(v6, v4 + v1, (uint64_t (*)(void))type metadata accessor for GeoContact);
  testView1._rawValue = v3;
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  long long v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  long long v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  long long v11;
  uint64_t vars8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GeoTrafficIncident>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24FF4F470;
  if (one-time initialization token for crash != -1) {
    swift_once();
  }
  unint64_t v2 = *((void *)pickupTruck.localizedAddress.value._object + 4);
  uint64_t v1 = *((void *)pickupTruck.localizedAddress.value._object + 5);
  uint64_t v3 = *((_OWORD *)pickupTruck.localizedAddress.value._object + 1);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)pickupTruck.localizedAddress.value._object;
  *(_OWORD *)(v0 + 48) = v3;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = v1;
  uint64_t v4 = one-time initialization token for hazard;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(*(void *)&pickupTruck.locationInfo.latitude + 32);
  uint64_t v5 = *(void *)(*(void *)&pickupTruck.locationInfo.latitude + 40);
  uint64_t v7 = *(_OWORD *)(*(void *)&pickupTruck.locationInfo.latitude + 16);
  *(_OWORD *)(v0 + 80) = **(_OWORD **)&pickupTruck.locationInfo.latitude;
  *(_OWORD *)(v0 + 96) = v7;
  *(void *)(v0 + 112) = v6;
  *(void *)(v0 + 120) = v5;
  uint64_t v8 = one-time initialization token for sc;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(sc.index + 32);
  uint64_t v9 = *(void *)(sc.index + 40);
  uint64_t v11 = *(_OWORD *)(sc.index + 16);
  *(_OWORD *)(v0 + 128) = *(_OWORD *)sc.index;
  *(_OWORD *)(v0 + 144) = v11;
  *(void *)(v0 + 160) = v10;
  *(void *)(v0 + 168) = v9;
  testView1._rawValue = (void *)v0;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in ContactDisambiguationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type SampleView_Previews and conformance SampleView_Previews()
{
  unint64_t result = lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews;
  if (!lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews;
  if (!lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SampleView_Previews and conformance SampleView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in SampleView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactDisambiguationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = type metadata accessor for ActionHandler();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = v6;
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for ContactDisambiguationView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for ActionHandler();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for ContactDisambiguationView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = type metadata accessor for ActionHandler();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v5;
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for ContactDisambiguationView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[3];
  uint64_t v7 = (void *)a1[3];
  a1[3] = v6;
  id v8 = v6;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for ContactDisambiguationView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[3];
  a1[3] = a2[3];

  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FF3F81C);
}

uint64_t sub_24FF3F81C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ActionHandler();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FF3F8E0);
}

uint64_t sub_24FF3F8E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for ContactDisambiguationView()
{
  uint64_t result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleView_Previews()
{
  return &type metadata for SampleView_Previews;
}

uint64_t sub_24FF3FA48()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type ComponentStack<DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>> and conformance ComponentStack<A>, &demangling cache variable for type metadata for ComponentStack<DisambiguationStandardView<PrimaryHeaderRichView, ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>>);
}

uint64_t sub_24FF3FA84()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.ContactDisambiguationDataModel, ContactDisambiguationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.ContactDisambiguationDataModel, ContactDisambiguationView>);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t outlined init with copy of ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
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

uint64_t sub_24FF3FC18()
{
  uint64_t v1 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PrimaryHeaderRichView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return v5(a1, v6, v3);
}

uint64_t sub_24FF3FD1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #2 in closure #2 in ContactDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return v5(a1, v6, v3);
}

uint64_t lazy protocol witness table accessor for type GeoContact and conformance GeoContact(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>()
{
  unint64_t result = lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>;
  if (!lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
    type metadata accessor for SimpleItemRichView();
    lazy protocol witness table accessor for type GeoContact and conformance GeoContact(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForEach<[GeoContact], GeoContact, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>);
  }
  return result;
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24FF3FF54()
{
  outlined consume of Text.Storage(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24FF3FF98()
{
  uint64_t v1 = (int *)(type metadata accessor for ContactDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = (int *)(type metadata accessor for GeoContact() - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = v7 + *(void *)(*(void *)v5 + 64);
  uint64_t v9 = v2 | v6 | 7;
  uint64_t v10 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v11 = v10 + v1[9];
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v7 + v5[12];
  uint64_t v14 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t outlined init with take of ContactDisambiguationView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in ContactDisambiguationView.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for ContactDisambiguationView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for GeoContact() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return closure #1 in closure #1 in ContactDisambiguationView.body.getter((void *)(v0 + v2), v5);
}

uint64_t GeoTrafficIncident.index.getter()
{
  return *(void *)v0;
}

uint64_t GeoTrafficIncident.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoTrafficIncident.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoTrafficIncident.driPayload.getter()
{
  return *(void *)(v0 + 40);
}

void GeoTrafficIncident.hash(into:)()
{
  Swift::UInt v1 = v0[2];
  Swift::UInt v2 = v0[5];
  Hasher._combine(_:)(*v0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v2);
}

uint64_t GeoTrafficIncident.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aIndex_1[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoTrafficIncident.CodingKeys()
{
  return GeoTrafficIncident.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoTrafficIncident.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoTrafficIncident.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoTrafficIncident.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoTrafficIncident.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoTrafficIncident.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoTrafficIncident.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoTrafficIncident.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  v11[4] = v1[2];
  v11[5] = v8;
  uint64_t v9 = v1[3];
  v11[2] = v1[4];
  v11[3] = v9;
  v11[1] = v1[5];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    char v14 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v12 = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int GeoTrafficIncident.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[2];
  Swift::UInt v3 = v0[5];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

uint64_t GeoTrafficIncident.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoTrafficIncident.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v26 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v25 = 1;
  uint64_t v10 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v12 = v11;
  uint64_t v22 = v10;
  char v24 = 2;
  swift_bridgeObjectRetain();
  uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v21 = v13;
  char v23 = 3;
  swift_bridgeObjectRetain();
  uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = v21;
  uint64_t v15 = v22;
  *a2 = v9;
  a2[1] = v15;
  uint64_t v17 = v20;
  a2[2] = v12;
  a2[3] = v17;
  a2[4] = v16;
  a2[5] = v14;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void __swiftcall GeoTrafficIncident.init(index:id:displayName:driPayload:)(GeoUIFramework::GeoTrafficIncident *__return_ptr retstr, Swift::Int index, Swift::String_optional id, Swift::String displayName, Swift::Int driPayload)
{
  retstr->index = index;
  retstr->id = id;
  retstr->displayName = displayName;
  retstr->driPayload = driPayload;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoTrafficIncident@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoTrafficIncident.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoTrafficIncident(void *a1)
{
  return GeoTrafficIncident.encode(to:)(a1);
}

uint64_t protocol witness for Identifiable.id.getter in conformance GeoTrafficIncident@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = *(void *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void protocol witness for Hashable.hash(into:) in conformance GeoTrafficIncident()
{
  Swift::UInt v1 = v0[2];
  Swift::UInt v2 = v0[5];
  Hasher._combine(_:)(*v0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoTrafficIncident()
{
  Swift::UInt v1 = *v0;
  Swift::UInt v2 = v0[2];
  Swift::UInt v3 = v0[5];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

BOOL specialized static GeoTrafficIncident.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v10 = a2[5];
  if (v3)
  {
    if (v7)
    {
      if (a1[1] != a2[1] || v3 != v7)
      {
        char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
        BOOL result = 0;
        if ((v11 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v7) {
    return 0;
  }
LABEL_11:
  if (v4 == v8 && v5 == v9) {
    return v6 == v10;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  BOOL result = 0;
  if (v13) {
    return v6 == v10;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident.CodingKeys and conformance GeoTrafficIncident.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type String? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type String? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for String?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident;
  if (!lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoTrafficIncident and conformance GeoTrafficIncident);
  }
  return result;
}

uint64_t destroy for GeoTrafficIncident()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoTrafficIncident(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GeoTrafficIncident(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
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

uint64_t assignWithTake for GeoTrafficIncident(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoTrafficIncident(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoTrafficIncident(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoTrafficIncident()
{
  return &type metadata for GeoTrafficIncident;
}

uint64_t getEnumTagSinglePayload for GeoTrafficIncident.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GeoTrafficIncident.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24FF410F4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GeoTrafficIncident.CodingKeys()
{
  return &unk_2701641B0;
}

uint64_t specialized GeoTrafficIncident.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6C796150697264 && a2 == 0xEA00000000006461)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    BOOL v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  BOOL v3 = (void *)v2;
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
    outlined init with copy of (AnyHashable, Any)(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
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

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  long long v10;
  long long v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    BOOL v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  BOOL v3 = (void *)v2;
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
    outlined init with copy of (AnyHashable, Any)(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    char v10 = v15[0];
    char v11 = v15[1];
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
    v3[2] = v14;
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

uint64_t TrafficDisambiguationView.model.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id TrafficDisambiguationView.logObject.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t TrafficDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = type metadata accessor for TrafficDisambiguationView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v34 = *(void *)(v7 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v30 - v10;
  uint64_t v33 = type metadata accessor for DisambiguationTitle();
  uint64_t v12 = *(void *)(v33 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v33);
  uint64_t v32 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v31 = (char *)v30 - v15;
  uint64_t v17 = *v2;
  uint64_t v16 = v2[1];
  uint64_t v42 = MEMORY[0x263F8D310];
  uint64_t v43 = MEMORY[0x263F779A0];
  uint64_t v40 = v17;
  uint64_t v41 = v16;
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  swift_bridgeObjectRetain();
  DisambiguationTitle.init(text1:thumbnail:)();
  *(void *)&long long v37 = v2[2];
  v30[1] = swift_getKeyPath();
  outlined init with copy of TrafficDisambiguationView((uint64_t)v2, (uint64_t)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v19 = swift_allocObject();
  outlined init with take of TrafficDisambiguationView((uint64_t)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0);
  lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance [A], &demangling cache variable for type metadata for [GeoTrafficIncident]);
  lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident();
  uint64_t v20 = type metadata accessor for SimpleItemRichView();
  uint64_t v21 = lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
  uint64_t v40 = v20;
  uint64_t v41 = v21;
  swift_getOpaqueTypeConformance2();
  ForEach<>.init(_:id:content:)();
  uint64_t v22 = v12;
  char v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  char v24 = v31;
  uint64_t v25 = v33;
  v23(v32, v31, v33);
  char v26 = v35;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v35, v11, v6);
  unint64_t v27 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v28 + v27, v26, v6);
  lazy protocol witness table accessor for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>();
  DisambiguationView.init(title:content:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v25);
}

uint64_t type metadata accessor for TrafficDisambiguationView()
{
  uint64_t result = type metadata singleton initialization cache for TrafficDisambiguationView;
  if (!type metadata singleton initialization cache for TrafficDisambiguationView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t closure #1 in TrafficDisambiguationView.body.getter(long long *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TrafficDisambiguationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = type metadata accessor for SimpleItemRichView();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v11 = a1[2];
  long long v12 = *a1;
  long long v46 = a1[1];
  long long v47 = v11;
  long long v45 = v12;
  uint64_t v43 = MEMORY[0x263F8D310];
  uint64_t v44 = MEMORY[0x263F779A0];
  uint64_t v41 = *((void *)&v46 + 1);
  uint64_t v42 = v11;
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  swift_bridgeObjectRetain();
  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
  outlined init with copy of TrafficDisambiguationView(a2, (uint64_t)&v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = swift_allocObject();
  outlined init with take of TrafficDisambiguationView((uint64_t)&v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v14 + v13);
  uint64_t v15 = (_OWORD *)(v14 + ((v6 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  long long v16 = v46;
  *uint64_t v15 = v45;
  v15[1] = v16;
  void v15[2] = v47;
  outlined retain of GeoTrafficIncident((uint64_t)&v45);
  lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
  View.componentTapped(isNavigation:perform:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t outlined init with copy of TrafficDisambiguationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TrafficDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FF41EA8()
{
  Swift::UInt v1 = (int *)(type metadata accessor for TrafficDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  outlined consume of Environment<VRXIdiom>.Content(*(void *)(v6 + v1[11]), *(unsigned char *)(v6 + v1[11] + 8));
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t outlined init with take of TrafficDisambiguationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TrafficDisambiguationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in TrafficDisambiguationView.body.getter(long long *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TrafficDisambiguationView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return closure #1 in TrafficDisambiguationView.body.getter(a1, v4);
}

uint64_t closure #1 in closure #1 in TrafficDisambiguationView.body.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ActionProperty?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StandardActionHandler?);
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrafficDisambiguationView();
  ActionHandler.wrappedValue.getter();
  uint64_t v13 = type metadata accessor for StandardActionHandler();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return outlined destroy of Environment<Locale>.Content((uint64_t)v12, &demangling cache variable for type metadata for StandardActionHandler?);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ActionElementConvertible>);
  uint64_t v16 = swift_allocObject();
  long long v23 = xmmword_24FF4EB30;
  *(_OWORD *)(v16 + 16) = xmmword_24FF4EB30;
  uint64_t v24 = *(void *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v23;
  strcpy((char *)v25, "IncidentType");
  HIBYTE(v25[6]) = 0;
  v25[7] = -5120;
  AnyHashable.init<A>(_:)();
  uint64_t v18 = *(void *)(a2 + 40);
  *(void *)(inited + 96) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 72) = v18;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  uint64_t v19 = type metadata accessor for Command();
  uint64_t v20 = MEMORY[0x263F771C0];
  *(void *)(v16 + 56) = v19;
  *(void *)(v16 + 64) = v20;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v16 + 32));
  static Command.directInvocation(identifier:payload:isNavigation:)();
  swift_bridgeObjectRelease();
  ActionProperty.init(_:)();
  uint64_t v21 = type metadata accessor for ActionProperty();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 0, 1, v21);
  uint64_t v22 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
  StandardActionHandler.perform(_:interactionType:)();
  outlined destroy of Environment<Locale>.Content((uint64_t)v6, &demangling cache variable for type metadata for InteractionType?);
  outlined destroy of Environment<Locale>.Content((uint64_t)v9, &demangling cache variable for type metadata for ActionProperty?);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v13);
}

uint64_t sub_24FF42480()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #2 in TrafficDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return v5(a1, v6, v3);
}

unint64_t lazy protocol witness table accessor for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>()
{
  unint64_t result = lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>;
  if (!lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>);
    type metadata accessor for SimpleItemRichView();
    lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type SimpleItemRichView and conformance SimpleItemRichView, MEMORY[0x263F77728]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0> and conformance <> ForEach<A, B, C>);
  }
  return result;
}

uint64_t TrafficDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  type metadata accessor for OS_os_log();
  *(void *)(a2 + 24) = OS_os_log.init(subsystem:category:)();
  *(void *)(a2 + 32) = 0xD000000000000033;
  *(void *)(a2 + 40) = 0x800000024FF50DF0;
  uint64_t v3 = type metadata accessor for TrafficDisambiguationView();
  ActionHandler.init()();
  uint64_t v4 = (uint64_t *)(a2 + *(int *)(v3 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
  *uint64_t v4 = EnvironmentObject.init()();
  v4[1] = v5;
  uint64_t v6 = a2 + *(int *)(v3 + 36);
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v6 = result;
  *(unsigned char *)(v6 + 8) = 0;
  return result;
}

uint64_t static TrafficIncidentView_Previews.previews.getter()
{
  if (one-time initialization token for testView1 != -1) {
    swift_once();
  }
  type metadata accessor for TrafficDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
  lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type TrafficDisambiguationView and conformance TrafficDisambiguationView, (void (*)(uint64_t))type metadata accessor for TrafficDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t implicit closure #1 in static TrafficIncidentView_Previews.previews.getter@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  *a2 = *a1;
  a2[1] = v3;
  a2[2] = v4;
  type metadata accessor for OS_os_log();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[3] = OS_os_log.init(subsystem:category:)();
  a2[4] = 0xD000000000000033;
  a2[5] = 0x800000024FF50DF0;
  uint64_t v5 = type metadata accessor for TrafficDisambiguationView();
  ActionHandler.init()();
  uint64_t v6 = (void *)((char *)a2 + *(int *)(v5 + 32));
  type metadata accessor for Context();
  lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
  *uint64_t v6 = EnvironmentObject.init()();
  v6[1] = v7;
  uint64_t v8 = (char *)a2 + *(int *)(v5 + 36);
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v8 = result;
  v8[8] = 0;
  return result;
}

uint64_t protocol witness for static PreviewProvider.previews.getter in conformance TrafficIncidentView_Previews()
{
  if (one-time initialization token for testView1 != -1) {
    swift_once();
  }
  type metadata accessor for TrafficDisambiguationView();
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
  lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(&lazy protocol witness table cache variable for type TrafficDisambiguationView and conformance TrafficDisambiguationView, (void (*)(uint64_t))type metadata accessor for TrafficDisambiguationView);
  swift_bridgeObjectRetain();
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t protocol witness for static _PreviewProvider._previews.getter in conformance TrafficIncidentView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews();
  return MEMORY[0x270F00210](a1, v2);
}

uint64_t protocol witness for static _PreviewProvider._platform.getter in conformance TrafficIncidentView_Previews(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews();
  return MEMORY[0x270F00200](a1, v2);
}

double one-time initialization function for crash()
{
  uint64_t v0 = (_OWORD *)swift_slowAlloc();
  pickupTruck.localizedAddress.value._object = v0;
  double result = 0.0;
  *uint64_t v0 = xmmword_24FF4F410;
  v0[1] = xmmword_24FF4F420;
  *((void *)v0 + 4) = 0xE500000000000000;
  *((void *)v0 + 5) = 2;
  return result;
}

uint64_t crash.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for crash, (uint64_t)&pickupTruck.localizedAddress.value._object);
}

double one-time initialization function for hazard()
{
  uint64_t v0 = swift_slowAlloc();
  *(void *)&pickupTruck.locationInfo.latitude = v0;
  *(void *)&double result = 1;
  *(_OWORD *)uint64_t v0 = xmmword_24FF4F430;
  *(_OWORD *)(v0 + 16) = xmmword_24FF4F440;
  *(void *)(v0 + 32) = 0xE600000000000000;
  *(void *)(v0 + 40) = 1;
  return result;
}

uint64_t hazard.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for hazard, (uint64_t)&pickupTruck.locationInfo.latitude);
}

double one-time initialization function for sc()
{
  Swift::Int v0 = swift_slowAlloc();
  sc.index = v0;
  *(void *)&double result = 2;
  *(_OWORD *)Swift::Int v0 = xmmword_24FF4F450;
  *(_OWORD *)(v0 + 16) = xmmword_24FF4F460;
  *(void *)(v0 + 32) = 0xEB000000006B6365;
  *(void *)(v0 + 40) = 3;
  return result;
}

uint64_t sc.unsafeMutableAddressor()
{
  return crash.unsafeMutableAddressor(&one-time initialization token for sc, (uint64_t)&sc);
}

uint64_t crash.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(void *)a2;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type SimpleItemRichView and conformance SimpleItemRichView(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t associated type witness table accessor for View.Body : View in TrafficDisambiguationView()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews()
{
  unint64_t result = lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews;
  if (!lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews;
  if (!lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrafficIncidentView_Previews and conformance TrafficIncidentView_Previews);
  }
  return result;
}

uint64_t associated type witness table accessor for PreviewProvider.Previews : View in TrafficIncidentView_Previews()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TrafficDisambiguationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v8;
    uint64_t v9 = a2[5];
    uint64_t v10 = *(int *)(a3 + 28);
    long long v26 = (char *)a2 + v10;
    long long v27 = (char *)a1 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v11 = type metadata accessor for ActionHandler();
    long long v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = v8;
    swift_bridgeObjectRetain();
    v12(v27, v26, v11);
    uint64_t v14 = *(int *)(v6 + 32);
    uint64_t v15 = *(int *)(v6 + 36);
    uint64_t v16 = (uint64_t *)((char *)v4 + v14);
    uint64_t v17 = (char *)a2 + v14;
    uint64_t v19 = *(void **)v17;
    uint64_t v18 = *((void *)v17 + 1);
    void *v16 = v19;
    v16[1] = v18;
    uint64_t v20 = (char *)v4 + v15;
    uint64_t v21 = (char *)a2 + v15;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v15);
    LOBYTE(v6) = v21[8];
    id v23 = v19;
    outlined copy of Environment<VRXIdiom>.Content(v22, v6);
    *(void *)uint64_t v20 = v22;
    v20[8] = v6;
  }
  return v4;
}

uint64_t destroy for TrafficDisambiguationView(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  return outlined consume of Environment<VRXIdiom>.Content(v7, v8);
}

void *initializeWithCopy for TrafficDisambiguationView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v24 = (char *)a2 + v9;
  uint64_t v25 = (char *)a1 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v10 = type metadata accessor for ActionHandler();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v7;
  swift_bridgeObjectRetain();
  v11(v25, v24, v10);
  uint64_t v13 = *(int *)(v3 + 32);
  uint64_t v14 = *(int *)(v3 + 36);
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (char *)a2 + v13;
  uint64_t v18 = *(void **)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *uint64_t v15 = v18;
  v15[1] = v17;
  uint64_t v19 = (char *)a1 + v14;
  uint64_t v20 = (char *)a2 + v14;
  uint64_t v21 = *(void *)((char *)a2 + v14);
  LOBYTE(v3) = v20[8];
  id v22 = v18;
  outlined copy of Environment<VRXIdiom>.Content(v21, v3);
  *(void *)uint64_t v19 = v21;
  v19[8] = v3;
  return a1;
}

void *assignWithCopy for TrafficDisambiguationView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[3];
  uint64_t v7 = (void *)a1[3];
  a1[3] = v6;
  id v8 = v6;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void **)((char *)a1 + v13);
  uint64_t v17 = *(void **)((char *)a2 + v13);
  *uint64_t v14 = v17;
  id v18 = v17;

  v14[1] = *((void *)v15 + 1);
  uint64_t v19 = a3[9];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = *(void *)v21;
  LOBYTE(a3) = v21[8];
  outlined copy of Environment<VRXIdiom>.Content(*(void *)v21, (char)a3);
  uint64_t v23 = *(void *)v20;
  char v24 = v20[8];
  *(void *)uint64_t v20 = v22;
  v20[8] = (char)a3;
  outlined consume of Environment<VRXIdiom>.Content(v23, v24);
  return a1;
}

uint64_t initializeWithTake for TrafficDisambiguationView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  return a1;
}

void *assignWithTake for TrafficDisambiguationView(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[3];
  a1[3] = a2[3];

  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionHandler();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = *(void **)((char *)a1 + v13);
  *uint64_t v14 = *v15;

  v14[1] = v15[1];
  uint64_t v17 = a3[9];
  id v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = *(void *)v19;
  LOBYTE(v19) = v19[8];
  uint64_t v21 = *(void *)v18;
  char v22 = v18[8];
  *(void *)id v18 = v20;
  v18[8] = (char)v19;
  outlined consume of Environment<VRXIdiom>.Content(v21, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrafficDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FF43610);
}

uint64_t sub_24FF43610(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ActionHandler();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TrafficDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FF436D4);
}

uint64_t sub_24FF436D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for TrafficDisambiguationView()
{
  uint64_t result = type metadata accessor for ActionHandler();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrafficIncidentView_Previews()
{
  return &type metadata for TrafficIncidentView_Previews;
}

uint64_t sub_24FF43850()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>> and conformance DisambiguationView<A>, &demangling cache variable for type metadata for DisambiguationView<ForEach<[GeoTrafficIncident], GeoTrafficIncident, <<opaque return type of View.componentTapped(isNavigation:perform:)>>.0>>);
}

uint64_t sub_24FF4388C()
{
  return lazy protocol witness table accessor for type TupleView<(ModifiedContent<<<opaque return type of View.mapScope(_:)>>.0, _FlexFrameLayout>, PrimaryHeaderRichView, <<opaque return type of View.separators(_:isOverride:)>>.0)> and conformance TupleView<A>(&lazy protocol witness table cache variable for type SnippetPreview<GeoDataModels.TrafficDisambiguationDataModel, TrafficDisambiguationView> and conformance SnippetPreview<A, B>, &demangling cache variable for type metadata for SnippetPreview<GeoDataModels.TrafficDisambiguationDataModel, TrafficDisambiguationView>);
}

uint64_t sub_24FF4391C()
{
  unint64_t v1 = (int *)(type metadata accessor for TrafficDisambiguationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for ActionHandler();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  outlined consume of Environment<VRXIdiom>.Content(*(void *)(v6 + v1[11]), *(unsigned char *)(v6 + v1[11] + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t partial apply for closure #1 in closure #1 in TrafficDisambiguationView.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for TrafficDisambiguationView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return closure #1 in closure #1 in TrafficDisambiguationView.body.getter(v0 + v2, v3);
}

uint64_t outlined retain of GeoTrafficIncident(uint64_t a1)
{
  return a1;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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
      char v7 = MEMORY[0x25337C2C0](v9, a1);
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

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t outlined init with copy of (AnyHashable, Any)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t GeoContact.image.getter()
{
  uint64_t v1 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ImageElement.Contact.Content();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *((void *)v0 + 2);
  if (v9)
  {
    id v18 = v4;
    uint64_t v10 = *((void *)v0 + 1);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_24FF4EB30;
    *(void *)(v11 + 32) = v10;
    *(void *)(v11 + 40) = v9;
    unint64_t v4 = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v13 = *((void *)v0 + 6);
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = *((void *)v0 + 5) & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      swift_bridgeObjectRetain();
      ImageElement.Contact.Monogram.init(letters:)();
      uint64_t v12 = (unsigned int *)MEMORY[0x263F767D0];
      goto LABEL_8;
    }
  }
  ImageElement.Contact.Avatar.init(contactIds:)();
  uint64_t v12 = (unsigned int *)MEMORY[0x263F767C8];
LABEL_8:
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *v12, v5);
  uint64_t v15 = type metadata accessor for GeoContact();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, &v0[*(int *)(v15 + 40)], v1);
  return ImageElement.Contact.init(_:imageStyle:)();
}

uint64_t type metadata accessor for GeoContact()
{
  uint64_t result = type metadata singleton initialization cache for GeoContact;
  if (!type metadata singleton initialization cache for GeoContact) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t GeoContact.app.getter()
{
  if ((*(void *)(v0 + 72) & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 0xD000000000000013;
  }
  else {
    return 0x6C7070612E6D6F63;
  }
}

uint64_t GeoContact.supplamentalText.getter()
{
  if ((*(void *)(v0 + 72) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    swift_bridgeObjectRelease();
    return 5459283;
  }
  char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v1) {
    return 5459283;
  }
  return 0;
}

uint64_t GeoContact.init(index:id:displayName:initials:encodeBase64:shareLevel:imageStyle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  uint64_t v12 = (char *)a9 + *(int *)(type metadata accessor for GeoContact() + 40);
  uint64_t v13 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
  return v14(v12, a12, v13);
}

uint64_t GeoContact.index.getter()
{
  return *(void *)v0;
}

uint64_t GeoContact.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.initials.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.encodeBase64.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoContact.shareLevel.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t GeoContact.imageStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GeoContact() + 40);
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t GeoContact.imageStyle.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GeoContact() + 40);
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*GeoContact.imageStyle.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t AppID.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000013;
  }
  else {
    return 0x6C7070612E6D6F63;
  }
}

uint64_t GeoContact.hash(into:)()
{
  Hasher._combine(_:)(*v0);
  if (v0[2])
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v0[9]);
  type metadata accessor for GeoContact();
  type metadata accessor for ImageElement.ImageStyle();
  lazy protocol witness table accessor for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, MEMORY[0x263F76650]);
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t GeoContact.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aIndex_2[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoContact.CodingKeys()
{
  return GeoContact.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoContact.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoContact.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoContact.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoContact.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoContact.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoContact.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoContact.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    type metadata accessor for GeoContact();
    v8[9] = 6;
    type metadata accessor for ImageElement.ImageStyle();
    lazy protocol witness table accessor for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, MEMORY[0x263F76650]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int GeoContact.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t GeoContact.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v4 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoContact.CodingKeys>);
  uint64_t v7 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for GeoContact();
  MEMORY[0x270FA5388](v10);
  long long v29 = a1;
  long long v30 = (uint64_t *)((char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  }
  uint64_t v24 = v10;
  uint64_t v25 = v4;
  uint64_t v12 = v6;
  char v37 = 0;
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v30;
  *long long v30 = v13;
  char v36 = 1;
  uint64_t v15 = v7;
  v14[1] = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v14[2] = v16;
  char v35 = 2;
  v14[3] = KeyedDecodingContainer.decode(_:forKey:)();
  v14[4] = v17;
  char v34 = 3;
  v14[5] = KeyedDecodingContainer.decode(_:forKey:)();
  v14[6] = v18;
  char v33 = 4;
  v14[7] = KeyedDecodingContainer.decode(_:forKey:)();
  v14[8] = v19;
  char v32 = 5;
  v14[9] = KeyedDecodingContainer.decode(_:forKey:)();
  char v31 = 6;
  lazy protocol witness table accessor for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle(&lazy protocol witness table cache variable for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle, MEMORY[0x263F76650]);
  uint64_t v20 = v25;
  uint64_t v21 = v28;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v21);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))((char *)v14 + *(int *)(v24 + 40), v12, v20);
  outlined init with copy of GeoContact((uint64_t)v14, v27);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  return outlined destroy of GeoContact((uint64_t)v14);
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoContact@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return GeoContact.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoContact(void *a1)
{
  return GeoContact.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoContact()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoContact()
{
  return Hasher._finalize()();
}

GeoUIFramework::AppID_optional __swiftcall AppID.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AppID.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = GeoUIFramework_AppID_messages;
  }
  else {
    v4.value = GeoUIFramework_AppID_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppID(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = AppID.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == AppID.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppID()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  AppID.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppID()
{
  AppID.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppID()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  AppID.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AppID@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AppID.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AppID@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppID.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

Swift::String __swiftcall INPerson.getContactInitials()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v52 - v5;
  uint64_t v7 = type metadata accessor for PersonNameComponents();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v52 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v52 - v14;
  id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A78]), sel_init);
  objc_msgSend(v53, sel_setStyle_, 4);
  id v16 = objc_msgSend(v0, sel_nameComponents);
  if (v16)
  {
    uint64_t v17 = v16;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v13, v7);
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v19(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v18(v15, v6, v7);
      Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
      id v21 = v53;
      id v22 = objc_msgSend(v53, sel_stringFromPersonNameComponents_, isa);

      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = v24;

      (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v19(v6, 1, 1, v7);
  }
  outlined destroy of PersonNameComponents?((uint64_t)v6);
  id v26 = objc_msgSend(v0, sel_displayName);
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v29 = v28;

  swift_bridgeObjectRelease();
  uint64_t v30 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0) {
    uint64_t v30 = v27 & 0xFFFFFFFFFFFFLL;
  }
  if (v30)
  {
    id v31 = objc_msgSend(v0, sel_displayName);
    if (!v31)
    {
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v31 = (id)MEMORY[0x25337C1A0](v32);
      swift_bridgeObjectRelease();
    }
    id v33 = objc_msgSend(v53, sel_personNameComponentsFromString_, v31);

    if (v33)
    {
      static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

      char v34 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v34(v4, v13, v7);
      v19(v4, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) != 1)
      {
        char v35 = v52;
        v34(v52, v4, v7);
        Class v36 = PersonNameComponents._bridgeToObjectiveC()().super.isa;
        id v37 = v53;
        id v38 = objc_msgSend(v53, sel_stringFromPersonNameComponents_, v36);

        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v25 = v39;

        (*(void (**)(char *, uint64_t))(v8 + 8))(v35, v7);
        goto LABEL_24;
      }
    }
    else
    {
      v19(v4, 1, 1, v7);
    }
    outlined destroy of PersonNameComponents?((uint64_t)v4);
    id v42 = [v0 (SEL)0x26534E018];
    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v43;
  }
  else
  {
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
  }
  uint64_t v54 = v40;
  unint64_t v55 = v41;
  unint64_t v44 = lazy protocol witness table accessor for type String and conformance String();
  uint64_t v45 = MEMORY[0x25337C2A0](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x263F8D310], v44);
  swift_bridgeObjectRelease();
  uint64_t v54 = 0;
  unint64_t v55 = 0xE000000000000000;
  uint64_t v46 = *(void *)(v45 + 16);
  if (v46)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = v45 + 56;
    do
    {
      if ((*(void *)(v47 - 16) ^ *(void *)(v47 - 24)) >= 0x4000)
      {
        swift_bridgeObjectRetain();
        uint64_t v48 = Substring.subscript.getter();
        MEMORY[0x25337C1E0](v48);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v47 += 32;
      --v46;
    }
    while (v46);

    swift_bridgeObjectRelease_n();
    uint64_t v23 = v54;
    unint64_t v25 = v55;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v23 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
LABEL_24:
  uint64_t v49 = v23;
  uint64_t v50 = (void *)v25;
  result._object = v50;
  result._countAndFlagsBits = v49;
  return result;
}

uint64_t specialized static GeoContact.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v4 = a1[2];
  uint64_t v5 = a2[2];
  if (!v4)
  {
    if (!v5) {
      goto LABEL_11;
    }
    return 0;
  }
  if (!v5) {
    return 0;
  }
  BOOL v6 = a1[1] == a2[1] && v4 == v5;
  if (!v6 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
LABEL_11:
  BOOL v7 = a1[3] == a2[3] && a1[4] == a2[4];
  if (!v7 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || (a1[5] != a2[5] || a1[6] != a2[6]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || (a1[7] != a2[7] || a1[8] != a2[8]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || a1[9] != a2[9])
  {
    return 0;
  }
  uint64_t v8 = *(int *)(type metadata accessor for GeoContact() + 40);
  return MEMORY[0x270F73C60]((char *)a1 + v8, (char *)a2 + v8);
}

unint64_t lazy protocol witness table accessor for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoContact.CodingKeys and conformance GeoContact.CodingKeys);
  }
  return result;
}

uint64_t outlined init with copy of GeoContact(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GeoContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of GeoContact(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GeoContact();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of PersonNameComponents?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t base witness table accessor for Equatable in GeoContact()
{
  return lazy protocol witness table accessor for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle(&lazy protocol witness table cache variable for type GeoContact and conformance GeoContact, (void (*)(uint64_t))type metadata accessor for GeoContact);
}

uint64_t lazy protocol witness table accessor for type ImageElement.ImageStyle and conformance ImageElement.ImageStyle(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type AppID and conformance AppID()
{
  unint64_t result = lazy protocol witness table cache variable for type AppID and conformance AppID;
  if (!lazy protocol witness table cache variable for type AppID and conformance AppID)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AppID and conformance AppID);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GeoContact(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    uint64_t v6 = a2[5];
    a1[4] = a2[4];
    a1[5] = v6;
    uint64_t v7 = a2[7];
    a1[6] = a2[6];
    a1[7] = v7;
    uint64_t v8 = a2[9];
    uint64_t v9 = *(int *)(a3 + 40);
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = (char *)a1 + v9;
    a1[8] = a2[8];
    a1[9] = v8;
    uint64_t v12 = type metadata accessor for ImageElement.ImageStyle();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t destroy for GeoContact(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a2 + v8;
  uint64_t v10 = a1 + v8;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v11 = type metadata accessor for ImageElement.ImageStyle();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

void *assignWithCopy for GeoContact(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v4 = *(int *)(a3 + 40);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v7 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, v5, v7);
  return a1;
}

uint64_t assignWithTake for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for ImageElement.ImageStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FF460C8);
}

uint64_t sub_24FF460C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ImageElement.ImageStyle();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GeoContact(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FF4618C);
}

uint64_t sub_24FF4618C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ImageElement.ImageStyle();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for GeoContact()
{
  uint64_t result = type metadata accessor for ImageElement.ImageStyle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppID(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppID(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24FF46444);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for AppID(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppID()
{
  return &type metadata for AppID;
}

uint64_t getEnumTagSinglePayload for GeoContact.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GeoContact.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24FF465E4);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GeoContact.CodingKeys()
{
  return &unk_270164368;
}

uint64_t specialized GeoContact.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736C616974696E69 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x614265646F636E65 && a2 == 0xEC00000034366573 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x76654C6572616873 && a2 == 0xEA00000000006C65 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7974536567616D69 && a2 == 0xEA0000000000656CLL)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

double StandardMapData.center.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t StandardMapData.makePunchoutURL(idiom:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CharacterSet();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 8);
  unint64_t v14 = *(void *)v1;
  uint64_t v15 = v7;
  long long v16 = *(_OWORD *)(v1 + 16);
  char v8 = VRXIdiom.isWatchOS.getter();
  unint64_t v14 = StandardMapData.makePunchoutURI(includeLabel:)((v8 & 1) == 0);
  uint64_t v15 = v9;
  static CharacterSet.urlQueryAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  if (v11)
  {
    URL.init(string:)();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
}

uint64_t StandardMapData.makeAppPunchout(idiom:)()
{
  char v0 = VRXIdiom.isWatchOS.getter();
  StandardMapData.makePunchoutURI(includeLabel:)((v0 & 1) == 0);
  if (one-time initialization token for appName != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
}

GeoUIFramework::StandardMapData __swiftcall StandardMapData.init(label:latitude:longitude:)(Swift::String label, Swift::Double latitude, Swift::Double longitude)
{
  *(Swift::String *)uint64_t v3 = label;
  *(Swift::Double *)(v3 + 16) = latitude;
  *(Swift::Double *)(v3 + 24) = longitude;
  result.label = label;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

id static StandardMapData.blueTint.getter()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67578]), sel_init);
  objc_msgSend(v0, sel_setName_, 8);
  return v0;
}

uint64_t StandardMapData.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double StandardMapData.latitude.getter()
{
  return *(double *)(v0 + 16);
}

double StandardMapData.longitude.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t StandardMapData.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aLabel_0[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance StandardMapData.CodingKeys()
{
  return StandardMapData.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance StandardMapData.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized StandardMapData.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance StandardMapData.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance StandardMapData.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StandardMapData.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<StandardMapData.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  char v8 = a1;
  uint64_t v10 = v9;
  __swift_project_boxed_opaque_existential_1(v8, v7);
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v10);
}

uint64_t StandardMapData.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<StandardMapData.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v19 = 1;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v13 = v12;
  char v18 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v13;
  a2[3] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance StandardMapData@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return StandardMapData.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance StandardMapData(void *a1)
{
  return StandardMapData.encode(to:)(a1);
}

unint64_t StandardMapData.makePunchoutURI(includeLabel:)(char a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8D538];
  *(_OWORD *)(v7 + 16) = xmmword_24FF4EB30;
  uint64_t v9 = MEMORY[0x263F8D5B8];
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 32) = v6;
  v10._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = 44;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_24FF4EB30;
  *(void *)(v12 + 56) = v8;
  *(void *)(v12 + 64) = v9;
  *(void *)(v12 + 32) = v5;
  uint64_t v13 = String.init(format:_:)();
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0 && (v4 || v3 != 0xE000000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    lazy protocol witness table accessor for type String and conformance String();
    v19._countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = 15729;
    v20._object = (void *)0xE200000000000000;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = 1030515750;
    v21._object = (void *)0xE400000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    v17._countAndFlagsBits = 1030515750;
    v17._object = (void *)0xE400000000000000;
    String.append(_:)(v17);
  }
  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

void one-time initialization function for radius()
{
  sc.displayName._countAndFlagsBits = 0x4030000000000000;
}

Swift::String *GeoMapViewConstants.radius.unsafeMutableAddressor()
{
  if (one-time initialization token for radius != -1) {
    swift_once();
  }
  return &sc.displayName;
}

double static GeoMapViewConstants.radius.getter()
{
  return static GeoMapViewConstants.radius.getter(&one-time initialization token for radius, (uint64_t)&sc.displayName);
}

void one-time initialization function for frameHeight()
{
  sc.displayName._object = (void *)0x4063A00000000000;
}

void **GeoMapViewConstants.frameHeight.unsafeMutableAddressor()
{
  if (one-time initialization token for frameHeight != -1) {
    swift_once();
  }
  return &sc.displayName._object;
}

double static GeoMapViewConstants.frameHeight.getter()
{
  return static GeoMapViewConstants.radius.getter(&one-time initialization token for frameHeight, (uint64_t)&sc.displayName._object);
}

double static GeoMapViewConstants.radius.getter(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

double one-time initialization function for marginPadding()
{
  double result = 0.0;
  __asm { FMOV            V1.2D, #6.0 }
  *(_OWORD *)&sc.driPayload = _Q1;
  *(_OWORD *)&qword_269A9A3E0 = xmmword_24FF4F9F0;
  return result;
}

Swift::Int *GeoMapViewConstants.marginPadding.unsafeMutableAddressor()
{
  if (one-time initialization token for marginPadding != -1) {
    swift_once();
  }
  return &sc.driPayload;
}

double static GeoMapViewConstants.marginPadding.getter()
{
  if (one-time initialization token for marginPadding != -1) {
    swift_once();
  }
  return *(double *)&sc.driPayload;
}

unint64_t lazy protocol witness table accessor for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys;
  if (!lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StandardMapData.CodingKeys and conformance StandardMapData.CodingKeys);
  }
  return result;
}

uint64_t destroy for StandardMapData()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StandardMapData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for StandardMapData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
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

uint64_t assignWithTake for StandardMapData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandardMapData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StandardMapData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StandardMapData()
{
  return &type metadata for StandardMapData;
}

ValueMetadata *type metadata accessor for GeoMapViewConstants()
{
  return &type metadata for GeoMapViewConstants;
}

unsigned char *storeEnumTagSinglePayload for StandardMapData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24FF47928);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

void *type metadata accessor for StandardMapData.CodingKeys()
{
  return &unk_2701644A0;
}

uint64_t specialized StandardMapData.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656475746974616CLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64757469676E6F6CLL && a2 == 0xE900000000000065)
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

uint64_t static MapsAppProperties.getBundleID(idiom:)(uint64_t a1)
{
  if (a1 == 6) {
    return 0xD000000000000012;
  }
  else {
    return 0x6C7070612E6D6F63;
  }
}

uint64_t *MapsAppProperties.appName.unsafeMutableAddressor()
{
  if (one-time initialization token for appName != -1) {
    swift_once();
  }
  return &static MapsAppProperties.appName;
}

void one-time initialization function for appName()
{
  static MapsAppProperties.appName = 1936744781;
  *(void *)algn_269A9A3F8 = 0xE400000000000000;
}

uint64_t static MapsAppProperties.appName.getter()
{
  if (one-time initialization token for appName != -1) {
    swift_once();
  }
  uint64_t v0 = static MapsAppProperties.appName;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for MapsAppProperties()
{
  return &type metadata for MapsAppProperties;
}

uint64_t GeoUIPluginProviding.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t GeoUIPluginProviding.init()()
{
  return v0;
}

uint64_t GeoUIPluginProviding.snippet(for:mode:idiom:)(uint64_t a1)
{
  return specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(a1);
}

uint64_t GeoUIPluginProviding.deinit()
{
  return v0;
}

uint64_t GeoUIPluginProviding.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t protocol witness for SnippetProviding.init() in conformance GeoUIPluginProviding@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance GeoUIPluginProviding(uint64_t a1)
{
  return specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(a1);
}

uint64_t specialized GeoUIPluginProviding.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v41 = type metadata accessor for WhereAmIView();
  MEMORY[0x270FA5388](v41);
  BOOL v3 = (uint64_t *)((char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v40 = type metadata accessor for TrafficDisambiguationView();
  MEMORY[0x270FA5388](v40);
  uint64_t v5 = (uint64_t *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = type metadata accessor for ParkingLocationView();
  MEMORY[0x270FA5388](v39);
  uint64_t v7 = (uint64_t *)((char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for ContactDisambiguationView();
  MEMORY[0x270FA5388](v8);
  Swift::String v10 = (uint64_t *)((char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 72);
  switch(*(unsigned char *)(a1 + 80))
  {
    case 1:
      *uint64_t v7 = v12;
      v7[1] = v11;
      void v7[2] = v14;
      v7[3] = v13;
      v7[4] = v16;
      v7[5] = v15;
      v7[6] = v17;
      v7[7] = v18;
      v7[8] = v19;
      v7[9] = v20;
      type metadata accessor for OS_os_log();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v7[10] = OS_os_log.init(subsystem:category:)();
      ActionHandler.init()();
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type ParkingLocationView and conformance ParkingLocationView, (void (*)(uint64_t))type metadata accessor for ParkingLocationView);
      uint64_t v21 = View.eraseToAnyView()();
      id v22 = type metadata accessor for ParkingLocationView;
      uint64_t v23 = (uint64_t)v7;
      break;
    case 2:
      *uint64_t v5 = v12;
      v5[1] = v11;
      v5[2] = v14;
      type metadata accessor for OS_os_log();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v5[3] = OS_os_log.init(subsystem:category:)();
      v5[4] = 0xD000000000000033;
      v5[5] = 0x800000024FF50DF0;
      unint64_t v24 = v40;
      ActionHandler.init()();
      unint64_t v25 = (uint64_t *)((char *)v5 + *(int *)(v24 + 32));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *unint64_t v25 = EnvironmentObject.init()();
      v25[1] = v26;
      uint64_t v27 = (char *)v5 + *(int *)(v24 + 36);
      *(void *)uint64_t v27 = swift_getKeyPath();
      v27[8] = 0;
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type TrafficDisambiguationView and conformance TrafficDisambiguationView, (void (*)(uint64_t))type metadata accessor for TrafficDisambiguationView);
      uint64_t v21 = View.eraseToAnyView()();
      id v22 = type metadata accessor for TrafficDisambiguationView;
      uint64_t v23 = (uint64_t)v5;
      break;
    case 3:
      *BOOL v3 = v12;
      v3[1] = v11;
      v3[2] = v14;
      v3[3] = v13;
      v3[4] = v16;
      v3[5] = v15;
      v3[6] = v17;
      v3[7] = v18;
      v3[8] = v19;
      v3[9] = v20;
      uint64_t v28 = v11;
      uint64_t v38 = v15;
      uint64_t v39 = v18;
      uint64_t v29 = v13;
      uint64_t v30 = v16;
      uint64_t v31 = v17;
      unint64_t v40 = type metadata accessor for OS_os_log();
      outlined copy of GeoDataModels(v12, v28, v14, v29, v30, v38, v31, v39, v19, v20, 3);
      v3[10] = OS_os_log.init(subsystem:category:)();
      uint64_t v32 = (int *)v41;
      ActionHandler.init()();
      *(uint64_t *)((char *)v3 + v32[7]) = 0;
      id v33 = (uint64_t *)((char *)v3 + v32[8]);
      *id v33 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<Locale>.Content);
      swift_storeEnumTagMultiPayload();
      char v34 = (char *)v3 + v32[9];
      *(void *)char v34 = swift_getKeyPath();
      v34[8] = 0;
      char v35 = (uint64_t *)((char *)v3 + v32[10]);
      type metadata accessor for Context();
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *char v35 = EnvironmentObject.init()();
      v35[1] = v36;
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type WhereAmIView and conformance WhereAmIView, (void (*)(uint64_t))type metadata accessor for WhereAmIView);
      uint64_t v21 = View.eraseToAnyView()();
      id v22 = type metadata accessor for WhereAmIView;
      uint64_t v23 = (uint64_t)v3;
      break;
    default:
      *Swift::String v10 = v12;
      v10[1] = v11;
      v10[2] = v14;
      type metadata accessor for OS_os_log();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10[3] = OS_os_log.init(subsystem:category:)();
      v10[4] = 0xD00000000000002CLL;
      v10[5] = 0x800000024FF50B90;
      ActionHandler.init()();
      lazy protocol witness table accessor for type Context and conformance Context(&lazy protocol witness table cache variable for type ContactDisambiguationView and conformance ContactDisambiguationView, (void (*)(uint64_t))type metadata accessor for ContactDisambiguationView);
      uint64_t v21 = View.eraseToAnyView()();
      id v22 = type metadata accessor for ContactDisambiguationView;
      uint64_t v23 = (uint64_t)v10;
      break;
  }
  outlined destroy of WhereAmIView(v23, (uint64_t (*)(void))v22);
  return v21;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels and conformance GeoDataModels()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels;
  if (!lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels and conformance GeoDataModels);
  }
  return result;
}

uint64_t type metadata accessor for GeoUIPluginProviding()
{
  return self;
}

uint64_t method lookup function for GeoUIPluginProviding(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GeoUIPluginProviding);
}

uint64_t dispatch thunk of GeoUIPluginProviding.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t outlined copy of GeoDataModels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result = a4;
  switch(a11)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_3:
      swift_bridgeObjectRetain();
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Context and conformance Context(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined destroy of WhereAmIView(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void __swiftcall GeoDataModels.WhereAmIDataModel.init(meID:buttonLabel:localizedAddress:currentLocation:)(GeoUIFramework::GeoDataModels::WhereAmIDataModel *__return_ptr retstr, Swift::String_optional meID, Swift::String buttonLabel, Swift::String_optional localizedAddress, GeoUIFramework::StandardMapData currentLocation)
{
  uint64_t v5 = *(void *)currentLocation.label._countAndFlagsBits;
  uint64_t v6 = *(void **)(currentLocation.label._countAndFlagsBits + 8);
  retstr->meID = meID;
  retstr->buttonLabel = buttonLabel;
  retstr->localizedAddress = localizedAddress;
  retstr->currentLocation.label._countAndFlagsBits = v5;
  retstr->currentLocation.label._object = v6;
  *(_OWORD *)&retstr->currentLocation.latitude = *(_OWORD *)(currentLocation.label._countAndFlagsBits + 16);
}

void __swiftcall GeoDataModels.ParkingLocationDataModel.init(parkedCar:buttonLabel:)(GeoUIFramework::GeoDataModels::ParkingLocationDataModel *__return_ptr retstr, GeoUIFramework::GeoParkedCar *parkedCar, Swift::String buttonLabel)
{
  uint64_t countAndFlagsBits = parkedCar->locationInfo.label._countAndFlagsBits;
  object = parkedCar->locationInfo.label._object;
  Swift::String_optional localizedAddress = parkedCar->localizedAddress;
  retstr->parkedCar.note = parkedCar->note;
  retstr->parkedCar.Swift::String_optional localizedAddress = localizedAddress;
  retstr->parkedCar.locationInfo.label._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->parkedCar.locationInfo.label._object = object;
  *(_OWORD *)&retstr->parkedCar.locationInfo.latitude = *(_OWORD *)&parkedCar->locationInfo.latitude;
  retstr->buttonLabel = buttonLabel;
}

GeoUIFramework::GeoDataModels::ContactDisambiguationDataModel __swiftcall GeoDataModels.ContactDisambiguationDataModel.init(systemText:candidates:)(Swift::String systemText, Swift::OpaquePointer candidates)
{
  *(Swift::String *)uint64_t v2 = systemText;
  *(Swift::OpaquePointer *)(v2 + 16) = candidates;
  result.systemText = systemText;
  result.candidates = candidates;
  return result;
}

GeoUIFramework::GeoDataModels::TrafficDisambiguationDataModel __swiftcall GeoDataModels.TrafficDisambiguationDataModel.init(systemText:candidates:)(Swift::String systemText, Swift::OpaquePointer candidates)
{
  *(Swift::String *)uint64_t v2 = systemText;
  *(Swift::OpaquePointer *)(v2 + 16) = candidates;
  result.systemText = systemText;
  result.candidates = candidates;
  return result;
}

void one-time initialization function for bundleName()
{
  static GeoDataModels.bundleName = 0x756C5049556F6547;
  *(void *)algn_269A96A38 = 0xEB000000006E6967;
}

uint64_t static GeoDataModels.bundleName.getter()
{
  if (one-time initialization token for bundleName != -1) {
    swift_once();
  }
  uint64_t v0 = static GeoDataModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.systemText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.systemText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*GeoDataModels.ContactDisambiguationDataModel.systemText.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.candidates.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*GeoDataModels.ContactDisambiguationDataModel.candidates.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x74616469646E6163;
  }
  else {
    return 0x65546D6574737973;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  return GeoDataModels.ContactDisambiguationDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoDataModels.ContactDisambiguationDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ContactDisambiguationDataModel.CodingKeys>);
  uint64_t v10 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    uint64_t v11 = v9;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
    lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoContact] and conformance <A> [A], &lazy protocol witness table cache variable for type GeoContact and conformance GeoContact);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.ContactDisambiguationDataModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ContactDisambiguationDataModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel.CodingKeys and conformance GeoDataModels.ContactDisambiguationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v16 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoContact]);
  char v15 = 1;
  lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoContact] and conformance <A> [A], &lazy protocol witness table cache variable for type GeoContact and conformance GeoContact);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t lazy protocol witness table accessor for type [GeoContact] and conformance <A> [A](unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GeoContact]);
    lazy protocol witness table accessor for type GeoContact and conformance GeoContact(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type GeoContact and conformance GeoContact(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GeoContact();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.ContactDisambiguationDataModel@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.ContactDisambiguationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.ContactDisambiguationDataModel(void *a1)
{
  return GeoDataModels.ContactDisambiguationDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.ParkingLocationDataModel.parkedCar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(void *)(a1 + 40) = v2;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t GeoDataModels.ParkingLocationDataModel.buttonLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.ParkingLocationDataModel.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x614C6E6F74747562;
  }
  else {
    return 0x614364656B726170;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  return GeoDataModels.ParkingLocationDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoDataModels.ParkingLocationDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ParkingLocationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoDataModels.ParkingLocationDataModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ParkingLocationDataModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = *v1;
  long long v16 = v1[1];
  long long v17 = v7;
  uint64_t v9 = *((void *)v1 + 4);
  uint64_t v8 = *((void *)v1 + 5);
  uint64_t v10 = *((void *)v1 + 6);
  uint64_t v11 = *((void *)v1 + 7);
  uint64_t v12 = *((void *)v1 + 8);
  v15[0] = *((void *)v1 + 9);
  v15[1] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  long long v19 = v17;
  long long v20 = v16;
  uint64_t v21 = v9;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  uint64_t v24 = v11;
  char v25 = 0;
  lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar();
  uint64_t v13 = v18;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v13)
  {
    LOBYTE(v19) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar;
  if (!lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar;
  if (!lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoParkedCar and conformance GeoParkedCar);
  }
  return result;
}

uint64_t GeoDataModels.ParkingLocationDataModel.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ParkingLocationDataModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel.CodingKeys and conformance GeoDataModels.ParkingLocationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v34 = 0;
  lazy protocol witness table accessor for type GeoParkedCar and conformance GeoParkedCar();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v27;
  uint64_t v10 = v29;
  uint64_t v23 = v28;
  uint64_t v24 = v26;
  uint64_t v11 = v31;
  uint64_t v22 = v30;
  uint64_t v12 = v32;
  uint64_t v13 = v33;
  LOBYTE(v26) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = v9;
  swift_bridgeObjectRetain();
  uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = v15;
  long long v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v21 = v14;
  v17(v8, v5);
  uint64_t v18 = v25;
  *a2 = v24;
  a2[1] = v18;
  a2[2] = v23;
  a2[3] = v10;
  a2[4] = v22;
  a2[5] = v11;
  a2[6] = v12;
  a2[7] = v13;
  a2[8] = v21;
  a2[9] = v16;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.ParkingLocationDataModel@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return GeoDataModels.ParkingLocationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.ParkingLocationDataModel(void *a1)
{
  return GeoDataModels.ParkingLocationDataModel.encode(to:)(a1);
}

uint64_t (*GeoDataModels.TrafficDisambiguationDataModel.systemText.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t (*GeoDataModels.TrafficDisambiguationDataModel.candidates.modify())()
{
  return closure #2 in closure #2 in closure #1 in ParkingLocationView.directionsButton.getter;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoDataModels.TrafficDisambiguationDataModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.TrafficDisambiguationDataModel.CodingKeys>);
  uint64_t v10 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    uint64_t v11 = v9;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
    lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GeoTrafficIncident]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t GeoDataModels.TrafficDisambiguationDataModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.TrafficDisambiguationDataModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel.CodingKeys and conformance GeoDataModels.TrafficDisambiguationDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v16 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GeoTrafficIncident]);
  char v15 = 1;
  lazy protocol witness table accessor for type [GeoTrafficIncident] and conformance <A> [A](&lazy protocol witness table cache variable for type [GeoTrafficIncident] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type GeoTrafficIncident and conformance GeoTrafficIncident);
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.TrafficDisambiguationDataModel@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.TrafficDisambiguationDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.TrafficDisambiguationDataModel(void *a1)
{
  return GeoDataModels.TrafficDisambiguationDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.WhereAmIDataModel.meID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.buttonLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.localizedAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GeoDataModels.WhereAmIDataModel.currentLocation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 56);
  *(void *)a1 = *(void *)(v1 + 48);
  *(void *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 64);
  return swift_bridgeObjectRetain();
}

unint64_t GeoDataModels.WhereAmIDataModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x614C6E6F74747562;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x4C746E6572727563;
      break;
    default:
      unint64_t result = 1145660781;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  return GeoDataModels.WhereAmIDataModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.WhereAmIDataModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoDataModels.WhereAmIDataModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.WhereAmIDataModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoDataModels.WhereAmIDataModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.WhereAmIDataModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v21 = v1[3];
  uint64_t v22 = v7;
  uint64_t v8 = v1[4];
  uint64_t v19 = v1[5];
  uint64_t v20 = v8;
  uint64_t v9 = v1[6];
  uint64_t v17 = v1[7];
  uint64_t v18 = v9;
  uint64_t v10 = v1[8];
  uint64_t v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v24) = 0;
  uint64_t v12 = v23;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v12)
  {
    uint64_t v14 = v17;
    uint64_t v13 = v18;
    LOBYTE(v24) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v24) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    uint64_t v24 = v13;
    uint64_t v25 = v14;
    uint64_t v26 = v10;
    uint64_t v27 = v11;
    char v28 = 3;
    lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.WhereAmIDataModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.WhereAmIDataModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel.CodingKeys and conformance GeoDataModels.WhereAmIDataModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  LOBYTE(v30) = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  uint64_t v28 = v9;
  LOBYTE(v30) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v29 = v13;
  uint64_t v26 = v12;
  uint64_t v27 = v11;
  LOBYTE(v30) = 2;
  swift_bridgeObjectRetain();
  uint64_t v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v34 = 3;
  uint64_t v15 = v14;
  lazy protocol witness table accessor for type StandardMapData and conformance StandardMapData();
  uint64_t v25 = v15;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v18 = v30;
  uint64_t v17 = v31;
  uint64_t v19 = v32;
  uint64_t v20 = v33;
  uint64_t v21 = v27;
  swift_bridgeObjectRetain();
  uint64_t v22 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v28;
  a2[1] = v21;
  uint64_t v23 = v25;
  a2[2] = v26;
  a2[3] = v22;
  a2[4] = v24;
  a2[5] = v23;
  a2[6] = v18;
  a2[7] = v17;
  a2[8] = v19;
  a2[9] = v20;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels.WhereAmIDataModel@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GeoDataModels.WhereAmIDataModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels.WhereAmIDataModel(void *a1)
{
  return GeoDataModels.WhereAmIDataModel.encode(to:)(a1);
}

uint64_t GeoDataModels.snippetHidden(for:idiom:)()
{
  uint64_t v1 = type metadata accessor for DeviceIdiom();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2)
  {
    char v5 = 0;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F75620], v1);
    char v5 = static DeviceIdiom.== infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v5 & 1;
}

unint64_t GeoDataModels.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4C676E696B726170;
      break;
    case 3:
      unint64_t result = 0x496D416572656877;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance GeoDataModels.CodingKeys()
{
  return GeoDataModels.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoDataModels.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  return 1;
}

void protocol witness for CodingKey.init(intValue:) in conformance GeoDataModels.ContactDisambiguationCodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.ParkingLocationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.ParkingLocationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.TrafficDisambiguationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.TrafficDisambiguationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GeoDataModels.WhereAmICodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GeoDataModels.WhereAmICodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GeoDataModels.ContactDisambiguationCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GeoDataModels.WhereAmICodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GeoDataModels.WhereAmICodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GeoDataModels.encode(to:)(void *a1)
{
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.WhereAmICodingKeys>);
  uint64_t v32 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.TrafficDisambiguationCodingKeys>);
  uint64_t v29 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v28 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ParkingLocationCodingKeys>);
  uint64_t v26 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.ContactDisambiguationCodingKeys>);
  uint64_t v25 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GeoDataModels.CodingKeys>);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1[1];
  uint64_t v41 = *v1;
  uint64_t v42 = v13;
  uint64_t v43 = v1[2];
  uint64_t v14 = v1[3];
  uint64_t v39 = v1[4];
  uint64_t v40 = v14;
  uint64_t v15 = v1[5];
  uint64_t v37 = v1[6];
  uint64_t v38 = v15;
  uint64_t v16 = v1[7];
  uint64_t v35 = v1[8];
  uint64_t v36 = v16;
  uint64_t v34 = v1[9];
  uint64_t v17 = *((unsigned __int8 *)v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch(v17)
  {
    case 1:
      LOBYTE(v46) = 1;
      lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
      uint64_t v23 = v45;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v46 = v41;
      uint64_t v47 = v42;
      uint64_t v48 = v43;
      uint64_t v49 = v40;
      uint64_t v50 = v39;
      uint64_t v51 = v38;
      uint64_t v52 = v37;
      uint64_t v53 = v36;
      uint64_t v54 = v35;
      uint64_t v55 = v34;
      lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel();
      uint64_t v24 = v27;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v12, v23);
    case 2:
      LOBYTE(v46) = 2;
      lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
      uint64_t v19 = v28;
      uint64_t v18 = v45;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v46 = v41;
      uint64_t v47 = v42;
      uint64_t v48 = v43;
      lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
      uint64_t v20 = v30;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      uint64_t v21 = &v56;
      goto LABEL_5;
    case 3:
      LOBYTE(v46) = 3;
      lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
      uint64_t v19 = v31;
      uint64_t v18 = v45;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v46 = v41;
      uint64_t v47 = v42;
      uint64_t v48 = v43;
      uint64_t v49 = v40;
      uint64_t v50 = v39;
      uint64_t v51 = v38;
      uint64_t v52 = v37;
      uint64_t v53 = v36;
      uint64_t v54 = v35;
      uint64_t v55 = v34;
      lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel();
      uint64_t v20 = v33;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      uint64_t v21 = &v57;
LABEL_5:
      (*(void (**)(char *, uint64_t))(*(v21 - 32) + 8))(v19, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v12, v18);
    default:
      LOBYTE(v46) = 0;
      lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
      uint64_t v18 = v45;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v46 = v41;
      uint64_t v47 = v42;
      uint64_t v48 = v43;
      lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v12, v18);
  }
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys;
  if (!lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys);
  }
  return result;
}

uint64_t GeoDataModels.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.WhereAmICodingKeys>);
  uint64_t v57 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  unint64_t v59 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.TrafficDisambiguationCodingKeys>);
  uint64_t v56 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  unint64_t v58 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ParkingLocationCodingKeys>);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.ContactDisambiguationCodingKeys>);
  uint64_t v52 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GeoDataModels.CodingKeys>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v61 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  lazy protocol witness table accessor for type GeoDataModels.CodingKeys and conformance GeoDataModels.CodingKeys();
  uint64_t v16 = v71;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v16)
  {
LABEL_8:
    uint64_t v28 = (uint64_t)v61;
    return __swift_destroy_boxed_opaque_existential_0(v28);
  }
  uint64_t v17 = v10;
  uint64_t v49 = v8;
  uint64_t v18 = v7;
  uint64_t v19 = v58;
  uint64_t v50 = 0;
  uint64_t v21 = v59;
  uint64_t v20 = v60;
  uint64_t v71 = v12;
  uint64_t v22 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v22 + 16) != 1)
  {
    uint64_t v25 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v27 = &type metadata for GeoDataModels;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v11);
    goto LABEL_8;
  }
  char v23 = *(unsigned char *)(v22 + 32);
  switch(v23)
  {
    case 1:
      LOBYTE(v62) = 1;
      lazy protocol witness table accessor for type GeoDataModels.ParkingLocationCodingKeys and conformance GeoDataModels.ParkingLocationCodingKeys();
      uint64_t v30 = v18;
      uint64_t v31 = v50;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v31) {
        goto LABEL_7;
      }
      lazy protocol witness table accessor for type GeoDataModels.ParkingLocationDataModel and conformance GeoDataModels.ParkingLocationDataModel();
      uint64_t v32 = v55;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v11);
      uint64_t v28 = (uint64_t)v61;
      uint64_t v40 = v62;
      long long v41 = v63;
      uint64_t v42 = v64;
      uint64_t v43 = v65;
      uint64_t v44 = v66;
      uint64_t v45 = v67;
      uint64_t v46 = v68;
      uint64_t v47 = v69;
      uint64_t v48 = v70;
      break;
    case 2:
      uint64_t v55 = v22;
      LOBYTE(v62) = 2;
      lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationCodingKeys and conformance GeoDataModels.TrafficDisambiguationCodingKeys();
      uint64_t v33 = v50;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v33) {
        goto LABEL_7;
      }
      lazy protocol witness table accessor for type GeoDataModels.TrafficDisambiguationDataModel and conformance GeoDataModels.TrafficDisambiguationDataModel();
      uint64_t v34 = v53;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      uint64_t v35 = v71;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v19, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v11);
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v28 = (uint64_t)v61;
      uint64_t v40 = v62;
      long long v41 = v63;
      break;
    case 3:
      uint64_t v55 = v22;
      LOBYTE(v62) = 3;
      lazy protocol witness table accessor for type GeoDataModels.WhereAmICodingKeys and conformance GeoDataModels.WhereAmICodingKeys();
      uint64_t v36 = v50;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v36) {
        goto LABEL_7;
      }
      lazy protocol witness table accessor for type GeoDataModels.WhereAmIDataModel and conformance GeoDataModels.WhereAmIDataModel();
      uint64_t v38 = v51;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      uint64_t v39 = v71;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v21, v38);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v11);
      uint64_t v28 = (uint64_t)v61;
      uint64_t v40 = v62;
      long long v41 = v63;
      uint64_t v42 = v64;
      uint64_t v43 = v65;
      uint64_t v44 = v66;
      uint64_t v45 = v67;
      uint64_t v46 = v68;
      uint64_t v47 = v69;
      uint64_t v48 = v70;
      break;
    default:
      unint64_t v59 = (char *)*(unsigned __int8 *)(v22 + 32);
      LOBYTE(v62) = 0;
      lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationCodingKeys and conformance GeoDataModels.ContactDisambiguationCodingKeys();
      uint64_t v24 = v50;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v24) {
        goto LABEL_7;
      }
      lazy protocol witness table accessor for type GeoDataModels.ContactDisambiguationDataModel and conformance GeoDataModels.ContactDisambiguationDataModel();
      uint64_t v37 = v49;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v17, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v11);
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v28 = (uint64_t)v61;
      uint64_t v40 = v62;
      long long v41 = v63;
      char v23 = (char)v59;
      break;
  }
  *(void *)uint64_t v20 = v40;
  *(_OWORD *)(v20 + 8) = v41;
  *(void *)(v20 + 24) = v42;
  *(void *)(v20 + 32) = v43;
  *(void *)(v20 + 40) = v44;
  *(void *)(v20 + 48) = v45;
  *(void *)(v20 + 56) = v46;
  *(void *)(v20 + 64) = v47;
  *(void *)(v20 + 72) = v48;
  *(unsigned char *)(v20 + 80) = v23;
  return __swift_destroy_boxed_opaque_existential_0(v28);
}

uint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance GeoDataModels()
{
  if (one-time initialization token for bundleName != -1) {
    swift_once();
  }
  uint64_t v0 = static GeoDataModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t protocol witness for SnippetPluginModel.snippetHidden(for:idiom:) in conformance GeoDataModels()
{
  uint64_t v1 = type metadata accessor for DeviceIdiom();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2)
  {
    char v5 = 0;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F75620], v1);
    char v5 = static DeviceIdiom.== infix(_:_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v5 & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GeoDataModels@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return GeoDataModels.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GeoDataModels(void *a1)
{
  return GeoDataModels.encode(to:)(a1);
}

uint64_t destroy for GeoDataModels(uint64_t a1)
{
  return outlined consume of GeoDataModels(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80));
}

uint64_t outlined consume of GeoDataModels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result = a6;
  switch(a11)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for GeoDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  outlined copy of GeoDataModels(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for GeoDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(unsigned char *)(a2 + 80);
  outlined copy of GeoDataModels(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  outlined consume of GeoDataModels(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for GeoDataModels(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  outlined consume of GeoDataModels(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for GeoDataModels(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t destructiveInjectEnumTag for GeoDataModels(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels()
{
  return &type metadata for GeoDataModels;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.ContactDisambiguationDataModel()
{
  return &type metadata for GeoDataModels.ContactDisambiguationDataModel;
}

uint64_t destroy for GeoDataModels.ParkingLocationDataModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoDataModels.ParkingLocationDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GeoDataModels.ParkingLocationDataModel(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for GeoDataModels.ParkingLocationDataModel(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ParkingLocationDataModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.ParkingLocationDataModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.ParkingLocationDataModel()
{
  return &type metadata for GeoDataModels.ParkingLocationDataModel;
}

uint64_t destroy for GeoDataModels.ContactDisambiguationDataModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for GeoDataModels.ContactDisambiguationDataModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GeoDataModels.ContactDisambiguationDataModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for GeoDataModels.ContactDisambiguationDataModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ContactDisambiguationDataModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GeoDataModels.ContactDisambiguationDataModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GeoDataModels.TrafficDisambiguationDataModel()
{
  return &type metadata for GeoDataModels.TrafficDisambiguationDataModel;
}

uint64_t destroy for GeoDataModels.WhereAmIDataModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GeoDataModels.WhereAmIDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GeoDataModels.WhereAmIDataModel(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  return a1;
}

uint64_t assignWithTake for GeoDataModels.WhereAmIDataModel(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.WhereAmIDataModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeoDataModels.WhereAmIDataModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeoDataModels.WhereAmIDataModel()
{
  return &type metadata for GeoDataModels.WhereAmIDataModel;
}

void *type metadata accessor for GeoDataModels.CodingKeys()
{
  return &unk_2701647E8;
}

uint64_t getEnumTag for GeoDataModels.ContactDisambiguationCodingKeys()
{
  return 0;
}

void *type metadata accessor for GeoDataModels.ContactDisambiguationCodingKeys()
{
  return &unk_270164878;
}

void *type metadata accessor for GeoDataModels.ParkingLocationCodingKeys()
{
  return &unk_270164908;
}

void *type metadata accessor for GeoDataModels.TrafficDisambiguationCodingKeys()
{
  return &unk_270164998;
}

uint64_t getEnumTagSinglePayload for GeoDataModels.ContactDisambiguationCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for GeoDataModels.ContactDisambiguationCodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24FF4CBDCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for GeoDataModels.WhereAmICodingKeys()
{
  return &unk_270164A28;
}

unsigned char *storeEnumTagSinglePayload for GeoDataModels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24FF4CCE0);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void *type metadata accessor for GeoDataModels.WhereAmIDataModel.CodingKeys()
{
  return &unk_270164AB8;
}

void *type metadata accessor for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys()
{
  return &unk_270164B48;
}

void *type metadata accessor for GeoDataModels.ParkingLocationDataModel.CodingKeys()
{
  return &unk_270164BD8;
}

unsigned char *storeEnumTagSinglePayload for GeoDataModels.TrafficDisambiguationDataModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FF4CE0CLL);
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

void *type metadata accessor for GeoDataModels.ContactDisambiguationDataModel.CodingKeys()
{
  return &unk_270164C68;
}

uint64_t specialized GeoDataModels.ParkingLocationDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x614364656B726170 && a2 == 0xE900000000000072;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized GeoDataModels.ContactDisambiguationDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65546D6574737973 && a2 == 0xEA00000000007478
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized GeoDataModels.WhereAmIDataModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1145660781 && a2 == 0xE400000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024FF50B70 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4C746E6572727563 && a2 == 0xEF6E6F697461636FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t specialized GeoDataModels.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024FF50F30
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4C676E696B726170 && a2 == 0xEF6E6F697461636FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024FF50F50 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x496D416572656877 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t specialized GeoDataModels.ContactDisambiguationCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
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

uint64_t specialized GeoDataModels.WhereAmICodingKeys.stringValue.getter()
{
  return 12383;
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return MEMORY[0x270EEE100]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)MEMORY[0x270EEF3F0]();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEF410]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x270EEF460]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t AppPunchout.init(punchOutUri:bundleId:appDisplayName:)()
{
  return MEMORY[0x270F73A58]();
}

uint64_t static ImageElement.badgedImage(image:badge:)()
{
  return MEMORY[0x270F73C40]();
}

uint64_t type metadata accessor for ImageElement.ImageStyle()
{
  return MEMORY[0x270F73C70]();
}

uint64_t type metadata accessor for ImageElement.SourceType()
{
  return MEMORY[0x270F73CB8]();
}

uint64_t ImageElement.AppIcon.init(_:imageStyle:)()
{
  return MEMORY[0x270F73E68]();
}

uint64_t ImageElement.Contact.Avatar.init(contactIds:)()
{
  return MEMORY[0x270F73E98]();
}

uint64_t type metadata accessor for ImageElement.Contact.Content()
{
  return MEMORY[0x270F73EA0]();
}

uint64_t ImageElement.Contact.Monogram.init(letters:)()
{
  return MEMORY[0x270F73EB8]();
}

uint64_t ImageElement.Contact.init(_:imageStyle:)()
{
  return MEMORY[0x270F73ED0]();
}

uint64_t type metadata accessor for ImageElement()
{
  return MEMORY[0x270F73F18]();
}

uint64_t type metadata accessor for ActionProperty()
{
  return MEMORY[0x270F74130]();
}

uint64_t ActionProperty.init(_:)()
{
  return MEMORY[0x270F74150]();
}

uint64_t type metadata accessor for SeparatorStyle()
{
  return MEMORY[0x270F741F8]();
}

uint64_t static Command.directInvocation(identifier:payload:isNavigation:)()
{
  return MEMORY[0x270F755B0]();
}

uint64_t type metadata accessor for Command()
{
  return MEMORY[0x270F755C8]();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return MEMORY[0x270F729D8]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x270F729E8]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x270EFEFC8]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x270F00690]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x270F00830]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x270F00848]();
}

uint64_t EnvironmentValues.currentIdiom.getter()
{
  return MEMORY[0x270F75868]();
}

uint64_t EnvironmentValues.currentIdiom.setter()
{
  return MEMORY[0x270F75878]();
}

uint64_t EnvironmentValues.locale.getter()
{
  return MEMORY[0x270F00DC8]();
}

uint64_t EnvironmentValues.locale.setter()
{
  return MEMORY[0x270F00DD8]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t static PrimitiveButtonStyle<>.rfButton.getter()
{
  return MEMORY[0x270F75930]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E8]();
}

uint64_t static Font.title2.getter()
{
  return MEMORY[0x270F02C78]();
}

uint64_t Text.foregroundColor(_:)()
{
  return MEMORY[0x270F03000]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x270F030B0]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03258]();
}

uint64_t View.eraseToAnyView()()
{
  return MEMORY[0x270F75948]();
}

uint64_t View.buttonRole(_:)()
{
  return MEMORY[0x270F75968]();
}

uint64_t View.separators(_:isOverride:)()
{
  return MEMORY[0x270F759A8]();
}

uint64_t View.componentTapped(isNavigation:perform:)()
{
  return MEMORY[0x270F759D0]();
}

uint64_t View.mapScope(_:)()
{
  return MEMORY[0x270F081B8]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x270F03440]();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return MEMORY[0x270F035D8]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036B8]();
}

uint64_t View.privacySensitive(_:)()
{
  return MEMORY[0x270F038C0]();
}

uint64_t static Color.green.getter()
{
  return MEMORY[0x270F04490]();
}

uint64_t Label.init(title:icon:)()
{
  return MEMORY[0x270F04750]();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return MEMORY[0x270F04768]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048A8]();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return MEMORY[0x270F04C98]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x270F05080]();
}

uint64_t Namespace.wrappedValue.getter()
{
  return MEMORY[0x270F05230]();
}

uint64_t ShareLink<>.init<>(item:subject:message:onPresentationChanged:)()
{
  return MEMORY[0x270F05288]();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return MEMORY[0x270F75AD8]();
}

uint64_t SnippetPreview.init(snippetModel:content:)()
{
  return MEMORY[0x270F75AF8]();
}

uint64_t type metadata accessor for RFImageView()
{
  return MEMORY[0x270F75B18]();
}

uint64_t RFImageView.init(_:)()
{
  return MEMORY[0x270F75B40]();
}

uint64_t ActionHandler.wrappedValue.getter()
{
  return MEMORY[0x270F75B88]();
}

uint64_t ActionHandler.init()()
{
  return MEMORY[0x270F75BA0]();
}

uint64_t type metadata accessor for ActionHandler()
{
  return MEMORY[0x270F75BB0]();
}

uint64_t type metadata accessor for RFButtonStyle()
{
  return MEMORY[0x270F75C00]();
}

uint64_t ComponentStack.init(content:)()
{
  return MEMORY[0x270F75C28]();
}

uint64_t type metadata accessor for MapAspectRatio()
{
  return MEMORY[0x270F75C58]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x270F75C70]();
}

uint64_t DisambiguationView.init(title:content:)()
{
  return MEMORY[0x270F75D88]();
}

uint64_t SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)()
{
  return MEMORY[0x270F75DB0]();
}

uint64_t type metadata accessor for SimpleItemRichView()
{
  return MEMORY[0x270F75DC8]();
}

uint64_t ButtonContainerView.init(buttons:)()
{
  return MEMORY[0x270F75DF0]();
}

uint64_t type metadata accessor for ButtonContainerView()
{
  return MEMORY[0x270F75E00]();
}

uint64_t DisambiguationTitle.init(text1:thumbnail:)()
{
  return MEMORY[0x270F75E10]();
}

uint64_t type metadata accessor for DisambiguationTitle()
{
  return MEMORY[0x270F75E20]();
}

uint64_t PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)()
{
  return MEMORY[0x270F75EC0]();
}

uint64_t type metadata accessor for PrimaryHeaderRichView()
{
  return MEMORY[0x270F75ED8]();
}

uint64_t StandardActionHandler.perform(_:interactionType:)()
{
  return MEMORY[0x270F75EE8]();
}

uint64_t type metadata accessor for StandardActionHandler()
{
  return MEMORY[0x270F75EF8]();
}

uint64_t DisambiguationStandardView.init(header:content:)()
{
  return MEMORY[0x270F76078]();
}

uint64_t dispatch thunk of Context.didEndEditing()()
{
  return MEMORY[0x270F761B8]();
}

uint64_t dispatch thunk of Context.willBeginEditing()()
{
  return MEMORY[0x270F761C0]();
}

uint64_t type metadata accessor for Context()
{
  return MEMORY[0x270F76278]();
}

uint64_t MapView.init(markers:annotations:mapItemIdentifiers:polyline:aspectRatio:cameraDistance:showsUserLocation:)()
{
  return MEMORY[0x270F76288]();
}

uint64_t type metadata accessor for MapView()
{
  return MEMORY[0x270F76290]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  MEMORY[0x270F9D798](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t RFMapMarker.init(coordinate:title:image:tint:)()
{
  return MEMORY[0x270F76298]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t VRXIdiom.isWatchOS.getter()
{
  return MEMORY[0x270F76308]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x270FA13A0]();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F310]();
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

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F450]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}