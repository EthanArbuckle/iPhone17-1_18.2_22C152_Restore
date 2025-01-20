void sub_59D4(id a1, BSActionResponse *a2)
{
  NSLog(@"Scene destruction request completed with response: %@", a2);
}

NSDictionary *__cdecl sub_5A98(id a1)
{
  return (NSDictionary *)&off_CA50;
}

id sub_5EB0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRatchetState:a2];
}

void sub_6428(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_644C(uint64_t a1, char a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v11 || (a2 & 1) == 0)
  {
    v6 = [WeakRetained daemonConnection];
    v7 = [v6 xpcConnection];

    id v8 = [v7 processIdentifier];
    v9 = [v7 serviceName];
    NSLog(@"Error [%@]: Preferences [%d] failed to connect over %@", v11, v8, v9);
  }
  v10 = [WeakRetained daemonConnection];
  [v10 disconnect];
}

void sub_71B0()
{
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = [self defaultWorkspace];
  if (v0)
  {
    uint64_t v2 = v0;
    sub_82D0(v1);
    id v4 = v3;
    [v2 openSensitiveURL:v3 withOptions:0];
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

id sub_737C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = v4;
  if (a3)
  {
    NSString v8 = sub_8380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  id v9 = [objc_allocWithZone(v5) initWithStyle:a1 reuseIdentifier:v8 specifier:a4];

  return v9;
}

id sub_740C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v10 = sub_8380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:specifier:", a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_75AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  if (a3)
  {
    NSString v6 = sub_8380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithStyle:a1 reuseIdentifier:v6];

  return v7;
}

id sub_7628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v7 = sub_8380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, "initWithStyle:reuseIdentifier:", a1, v7);

  return v8;
}

id sub_77B8(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_77FC(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_7914()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_794C()
{
  uint64_t v1 = sub_7D78(&qword_12B40);
  uint64_t v17 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_82F0();
  ((void (*)(void))__chkstk_darwin)();
  sub_8370();
  ((void (*)(void))__chkstk_darwin)();
  sub_83D0();
  v16[2] = sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [v0 setSelectionStyle:0];
  sub_8360();
  sub_7DBC();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  objc_super v5 = self;
  id v6 = [v5 bundleForClass:ObjCClassFromMetadata];
  sub_82E0();
  uint64_t v7 = sub_83A0();
  v16[1] = v0;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  sub_8360();
  id v11 = [v5 bundleForClass:ObjCClassFromMetadata];
  sub_82E0();
  uint64_t v12 = sub_83A0();
  uint64_t v13 = __chkstk_darwin(v12);
  v16[-4] = v8;
  v16[-3] = v10;
  v16[-2] = v13;
  v16[-1] = v14;
  sub_7D78(&qword_12B50);
  sub_7F48(&qword_12B58, &qword_12B50);
  sub_8330();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_8340();
  v18[3] = v1;
  v18[4] = sub_7F48(&qword_12B60, &qword_12B40);
  sub_7F8C(v18);
  sub_8320();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v1);
  sub_83E0();
  return swift_release();
}

uint64_t type metadata accessor for DSSafetyCheckPlacardCell()
{
  return self;
}

uint64_t sub_7D78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_7DBC()
{
  unint64_t result = qword_12B48;
  if (!qword_12B48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_12B48);
  }
  return result;
}

uint64_t sub_7DFC()
{
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_8350();

  return swift_release();
}

uint64_t sub_7F00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7F48(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7F00(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_7F8C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_7FF0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_8000()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_12C08 = (uint64_t)result;
  return result;
}

uint64_t sub_8054()
{
  uint64_t v0 = sub_8310();
  sub_826C(v0, qword_12C18);
  sub_8168(v0, (uint64_t)qword_12C18);
  if (qword_12C00 != -1) {
    swift_once();
  }
  id v1 = (id)qword_12C08;
  return sub_8300();
}

uint64_t sub_8104()
{
  if (qword_12C10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_8310();

  return sub_8168(v0, (uint64_t)qword_12C18);
}

uint64_t sub_8168(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_81A0@<X0>(uint64_t a1@<X8>)
{
  if (qword_12C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_8310();
  uint64_t v3 = sub_8168(v2, (uint64_t)qword_12C18);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *sub_826C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_82D0(NSURL *retstr@<X8>)
{
}

uint64_t sub_82E0()
{
  return static Locale.current.getter();
}

uint64_t sub_82F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_8300()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_8310()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_8320()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_8330()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_8340()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_8350()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:graphicIconTypeIdentifier:linkAction:)();
}

uint64_t sub_8360()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_8370()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_8380()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_8390()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_83A0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_83B0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_83C0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_83D0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_83E0()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t DSUIFeatureTable()
{
  return _DSUIFeatureTable();
}

uint64_t DSUILocStringForKey()
{
  return _DSUILocStringForKey();
}

uint64_t DSUILocStringForKeyInTable()
{
  return _DSUILocStringForKeyInTable();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__fitFrame_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fitFrame:toView:");
}

id objc_msgSend__presentDTOBanner(void *a1, const char *a2, ...)
{
  return _[a1 _presentDTOBanner];
}

id objc_msgSend__removeDTOBanner(void *a1, const char *a2, ...)
{
  return _[a1 _removeDTOBanner];
}

id objc_msgSend__setInteractiveTextSelectionDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInteractiveTextSelectionDisabled:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_banner(void *a1, const char *a2, ...)
{
  return _[a1 banner];
}

id objc_msgSend_bannerWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerWithPresentingViewController:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_daemonConnection(void *a1, const char *a2, ...)
{
  return _[a1 daemonConnection];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didTapLearnMoreLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapLearnMoreLink:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_initConnection(void *a1, const char *a2, ...)
{
  return _[a1 initConnection];
}

id objc_msgSend_initWithPreferredAnimationType_callbackQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredAnimationType:callbackQueue:completion:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_nonretainedObjectValue(void *a1, const char *a2, ...)
{
  return _[a1 nonretainedObjectValue];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_ratchetState(void *a1, const char *a2, ...)
{
  return _[a1 ratchetState];
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return _[a1 rawValue];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_sendActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActions:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBanner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBanner:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDaemonConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonConnection:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailText:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRatchetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRatchetState:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSymbolTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSymbolTintColor:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnpresentedResourceDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnpresentedResourceDictionary:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldShowBioRatchetFlow(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowBioRatchetFlow];
}

id objc_msgSend_showDSObfuscationWindowForApplicationWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDSObfuscationWindowForApplicationWindow:");
}

id objc_msgSend_showlearnMoreForPresentingViewController_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showlearnMoreForPresentingViewController:withURL:");
}

id objc_msgSend_startEmergencyResetWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEmergencyResetWithPresentingViewController:");
}

id objc_msgSend_startManageSharingWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startManageSharingWithPresentingViewController:");
}

id objc_msgSend_startWithPresentingViewController_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithPresentingViewController:withURL:");
}

id objc_msgSend_stateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateWithCompletion:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 tableHeaderView];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_unpresentedResourceDictionary(void *a1, const char *a2, ...)
{
  return _[a1 unpresentedResourceDictionary];
}

id objc_msgSend_updateSharingReminders(void *a1, const char *a2, ...)
{
  return _[a1 updateSharingReminders];
}

id objc_msgSend_userOpenedSafetyCheckWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userOpenedSafetyCheckWithCompletion:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}