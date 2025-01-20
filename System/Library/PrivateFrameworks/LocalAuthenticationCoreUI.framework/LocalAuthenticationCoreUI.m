id LA_LOG_LACUIPackagedViewPlatformStateController()
{
  void *v0;
  uint64_t vars8;

  if (LA_LOG_LACUIPackagedViewPlatformStateController_once != -1) {
    dispatch_once(&LA_LOG_LACUIPackagedViewPlatformStateController_once, &__block_literal_global);
  }
  v0 = (void *)LA_LOG_LACUIPackagedViewPlatformStateController_log;
  return v0;
}

id _NSStringFromCAStateTransition(void *a1)
{
  v1 = NSString;
  id v2 = a1;
  uint64_t v3 = objc_opt_class();
  v4 = [v2 fromState];
  v5 = [v2 toState];
  v6 = [v1 stringWithFormat:@"<%@; %p; from:%@; to:%@>", v3, v2, v4, v5];

  return v6;
}

__CFString *NSStringFromLACUIAuthorizationViewMode(uint64_t a1)
{
  if (a1) {
    return @"Register";
  }
  else {
    return @"Enter";
  }
}

__CFString *NSStringFromLACUIAuthorizationViewStyle(uint64_t a1)
{
  if (a1) {
    return @"FullScreen";
  }
  else {
    return @"Sheet";
  }
}

__CFString *NSStringFromLACUIAuthenticatorServiceConfigurationRequirement(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Invalid";
  }
  else {
    return off_2653BCAC8[a1 - 1];
  }
}

__CFString *NSStringFromLACUISceneButton()
{
  return @"home";
}

void sub_255007418(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *LACUILockViewStateNameFromState(unint64_t a1)
{
  if (a1 > 2) {
    return @"Invalid";
  }
  else {
    return off_2653BCB20[a1];
  }
}

__CFString *NSStringFromLACUILockViewState(unint64_t a1)
{
  if (a1 > 2) {
    return @"Invalid";
  }
  else {
    return off_2653BCB20[a1];
  }
}

void sub_255008B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_255009D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25500B998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *CAStateNameFromLACUIFaceIDSpinnerViewState(unint64_t a1)
{
  if (a1 > 3) {
    return @"Invalid";
  }
  else {
    return off_2653BCD60[a1];
  }
}

__CFString *NSStringFromLACUIFaceIDSpinnerViewState(unint64_t a1)
{
  if (a1 > 3) {
    return @"Invalid";
  }
  else {
    return off_2653BCD80[a1];
  }
}

id LACUIImageWithIcon(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263F4B558]);
  uint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  v5 = objc_msgSend(v2, "initWithSize:scale:", 50.0, 50.0, v4);

  v6 = [v1 imageForDescriptor:v5];
  v7 = v6;
  if (v6 && ![v6 placeholder]
    || ([v1 prepareImageForDescriptor:v5],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        (v7 = (void *)v8) != 0))
  {
    id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "initWithCGImage:", objc_msgSend(v7, "CGImage"));
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F827E8]);
  }

  return v9;
}

void LACUILayerScaleDirectDescendants(void *a1, CGFloat a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [v3 sublayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (v3) {
          [v3 transform];
        }
        else {
          memset(&v10, 0, sizeof(v10));
        }
        CATransform3DScale(&v11, &v10, a2, a2, 1.0);
        [v9 setTransform:&v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void LACUILayerScaleToFitInRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v7 = a1;
  [v7 bounds];
  double v9 = a4 / v8;
  [v7 bounds];
  if (v9 >= a5 / v10) {
    double v9 = a5 / v10;
  }
  objc_msgSend(v7, "setPosition:", a4 * 0.5, a5 * 0.5);
  CATransform3DMakeScale(&v12, v9, v9, 1.0);
  CATransform3D v11 = v12;
  [v7 setTransform:&v11];
}

id LACUILayerFindSublayerWithName(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [v3 sublayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        CATransform3D v11 = [v10 name];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v17 = v10;
          goto LABEL_19;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = objc_msgSend(v3, "sublayers", 0);
  uint64_t v13 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v5);
      }
      LACUILayerFindSublayerWithName(*(void *)(*((void *)&v20 + 1) + 8 * v16), v4);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v14) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    v18 = v17;
  }
  else
  {
LABEL_17:
    v18 = 0;
  }

  return v18;
}

id LA_LOG_LACUIPackagedView()
{
  if (LA_LOG_LACUIPackagedView_once != -1) {
    dispatch_once(&LA_LOG_LACUIPackagedView_once, &__block_literal_global_45);
  }
  v0 = (void *)LA_LOG_LACUIPackagedView_log;
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t LACUIAuthContainerView.viewModel.getter()
{
  return LACUIAuthContainerView.viewModel.getter(MEMORY[0x263F18660]);
}

uint64_t LACUIAuthContainerView.$viewModel.getter()
{
  return LACUIAuthContainerView.viewModel.getter(MEMORY[0x263F18668]);
}

uint64_t LACUIAuthContainerView.viewModel.getter(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for LACUIAuthContainerViewModel();
  uint64_t v6 = lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel, (void (*)(uint64_t))type metadata accessor for LACUIAuthContainerViewModel);
  return a1(v2, v3, v4, v5, v6);
}

uint64_t LACUIAuthContainerView.init(dataSource:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = partial apply for implicit closure #1 in LACUIAuthContainerView.init(dataSource:);
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t implicit closure #1 in LACUIAuthContainerView.init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LACUIAuthState();
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v20 - v11;
  type metadata accessor for LACUIAuthContainerViewModel();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v13 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  uint64_t v15 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v12, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for LACUIAuthState);
  swift_unknownObjectRetain();
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthCountdownView((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for LACUIAuthState);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v14, v7, v4);
  uint64_t v16 = v13 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(void *)(v13 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(void *)(v16 + 8) = v20;
  swift_unknownObjectWeakAssign();
  long long v21 = xmmword_255043300;
  uint64_t v17 = type metadata accessor for TaskPriority();
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  char v24 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v13;
  outlined init with take of LACUIAuthAction((uint64_t)&v21, (uint64_t)(v18 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:), (uint64_t)v18);
  swift_unknownObjectRelease();
  swift_release();
  return v13;
}

uint64_t sub_25500E14C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for implicit closure #1 in LACUIAuthContainerView.init(dataSource:)()
{
  return implicit closure #1 in LACUIAuthContainerView.init(dataSource:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t LACUIAuthContainerView.init(viewModel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = partial apply for implicit closure #1 in LACUIAuthContainerView.init(viewModel:);
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

uint64_t partial apply for implicit closure #1 in LACUIAuthContainerView.init(viewModel:)()
{
  return swift_retain();
}

uint64_t LACUIAuthContainerView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = type metadata accessor for LACUIAuthCountdownView();
  MEMORY[0x270FA5388](v26);
  uint64_t v23 = (uint64_t *)((char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v21 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v22 = (uint64_t)&v21 - v6;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<EmptyView, LACUIAuthCountdownView>.Storage);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LACUIAuthState();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  type metadata accessor for LACUIAuthContainerViewModel();
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel, (void (*)(uint64_t))type metadata accessor for LACUIAuthContainerViewModel);
  uint64_t v12 = StateObject.wrappedValue.getter();
  uint64_t v13 = outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  (*(void (**)(uint64_t))(*(void *)v12 + 96))(v13);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
  {
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView);
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    uint64_t v15 = v22;
    outlined init with take of LACUIAuthCountdownConfiguration((uint64_t)v11, v22);
    uint64_t v16 = v21;
    outlined init with copy of LACUIAuthCountdownConfiguration(v15, v21, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
    uint64_t v17 = StateObject.wrappedValue.getter();
    outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
    type metadata accessor for LACUIAuthCountdownViewModel();
    swift_allocObject();
    LACUIAuthCountdownViewModel.init(configuration:handler:)(v16, v17, (uint64_t)&protocol witness table for LACUIAuthContainerViewModel);
    uint64_t KeyPath = swift_getKeyPath();
    v19 = v23;
    *(uint64_t *)((char *)v23 + *(int *)(v26 + 20)) = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel);
    uint64_t *v19 = ObservedObject.init(wrappedValue:)();
    v19[1] = v20;
    outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v19, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView);
    _ConditionalContent<>.init(storage:)();
    outlined destroy of LACUIAuthCountdownView((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    return outlined destroy of LACUIAuthCountdownView(v15, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  }
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

uint64_t outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage()
{
  return swift_retain();
}

uint64_t outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage()
{
  return swift_release();
}

uint64_t outlined init with take of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance LACUIAuthContainerView()
{
  return MEMORY[0x270F032C0]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance LACUIAuthContainerView()
{
  return MEMORY[0x270F032D0]();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance LACUIAuthContainerView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t default argument 0 of View.embedInScrollView(fillAvailableSpace:)()
{
  return 1;
}

uint64_t key path getter for EnvironmentValues.colorScheme : EnvironmentValues()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t key path setter for EnvironmentValues.colorScheme : EnvironmentValues(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthContainerView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for LACUIAuthContainerView()
{
  return outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthContainerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LACUIAuthContainerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LACUIAuthContainerView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthContainerView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LACUIAuthContainerView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for LACUIAuthContainerView()
{
  return &type metadata for LACUIAuthContainerView;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<EmptyView, LACUIAuthCountdownView>);
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>);
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

void type metadata accessor for LACUserInterfaceRequestIdentifier(uint64_t a1)
{
}

void type metadata accessor for LACBiometryType(uint64_t a1)
{
}

void type metadata accessor for LACUIFaceIDSpinnerState(uint64_t a1)
{
}

void type metadata accessor for LACUILockViewState(uint64_t a1)
{
}

void type metadata accessor for LACUserInterfaceRequestIdentifier(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance LACBiometryType()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance LACBiometryType(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x25A2849D0](a1, &v6);
  uint64_t v4 = v6;
  char v5 = v7;
  if (v7) {
    uint64_t v4 = 0;
  }
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance LACBiometryType(uint64_t a1, uint64_t a2)
{
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance LACBiometryType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance LACBiometryType@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LACBiometryType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance LACBiometryType()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, type metadata accessor for LACBiometryType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, type metadata accessor for LACBiometryType);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LACBiometryType()
{
  return MEMORY[0x270F9E010](*v0);
}

void protocol witness for Hashable.hash(into:) in conformance LACBiometryType()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LACBiometryType(uint64_t a1)
{
  return MEMORY[0x270F9FC40](a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACBiometryType(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t base witness table accessor for Equatable in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, type metadata accessor for LACBiometryType);
}

uint64_t outlined init with copy of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of LACUIAuthCountdownView(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25500EFC8()
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + 48) >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t outlined init with take of LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void LACUIAuthCountdownViewModel.handler.setter()
{
}

uint64_t static LACUIDTOUtilities.dtoLearnMoreLinkURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  }
  __break(1u);
  return result;
}

LACUIDTOUtilities __swiftcall LACUIDTOUtilities.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (LACUIDTOUtilities)objc_msgSend(v0, sel_init);
}

id LACUIDTOUtilities.init()()
{
  v1.super_class = (Class)LACUIDTOUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for LACUIDTOUtilities()
{
  unint64_t result = lazy cache variable for type metadata for LACUIDTOUtilities;
  if (!lazy cache variable for type metadata for LACUIDTOUtilities)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACUIDTOUtilities);
  }
  return result;
}

uint64_t dispatch thunk of LACUIAuthDataSource.nextState(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return v13(a1, a2, a3, a4, a5);
}

LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle_optional __swiftcall LACUIRatchetViewModelPresentationStyle.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  char *v1 = v2;
  return (LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle_optional)rawValue;
}

uint64_t LACUIRatchetViewModelPresentationStyle.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t lazy protocol witness table accessor for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle;
  if (!lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LACUIRatchetViewModelPresentationStyle()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LACUIRatchetViewModelPresentationStyle()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LACUIRatchetViewModelPresentationStyle()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance LACUIRatchetViewModelPresentationStyle@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LACUIRatchetViewModelPresentationStyle(void *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LACUIRatchetViewModelPresentationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25500F9E0);
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

uint64_t getEnumTag for LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for LACUIRatchetViewModelPresentationStyle(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LACUIRatchetViewModelPresentationStyle()
{
  return &type metadata for LACUIRatchetViewModelPresentationStyle;
}

uint64_t specialized static LACUIAuthImageConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (a1[2])
  {
    if (a2[2])
    {
      if (v2 != v4 || v3 != v5)
      {
LABEL_15:
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
        goto LABEL_17;
      }
LABEL_16:
      char v7 = 1;
      goto LABEL_17;
    }
  }
  else if ((a2[2] & 1) == 0)
  {
    if (v2 != v4 || v3 != v5) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  char v7 = 0;
LABEL_17:
  outlined copy of LACUIAuthImageConfiguration();
  outlined copy of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  return v7 & 1;
}

uint64_t outlined copy of LACUIAuthImageConfiguration()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LACUIAuthImageConfiguration()
{
  return outlined consume of LACUIAuthImageConfiguration();
}

uint64_t outlined consume of LACUIAuthImageConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthImageConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LACUIAuthImageConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of LACUIAuthImageConfiguration();
  return a1;
}

uint64_t assignWithTake for LACUIAuthImageConfiguration(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of LACUIAuthImageConfiguration();
  return a1;
}

uint64_t getEnumTag for LACUIAuthImageConfiguration(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for LACUIAuthImageConfiguration(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthImageConfiguration()
{
  return &type metadata for LACUIAuthImageConfiguration;
}

uint64_t static Color.sheetBackground(for:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F18508])
  {
    id v7 = objc_msgSend(self, sel_systemBackgroundColor);
  }
  else
  {
    int v8 = v6;
    int v9 = *MEMORY[0x263F184F8];
    uint64_t v10 = self;
    if (v8 != v9)
    {
      uint64_t v11 = MEMORY[0x25A284760](objc_msgSend(v10, sel_systemBackgroundColor));
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return v11;
    }
    id v7 = objc_msgSend(v10, sel_secondarySystemBackgroundColor);
  }
  return MEMORY[0x25A284760](v7);
}

void static Color.systemBackground.getter()
{
}

void static Color.secondarySystemBackground.getter()
{
}

void static Color.systemBackground.getter(SEL *a1)
{
  id v1 = [self *a1];
  JUMPOUT(0x25A284760);
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init(biometryType:alertFactory:)(uint64_t a1, uint64_t a2)
{
  char v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType] = a1;
  *(void *)&v5[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType] = a1;
  *(void *)&v2[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler()
{
  return self;
}

Swift::Bool __swiftcall LACUIDTOBiometryRequiredScenePresentationHandler.canHandle(request:)(LACUIScenePresentationRequest request)
{
  id v1 = [(objc_class *)request.super.isa userInterfaceRequest];
  unsigned int v2 = objc_msgSend(v1, sel_identifier);

  return v2 == 5;
}

Swift::Void __swiftcall LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(LACUIScenePresentationRequest request, LACUIScenePresentationContext inContext)
{
}

uint64_t closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(void *a1)
{
  objc_msgSend(objc_msgSend(a1, sel_presenter), sel_dismiss);
  return swift_unknownObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void LACUIDTOBiometryRequiredScenePresentationHandler.init()()
{
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(void *a1)
{
  uint64_t v3 = type metadata accessor for LACLogger();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  int v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType);
  id v8 = objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory), sel_biometryRequiredAlertWithBiometryType_, v7);
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a1;
    uint64_t v22 = partial apply for closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:);
    uint64_t v23 = v10;
    aBlock._countAndFlagsBits = MEMORY[0x263EF8330];
    aBlock._object = (void *)1107296256;
    uint64_t v20 = thunk for @escaping @callee_guaranteed () -> ();
    uint64_t v21 = &block_descriptor_0;
    uint64_t v11 = _Block_copy(&aBlock);
    id v12 = a1;
    swift_release();
    objc_msgSend(v9, sel_setOnDismiss_, v11);
    _Block_release(v11);
    id v13 = objc_msgSend(v12, sel_presenter);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v9;
    uint64_t v22 = partial apply for closure #2 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:);
    uint64_t v23 = v14;
    aBlock._countAndFlagsBits = MEMORY[0x263EF8330];
    aBlock._object = (void *)1107296256;
    uint64_t v20 = thunk for @escaping @callee_guaranteed () -> ();
    uint64_t v21 = &block_descriptor_9;
    uint64_t v15 = _Block_copy(&aBlock);
    id v16 = v9;
    swift_release();
    objc_msgSend(v13, sel_present_animated_completion_, v16, 1, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();
  }
  else
  {
    static LACLogger.ui.getter();
    aBlock._countAndFlagsBits = 0;
    aBlock._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease();
    aBlock._countAndFlagsBits = 0xD000000000000025;
    aBlock._object = (void *)0x8000000255045900;
    uint64_t v24 = v7;
    v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    LACLogger.error(_:)(aBlock);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    objc_msgSend(objc_msgSend(a1, sel_presenter), sel_dismiss);
    swift_unknownObjectRelease();
  }
}

uint64_t method lookup function for LACUIDTOBiometryRequiredScenePresentationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIDTOBiometryRequiredScenePresentationHandler);
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init(biometryType:alertFactory:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.canHandle(request:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_2550105C0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  return closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(*(void **)(v0 + 16));
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

id partial apply for closure #2 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_shake);
}

uint64_t Image.init(with:)(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16))
  {
    return Image.init(systemName:)();
  }
  else
  {
    uint64_t v2 = one-time initialization token for current;
    swift_bridgeObjectRetain();
    if (v2 != -1) {
      swift_once();
    }
    id v3 = (id)static NSBundle.current;
    uint64_t v4 = Image.init(_:bundle:)();
    outlined consume of LACUIAuthImageConfiguration();
    return v4;
  }
}

uint64_t NSBundle.Sentinel.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id one-time initialization function for current()
{
  type metadata accessor for NSBundle.Sentinel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for NSBundle.Sentinel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for NSBundle.Sentinel()
{
  return self;
}

{
  return self;
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.viewModel.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUIFaceIDSpinnerView_SwiftUI.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.$viewModel.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for LACUIFaceIDSpinnerViewModel();
  unint64_t v4 = lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel();
  return MEMORY[0x270EFFB88](v1, v2, v3, v4);
}

unint64_t lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel)
  {
    type metadata accessor for LACUIFaceIDSpinnerViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel);
  }
  return result;
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUIFaceIDSpinnerViewModel();
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel();
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void LACUIFaceIDSpinnerView_SwiftUI.updateUIView<A>(_:context:)(void *a1)
{
}

void LACUIFaceIDSpinnerView_SwiftUI.updateView<A>(_:context:)(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    int v6 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 88);
    id v9 = a1;
    uint64_t v7 = swift_retain();
    uint64_t v8 = v6(v7);
    swift_release();
    objc_msgSend(v5, sel_setState_, v8);
  }
}

id LACUIFaceIDSpinnerView_SwiftUI.makeUIView(context:)()
{
  id v0 = objc_allocWithZone((Class)LACUIFaceIDSpinnerView);
  return objc_msgSend(v0, sel_init);
}

unint64_t instantiation function for generic protocol witness table for LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI);
  }
  return result;
}

id protocol witness for UIViewRepresentable.makeUIView(context:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  id v0 = objc_allocWithZone((Class)LACUIFaceIDSpinnerView);
  return objc_msgSend(v0, sel_init);
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance LACUIFaceIDSpinnerView_SwiftUI(void *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)(v1 + 8) + 88);
  id v5 = a1;
  uint64_t v3 = swift_retain();
  uint64_t v4 = v2(v3);
  swift_release();
  objc_msgSend(v5, sel_setState_, v4);
}

uint64_t protocol witness for UIViewRepresentable._resetUIView(_:coordinator:destroy:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F016E0]();
}

uint64_t protocol witness for static UIViewRepresentable.dismantleUIView(_:coordinator:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F016F8]();
}

uint64_t protocol witness for UIViewRepresentable.makeCoordinator() in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01790]();
}

uint64_t protocol witness for UIViewRepresentable._identifiedViewTree(in:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01738]();
}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t protocol witness for UIViewRepresentable._overrideSizeThatFits(_:in:uiView:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01758]();
}

uint64_t protocol witness for UIViewRepresentable._overrideLayoutTraits(_:for:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01748]();
}

uint64_t protocol witness for static UIViewRepresentable._modifyBridgedViewInputs(_:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01768]();
}

uint64_t protocol witness for static UIViewRepresentable._layoutOptions(_:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x270F01728]();
}

uint64_t associated type witness table accessor for View.Body : View in LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x263F1BB58];
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void protocol witness for View.body.getter in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
}

uint64_t sub_255010D14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_255010D20(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = v3;
  return result;
}

void *initializeBufferWithCopyOfBuffer for LACUIFaceIDSpinnerView_SwiftUI(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for LACUIFaceIDSpinnerView_SwiftUI()
{
  return swift_release();
}

void *assignWithCopy for LACUIFaceIDSpinnerView_SwiftUI(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for LACUIFaceIDSpinnerView_SwiftUI(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LACUIFaceIDSpinnerView_SwiftUI(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for LACUIFaceIDSpinnerView_SwiftUI()
{
  return &type metadata for LACUIFaceIDSpinnerView_SwiftUI;
}

uint64_t LACUIAuthCountdownViewModel.__allocating_init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  LACUIAuthCountdownViewModel.init(configuration:handler:)(a1, a2, a3);
  return v6;
}

uint64_t LACUIAuthCountdownViewModel.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of LACUIAuthCountdownConfiguration(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, a1);
}

uint64_t LACUIAuthCountdownViewModel.delayExpiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  uint64_t v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v6 + *(int *)(v7 + 28), (uint64_t)v5);
  uint64_t v8 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v5, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    uint64_t v9 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    uint64_t v11 = &v5[*(int *)(v8 + 20)];
    uint64_t v12 = type metadata accessor for Date();
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(a1, v11, v12);
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(a1, 0, 1, v12);
  }
}

uint64_t LACUIAuthCountdownViewModel.init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v20 - v14;
  *(void *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer) = 0;
  outlined init with copy of LACUIAuthCountdownConfiguration(a1, v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration);
  *(void *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler + 8) = a3;
  uint64_t v16 = swift_unknownObjectWeakAssign();
  (*(void (**)(uint64_t))(*(void *)v3 + 104))(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    swift_unknownObjectRelease();
    outlined destroy of LACUIAuthCountdownDelayConfiguration(a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    static Date.now.getter();
    char v17 = static Date.> infix(_:_:)();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
    v18(v13, v9);
    if (v17) {
      LACUIAuthCountdownViewModel.scheduleDelayTimer()();
    }
    swift_unknownObjectRelease();
    outlined destroy of LACUIAuthCountdownDelayConfiguration(a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    v18(v15, v9);
  }
  return v3;
}

uint64_t outlined init with copy of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  uint64_t v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer;
  unint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    uint64_t v3 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = 0;
  }
  uint64_t v4 = self;
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  v9[4] = partial apply for closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer();
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ();
  v9[3] = &block_descriptor_1;
  uint64_t v6 = _Block_copy(v9);
  swift_release();
  id v7 = objc_msgSend(v4, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v6, 0.5);
  _Block_release(v6);
  uint64_t v8 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = v7;
}

Swift::Void __swiftcall LACUIAuthCountdownViewModel.tappedOnButton(_:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *a1)
{
  uint64_t countAndFlagsBits = a1->id._countAndFlagsBits;
  object = a1->id._object;
  uint64_t v5 = a1->title._countAndFlagsBits;
  uint64_t v4 = a1->title._object;
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle style = a1->style;
  uint64_t v7 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler;
  if (MEMORY[0x25A2854F0](v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler))
  {
    uint64_t v8 = *(void *)(v7 + 8);
    uint64_t ObjectType = swift_getObjectType();
    v11[0] = countAndFlagsBits;
    v11[1] = object;
    v11[2] = v5;
    v11[3] = v4;
    LocalAuthenticationCoreUI::LACUIAuthButtonStyle v12 = style;
    uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v11, ObjectType, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t LACUIAuthCountdownViewModel.deinit()
{
  outlined destroy of LACUIAuthCountdownDelayConfiguration(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler);

  return v0;
}

uint64_t outlined destroy of weak LACUIAuthCountdownViewModelHandler?(uint64_t a1)
{
  return a1;
}

uint64_t LACUIAuthCountdownViewModel.__deallocating_deinit()
{
  outlined destroy of LACUIAuthCountdownDelayConfiguration(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler);

  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in LACUIAuthCountdownViewModel()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIAuthCountdownViewModel@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUIAuthCountdownViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModelHandler.handle(action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t ObjC metadata update function for LACUIAuthCountdownViewModel()
{
  return type metadata accessor for LACUIAuthCountdownViewModel();
}

uint64_t type metadata accessor for LACUIAuthCountdownViewModel()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthCountdownViewModel;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownViewModel()
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for LACUIAuthCountdownViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIAuthCountdownViewModel);
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.delayExpiration.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.__allocating_init(configuration:handler:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.tappedOnButton(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_255011A08()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v21 - v8;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v2, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(uint64_t))(*(void *)Strong + 104))(Strong);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v2, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
  static Date.now.getter();
  char v11 = static Date.< infix(_:_:)();
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  if (v11)
  {
    swift_beginAccess();
    uint64_t v13 = swift_weakLoadStrong();
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer;
      objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer), sel_invalidate);
      uint64_t v16 = *(void **)(v14 + v15);
      *(void *)(v14 + v15) = 0;

      uint64_t v17 = v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler;
      if (MEMORY[0x25A2854F0](v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler))
      {
        uint64_t v18 = *(void *)(v17 + 8);
        uint64_t ObjectType = swift_getObjectType();
        char v22 = 0;
        memset(v21, 0, sizeof(v21));
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v18 + 8))(v21, ObjectType, v18);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v12)(v9, v3);
}

uint64_t partial apply for closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  return closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()();
}

void thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

uint64_t LACUIAuthCountdownDelayView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of LACUIAuthCountdownDelayConfiguration(v1, a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
}

uint64_t LACUIAuthCountdownDelayView.expirationRange.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (lower: Date, upper: Date));
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  v40 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Date>);
  MEMORY[0x270FA5388](v8);
  v41 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  char v11 = *(void **)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  static Date.now.getter();
  char v18 = static Date.> infix(_:_:)();
  v38 = (void (*)(char *, uint64_t))v11[1];
  v39 = v11 + 1;
  v38(v16, v10);
  static Date.now.getter();
  uint64_t v42 = a1;
  uint64_t v36 = v3;
  uint64_t v37 = v8;
  if (v18)
  {
    v35 = (void (*)(char *, uint64_t, uint64_t))v11[2];
    v35(v14, v17, v10);
    lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
    uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if (result)
    {
      uint64_t v20 = &v7[*(int *)(v3 + 48)];
      uint64_t v21 = (void (*)(char *, char *, uint64_t))v11[4];
      v21(v7, v16, v10);
      v34 = v20;
      v21(v20, v14, v10);
      char v22 = v40;
      uint64_t v23 = &v40[*(int *)(v3 + 48)];
      uint64_t v24 = (void (*)(char *, char *, uint64_t))v35;
      v35(v40, (uint64_t)v7, v10);
      v24(v23, v20, v10);
      uint64_t v25 = (uint64_t)v41;
      v21(v41, v22, v10);
      uint64_t v26 = v38;
      v38(v23, v10);
      long long v27 = &v22[*(int *)(v36 + 48)];
      v21(v22, v7, v10);
      v21(v27, v34, v10);
      v21((char *)(v25 + *(int *)(v37 + 36)), v27, v10);
LABEL_6:
      v26(v22, v10);
      return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v25, v42, &demangling cache variable for type metadata for Range<Date>);
    }
    __break(1u);
  }
  else
  {
    static Date.now.getter();
    lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
    uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if (result)
    {
      v28 = &v7[*(int *)(v3 + 48)];
      v29 = (void (*)(char *, char *, uint64_t))v11[4];
      v29(v7, v16, v10);
      v29(v28, v14, v10);
      char v22 = v40;
      uint64_t v30 = &v40[*(int *)(v3 + 48)];
      v31 = (void (*)(char *, char *, uint64_t))v11[2];
      v31(v40, v7, v10);
      v31(v30, v28, v10);
      uint64_t v25 = (uint64_t)v41;
      v29(v41, v22, v10);
      uint64_t v26 = v38;
      v38(v30, v10);
      v32 = &v22[*(int *)(v36 + 48)];
      v29(v22, v7, v10);
      v29(v32, v28, v10);
      v29((char *)(v25 + *(int *)(v37 + 36)), v32, v10);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>);
  return closure #1 in LACUIAuthCountdownDelayView.body.getter(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v77 = a1;
  v83 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v81 = *(void *)(v3 - 8);
  uint64_t v82 = v3;
  MEMORY[0x270FA5388](v3);
  v80 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = type metadata accessor for RoundedRectangle() - 8;
  MEMORY[0x270FA5388](v79);
  v78 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LACUIAuthCountdownDelayView();
  uint64_t v73 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v73 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>)
      - 8;
  MEMORY[0x270FA5388](v74);
  uint64_t v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>);
  MEMORY[0x270FA5388](v76);
  uint64_t v75 = (uint64_t)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.accessibilityElement(children:)>>.0);
  uint64_t v86 = *(void *)(v23 - 8);
  uint64_t v87 = v23;
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  v85 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v84 = (char *)&v72 - v26;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration(a1, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
  unint64_t v27 = (*(unsigned __int8 *)(v73 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
  uint64_t v28 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)v8, v28 + v27, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  *((void *)v12 + 2) = partial apply for closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter;
  *((void *)v12 + 3) = v28;
  v29 = (uint64_t *)&v12[*(int *)(v10 + 48)];
  uint64_t *v29 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  static Alignment.center.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, 0.0, 1);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  LOBYTE(v12) = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v15, (uint64_t)v19, &demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  uint64_t v30 = &v19[*(int *)(v17 + 44)];
  *uint64_t v30 = (char)v12;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  id v31 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  uint64_t v32 = MEMORY[0x25A284760](v31);
  uint64_t v33 = v78;
  v34 = &v78[*(int *)(v79 + 28)];
  uint64_t v35 = *MEMORY[0x263F19860];
  uint64_t v36 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v34, v35, v36);
  __asm { FMOV            V0.2D, #8.0 }
  *uint64_t v33 = _Q0;
  uint64_t v42 = (uint64_t)v33;
  v43 = (uint64_t *)&v21[*(int *)(v74 + 44)];
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<Color, RoundedRectangle>);
  outlined init with copy of LACUIAuthCountdownDelayConfiguration(v42, (uint64_t)v43 + *(int *)(v44 + 52), MEMORY[0x263F19048]);
  uint64_t *v43 = v32;
  *(_WORD *)((char *)v43 + *(int *)(v44 + 56)) = 256;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v19, (uint64_t)v21, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  outlined destroy of RoundedRectangle(v42);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v19, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  LOBYTE(v32) = static Edge.Set.horizontal.getter();
  uint64_t v45 = v75;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v21, v75, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
  uint64_t v46 = v45 + *(int *)(v76 + 36);
  *(unsigned char *)uint64_t v46 = v32;
  *(_OWORD *)(v46 + 8) = 0u;
  *(_OWORD *)(v46 + 24) = 0u;
  *(unsigned char *)(v46 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v21, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
  v47 = v80;
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  v48 = v85;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v47, v82);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v45, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>);
  (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v84, v48, v87);
  if (*(void *)(v77 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24) + 8))
  {
    uint64_t v82 = static VerticalAlignment.center.getter();
    swift_bridgeObjectRetain();
    static Font.footnote.getter();
    uint64_t v49 = Text.font(_:)();
    uint64_t v51 = v50;
    char v53 = v52;
    swift_bridgeObjectRelease();
    swift_release();
    char v54 = v53 & 1;
    v121[0] = static HierarchicalShapeStyle.secondary.getter();
    uint64_t v55 = Text.foregroundStyle<A>(_:)();
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    char v61 = v60 & 1;
    outlined consume of Text.Storage(v49, v51, v54);
    swift_bridgeObjectRelease();
    outlined copy of Text.Storage(v55, v57, v61);
    swift_bridgeObjectRetain();
    outlined consume of Text.Storage(v55, v57, v61);
    swift_bridgeObjectRelease();
    LOBYTE(v49) = static Edge.Set.horizontal.getter();
    char v62 = static Edge.Set.horizontal.getter();
    char v96 = 1;
    char v95 = v61;
    char v94 = 1;
    char v91 = 1;
    char v88 = 1;
    v99[0] = v82;
    v99[1] = 0;
    char v100 = 1;
    *(_DWORD *)v101 = *(_DWORD *)v98;
    *(_DWORD *)&v101[3] = *(_DWORD *)&v98[3];
    uint64_t v102 = v55;
    uint64_t v103 = v57;
    char v104 = v61;
    *(_DWORD *)&v105[3] = *(_DWORD *)&v97[3];
    *(_DWORD *)v105 = *(_DWORD *)v97;
    uint64_t v106 = v59;
    uint64_t v107 = 0;
    char v108 = 1;
    *(_DWORD *)v109 = *(_DWORD *)v93;
    *(_DWORD *)&v109[3] = *(_DWORD *)&v93[3];
    char v110 = v49;
    *(_DWORD *)&v111[3] = *(_DWORD *)&v92[3];
    *(_DWORD *)v111 = *(_DWORD *)v92;
    long long v112 = 0u;
    long long v113 = 0u;
    char v114 = 1;
    *(_DWORD *)v115 = *(_DWORD *)v90;
    *(_DWORD *)&v115[3] = *(_DWORD *)&v90[3];
    char v116 = v62;
    *(_DWORD *)v117 = *(_DWORD *)v89;
    *(_DWORD *)&v117[3] = *(_DWORD *)&v89[3];
    long long v118 = 0u;
    long long v119 = 0u;
    char v120 = 1;
    destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle(v99);
  }
  else
  {
    _s7SwiftUI15ModifiedContentVyACyAA6HStackVyAA9TupleViewVyAA4TextV_AA6SpacerVtGGAA14_PaddingLayoutVGAOGSgWOi0_((uint64_t)v99);
  }
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v99, (uint64_t)v121, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v64 = v85;
  uint64_t v63 = v86;
  v65 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
  v66 = v84;
  uint64_t v67 = v87;
  v65(v85, v84, v87);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v121, (uint64_t)v97, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v68 = v83;
  v65(v83, v64, v67);
  uint64_t v69 = (uint64_t)&v68[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?))
                             + 48)];
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v97, (uint64_t)v98, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v98, v69, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v98, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined copy of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v70 = *(void (**)(char *, uint64_t))(v63 + 8);
  v70(v66, v67);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v97, (uint64_t)v99, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v99, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  return ((uint64_t (*)(char *, uint64_t))v70)(v64, v67);
}

uint64_t closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayView();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v43 = *(void *)(v45 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v41 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v37 - v11;
  uint64_t v40 = type metadata accessor for PeriodicTimelineSchedule();
  uint64_t v48 = *(void *)(v40 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v40);
  v39 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v37 = (char *)&v37 - v15;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>);
  uint64_t v16 = *(void *)(v38 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v38);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v42 = (char *)&v37 - v20;
  uint64_t v21 = a1[1];
  uint64_t v47 = *a1;
  uint64_t v44 = v21;
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Date.now.getter();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v22 = v37;
  PeriodicTimelineSchedule.init(from:by:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  uint64_t v23 = v41;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration((uint64_t)a1, v41, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
  unint64_t v24 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v25 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v23, v25 + v24, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
  uint64_t v26 = v40;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v39, v22, v40);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = partial apply for closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter;
  *(void *)(v27 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule, MEMORY[0x263F1A108]);
  lazy protocol witness table accessor for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>();
  TimelineView<>.init(_:content:)();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v22, v26);
  uint64_t v28 = v42;
  uint64_t v29 = v38;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v42, v19, v38);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v30(v19, v28, v29);
  uint64_t v32 = KeyPath;
  uint64_t v31 = v47;
  uint64_t v33 = v44;
  *(void *)a2 = v47;
  *(void *)(a2 + 8) = v33;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a2 + 32) = v32;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 56) = 1;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>));
  v30((char *)(a2 + *(int *)(v34 + 64)), v19, v29);
  outlined copy of Text.Storage(v31, v33, 0);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v16 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v35(v28, v29);
  v35(v19, v29);
  outlined consume of Text.Storage(v31, v33, 0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AccessibilityTraits();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v64 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for Date.ComponentsFormatStyle.Style();
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v56 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date.ComponentsFormatStyle();
  uint64_t v61 = *(void *)(v8 - 8);
  uint64_t v62 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Date>);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v55 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Duration.TimeFormatStyle.Pattern();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Duration.TimeFormatStyle();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v59 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v63 = a1;
  uint64_t result = Date.timeIntervalSinceNow.getter();
  if (v23 < 0.0) {
    double v23 = 0.0;
  }
  if ((~*(void *)&v23 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v23 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v23 < 9.22337204e18)
  {
    Duration.init(secondsComponent:attosecondsComponent:)();
    uint64_t v54 = a2;
    static Duration.TimeFormatStyle.Pattern.minuteSecond.getter();
    static FormatStyle<>.time(pattern:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type Duration.TimeFormatStyle and conformance Duration.TimeFormatStyle, MEMORY[0x263F07E80]);
    Duration.formatted<A>(_:)();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    uint64_t v69 = v65;
    uint64_t v70 = v66;
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v24 = Text.init<A>(_:)();
    uint64_t v26 = v25;
    char v28 = v27 & 1;
    uint64_t v29 = Text.monospacedDigit()();
    uint64_t v53 = v4;
    uint64_t v31 = v30;
    uint64_t v52 = v5;
    char v33 = v32 & 1;
    outlined consume of Text.Storage(v24, v26, v28);
    swift_bridgeObjectRelease();
    LODWORD(v65) = static HierarchicalShapeStyle.secondary.getter();
    uint64_t v34 = Text.foregroundStyle<A>(_:)();
    uint64_t v36 = v35;
    char v38 = v37 & 1;
    outlined consume of Text.Storage(v29, v31, v33);
    swift_bridgeObjectRelease();
    uint64_t v39 = v55;
    LACUIAuthCountdownDelayView.expirationRange.getter(v55);
    uint64_t v40 = v56;
    static Date.ComponentsFormatStyle.Style.wide.getter();
    uint64_t v41 = v57;
    static FormatStyle<>.components(style:fields:)();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v40, v60);
    lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type Date.ComponentsFormatStyle and conformance Date.ComponentsFormatStyle, MEMORY[0x263F07408]);
    uint64_t v42 = v62;
    Range<>.formatted<A>(_:)();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v41, v42);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v39, &demangling cache variable for type metadata for Range<Date>);
    uint64_t v69 = v65;
    uint64_t v70 = v66;
    uint64_t v43 = Text.accessibilityLabel<A>(_:)();
    uint64_t v45 = v44;
    LOBYTE(v41) = v46;
    uint64_t v48 = v47;
    outlined consume of Text.Storage(v34, v36, v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v65 = v43;
    uint64_t v66 = v45;
    char v67 = v41 & 1;
    uint64_t v68 = v48;
    uint64_t v49 = v64;
    static AccessibilityTraits.updatesFrequently.getter();
    uint64_t v50 = (uint64_t)v59;
    View.accessibilityAddTraits(_:)();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v53);
    outlined consume of Text.Storage(v65, v66, v67);
    swift_bridgeObjectRelease();
    return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v50, v54, &demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t LACUIAuthCountdownDelayView.init(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return outlined init with take of LACUIAuthCountdownDelayConfiguration(a1, a2, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownDelayView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for View.body.getter in conformance LACUIAuthCountdownDelayView@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>);
  return closure #1 in LACUIAuthCountdownDelayView.body.getter(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownDelayView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(v4 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(v6 + 24);
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownDelayView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  uint64_t v3 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LACUIAuthCountdownDelayView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v6 = *(int *)(v5 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(v5 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LACUIAuthCountdownDelayView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = *(int *)(v4 + 24);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownDelayView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v5 = *(int *)(v4 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + *(int *)(v4 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 24));
  return a1;
}

void *assignWithTake for LACUIAuthCountdownDelayView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v6 = *(int *)(v5 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(v5 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownDelayView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255013F00);
}

uint64_t sub_255013F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownDelayView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255013F80);
}

uint64_t sub_255013F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LACUIAuthCountdownDelayView()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthCountdownDelayView;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownDelayView) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownDelayView()
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2550140C8()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>);
}

uint64_t outlined init with take of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8);
  uint64_t v4 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  return closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter(v4, a1);
}

uint64_t outlined init with copy of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of RoundedRectangle(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _InsettableBackgroundShapeModifier<Color, RoundedRectangle> and conformance _InsettableBackgroundShapeModifier<A, B>, &demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<Color, RoundedRectangle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(unint64_t *a1, uint64_t *a2)
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

double _s7SwiftUI15ModifiedContentVyACyAA6HStackVyAA9TupleViewVyAA4TextV_AA6SpacerVtGGAA14_PaddingLayoutVGAOGSgWOi0_(uint64_t a1)
{
  *(unsigned char *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t outlined copy of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    outlined copy of Text.Storage(a4, a5, a6 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 160);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    v4);
  return a1;
}

uint64_t outlined consume of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    outlined consume of Text.Storage(a4, a5, a6 & 1);
    return swift_bridgeObjectRelease();
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

uint64_t specialized closure #1 in TimelineView<>.init(_:content:)(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<EveryMinuteTimelineSchedule, Never>.Context);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>.Context);
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t result = v7 - 8;
  if (*(void *)(v9 + 64) == v6)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    a2((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter(v4, a1);
}

uint64_t sub_255014954()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for specialized closure #1 in TimelineView<>.init(_:content:)(uint64_t a1)
{
  return specialized closure #1 in TimelineView<>.init(_:content:)(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
    lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(&lazy protocol witness table cache variable for type AccessibilityAttachmentModifier and conformance AccessibilityAttachmentModifier, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>);
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

uint64_t lazy protocol witness table accessor for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t LACUIAuthCountdownDelayConfiguration.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownDelayConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.expiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for LACUIAuthCountdownDelayConfiguration()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthCountdownDelayConfiguration;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownDelayConfiguration) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LACUIAuthCountdownDelayConfiguration.expiration.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.expiration.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.caption.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownDelayConfiguration.caption.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.caption.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.init(title:expiration:caption:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v13 = (void *)((char *)a6 + *(int *)(v12 + 24));
  *a6 = a1;
  a6[1] = a2;
  uint64_t v14 = (char *)a6 + *(int *)(v12 + 20);
  uint64_t v15 = type metadata accessor for Date();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a3, v15);
  *uint64_t v13 = a4;
  v13[1] = a5;
  return result;
}

uint64_t specialized static LACUIAuthCountdownDelayConfiguration.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    if (static Date.== infix(_:_:)())
    {
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = (void *)((char *)a1 + v8);
      uint64_t v10 = *(void *)((char *)a1 + v8 + 8);
      uint64_t v11 = (void *)((char *)a2 + v8);
      uint64_t v12 = v11[1];
      if (v10)
      {
        if (v12)
        {
          BOOL v13 = *v9 == *v11 && v10 == v12;
          if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            return 1;
          }
        }
      }
      else if (!v12)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownDelayConfiguration(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    BOOL v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LACUIAuthCountdownDelayConfiguration(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LACUIAuthCountdownDelayConfiguration(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownDelayConfiguration(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for LACUIAuthCountdownDelayConfiguration(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25501541C);
}

uint64_t sub_25501541C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2550154E0);
}

uint64_t sub_2550154E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownDelayConfiguration()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t LACUIRatchetViewModelConfiguration.countdownPrimaryActionTitle.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void LACUIRatchetViewModelConfiguration.presentationStyle.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

LocalAuthenticationCoreUI::LACUIRatchetViewModelConfiguration __swiftcall LACUIRatchetViewModelConfiguration.init(countdownPrimaryActionTitle:presentationStyle:)(Swift::String_optional countdownPrimaryActionTitle, LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle presentationStyle)
{
  char v3 = *(unsigned char *)presentationStyle;
  *(Swift::String_optional *)uint64_t v2 = countdownPrimaryActionTitle;
  *(unsigned char *)(v2 + 16) = v3;
  result.countdownPrimaryActionTitle = countdownPrimaryActionTitle;
  result.presentationStyle = presentationStyle;
  return result;
}

uint64_t destroy for LACUIRatchetViewModelConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModelConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for LACUIRatchetViewModelConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)LocalAuthenticationCoreUI::LACUIRatchetViewModelConfiguration result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIRatchetViewModelConfiguration()
{
  return &type metadata for LACUIRatchetViewModelConfiguration;
}

uint64_t key path getter for LACUILockViewModel.state : LACUILockViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUILockViewModel.state : LACUILockViewModel(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 104))(*a1);
}

uint64_t LACUILockViewModel.state.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_255015918@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_255015964(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 104))(*a1);
}

uint64_t LACUILockViewModel.state.setter()
{
  return static Published.subscript.setter();
}

uint64_t (*LACUILockViewModel.state.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

uint64_t key path setter for LACUILockViewModel.$state : LACUILockViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 128))(v6);
}

uint64_t LACUILockViewModel.$state.getter()
{
  return LACUILockViewModel.$state.getter((uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state, &demangling cache variable for type metadata for Published<LACUILockViewState>);
}

uint64_t LACUILockViewModel.$state.setter(uint64_t a1)
{
  return LACUILockViewModel.$state.setter(a1, &demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher, (uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state, &demangling cache variable for type metadata for Published<LACUILockViewState>);
}

uint64_t (*LACUILockViewModel.$state.modify(void *a1))()
{
  unint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

uint64_t key path getter for LACUILockViewModel.color : LACUILockViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUILockViewModel.color : LACUILockViewModel(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 152))(*a1);
}

uint64_t LACUILockViewModel.color.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_255015DF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))();
  *a2 = result;
  return result;
}

uint64_t sub_255015E40(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 152))(*a1);
}

uint64_t LACUILockViewModel.color.setter()
{
  return static Published.subscript.setter();
}

uint64_t (*LACUILockViewModel.color.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

void LACUILockViewModel.state.modify(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t key path setter for LACUILockViewModel.$color : LACUILockViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>.Publisher);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 176))(v6);
}

uint64_t LACUILockViewModel.$color.getter()
{
  return LACUILockViewModel.$state.getter((uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color, &demangling cache variable for type metadata for Published<UIColor>);
}

uint64_t LACUILockViewModel.$state.getter(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t LACUILockViewModel.$color.setter(uint64_t a1)
{
  return LACUILockViewModel.$state.setter(a1, &demangling cache variable for type metadata for Published<UIColor>.Publisher, (uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color, &demangling cache variable for type metadata for Published<UIColor>);
}

uint64_t LACUILockViewModel.$state.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*LACUILockViewModel.$color.modify(void *a1))()
{
  unint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

void LACUILockViewModel.$state.modify(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t LACUILockViewModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for LACUILockViewState(0);
  Published.init(initialValue:)();
  objc_msgSend(self, sel_whiteColor);
  type metadata accessor for UIColor();
  Published.init(initialValue:)();
  return v0;
}

uint64_t LACUILockViewModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  id v13 = 0;
  type metadata accessor for LACUILockViewState(0);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v10 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  id v13 = objc_msgSend(self, sel_whiteColor);
  type metadata accessor for UIColor();
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v10, v4, v1);
  return v0;
}

unint64_t type metadata accessor for UIColor()
{
  unint64_t result = lazy cache variable for type metadata for UIColor;
  if (!lazy cache variable for type metadata for UIColor)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIColor);
  }
  return result;
}

uint64_t LACUILockViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t LACUILockViewModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUILockViewModel@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUILockViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2550169D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 120))();
}

uint64_t sub_255016A20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 168))();
}

uint64_t ObjC metadata update function for LACUILockViewModel()
{
  return type metadata accessor for LACUILockViewModel();
}

uint64_t type metadata accessor for LACUILockViewModel()
{
  uint64_t result = type metadata singleton initialization cache for LACUILockViewModel;
  if (!type metadata singleton initialization cache for LACUILockViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for LACUILockViewModel()
{
  type metadata accessor for Published<LACUILockViewState>(319, &lazy cache variable for type metadata for Published<LACUILockViewState>, type metadata accessor for LACUILockViewState);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<LACUILockViewState>(319, &lazy cache variable for type metadata for Published<UIColor>, (void (*)(uint64_t))type metadata accessor for UIColor);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for LACUILockViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUILockViewModel);
}

uint64_t dispatch thunk of LACUILockViewModel.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of LACUILockViewModel.state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of LACUILockViewModel.state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of LACUILockViewModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

void type metadata accessor for Published<LACUILockViewState>(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t LACUIRatchetViewModel.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration + 8);
  char v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration + 16);
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t LACUIRatchetViewModel.statePublisher.getter()
{
  return LACUIRatchetViewModel.statePublisher.getter((void (*)(void))LACUIRatchetViewModel.stateSubject.getter, &demangling cache variable for type metadata for CurrentValueSubject<LACUIRatchetViewModel.State, Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<LACUIRatchetViewModel.State, Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t LACUIRatchetViewModel.learnMorePublisher.getter()
{
  return LACUIRatchetViewModel.statePublisher.getter((void (*)(void))LACUIRatchetViewModel.learnMoreSubject.getter, &demangling cache variable for type metadata for PassthroughSubject<(), Never>, &lazy protocol witness table cache variable for type PassthroughSubject<(), Never> and conformance PassthroughSubject<A, B>);
}

uint64_t LACUIRatchetViewModel.statePublisher.getter(void (*a1)(void), uint64_t *a2, unint64_t *a3)
{
  a1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(a3, a2);
  uint64_t v5 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v5;
}

uint64_t LACUIRatchetViewModel.isInvalidated.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
  swift_beginAccess();
  return *v1;
}

uint64_t key path setter for LACUIRatchetViewModel.state : LACUIRatchetViewModel(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v15[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v15[-v11];
  outlined init with copy of LACUIRatchetViewModel.State(a1, (uint64_t)&v15[-v11]);
  uint64_t v13 = *a2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v13, (uint64_t)v10);
  swift_beginAccess();
  outlined assign with copy of LACUIRatchetViewModel.State((uint64_t)v12, v13);
  swift_endAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v13, (uint64_t)v7);
  LACUIRatchetViewModel.stateUpdated(from:to:)((uint64_t)v10, (uint64_t)v7);
  outlined destroy of LACUIRatchetViewModel.State((uint64_t)v7, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIRatchetViewModel.State((uint64_t)v12, type metadata accessor for LACUIRatchetViewModel.State);
  return outlined destroy of LACUIRatchetViewModel.State((uint64_t)v10, type metadata accessor for LACUIRatchetViewModel.State);
}

uint64_t LACUIRatchetViewModel.stateUpdated(from:to:)(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  uint64_t v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = type metadata accessor for LACLogger();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = specialized static LACUIRatchetViewModel.State.== infix(_:_:)(a1, a2);
  if ((result & 1) == 0)
  {
    static LACLogger.dtoUI.getter();
    v32._uint64_t countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    uint64_t v30 = v12;
    _StringGuts.grow(_:)(32);
    id v17 = objc_msgSend(v3, sel_description);
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v3;
    uint64_t v29 = v13;
    uint64_t v19 = a2;
    uint64_t v20 = v18;
    uint64_t v22 = v21;

    swift_bridgeObjectRelease();
    v32._uint64_t countAndFlagsBits = v20;
    v32._object = v22;
    v23._object = (void *)0x8000000255045C90;
    v23._uint64_t countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v23);
    outlined init with copy of LACUIRatchetViewModel.State(a1, (uint64_t)v11);
    v24._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._uint64_t countAndFlagsBits = 0x203A6F7420;
    v25._object = (void *)0xE500000000000000;
    String.append(_:)(v25);
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v11);
    v26._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    LACLogger.log(_:)(v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v9);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      char v27 = (void *)*((void *)v9 + 1);
      swift_bridgeObjectRelease();

      char v28 = &v31[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning];
      swift_beginAccess();
      char *v28 = 0;
    }
    else
    {
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v9, type metadata accessor for LACUIRatchetViewModel.State);
    }
    LACUIRatchetViewModel.stateSubject.getter();
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v11);
    CurrentValueSubject.value.setter();
    return swift_release();
  }
  return result;
}

uint64_t LACUIRatchetViewModel.state.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  return outlined init with copy of LACUIRatchetViewModel.State(v3, a1);
}

uint64_t LACUIRatchetViewModel.isRunning.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
  swift_beginAccess();
  return *v1;
}

uint64_t LACUIRatchetViewModel.stateSubject.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LACUIRatchetViewModel.State(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject;
  if (*(void *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject))
  {
    uint64_t v4 = *(void *)(v0
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<LACUIRatchetViewModel.State, Never>);
    swift_allocObject();
    uint64_t v4 = CurrentValueSubject.init(_:)();
    *(void *)(v1 + v3) = v4;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v4;
}

uint64_t LACUIRatchetViewModel.learnMoreSubject.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject);
  }
  else
  {
    uint64_t v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<(), Never>);
    swift_allocObject();
    uint64_t v2 = PassthroughSubject.init()();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t LACUIRatchetViewModel.ratchetIdentifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier);
  if (*(void *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier
                 + 8))
  {
    uint64_t v2 = *v1;
  }
  else
  {
    id v3 = objc_msgSend(self, sel_mainBundle);
    id v4 = objc_msgSend(v3, sel_bundleIdentifier);

    if (v4)
    {
      uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v6 = v5;
    }
    else
    {
      uint64_t v2 = 0;
      unint64_t v6 = 0xE000000000000000;
    }
    uint64_t *v1 = v2;
    v1[1] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id LACUIRatchetViewModel.ratchetManager.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void LACUIRatchetViewModel.ratchetManager.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*LACUIRatchetViewModel.ratchetManager.modify())()
{
  return LACUIRatchetViewModel.ratchetManager.modify;
}

id LACUIRatchetViewModel.context.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context;
  if (*(void *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context))
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context);
  }
  else
  {
    id v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_contextProvider), sel_createContext);
    *(void *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id LACUIRatchetViewModel.__allocating_init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id LACUIRatchetViewModel.init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v3 = specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

id LACUIRatchetViewModel.__deallocating_deinit()
{
  uint64_t v1 = type metadata accessor for LACLogger();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static LACLogger.dtoUI.getter();
  v13._uint64_t countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(16);
  id v5 = objc_msgSend(v0, sel_description);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;

  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = v6;
  v13._object = v8;
  v9._uint64_t countAndFlagsBits = 0x6974696E69656420;
  v9._object = (void *)0xEE0064657A696C61;
  String.append(_:)(v9);
  LACLogger.log(_:)(v13);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v10 = (objc_class *)type metadata accessor for LACUIRatchetViewModel(0);
  v12.receiver = v0;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

Swift::Void __swiftcall LACUIRatchetViewModel.start()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  id v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  uint64_t v6 = v0;
  uint64_t v7 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.start(), (uint64_t)v5);
  uint64_t v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  Swift::String v9 = *(void **)&v6[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v6[v8] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    Swift::String v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9[2] + 1, 1, v9);
    *(void *)&v6[v8] = v9;
  }
  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    Swift::String v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v11 > 1), v12 + 1, 1, v9);
    *(void *)&v6[v8] = v9;
  }
  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;
  swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.start()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = type metadata accessor for LACLogger();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v4[9] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v4[10] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[11] = v7;
  v4[12] = *(void *)(v7 + 64);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.start(), 0, 0);
}

uint64_t closure #1 in LACUIRatchetViewModel.start()()
{
  uint64_t v1 = **(void **)(v0 + 40);
  unint64_t v2 = ((*MEMORY[0x263F8EED0] & v1) + 272) & 0xFFFFFFFFFFFFLL | 0xC4D1000000000000;
  *(void *)(v0 + 120) = *(void *)((*MEMORY[0x263F8EED0] & v1) + 0x110);
  *(void *)(v0 + 128) = v2;
  *(void *)(v0 + 136) = type metadata accessor for MainActor();
  *(void *)(v0 + 144) = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.start(), v4, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 120);
  unint64_t v2 = swift_release();
  *(unsigned char *)(v0 + 184) = v1(v2) & 1;
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.start(), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t (*v11)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(unsigned char *)(v0 + 184))
  {
    unint64_t v2 = *(void *)(v0 + 56);
    uint64_t v1 = *(void *)(v0 + 64);
    uint64_t v4 = *(void **)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    static LACLogger.dtoUI.getter();
    _StringGuts.grow(_:)(21);
    uint64_t v5 = objc_msgSend(v4, sel_description);
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();

    v9._object = (void *)0x8000000255045E00;
    v9._uint64_t countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v9);
    v10._uint64_t countAndFlagsBits = v6;
    v10._object = v8;
    LACLogger.log(_:)(v10);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    *(void *)(v0 + 152) = static MainActor.shared.getter();
    uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter();
    return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.start(), v14, v13);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  unsigned char *v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  unint64_t v2 = (unsigned char *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
  swift_beginAccess();
  *unint64_t v2 = 1;
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.start(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;

  unint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v5 = (void *)v0[5];
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  outlined init with copy of LACUIRatchetViewModel.State(v1, v2);
  uint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  outlined init with take of LACUIRatchetViewModel.State(v2, (uint64_t)v8 + v7, type metadata accessor for LACUIRatchetViewModel.State);
  uint64_t v9 = v5;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v4, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v8);
  swift_release();
  outlined destroy of LACUIRatchetViewModel.State(v1, type metadata accessor for LACUIRatchetViewModel.State);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[20] = v10;
  *uint64_t v10 = v0;
  v10[1] = closure #1 in LACUIRatchetViewModel.start();
  return LACUIRatchetViewModel.evaluate()();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  LACUIRatchetViewModel.finish(result:error:)(*(void *)(v0 + 176), 0);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 168);
  unint64_t v2 = v1;
  LACUIRatchetViewModel.finish(result:error:)(0, (uint64_t)v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t closure #1 in LACUIRatchetViewModel.start()(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = closure #1 in LACUIRatchetViewModel.start();
  }
  else
  {
    *(void *)(v4 + 176) = a1;
    uint64_t v5 = closure #1 in LACUIRatchetViewModel.start();
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t LACUIRatchetViewModel.evaluate()()
{
  v1[13] = v0;
  uint64_t v2 = type metadata accessor for LACLogger();
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.evaluate(), 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  unsigned __int8 v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x178))();
  uint64_t v3 = objc_msgSend(v2, sel_isFeatureStrictModeEnabled);

  *((unsigned char *)v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled) = v3;
  uint64_t v4 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v0[17] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[18] = v5;
  void *v5 = v0;
  v5[1] = LACUIRatchetViewModel.evaluate();
  uint64_t v6 = v0[13];
  v5[23] = v4;
  v5[24] = v6;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.arm(with:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  void *v4;
  id v5;
  unsigned int v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;

  *(void *)(v0 + 88) = *MEMORY[0x263F52418];
  uint64_t v1 = *(void *)(v0 + 152);
  AnyHashable.init<A>(_:)();
  if (*(void *)(v1 + 16) && (uint64_t v2 = specialized __RawDictionaryStorage.find<A>(_:)(v0 + 16), (v3 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(*(void *)(v0 + 152) + 56) + 32 * v2, v0 + 56);
  }
  else
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  outlined destroy of AnyHashable(v0 + 16);
  if (*(void *)(v0 + 80))
  {
    type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
    if (swift_dynamicCast())
    {
      uint64_t v4 = *(void **)(v0 + 96);
      *(void *)(v0 + 168) = v4;
      uint64_t v5 = objc_msgSend(v4, sel_gracePeriodState);
      uint64_t v6 = objc_msgSend(v5, sel_isActive);

      if (v6)
      {
        uint64_t v7 = (void *)swift_task_alloc();
        *(void *)(v0 + 176) = v7;
        void *v7 = v0;
        v7[1] = LACUIRatchetViewModel.evaluate();
        return LACUIRatchetViewModel.showUI(for:)((uint64_t)v4);
      }
    }
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 56, &demangling cache variable for type metadata for Any?);
  }
  uint64_t v9 = *(void *)(v0 + 152);
  unint64_t v11 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v13 = *(void **)(v0 + 104);
  unint64_t v12 = *(void *)(v0 + 112);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(40);
  uint64_t v14 = objc_msgSend(v13, sel_description, 0, 0xE000000000000000);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = v16;
  swift_bridgeObjectRelease();

  v18._object = (void *)0x8000000255045E40;
  v18._uint64_t countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v18);
  v19._uint64_t countAndFlagsBits = v15;
  v19._object = v17;
  LACLogger.log(_:)(v19);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v20(v9);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = LACUIRatchetViewModel.evaluate();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = LACUIRatchetViewModel.evaluate();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v14;

  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v5 = *(void **)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(40);
  uint64_t v6 = objc_msgSend(v5, sel_description, 0, 0xE000000000000000);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  v10._object = (void *)0x8000000255045E40;
  v10._uint64_t countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v10);
  v11._uint64_t countAndFlagsBits = v7;
  v11._object = v9;
  LACLogger.log(_:)(v11);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  unint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v12(v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  type metadata accessor for MainActor();
  *(void *)(v0 + 216) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.evaluate(), v2, v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = swift_release();
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x110))(v2))
  {
    *(unsigned char *)(v0 + 248) = (*(uint64_t (**)(void))((*v3 & **(void **)(v0 + 104)) + 0xE0))() & 1;
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  else
  {
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  void *v3;
  uint64_t v4;

  if (*(unsigned char *)(v0 + 248))
  {
    swift_willThrow();

    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v3;
    *uint64_t v3 = v0;
    v3[1] = LACUIRatchetViewModel.evaluate();
    return LACUIRatchetViewModel.armIfPossible()();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_willThrow();

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t (*v5)(void);
  uint64_t v6;

  if (*(void *)(v0 + 232))
  {
    uint64_t v1 = *(void **)(v0 + 192);

    uint64_t v2 = *(void *)(v0 + 232);
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v3(v2);
  }
  else
  {
    swift_willThrow();

    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;

  swift_bridgeObjectRelease();
  uint64_t v1 = v0[20];
  v0[24] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[25] = v2;
  *uint64_t v2 = v0;
  v2[1] = LACUIRatchetViewModel.evaluate();
  uint64_t v3 = v0[13];
  v2[16] = v1;
  v2[17] = v3;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.showRatchetUI(for:), 0, 0);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t v1 = (void *)v0[21];
  swift_bridgeObjectRelease();

  uint64_t v2 = v0[23];
  v0[24] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[25] = v3;
  *uint64_t v3 = v0;
  v3[1] = LACUIRatchetViewModel.evaluate();
  uint64_t v4 = v0[13];
  v3[16] = v2;
  v3[17] = v4;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.showRatchetUI(for:), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LACUIRatchetViewModel.evaluate()(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 152) = a1;
  *(void *)(v3 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 208) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.evaluate(), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = *v2;
  *(void *)(v3 + 232) = a1;
  *(void *)(v3 + 240) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  else {
    uint64_t v4 = LACUIRatchetViewModel.evaluate();
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t LACUIRatchetViewModel.finish(result:error:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v35 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for LACUIRatchetViewModel.State(0);
  uint64_t v41 = *(void *)(v38 - 8);
  uint64_t v8 = *(void *)(v41 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v38);
  uint64_t v39 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (uint64_t *)((char *)&v35 - v10);
  uint64_t v36 = type metadata accessor for LACLogger();
  uint64_t v12 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(ObjectType + 576))(a2);
  static LACLogger.dtoUI.getter();
  v43._uint64_t countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(38);
  id v15 = objc_msgSend(v3, sel_description);
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  swift_bridgeObjectRelease();
  v43._uint64_t countAndFlagsBits = v16;
  v43._object = v18;
  v19._object = (void *)0x8000000255045E20;
  v19._uint64_t countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v19);
  uint64_t v20 = v35;
  uint64_t v42 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]?);
  v21._uint64_t countAndFlagsBits = Optional.debugDescription.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._uint64_t countAndFlagsBits = 0x203A726F72726520;
  v22._object = (void *)0xE800000000000000;
  String.append(_:)(v22);
  uint64_t v42 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error?);
  v23._uint64_t countAndFlagsBits = Optional.debugDescription.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v43);
  swift_bridgeObjectRelease();
  uint64_t v24 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v36);
  Swift::String v25 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x178))(v24);
  objc_msgSend(v25, sel_removeObserver_, v3);

  Swift::String v26 = (void *)v37;
  *unint64_t v11 = v20;
  v11[1] = v26;
  swift_storeEnumTagMultiPayload();
  uint64_t v27 = type metadata accessor for TaskPriority();
  uint64_t v28 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v40, 1, 1, v27);
  uint64_t v29 = v39;
  outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v11, v39);
  unint64_t v30 = (*(unsigned __int8 *)(v41 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = 0;
  v31[3] = 0;
  v31[4] = v3;
  outlined init with take of LACUIRatchetViewModel.State(v29, (uint64_t)v31 + v30, type metadata accessor for LACUIRatchetViewModel.State);
  swift_bridgeObjectRetain();
  id v32 = v26;
  char v33 = v3;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v28, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v31);
  swift_release();

  return outlined destroy of LACUIRatchetViewModel.State((uint64_t)v11, type metadata accessor for LACUIRatchetViewModel.State);
}

Swift::Void __swiftcall LACUIRatchetViewModel.stop(withReason:invalidate:)(Swift::String withReason, Swift::Bool invalidate)
{
  object = withReason._object;
  uint64_t countAndFlagsBits = withReason._countAndFlagsBits;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = v2;
  *(void *)(v10 + 40) = countAndFlagsBits;
  *(void *)(v10 + 48) = object;
  *(unsigned char *)(v10 + 56) = invalidate;
  id v11 = v2;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:), v10);
  swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v11 = *(int **)((*MEMORY[0x263F8EED0] & *a4) + 0x238);
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v11 + *v11);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v12;
  *uint64_t v12 = v7;
  v12[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v14(a5, a6, a7);
}

uint64_t LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 56) = a3;
  *(void *)(v4 + 16) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 40) = v7;
  void *v7 = v4;
  v7[1] = LACUIRatchetViewModel.stop(withReason:invalidate:);
  return LACUIRatchetViewModel.stop(with:)(a1, a2);
}

uint64_t LACUIRatchetViewModel.stop(withReason:invalidate:)()
{
  uint64_t v1 = (void *)*v0;
  int v2 = *(unsigned __int8 *)(*v0 + 56);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  if (v2 == 1)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v1[6] = v4;
    void *v4 = v3;
    v4[1] = LACUIRatchetViewModel.stop(withReason:invalidate:);
    uint64_t v5 = v1[3];
    uint64_t v6 = v1[2];
    return LACUIRatchetViewModel.invalidate(with:)(v6, v5);
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(v3 + 8);
    return v8();
  }
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

uint64_t LACUIRatchetViewModel.stop(with:)(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  v3[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for LACLogger();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.stop(with:), 0, 0);
}

uint64_t LACUIRatchetViewModel.stop(with:)()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 152) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.stop(with:), v2, v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unsigned char *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = swift_release();
  if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x110))(v2))
  {
    uint64_t v3 = (unsigned char *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
    swift_beginAccess();
    *uint64_t v3 = 0;
    uint64_t v4 = LACUIRatchetViewModel.stop(with:);
  }
  else
  {
    uint64_t v4 = LACUIRatchetViewModel.stop(with:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[15];
  id v32 = v0[16];
  uint64_t v4 = v0[13];
  char v33 = v0[12];
  uint64_t v5 = (void *)v0[11];
  uint64_t v31 = (void *)v0[10];
  uint64_t v6 = v0[9];
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(26);
  swift_bridgeObjectRelease();
  uint64_t v7 = objc_msgSend(v5, sel_description);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0x6572206874697720;
  v12._object = (void *)0xED0000206E6F7361;
  String.append(_:)(v12);
  v13._uint64_t countAndFlagsBits = v6;
  v13._object = v31;
  String.append(_:)(v13);
  v14._uint64_t countAndFlagsBits = 0x676E6970706F7453;
  v14._object = (void *)0xE900000000000020;
  LACLogger.log(_:)(v14);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v32);
  uint64_t v15 = (uint64_t)v5 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v15, v3, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v3, 1, v33))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0[15], &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  }
  else
  {
    uint64_t v16 = v0[14];
    id v17 = v0[15];
    uint64_t v18 = v0[12];
    Swift::String v19 = v0[13];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v16, v17, v18);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v17, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    type metadata accessor for CancellationError();
    lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
    uint64_t v20 = swift_allocError();
    CancellationError.init()();
    v0[8] = v20;
    CheckedContinuation.resume(throwing:)();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
  }
  Swift::String v21 = v0[11];
  Swift::String v22 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  Swift::String v23 = *(void *)(*(void *)(v21 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks) + 16);
  if (v23)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = 0;
    Swift::String v25 = MEMORY[0x263F8EE60] + 8;
    Swift::String v26 = MEMORY[0x263F8E628];
    uint64_t v27 = MEMORY[0x263F8E658];
    do
    {
      ++v24;
      uint64_t v28 = swift_retain();
      MEMORY[0x25A2849B0](v28, v25, v26, v27);
      swift_release();
    }
    while (v23 != v24);
    swift_bridgeObjectRelease();
  }
  *(void *)(v21 + v22) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t (*v15)(void);
  uint64_t v17;

  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = (void *)v0[10];
  uint64_t v5 = (void *)v0[11];
  uint64_t v6 = v0[9];
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  uint64_t v7 = objc_msgSend(v5, sel_description);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._object = (void *)0x8000000255045DD0;
  v12._uint64_t countAndFlagsBits = 0xD000000000000023;
  String.append(_:)(v12);
  v13._uint64_t countAndFlagsBits = v6;
  v13._object = v4;
  String.append(_:)(v13);
  v14._uint64_t countAndFlagsBits = 0x676E6970706F7453;
  v14._object = (void *)0xE900000000000020;
  LACLogger.log(_:)(v14);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t LACUIRatchetViewModel.invalidate(with:)(uint64_t a1, uint64_t a2)
{
  v3[22] = a2;
  v3[23] = v2;
  v3[21] = a1;
  uint64_t v4 = type metadata accessor for LACLogger();
  v3[24] = v4;
  v3[25] = *(void *)(v4 - 8);
  v3[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.invalidate(with:), 0, 0);
}

uint64_t LACUIRatchetViewModel.invalidate(with:)()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 216) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.invalidate(with:), v2, v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  unsigned char *v4;
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v2 = swift_release();
  if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0xE0))(v2))
  {
    uint64_t v3 = LACUIRatchetViewModel.invalidate(with:);
  }
  else
  {
    uint64_t v4 = (unsigned char *)(*(void *)(v0 + 184)
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
    swift_beginAccess();
    void *v4 = 1;
    uint64_t v3 = LACUIRatchetViewModel.invalidate(with:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  Swift::String v22;
  void *v23;
  uint64_t v24;

  Swift::String v23 = v0;
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = (void *)v0[23];
  Swift::String v21 = v0[24];
  uint64_t v5 = v0[21];
  uint64_t v4 = (void *)v0[22];
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  strcpy((char *)&v22, "Invalidating ");
  HIWORD(v22._object) = -4864;
  uint64_t v6 = objc_msgSend(v3, sel_description);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  v10._uint64_t countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 0x6572206874697720;
  v11._object = (void *)0xED0000206E6F7361;
  String.append(_:)(v11);
  v12._uint64_t countAndFlagsBits = v5;
  v12._object = v4;
  String.append(_:)(v12);
  LACLogger.log(_:)(v22);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[28] = v13;
  v0[29] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v1, v21);
  objc_msgSend(LACUIRatchetViewModel.context.getter(), sel_invalidate);
  uint64_t v14 = swift_unknownObjectRelease();
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x178))(v14);
  v0[30] = v15;
  uint64_t v16 = LACUIRatchetViewModel.ratchetIdentifier.getter();
  id v17 = MEMORY[0x25A2848C0](v16);
  v0[31] = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = MEMORY[0x25A2848C0](v5, v4);
  v0[32] = v18;
  v0[2] = v0;
  v0[3] = LACUIRatchetViewModel.invalidate(with:);
  Swift::String v19 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ();
  v0[13] = &block_descriptor_75;
  v0[14] = v19;
  objc_msgSend(v15, sel_cancelArmRequestWithIdentifier_reason_completion_, v17, v18);
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 264) = v1;
  if (v1) {
    uint64_t v2 = LACUIRatchetViewModel.invalidate(with:);
  }
  else {
    uint64_t v2 = LACUIRatchetViewModel.invalidate(with:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 248);
  uint64_t v2 = *(void **)(v0 + 256);

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  Swift::String v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t (*v16)(void);
  uint64_t v18;

  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v4 = (void *)v0[23];
  uint64_t v3 = v0[24];
  uint64_t v6 = v0[21];
  uint64_t v5 = (void *)v0[22];
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(56);
  v7._uint64_t countAndFlagsBits = 0x6164696C61766E49;
  v7._object = (void *)0xED000020676E6974;
  String.append(_:)(v7);
  uint64_t v8 = objc_msgSend(v4, sel_description);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = v10;

  v12._uint64_t countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._object = (void *)0x8000000255045DA0;
  v13._uint64_t countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v13);
  v14._uint64_t countAndFlagsBits = v6;
  v14._object = v5;
  String.append(_:)(v14);
  v15._uint64_t countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  LACLogger.log(_:)(v15);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

{
  Swift::String *v0;
  void *object;
  void *countAndFlagsBits;
  void *v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t (*v15)(void);
  uint64_t v17;

  uint64_t countAndFlagsBits = (void *)v0[16]._countAndFlagsBits;
  object = v0[16]._object;
  uint64_t v4 = (void *)v0[15]._countAndFlagsBits;
  uint64_t v3 = v0[15]._object;
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[14]._countAndFlagsBits;
  uint64_t v6 = v0[13]._countAndFlagsBits;
  uint64_t v8 = v0[11]._object;
  uint64_t v7 = v0[12]._countAndFlagsBits;
  swift_willThrow();

  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(42);
  v0[9]._uint64_t countAndFlagsBits = 0;
  v0[9]._object = (void *)0xE000000000000000;
  uint64_t v9 = objc_msgSend(v8, sel_description);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  v13._uint64_t countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._object = (void *)0x8000000255045D70;
  v14._uint64_t countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v14);
  v0[10]._uint64_t countAndFlagsBits = (uint64_t)object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  _print_unlocked<A, B>(_:_:)();
  LACLogger.log(_:)(v0[9]);
  swift_bridgeObjectRelease();

  v5(v6, v7);
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0->_object;
  return v15();
}

id LACUIRatchetViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void LACUIRatchetViewModel.init()()
{
}

uint64_t LACUIRatchetViewModel.ratchetStateDidChange(_:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = a1;
  uint64_t v8 = v1;
  id v9 = a1;
  uint64_t v10 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), (uint64_t)v7);
  uint64_t v11 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  uint64_t v12 = *(void **)&v8[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v8[v11] = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
    *(void *)&v8[v11] = v12;
  }
  unint64_t v15 = v12[2];
  unint64_t v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1, v12);
    *(void *)&v8[v11] = v12;
  }
  v12[2] = v15 + 1;
  v12[v15 + 4] = v10;
  return swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v5[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v5[8] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v5[9] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[10] = v7;
  v5[11] = *(void *)(v7 + 64);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), 0, 0);
}

uint64_t closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)()
{
  *(void *)(v0 + 120) = type metadata accessor for MainActor();
  *(void *)(v0 + 128) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), v2, v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = swift_release();
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x110))(v2))
  {
    *(unsigned char *)(v0 + 160) = (*(uint64_t (**)(void))((*v3 & **(void **)(v0 + 40)) + 0xE0))() & 1;
    return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  if ((*(unsigned char *)(v0 + 160) & 1) != 0 || (char *)objc_msgSend(*(id *)(v0 + 48), sel_rawValue) - 2 > (char *)2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    uint64_t v1 = *(void **)(v0 + 40);
    uint64_t v2 = (*MEMORY[0x263F8EED0] & *v1) + 248;
    *(void *)(v0 + 136) = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0xF8);
    *(void *)(v0 + 144) = v2 & 0xFFFFFFFFFFFFLL | 0x61AF000000000000;
    *(void *)(v0 + 152) = static MainActor.shared.getter();
    uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
    return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), v4, v3);
  }
}

{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = *(void (**)(uint64_t))(v0 + 136);
  uint64_t v2 = swift_release();
  v1(v2);
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t (*v14)(void);
  uint64_t v16;

  uint64_t v1 = v0[14];
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v3 = v0[12];
    uint64_t v2 = v0[13];
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v7 = (void *)v0[5];
    outlined destroy of LACUIRatchetViewModel.State(v1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    static Date.now.getter();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 1, v8);
    uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v6, v9, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v2);
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    outlined init with copy of LACUIRatchetViewModel.State(v2, v3);
    uint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = v7;
    outlined init with take of LACUIRatchetViewModel.State(v3, (uint64_t)v12 + v11, type metadata accessor for LACUIRatchetViewModel.State);
    uint64_t v13 = v7;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v5, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v12);
    swift_release();
    uint64_t v1 = v2;
  }
  outlined destroy of LACUIRatchetViewModel.State(v1, type metadata accessor for LACUIRatchetViewModel.State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t LACUIRatchetViewModel.uiConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v61 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x270FA5388](v61);
  uint64_t v57 = (uint64_t)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v58 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v62 = (char *)&v57 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v59 = (char *)&v57 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v60 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v57 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v57 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v57 - v19;
  uint64_t v21 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v21, (uint64_t)v20, &demangling cache variable for type metadata for Date?);
  uint64_t v63 = v4;
  Swift::String v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  int v23 = v22(v20, 1, v3);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v20, &demangling cache variable for type metadata for Date?);
  if (v23 == 1)
  {
    uint64_t v24 = v65 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
    swift_beginAccess();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v24, (uint64_t)v18, &demangling cache variable for type metadata for Date?);
    LODWORD(v24) = v22(v18, 1, v3);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for Date?);
    if (v24 == 1)
    {
      uint64_t v25 = v65;
      uint64_t v26 = LACUIRatchetViewModel.beginDelayTitle.getter(MEMORY[0x263F523C8]);
      unint64_t v28 = v27;
      uint64_t v29 = LACUIRatchetViewModel.beginDelayText.getter();
      unint64_t v31 = v30;
      int v32 = *(unsigned __int8 *)(v25
                               + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled);
      char v33 = LACUIRatchetViewModel.beginDelayLocationWarning.getter();
      uint64_t v34 = v64;
      static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:familiarLocationsUnavailable:customCancelTitle:)(v26, v28, v29, v31, v32, v33 & 1, 0, 0, v64, 0);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSCoding + 16);
      goto LABEL_21;
    }
  }
  uint64_t v37 = v65 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v37, (uint64_t)v15, &demangling cache variable for type metadata for Date?);
  if (v22(v15, 1, v3) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for Date?);
    uint64_t v38 = v63;
    uint64_t v34 = v64;
  }
  else
  {
    uint64_t v39 = v63;
    uint64_t v40 = v59;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v59, v15, v3);
    uint64_t v41 = v62;
    static Date.now.getter();
    char v42 = static Date.> infix(_:_:)();
    Swift::String v43 = *(void (**)(char *, uint64_t))(v39 + 8);
    v43(v41, v3);
    uint64_t v34 = v64;
    if (v42)
    {
      uint64_t v44 = v57;
      static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)(0, 0, v57);
      v43(v40, v3);
      uint64_t result = outlined init with take of LACUIRatchetViewModel.State(v44, v34, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSCoding + 16);
      goto LABEL_21;
    }
    v43(v40, v3);
    uint64_t v38 = v39;
  }
  uint64_t v45 = v60;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v21, v60, &demangling cache variable for type metadata for Date?);
  if (v22((char *)v45, 1, v3) != 1)
  {
    uint64_t v46 = (uint64_t)v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v58, v45, v3);
    uint64_t v47 = v62;
    static Date.now.getter();
    char v48 = static Date.> infix(_:_:)();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v38 + 8);
    v49(v47, v3);
    p_prots = &OBJC_PROTOCOL___NSCoding.prots;
    if ((v48 & 1) == 0)
    {
      v49((char *)v46, v3);
      goto LABEL_20;
    }
    uint64_t v50 = v65;
    uint64_t v51 = LACUIRatchetViewModel.beginDelayTitle.getter(MEMORY[0x263F523F0]);
    static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)(v51, v52, v46, 0, 0, v34);
    swift_bridgeObjectRelease();
    uint64_t v53 = *(void *)(v50 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration + 8);
    if (!v53
      || (uint64_t v54 = *(int *)(v61 + 36), v55 = *(void *)(v34 + v54), !*(void *)(v55 + 16))
      || *(unsigned char *)(v55 + 64))
    {
LABEL_18:
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v49)(v46, v3);
      goto LABEL_21;
    }
    uint64_t v56 = *(void *)(v50 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration);
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if (*(void *)(v55 + 16))
      {
LABEL_17:
        *(void *)(v55 + 48) = v56;
        *(void *)(v55 + 56) = v53;
        swift_bridgeObjectRelease();
        *(void *)(v34 + v54) = v55;
        uint64_t v46 = (uint64_t)v58;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v55);
      uint64_t v55 = result;
      if (*(void *)(result + 16)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    return result;
  }
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v45, &demangling cache variable for type metadata for Date?);
  p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSCoding + 16);
LABEL_20:
  uint64_t result = static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)(0, 0xE000000000000000, 0, 0, v34);
LABEL_21:
  if ((*((unsigned char *)&p_prots[196][2].count + v65) & 1) == 0) {
    *(unsigned char *)(v34 + *(int *)(v61 + 44)) = 0;
  }
  return result;
}

uint64_t LACUIRatchetViewModel.handle(action:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v36 = v9;
  uint64_t v37 = (uint64_t)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v38 = (uint64_t)&v34 - v10;
  uint64_t v41 = type metadata accessor for LACLogger();
  uint64_t v11 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v40 = *(void *)a1;
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  char v17 = *(unsigned char *)(a1 + 32);
  static LACLogger.dtoUI.getter();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  char v42 = v2;
  id v18 = objc_msgSend(v2, sel_description);
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();

  v48._uint64_t countAndFlagsBits = v19;
  v48._object = v21;
  uint64_t v22 = v40;
  v23._object = (void *)0x8000000255045AA0;
  v23._uint64_t countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v23);
  uint64_t v43 = v22;
  unint64_t v44 = v14;
  uint64_t v45 = v16;
  uint64_t v46 = v15;
  char v47 = v17;
  outlined copy of LACUIAuthActionCountdown(v22, v14);
  v24._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v48);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v41);
  if (v14)
  {
    uint64_t v43 = v22;
    unint64_t v44 = v14;
    uint64_t v45 = v16;
    uint64_t v46 = v15;
    char v47 = v17;
    return LACUIRatchetViewModel.handleButtonTap(_:)((uint64_t)&v43);
  }
  else
  {
    uint64_t v26 = v38;
    unint64_t v27 = v42;
    LACUIRatchetViewModel.uiConfiguration.getter(v38);
    swift_storeEnumTagMultiPayload();
    uint64_t v28 = type metadata accessor for TaskPriority();
    uint64_t v29 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v39, 1, 1, v28);
    uint64_t v30 = v37;
    outlined init with copy of LACUIRatchetViewModel.State(v26, v37);
    unint64_t v31 = (*(unsigned __int8 *)(v35 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    int v32 = (void *)swift_allocObject();
    v32[2] = 0;
    v32[3] = 0;
    v32[4] = v27;
    outlined init with take of LACUIRatchetViewModel.State(v30, (uint64_t)v32 + v31, type metadata accessor for LACUIRatchetViewModel.State);
    id v33 = v27;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v29, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.set(state:), (uint64_t)v32);
    swift_release();
    return outlined destroy of LACUIRatchetViewModel.State(v26, type metadata accessor for LACUIRatchetViewModel.State);
  }
}

uint64_t LACUIRatchetViewModel.handleButtonTap(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACLogger();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v47 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)a1;
  id v18 = *(void **)(a1 + 8);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v19 = *(void *)(a1 + 24);
  char v21 = *(unsigned char *)(a1 + 32);
  swift_bridgeObjectRetain();
  v22._uint64_t countAndFlagsBits = v17;
  v22._object = v18;
  LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(v22);
  switch((char)v52)
  {
    case 1:
      LACUIRatchetViewModel.learnMoreSubject.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<(), Never>);
      lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type PassthroughSubject<(), Never> and conformance PassthroughSubject<A, B>, &demangling cache variable for type metadata for PassthroughSubject<(), Never>);
      Subject<>.send()();
      uint64_t result = swift_release();
      break;
    case 2:
    case 3:
      uint64_t v35 = (uint64_t)v51 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
      swift_beginAccess();
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v35, (uint64_t)v13, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
      uint64_t v37 = v49;
      uint64_t v36 = v50;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v13, 1, v50))
      {
        uint64_t result = outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v7, v13, v36);
        outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
        v57._uint64_t countAndFlagsBits = 0;
        CheckedContinuation.resume(returning:)();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v36);
      }
      break;
    case 5:
      uint64_t v38 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v51) + 0x230);
      uint64_t result = v38(0x6E61632072657355, 0xEB000000006C6563, 1);
      break;
    case 6:
      uint64_t v39 = (uint64_t)v51 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
      swift_beginAccess();
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v39, (uint64_t)v11, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
      uint64_t v41 = v49;
      uint64_t v40 = v50;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v11, 1, v50))
      {
        uint64_t result = outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v7, v11, v40);
        outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
        uint64_t v43 = self;
        uint64_t v44 = *MEMORY[0x263F52348];
        uint64_t v45 = (void *)MEMORY[0x25A2848C0](0xD000000000000018, 0x8000000255045CD0);
        id v46 = objc_msgSend(v43, sel_errorWithCode_debugDescription_, v44, v45);

        v57._uint64_t countAndFlagsBits = (uint64_t)v46;
        CheckedContinuation.resume(throwing:)();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v7, v40);
      }
      break;
    case 7:
      static LACLogger.dtoUI.getter();
      uint64_t v52 = 0;
      unint64_t v53 = 0xE000000000000000;
      _StringGuts.grow(_:)(32);
      swift_bridgeObjectRelease();
      v57._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v57._object = (void *)0x8000000255045CB0;
      uint64_t v52 = v17;
      unint64_t v53 = (unint64_t)v18;
      uint64_t v54 = v20;
      uint64_t v55 = v19;
      char v56 = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42._uint64_t countAndFlagsBits = String.init<A>(describing:)();
      String.append(_:)(v42);
      swift_bridgeObjectRelease();
      LACLogger.error(_:)(v57);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v4, v48);
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))((*MEMORY[0x263F8EED0] & *v51) + 0x230))(0x206E776F6E6B6E55, 0xEE006E6F69746361, 0);
      break;
    default:
      uint64_t v23 = swift_allocObject();
      Swift::String v24 = v51;
      swift_unknownObjectWeakInit();
      uint64_t v25 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v16, 1, 1, v25);
      uint64_t v26 = (void *)swift_allocObject();
      v26[2] = 0;
      v26[3] = 0;
      v26[4] = v24;
      v26[5] = partial apply for closure #1 in LACUIRatchetViewModel.handleButtonTap(_:);
      v26[6] = v23;
      swift_retain_n();
      unint64_t v27 = v24;
      uint64_t v28 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:), (uint64_t)v26);
      uint64_t v29 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
      uint64_t v30 = *(void **)&v27[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v27[v29] = v30;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v30[2] + 1, 1, v30);
        *(void *)&v27[v29] = v30;
      }
      unint64_t v33 = v30[2];
      unint64_t v32 = v30[3];
      if (v33 >= v32 >> 1)
      {
        uint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v32 > 1), v33 + 1, 1, v30);
        *(void *)&v27[v29] = v30;
      }
      v30[2] = v33 + 1;
      v30[v33 + 4] = v28;
      swift_release_n();
      uint64_t result = swift_release();
      break;
  }
  return result;
}

uint64_t closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(void *a1, char a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v33 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v34 = (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = type metadata accessor for LACLogger();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a3 + 16;
  static LACLogger.dtoUI.getter();
  uint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  _StringGuts.grow(_:)(37);
  swift_beginAccess();
  v40._uint64_t countAndFlagsBits = MEMORY[0x25A2854F0](a3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIRatchetViewModel?);
  uint64_t v18 = String.init<A>(describing:)();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  v40._uint64_t countAndFlagsBits = v18;
  v40._object = v20;
  char v21 = a1;
  v22._object = (void *)0x8000000255045D20;
  v22._uint64_t countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v22);
  uint64_t v38 = a1;
  char v39 = a2 & 1;
  outlined copy of Result<[AnyHashable : Any], Error>(a1, a2 & 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[AnyHashable : Any], Error>);
  v23._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v40);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (a2)
  {
    swift_beginAccess();
    uint64_t result = MEMORY[0x25A2854F0](v17);
    if (!result) {
      return result;
    }
    uint64_t v25 = (void *)result;
    uint64_t v26 = result + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    uint64_t v27 = v34;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v26, v34, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    outlined copy of Result<[AnyHashable : Any], Error>(v21, 1);

    uint64_t v29 = v35;
    uint64_t v28 = v36;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v27, 1, v36))
    {
      outlined consume of Result<[AnyHashable : Any], Error>(v21, 1);
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    }
    unint64_t v32 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v33, v27, v28);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    uint64_t v37 = v21;
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_beginAccess();
    uint64_t result = MEMORY[0x25A2854F0](v17);
    if (!result) {
      return result;
    }
    uint64_t v30 = (void *)result;
    uint64_t v31 = result + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v31, (uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    outlined copy of Result<[AnyHashable : Any], Error>(a1, 0);

    uint64_t v29 = v35;
    uint64_t v28 = v36;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v12, 1, v36))
    {
      outlined consume of Result<[AnyHashable : Any], Error>(a1, 0);
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    }
    unint64_t v32 = v33;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v33, v12, v28);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    uint64_t v37 = a1;
    CheckedContinuation.resume(returning:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v28);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ()(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t LACUIRatchetViewModel.arm(with:)(uint64_t a1)
{
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = v1;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.arm(with:), 0, 0);
}

uint64_t LACUIRatchetViewModel.arm(with:)()
{
  uint64_t v17 = v0;
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(*(void *)(v0 + 192) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(void *)(v0 + 120) = *MEMORY[0x263F523F8];
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  uint64_t v3 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v0 + 152) = 1;
  *(void *)(v0 + 176) = v3;
  outlined init with take of Any((_OWORD *)(v0 + 152), (_OWORD *)(v0 + 120));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = v2;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)((_OWORD *)(v0 + 120), v0 + 80, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 80);
  *(void *)(v0 + 120) = *MEMORY[0x263F52400];
  AnyHashable.init<A>(_:)();
  *(void *)(v0 + 144) = v3;
  *(unsigned char *)(v0 + 120) = 1;
  outlined init with take of Any((_OWORD *)(v0 + 120), (_OWORD *)(v0 + 152));
  char v5 = swift_isUniquelyReferenced_nonNull_native();
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)((_OWORD *)(v0 + 152), v0 + 80, v5);
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 80);
  swift_bridgeObjectRetain();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = v2;
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v1, (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B), 0, v6, &v16);
  uint64_t v7 = *(void **)(v0 + 192);
  uint64_t v8 = swift_bridgeObjectRelease();
  uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0x178))(v8);
  *(void *)(v0 + 200) = v9;
  uint64_t v10 = LACUIRatchetViewModel.ratchetIdentifier.getter();
  uint64_t v11 = MEMORY[0x25A2848C0](v10);
  *(void *)(v0 + 208) = v11;
  swift_bridgeObjectRelease();
  id v12 = LACUIRatchetViewModel.context.getter();
  *(void *)(v0 + 216) = v12;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 224) = isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = LACUIRatchetViewModel.arm(with:);
  uint64_t v14 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> () with result type [AnyHashable : Any];
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v14;
  objc_msgSend(v9, sel_performArmRequestWithIdentifier_context_options_completion_, v11, v12, isa, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = LACUIRatchetViewModel.arm(with:);
  }
  else {
    uint64_t v2 = LACUIRatchetViewModel.arm(with:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v6;

  uint64_t v1 = *(void **)(v0 + 224);
  uint64_t v2 = *(void **)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 120);

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = (void *)v0[28];
  uint64_t v2 = (void *)v0[26];
  uint64_t v3 = (void *)v0[25];
  swift_willThrow();

  swift_unknownObjectRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t LACUIRatchetViewModel.showUI(for:)(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = type metadata accessor for Date();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v2[14] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v2[15] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[16] = v5;
  v2[17] = *(void *)(v5 + 64);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for LACLogger();
  v2[20] = v6;
  v2[21] = *(void *)(v6 - 8);
  v2[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.showUI(for:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v4 = *v2;
  *(void *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  else
  {
    *(void *)(v4 + 232) = a1;
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v4 = *v2;
  *(void *)(*v2 + 248) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  else
  {
    *(void *)(v4 + 256) = a1;
    uint64_t v5 = LACUIRatchetViewModel.showUI(for:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t LACUIRatchetViewModel.showUI(for:)()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v62 = v0[20];
  uint64_t v3 = (void *)v0[8];
  uint64_t v4 = (void *)v0[9];
  id v5 = objc_msgSend(v3, sel_ratchetState);
  v0[23] = v5;
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(27);
  id v6 = objc_msgSend(v4, sel_description);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();

  uint64_t v63 = v7;
  v10._object = (void *)0x8000000255045E70;
  v10._uint64_t countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v10);
  id v11 = objc_msgSend(v5, sel_description);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  v15._uint64_t countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._uint64_t countAndFlagsBits = v63;
  v16._object = v9;
  LACLogger.log(_:)(v16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v62);
  id v17 = objc_msgSend(v3, sel_gracePeriodState);
  LOBYTE(v3) = objc_msgSend(v17, sel_isActive);

  if (v3)
  {
    uint64_t v18 = v0[19];
    uint64_t v58 = v0[18];
    uint64_t v60 = v0[16];
    uint64_t v19 = v0[13];
    uint64_t v56 = v0[14];
    uint64_t v21 = v0[11];
    uint64_t v20 = v0[12];
    Swift::String v22 = (void *)v0[9];
    uint64_t v23 = v0[10];
    Swift::String v24 = (void *)v0[8];
    static Date.now.getter();
    id v25 = objc_msgSend(v24, sel_gracePeriodState);
    objc_msgSend(v25, sel_time);

    Date.addingTimeInterval(_:)();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v23);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v19, 0, 1, v23);
    uint64_t v26 = (uint64_t)v22 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v19, v26, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v18);
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v56, 1, 1, v27);
    outlined init with copy of LACUIRatchetViewModel.State(v18, v58);
    unint64_t v28 = (*(unsigned __int8 *)(v60 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v22;
    outlined init with take of LACUIRatchetViewModel.State(v58, (uint64_t)v29 + v28, type metadata accessor for LACUIRatchetViewModel.State);
    id v30 = v22;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v56, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v29);
    swift_release();
    outlined destroy of LACUIRatchetViewModel.State(v18, type metadata accessor for LACUIRatchetViewModel.State);
    uint64_t v31 = (void *)swift_task_alloc();
    v0[30] = v31;
    *uint64_t v31 = v0;
    unint64_t v32 = LACUIRatchetViewModel.showUI(for:);
LABEL_7:
    v31[1] = v32;
    return LACUIRatchetViewModel.setupContinuationAndWait()();
  }
  id v33 = objc_msgSend(v5, sel_rawValue);
  if (v33 == (id)1)
  {
    uint64_t v43 = v0[19];
    uint64_t v59 = v0[18];
    uint64_t v61 = v0[16];
    uint64_t v44 = v0[13];
    uint64_t v57 = v0[14];
    uint64_t v46 = v0[11];
    uint64_t v45 = v0[12];
    uint64_t v48 = (void *)v0[9];
    uint64_t v47 = v0[10];
    objc_msgSend(v5, sel_duration);
    static Date.now.getter();
    Date.addingTimeInterval(_:)();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v44, 0, 1, v47);
    uint64_t v49 = (uint64_t)v48 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v44, v49, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v43);
    swift_storeEnumTagMultiPayload();
    uint64_t v50 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v57, 1, 1, v50);
    outlined init with copy of LACUIRatchetViewModel.State(v43, v59);
    unint64_t v51 = (*(unsigned __int8 *)(v61 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
    uint64_t v52 = (void *)swift_allocObject();
    v52[2] = 0;
    v52[3] = 0;
    v52[4] = v48;
    outlined init with take of LACUIRatchetViewModel.State(v59, (uint64_t)v52 + v51, type metadata accessor for LACUIRatchetViewModel.State);
    id v53 = v48;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v57, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v52);
    swift_release();
    outlined destroy of LACUIRatchetViewModel.State(v43, type metadata accessor for LACUIRatchetViewModel.State);
    uint64_t v31 = (void *)swift_task_alloc();
    v0[27] = v31;
    *uint64_t v31 = v0;
    unint64_t v32 = LACUIRatchetViewModel.showUI(for:);
    goto LABEL_7;
  }
  if (!v33)
  {
    uint64_t v35 = v0[18];
    uint64_t v34 = v0[19];
    uint64_t v36 = v0[16];
    uint64_t v37 = v0[14];
    uint64_t v38 = (void *)v0[9];
    LACUIRatchetViewModel.uiConfiguration.getter(v34);
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v37, 1, 1, v39);
    outlined init with copy of LACUIRatchetViewModel.State(v34, v35);
    unint64_t v40 = (*(unsigned __int8 *)(v36 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v41 = (void *)swift_allocObject();
    v41[2] = 0;
    v41[3] = 0;
    v41[4] = v38;
    outlined init with take of LACUIRatchetViewModel.State(v35, (uint64_t)v41 + v40, type metadata accessor for LACUIRatchetViewModel.State);
    id v42 = v38;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v37, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v41);
    swift_release();
    outlined destroy of LACUIRatchetViewModel.State(v34, type metadata accessor for LACUIRatchetViewModel.State);
    uint64_t v31 = (void *)swift_task_alloc();
    v0[24] = v31;
    *uint64_t v31 = v0;
    unint64_t v32 = LACUIRatchetViewModel.showUI(for:);
    goto LABEL_7;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v55 = (uint64_t (*)(void))v0[1];
  return v55(0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 208);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 232);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 256);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LACUIRatchetViewModel.showRatchetUI(for:)(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.showRatchetUI(for:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v4 = *v2;
  *(void *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = LACUIRatchetViewModel.showRatchetUI(for:);
  }
  else
  {
    *(void *)(v4 + 232) = a1;
    id v5 = LACUIRatchetViewModel.showRatchetUI(for:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t LACUIRatchetViewModel.showRatchetUI(for:)()
{
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x178))();
  objc_msgSend(v3, sel_addObserver_, v2);

  id v4 = v1;
  id v5 = *(void **)(v0 + 128);
  *(void *)(v0 + 96) = v5;
  uint64_t v6 = *MEMORY[0x263F52360];
  *(void *)(v0 + 144) = *MEMORY[0x263F52310];
  *(void *)(v0 + 152) = v6;
  *(void *)(v0 + 160) = *MEMORY[0x263F52358];
  id v7 = v5;
  id v8 = v5;
  *(void *)(v0 + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *(void *)(v0 + 176) = type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
  uint64_t v9 = (SEL *)&unk_2653BD000;
  if (!swift_dynamicCast()) {
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v37 = *(void *)(v0 + 152);
  id v11 = *(void **)(v0 + 112);
  uint64_t v12 = self;
  id v13 = v11;
  uint64_t v14 = (void *)_convertErrorToNSError(_:)();

  LOBYTE(v10) = objc_msgSend(v12, sel_error_hasCode_subcode_, v14, v10, v37);
  if ((v10 & 1) == 0)
  {

    char v22 = 0;
    uint64_t v23 = v5;
    uint64_t v9 = (SEL *)&unk_2653BD000;
    goto LABEL_18;
  }
  id v15 = objc_msgSend(v13, sel_userInfo);
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v16 + 16))
  {
    unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v17, v18);
    uint64_t v20 = (_OWORD *)(v0 + 48);
    if (v21)
    {
      outlined init with copy of Any(*(void *)(v16 + 56) + 32 * v19, v0 + 48);
      goto LABEL_10;
    }
    long long v24 = 0uLL;
  }
  else
  {
    long long v24 = 0uLL;
    uint64_t v20 = (_OWORD *)(v0 + 48);
  }
  _OWORD *v20 = v24;
  v20[1] = v24;
LABEL_10:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 72))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v20, &demangling cache variable for type metadata for Any?);
    uint64_t v9 = (SEL *)&unk_2653BD000;
    goto LABEL_14;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  uint64_t v9 = (SEL *)&unk_2653BD000;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    char v22 = 0;
    goto LABEL_15;
  }

  char v22 = 1;
LABEL_15:
  uint64_t v23 = v5;
LABEL_18:
  while (1)
  {
    *(void *)(v0 + 184) = v23;
    *(void *)(v0 + 192) = v5;
    if ((v22 & 1) == 0) {
      break;
    }
    if (v23)
    {
      *(void *)(v0 + 80) = v23;
      id v25 = v23;
      if (swift_dynamicCast())
      {
        uint64_t v26 = *(void **)(v0 + 88);
        *(void *)(v0 + 200) = v26;
        id v27 = [v26 v9[359]];
        uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        if (*(void *)(v28 + 16) && (unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v29, v30), (v32 & 1) != 0))
        {
          outlined init with copy of Any(*(void *)(v28 + 56) + 32 * v31, v0 + 16);
        }
        else
        {
          *(_OWORD *)(v0 + 16) = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 40))
        {
          type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
          if (swift_dynamicCast())
          {
            uint64_t v35 = *(void *)(v0 + 104);
            *(void *)(v0 + 208) = v35;
            uint64_t v36 = (void *)swift_task_alloc();
            *(void *)(v0 + 216) = v36;
            *uint64_t v36 = v0;
            v36[1] = LACUIRatchetViewModel.showRatchetUI(for:);
            return LACUIRatchetViewModel.showUI(for:)(v35);
          }
        }
        else
        {

          outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 16, &demangling cache variable for type metadata for Any?);
        }
      }
    }

    char v22 = 0;
    uint64_t v23 = 0;
    id v5 = *(void **)(v0 + 192);
  }

  id v33 = *(uint64_t (**)(void *))(v0 + 8);
  return v33(v5);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 200);

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 192);
  *(void *)(v0 + 184) = 0;

  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  SEL *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _OWORD *v18;
  char v19;
  char v20;
  void *v21;
  long long v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t (*v31)(void *);
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(void **)(v0 + 184);
  uint64_t v3 = *(void **)(v0 + 192);

  id v4 = *(void **)(v0 + 224);
  *(void *)(v0 + 96) = v4;
  id v5 = v4;
  uint64_t v6 = v4;
  *(void *)(v0 + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *(void *)(v0 + 176) = type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
  id v7 = (SEL *)&unk_2653BD000;
  if (!swift_dynamicCast()) {
    goto LABEL_14;
  }
  id v8 = *(void *)(v0 + 144);
  uint64_t v35 = *(void *)(v0 + 152);
  uint64_t v9 = *(void **)(v0 + 112);
  uint64_t v10 = self;
  id v11 = v9;
  uint64_t v12 = (void *)_convertErrorToNSError(_:)();

  LOBYTE(v8) = objc_msgSend(v10, sel_error_hasCode_subcode_, v12, v8, v35);
  if ((v8 & 1) == 0)
  {

    uint64_t v20 = 0;
    char v21 = v4;
    id v7 = (SEL *)&unk_2653BD000;
    goto LABEL_18;
  }
  id v13 = objc_msgSend(v11, sel_userInfo);
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v14 + 16))
  {
    uint64_t v17 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    uint64_t v18 = (_OWORD *)(v0 + 48);
    if (v19)
    {
      outlined init with copy of Any(*(void *)(v14 + 56) + 32 * v17, v0 + 48);
      goto LABEL_10;
    }
    char v22 = 0uLL;
  }
  else
  {
    char v22 = 0uLL;
    uint64_t v18 = (_OWORD *)(v0 + 48);
  }
  void *v18 = v22;
  v18[1] = v22;
LABEL_10:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 72))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for Any?);
    id v7 = (SEL *)&unk_2653BD000;
    goto LABEL_14;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  id v7 = (SEL *)&unk_2653BD000;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    uint64_t v20 = 0;
    goto LABEL_15;
  }

  uint64_t v20 = 1;
LABEL_15:
  char v21 = v4;
LABEL_18:
  while (1)
  {
    *(void *)(v0 + 184) = v21;
    *(void *)(v0 + 192) = v4;
    if ((v20 & 1) == 0) {
      break;
    }
    if (v21)
    {
      *(void *)(v0 + 80) = v21;
      uint64_t v23 = v21;
      if (swift_dynamicCast())
      {
        long long v24 = *(void **)(v0 + 88);
        *(void *)(v0 + 200) = v24;
        id v25 = [v24 v7[359]];
        uint64_t v26 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        id v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        if (*(void *)(v26 + 16) && (uint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v28), (v30 & 1) != 0))
        {
          outlined init with copy of Any(*(void *)(v26 + 56) + 32 * v29, v0 + 16);
        }
        else
        {
          *(_OWORD *)(v0 + 16) = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 40))
        {
          type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
          if (swift_dynamicCast())
          {
            id v33 = *(void *)(v0 + 104);
            *(void *)(v0 + 208) = v33;
            uint64_t v34 = (void *)swift_task_alloc();
            *(void *)(v0 + 216) = v34;
            char *v34 = v0;
            v34[1] = LACUIRatchetViewModel.showRatchetUI(for:);
            return LACUIRatchetViewModel.showUI(for:)(v33);
          }
        }
        else
        {

          outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 16, &demangling cache variable for type metadata for Any?);
        }
      }
    }

    uint64_t v20 = 0;
    char v21 = 0;
    id v4 = *(void **)(v0 + 192);
  }

  unint64_t v31 = *(uint64_t (**)(void *))(v0 + 8);
  return v31(v4);
}

uint64_t LACUIRatchetViewModel.armIfPossible()()
{
  v1[30] = v0;
  uint64_t v2 = type metadata accessor for LACLogger();
  v1[31] = v2;
  v1[32] = *(void *)(v2 - 8);
  v1[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.armIfPossible(), 0, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 240)) + 0x178))();
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 224;
  *(void *)(v0 + 24) = LACUIRatchetViewModel.armIfPossible();
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 184) = MEMORY[0x263EF8330];
  *(void *)(v0 + 192) = 0x40000000;
  *(void *)(v0 + 200) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned LACDTORatchetState?, @unowned NSError?) -> () with result type LACDTORatchetState;
  *(void *)(v0 + 208) = &block_descriptor_115;
  *(void *)(v0 + 216) = v2;
  objc_msgSend(v1, sel_stateWithCompletion_, v0 + 184);
  return MEMORY[0x270FA23F0](v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 280) = v1;
  if (v1) {
    uint64_t v2 = LACUIRatchetViewModel.armIfPossible();
  }
  else {
    uint64_t v2 = LACUIRatchetViewModel.armIfPossible();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t inited;
  BOOL v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v25;
  uint64_t v26;

  uint64_t v2 = v0[33];
  uint64_t v1 = (void *)v0[34];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[32];
  id v5 = (void *)v0[30];
  uint64_t v6 = (void *)v0[28];
  v0[36] = v6;

  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(46);
  id v7 = objc_msgSend(v5, sel_description);
  id v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  id v25 = v8;
  v11._object = (void *)0x8000000255045EE0;
  v11._uint64_t countAndFlagsBits = 0xD00000000000002ALL;
  String.append(_:)(v11);
  uint64_t v12 = objc_msgSend(v6, sel_description);
  id v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = v14;

  v16._uint64_t countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = v25;
  v17._object = v10;
  LACLogger.log(_:)(v17);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if ((char *)objc_msgSend(v6, sel_rawValue) - 2 >= (char *)3)
  {

    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23(0);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_255043E40;
    v0[29] = *MEMORY[0x263F52408];
    AnyHashable.init<A>(_:)();
    unint64_t v19 = objc_msgSend(v6, sel_rawValue) == (id)3;
    *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 72) = v19;
    uint64_t v20 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    v0[37] = v20;
    char v21 = (void *)swift_task_alloc();
    v0[38] = v21;
    *char v21 = v0;
    v21[1] = LACUIRatchetViewModel.armIfPossible();
    char v22 = v0[30];
    v21[23] = v20;
    v21[24] = v22;
    return MEMORY[0x270FA2498](LACUIRatchetViewModel.arm(with:), 0, 0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = *(void *)(v0 + 320);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 272);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 288);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t LACUIRatchetViewModel.armIfPossible()(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 312) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = LACUIRatchetViewModel.armIfPossible();
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 320) = a1;
    id v5 = LACUIRatchetViewModel.armIfPossible();
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:), 0, 0);
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_255043E40;
  v0[15] = *MEMORY[0x263F523E0];
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  unint64_t v2 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  v0[19] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:);
  uint64_t v4 = v0[16];
  v3[23] = v2;
  v3[24] = v4;
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.arm(with:), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  (*(void (**)(void, void))(v0 + 136))(*(void *)(v0 + 176), 0);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  void *v0;
  void *v1;
  void (*v2)(void *, uint64_t);
  id v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = (void *)v0[21];
  unint64_t v2 = (void (*)(void *, uint64_t))v0[17];
  swift_bridgeObjectRelease();
  uint64_t v3 = v1;
  v2(v1, 1);

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 176) = a1;
    id v5 = closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
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
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
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

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned LACDTORatchetState?, @unowned NSError?) -> () with result type LACDTORatchetState(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
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

uint64_t closure #1 in LACUIRatchetViewModel.set(state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  type metadata accessor for LACUIRatchetViewModel.State(0);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.set(state:), 0, 0);
}

uint64_t closure #1 in LACUIRatchetViewModel.set(state:)()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 104) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.set(state:), v2, v1);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  swift_release();
  outlined init with copy of LACUIRatchetViewModel.State(v5, v1);
  uint64_t v6 = v4 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v6, v3);
  swift_beginAccess();
  outlined assign with copy of LACUIRatchetViewModel.State(v1, v6);
  swift_endAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v6, v2);
  LACUIRatchetViewModel.stateUpdated(from:to:)(v3, v2);
  outlined destroy of LACUIRatchetViewModel.State(v2, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIRatchetViewModel.State(v1, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIRatchetViewModel.State(v3, type metadata accessor for LACUIRatchetViewModel.State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t LACUIRatchetViewModel.setupContinuationAndWait()()
{
  *(void *)(v1 + 72) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  *(void *)(v1 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](LACUIRatchetViewModel.setupContinuationAndWait(), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 88) = v1;
  swift_unknownObjectWeakInit();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]?);
  *uint64_t v2 = v0;
  v2[1] = LACUIRatchetViewModel.setupContinuationAndWait();
  return MEMORY[0x270FA2360](v0 + 64, 0, 0, 0xD00000000000001ALL, 0x8000000255045E90, partial apply for closure #1 in LACUIRatchetViewModel.setupContinuationAndWait(), v1, v3);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = LACUIRatchetViewModel.setupContinuationAndWait();
  }
  else
  {
    swift_release();
    uint64_t v2 = LACUIRatchetViewModel.setupContinuationAndWait();
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
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  uint64_t v5 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined assign with take of Date?(v1, v5, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  swift_endAccess();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  swift_release();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  uint64_t v4 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined assign with take of Date?(v1, v4, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x25A2854F0](a2 + 16);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v6, a1, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    uint64_t v11 = (uint64_t)v8 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    outlined assign with take of Date?((uint64_t)v6, v11, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    swift_endAccess();
  }
}

uint64_t LACUIRatchetViewModel.beginDelayText.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(void *)&long long v12 = *MEMORY[0x263F523C0];
  AnyHashable.init<A>(_:)();
  if (*(void *)(v2 + 16) && (unint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v4 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v11);
  if (*((void *)&v13 + 1))
  {
    if (swift_dynamicCast()) {
      uint64_t v5 = v9;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v12, &demangling cache variable for type metadata for Any?);
    uint64_t v5 = 0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled) == 1)
  {
    uint64_t v10 = *MEMORY[0x263F523D8];
    AnyHashable.init<A>(_:)();
    if (*(void *)(v2 + 16) && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v7 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v6, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    outlined destroy of AnyHashable((uint64_t)v11);
    if (*((void *)&v13 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v5 = v10;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v12, &demangling cache variable for type metadata for Any?);
    }
  }
  return v5;
}

uint64_t LACUIRatchetViewModel.beginDelayLocationWarning.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(void *)&long long v7 = *MEMORY[0x263F523D0];
  AnyHashable.init<A>(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v2 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6), (v3 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v7);
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v6);
  if (*((void *)&v8 + 1))
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v5;
    }
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v7, &demangling cache variable for type metadata for Any?);
    return 0;
  }
  return result;
}

uint64_t LACUIRatchetViewModel.beginDelayTitle.getter(void *a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(void *)&long long v8 = *a1;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v2 + 16) && (unint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7), (v4 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v7);
  if (*((void *)&v9 + 1))
  {
    if (swift_dynamicCast()) {
      return v6;
    }
    else {
      return 0;
    }
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v8, &demangling cache variable for type metadata for Any?);
    return 0;
  }
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthCountdownItemConfiguration>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[56 * v8]) {
      memmove(v12, v13, 56 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
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
  long long v12 = v10 + 32;
  long long v13 = a4 + 32;
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

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Task<(), Never>>);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<(), Never>);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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
      char v7 = MEMORY[0x25A284A80](v9, a1);
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
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = a2 + 40;
  outlined init with copy of AnyHashable(a1, a2);
  return outlined init with copy of Any(v2, v3);
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v39 = a1;
  uint64_t v40 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v41 = v8;
  uint64_t v42 = 0;
  uint64_t v43 = v11 & v9;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  specialized LazyMapSequence.Iterator.next()((uint64_t)&v35);
  if (!*((void *)&v36 + 1))
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    outlined consume of [AnyHashable : Any].Iterator._Variant();
    return swift_release();
  }
  while (1)
  {
    long long v32 = v35;
    long long v33 = v36;
    uint64_t v34 = v37;
    outlined init with take of Any(&v38, v31);
    uint64_t v13 = *a5;
    unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v32);
    uint64_t v16 = *(void *)(v13 + 16);
    BOOL v17 = (v14 & 1) == 0;
    uint64_t v18 = v16 + v17;
    if (__OFADD__(v16, v17)) {
      break;
    }
    char v19 = v14;
    if (*(void *)(v13 + 24) >= v18)
    {
      if (a4)
      {
        if (v14) {
          goto LABEL_6;
        }
      }
      else
      {
        specialized _NativeDictionary.copy()();
        if (v19) {
          goto LABEL_6;
        }
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
      unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v32);
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_22;
      }
      unint64_t v15 = v20;
      if (v19)
      {
LABEL_6:
        outlined init with copy of Any((uint64_t)v31, (uint64_t)v30);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
        outlined destroy of AnyHashable((uint64_t)&v32);
        uint64_t v12 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v15);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
        outlined init with take of Any(v30, v12);
        goto LABEL_7;
      }
    }
    char v22 = (void *)*a5;
    *(void *)(*a5 + 8 * (v15 >> 6) + 64) |= 1 << v15;
    uint64_t v23 = v22[6] + 40 * v15;
    long long v24 = v32;
    long long v25 = v33;
    *(void *)(v23 + 32) = v34;
    *(_OWORD *)uint64_t v23 = v24;
    *(_OWORD *)(v23 + 16) = v25;
    outlined init with take of Any(v31, (_OWORD *)(v22[7] + 32 * v15));
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_21;
    }
    v22[2] = v28;
LABEL_7:
    specialized LazyMapSequence.Iterator.next()((uint64_t)&v35);
    a4 = 1;
    if (!*((void *)&v36 + 1)) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    char v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      outlined init with take of Any((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      outlined init with copy of AnyHashable(v25, (uint64_t)&v38);
      outlined init with copy of Any(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)outlined init with take of Any(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    outlined init with copy of Any(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = outlined init with take of Any(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a3 & 1);
    unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      outlined init with copy of AnyHashable(a2, (uint64_t)v21);
      return specialized _NativeDictionary._insert(at:key:value:)(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return outlined init with take of Any(a1, v17);
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t specialized LazyMapSequence.Iterator.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    outlined init with copy of AnyHashable(*(void *)(v3 + 48) + 40 * v10, (uint64_t)v25);
    outlined init with copy of Any(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v25[2] + 8);
    goto LABEL_23;
  }
  int64_t v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    unint64_t v13 = *(void *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      uint64_t v9 = (v13 - 1) & v13;
      unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
      int64_t v7 = v11;
      goto LABEL_3;
    }
    int64_t v14 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        int64_t v11 = v14;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        unint64_t v13 = *(void *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          int64_t v11 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v14 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          unint64_t v13 = *(void *)(v4 + 8 * v14);
          if (v13) {
            goto LABEL_10;
          }
          int64_t v11 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            unint64_t v13 = *(void *)(v4 + 8 * v11);
            if (v13) {
              goto LABEL_7;
            }
            int64_t v7 = v12 - 1;
            int64_t v15 = v5 + 6;
            while (v12 != v15)
            {
              unint64_t v13 = *(void *)(v4 + 8 * v15++);
              if (v13)
              {
                int64_t v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v16 = (void (*)(_OWORD *))v1[5];
  uint64_t result = outlined init with take of (key: AnyHashable, value: Any)?((uint64_t)v25, (uint64_t)&v20);
  if (*((void *)&v21 + 1))
  {
    v18[2] = v22;
    v18[3] = v23;
    uint64_t v19 = v24;
    v18[0] = v20;
    v18[1] = v21;
    v16(v18);
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for (key: AnyHashable, value: Any));
  }
  else
  {
    *(void *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t specialized static LACUIRatchetViewModel.State.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  uint64_t v2 = type metadata accessor for LACUIRatchetViewModel.State(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  int64_t v5 = (uint64_t *)((char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  unint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  int64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  int64_t v14 = (char *)&v50 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (LACUIRatchetViewModel.State, LACUIRatchetViewModel.State));
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  long long v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (uint64_t *)((char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (uint64_t *)((char *)&v50 - v25);
  long long v27 = &v20[*(int *)(v18 + 56)];
  outlined init with copy of LACUIRatchetViewModel.State(v50, (uint64_t)v20);
  outlined init with copy of LACUIRatchetViewModel.State(v51, (uint64_t)v27);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v20, (uint64_t)v8);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        int64_t v11 = v8;
        goto LABEL_24;
      }
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_22;
    case 2u:
      outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v20, (uint64_t)v14);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        int64_t v11 = v14;
        goto LABEL_24;
      }
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_22;
    case 3u:
      outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v20, (uint64_t)v11);
      if (swift_getEnumCaseMultiPayload() == 3) {
        goto LABEL_24;
      }
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_22;
    case 4u:
      outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v20, (uint64_t)v5);
      uint64_t v29 = *v5;
      uint64_t v28 = (void *)v5[1];
      if (swift_getEnumCaseMultiPayload() != 4)
      {

        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v30 = *(void *)v27;
      char v31 = (void *)*((void *)v27 + 1);
      if (v29)
      {
        uint64_t v32 = Dictionary.description.getter();
        uint64_t v34 = v33;
        swift_bridgeObjectRelease();
        if (!v30)
        {
          if (!v34) {
            goto LABEL_40;
          }
          goto LABEL_37;
        }
      }
      else
      {
        if (!v30) {
          goto LABEL_40;
        }
        uint64_t v34 = 0;
        uint64_t v32 = 0;
      }
      uint64_t v38 = Dictionary.description.getter();
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      if (!v34)
      {
        if (!v40) {
          goto LABEL_40;
        }
        goto LABEL_37;
      }
      if (!v40)
      {
LABEL_37:
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
      if (v32 == v38 && v34 == v40)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
      char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v42 & 1) == 0)
      {
LABEL_38:

LABEL_58:
        char v35 = 0;
        goto LABEL_59;
      }
LABEL_40:
      if (v28)
      {
        id v53 = v28;
        id v43 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
        if (swift_dynamicCast()) {
          uint64_t v44 = v52;
        }
        else {
          uint64_t v44 = 0;
        }
        if (!v31)
        {
          if (v44)
          {
            char v31 = 0;
            uint64_t v44 = v52;
LABEL_54:
            id v48 = v44;

            goto LABEL_58;
          }
          uint64_t v45 = 0;
          goto LABEL_56;
        }
      }
      else
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if (!v31) {
          goto LABEL_56;
        }
      }
      id v53 = v31;
      id v46 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
      if (swift_dynamicCast()) {
        uint64_t v45 = v52;
      }
      else {
        uint64_t v45 = 0;
      }
      if (v44)
      {
        if (v45)
        {
          id v47 = v44;
          char v35 = static NSObject.== infix(_:_:)();

          goto LABEL_59;
        }
        goto LABEL_54;
      }
LABEL_56:

      if (v45)
      {

        goto LABEL_58;
      }
      char v35 = 1;
LABEL_59:
      uint64_t v37 = type metadata accessor for LACUIRatchetViewModel.State;
      uint64_t v36 = (uint64_t)v20;
LABEL_60:
      outlined destroy of LACUIRatchetViewModel.State(v36, v37);
      return v35 & 1;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_22;
      }
      goto LABEL_18;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_22;
      }
LABEL_18:
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v20, type metadata accessor for LACUIRatchetViewModel.State);
      char v35 = 1;
      return v35 & 1;
    default:
      outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v20, (uint64_t)v16);
      if (!swift_getEnumCaseMultiPayload())
      {
        int64_t v11 = v16;
LABEL_24:
        outlined init with take of LACUIRatchetViewModel.State((uint64_t)v11, (uint64_t)v26, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
        outlined init with take of LACUIRatchetViewModel.State((uint64_t)v27, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
        outlined destroy of LACUIRatchetViewModel.State((uint64_t)v20, type metadata accessor for LACUIRatchetViewModel.State);
        char v35 = specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(v26, v24);
        outlined destroy of LACUIRatchetViewModel.State((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
        uint64_t v36 = (uint64_t)v26;
        uint64_t v37 = (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration;
        goto LABEL_60;
      }
      outlined destroy of LACUIRatchetViewModel.State((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
LABEL_22:
      outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v20, (uint64_t *)&demangling cache variable for type metadata for (LACUIRatchetViewModel.State, LACUIRatchetViewModel.State));
      char v35 = 0;
      return v35 & 1;
  }
}

uint64_t outlined init with copy of LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LACUIRatchetViewModel.State(uint64_t a1)
{
  return type metadata accessor for LACUIRatchetViewModel.State(a1, type metadata singleton initialization cache for LACUIRatchetViewModel.State);
}

id specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  char v8 = *((unsigned char *)a3 + 16);
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated] = 0;
  type metadata accessor for LACUIRatchetViewModel.State(0);
  swift_storeEnumTagMultiPayload();
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject] = 0;
  uint64_t v9 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier];
  *uint64_t v9 = 0;
  v9[1] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks] = MEMORY[0x263F8EE78];
  uint64_t v10 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate];
  uint64_t v13 = type metadata accessor for Date();
  int64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate], 1, 1, v13);
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled] = 0;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options] = a2;
  uint64_t v15 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration];
  *(void *)uint64_t v15 = v6;
  *((void *)v15 + 1) = v7;
  v15[16] = v8;
  *(void *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_contextProvider] = a1;
  id v16 = objc_allocWithZone(MEMORY[0x263F52430]);
  uint64_t v17 = v3;
  swift_unknownObjectRetain();
  id v18 = objc_msgSend(v16, sel_initWithContextProvider_, a1);
  *(void *)&v17[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager] = v18;

  v20.receiver = v17;
  v20.super_class = (Class)type metadata accessor for LACUIRatchetViewModel(0);
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t type metadata accessor for LACUIRatchetViewModel(uint64_t a1)
{
  return type metadata accessor for LACUIRatchetViewModel.State(a1, (uint64_t *)&type metadata singleton initialization cache for LACUIRatchetViewModel);
}

uint64_t type metadata accessor for LACUIRatchetViewModel.State(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255022E30()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.start()(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.start()(a1, v4, v5, v6);
}

uint64_t sub_255022F24()
{
  return objectdestroy_3Tm(MEMORY[0x263F8EEA0], 57);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void **)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(unsigned __int8 *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)(a1, v4, v5, v6, v7, v8, v9);
}

id specialized static LACUIRatchetViewModel.mapError(_:)(void *a1)
{
  uint64_t v2 = type metadata accessor for CancellationError();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v6 = a1;
    uint64_t v7 = (void *)_convertErrorToNSError(_:)();
    id v8 = objc_msgSend(v7, sel_domain);

    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    if (v9 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v11 == v12)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        v23[1] = a1;
        id v15 = a1;
        id v16 = a1;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        if (swift_dynamicCast())
        {
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          id v17 = objc_msgSend(self, sel_errorWithCode_, *MEMORY[0x263F52340]);
        }
        else
        {
          id v17 = a1;
        }
        id v18 = self;
        uint64_t v19 = *MEMORY[0x263F52328];
        objc_super v20 = (void *)_convertErrorToNSError(_:)();
        id v21 = objc_msgSend(v18, sel_errorWithCode_underlyingError_, v19, v20);

        return v21;
      }
    }
  }
  return a1;
}

uint64_t sub_255023270()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(a1, v4, v5, v7, v6);
}

uint64_t outlined copy of LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.set(state:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for LACUIRatchetViewModel.State(0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.set(state:)(a1, v5, v6, v7, v8);
}

uint64_t sub_2550234BC@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xE0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25502351C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
}

uint64_t sub_255023528(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xF8))();
}

uint64_t sub_255023580@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x110))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_2550235E8(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
}

uint64_t keypath_setTm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

uint64_t sub_255023640@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x178))();
  *a2 = result;
  return result;
}

uint64_t sub_2550236A4(id *a1, void **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x180))(*a1);
}

uint64_t ObjC metadata update function for LACUIRatchetViewModel()
{
  return type metadata accessor for LACUIRatchetViewModel(0);
}

void type metadata completion function for LACUIRatchetViewModel()
{
  type metadata accessor for LACUIRatchetViewModel.State(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for CheckedContinuation<[AnyHashable : Any]?, Error>?();
    if (v1 <= 0x3F)
    {
      type metadata accessor for Date?();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for LACUIRatchetViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIRatchetViewModel);
}

uint64_t dispatch thunk of LACUIRatchetViewModel.statePublisher.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.learnMorePublisher.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.isInvalidated.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.isRunning.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.__allocating_init(contextProvider:options:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 544))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.stop(withReason:invalidate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)((*MEMORY[0x263F8EED0] & *v3) + 0x238);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v11(a1, a2, a3);
}

uint64_t dispatch thunk of static LACUIRatchetViewModel.mapError(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 576))();
}

void type metadata accessor for Date?()
{
  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for LACUIRatchetViewModel.State(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = *a2;
        uint64_t v8 = a2[1];
        char v9 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v7;
        a1[1] = v8;
        *((unsigned char *)a1 + 16) = v9;
        uint64_t v10 = a2[4];
        a1[3] = a2[3];
        a1[4] = v10;
        uint64_t v11 = a2[6];
        a1[5] = a2[5];
        a1[6] = v11;
        uint64_t v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v13 = v12[7];
        __dst = (void *)((char *)a1 + v13);
        char v14 = (void *)((char *)a2 + v13);
        uint64_t v15 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v109 = *(void *)(v15 - 8);
        id v16 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v109 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v16(v14, 1, v15))
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dst, v14, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          uint64_t v53 = v14[1];
          void *__dst = *v14;
          __dst[1] = v53;
          uint64_t v54 = *(int *)(v15 + 20);
          v101 = (char *)v14 + v54;
          v105 = (char *)__dst + v54;
          uint64_t v55 = type metadata accessor for Date();
          v97 = *(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16);
          swift_bridgeObjectRetain();
          v97(v105, v101, v55);
          uint64_t v56 = *(int *)(v15 + 24);
          uint64_t v57 = (void *)((char *)__dst + v56);
          uint64_t v58 = (void *)((char *)v14 + v56);
          uint64_t v59 = v58[1];
          *uint64_t v57 = *v58;
          v57[1] = v59;
          uint64_t v60 = *(void (**)(void *, void, uint64_t, uint64_t))(v109 + 56);
          swift_bridgeObjectRetain();
          v60(__dst, 0, 1, v15);
        }
        *(void *)((char *)a1 + v12[8]) = *(void *)((char *)a2 + v12[8]);
        *(void *)((char *)a1 + v12[9]) = *(void *)((char *)a2 + v12[9]);
        uint64_t v61 = v12[10];
        uint64_t v62 = (char *)a1 + v61;
        uint64_t v63 = (char *)a2 + v61;
        uint64_t v64 = *(void *)((char *)a2 + v61 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v64) {
          goto LABEL_26;
        }
        long long v93 = *((_OWORD *)v63 + 1);
        *(_OWORD *)uint64_t v62 = *(_OWORD *)v63;
        *((_OWORD *)v62 + 1) = v93;
        v62[32] = v63[32];
        goto LABEL_31;
      case 1u:
        uint64_t v20 = *a2;
        uint64_t v21 = a2[1];
        char v22 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v20;
        a1[1] = v21;
        *((unsigned char *)a1 + 16) = v22;
        uint64_t v23 = a2[4];
        a1[3] = a2[3];
        a1[4] = v23;
        uint64_t v24 = a2[6];
        a1[5] = a2[5];
        a1[6] = v24;
        uint64_t v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v25 = v12[7];
        __dsta = (void *)((char *)a1 + v25);
        uint64_t v26 = (void *)((char *)a2 + v25);
        uint64_t v27 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v110 = *(void *)(v27 - 8);
        uint64_t v28 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v110 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v28(v26, 1, v27))
        {
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dsta, v26, *(void *)(*(void *)(v29 - 8) + 64));
        }
        else
        {
          uint64_t v65 = v26[1];
          void *__dsta = *v26;
          __dsta[1] = v65;
          uint64_t v66 = *(int *)(v27 + 20);
          uint64_t v102 = (char *)v26 + v66;
          uint64_t v106 = (char *)__dsta + v66;
          uint64_t v67 = type metadata accessor for Date();
          v98 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 16);
          swift_bridgeObjectRetain();
          v98(v106, v102, v67);
          uint64_t v68 = *(int *)(v27 + 24);
          uint64_t v69 = (void *)((char *)__dsta + v68);
          uint64_t v70 = (void *)((char *)v26 + v68);
          uint64_t v71 = v70[1];
          *uint64_t v69 = *v70;
          v69[1] = v71;
          uint64_t v72 = *(void (**)(void *, void, uint64_t, uint64_t))(v110 + 56);
          swift_bridgeObjectRetain();
          v72(__dsta, 0, 1, v27);
        }
        *(void *)((char *)a1 + v12[8]) = *(void *)((char *)a2 + v12[8]);
        *(void *)((char *)a1 + v12[9]) = *(void *)((char *)a2 + v12[9]);
        uint64_t v73 = v12[10];
        uint64_t v62 = (char *)a1 + v73;
        uint64_t v63 = (char *)a2 + v73;
        uint64_t v64 = *(void *)((char *)a2 + v73 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v64) {
          goto LABEL_26;
        }
        long long v94 = *((_OWORD *)v63 + 1);
        *(_OWORD *)uint64_t v62 = *(_OWORD *)v63;
        *((_OWORD *)v62 + 1) = v94;
        v62[32] = v63[32];
        goto LABEL_31;
      case 2u:
        uint64_t v30 = *a2;
        uint64_t v31 = a2[1];
        char v32 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v30;
        a1[1] = v31;
        *((unsigned char *)a1 + 16) = v32;
        uint64_t v33 = a2[4];
        a1[3] = a2[3];
        a1[4] = v33;
        uint64_t v34 = a2[6];
        a1[5] = a2[5];
        a1[6] = v34;
        uint64_t v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v35 = v12[7];
        __dstb = (void *)((char *)a1 + v35);
        uint64_t v36 = (void *)((char *)a2 + v35);
        uint64_t v37 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v111 = *(void *)(v37 - 8);
        uint64_t v38 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v111 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v38(v36, 1, v37))
        {
          uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dstb, v36, *(void *)(*(void *)(v39 - 8) + 64));
        }
        else
        {
          uint64_t v74 = v36[1];
          void *__dstb = *v36;
          __dstb[1] = v74;
          uint64_t v75 = *(int *)(v37 + 20);
          uint64_t v103 = (char *)v36 + v75;
          uint64_t v107 = (char *)__dstb + v75;
          uint64_t v76 = type metadata accessor for Date();
          v99 = *(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16);
          swift_bridgeObjectRetain();
          v99(v107, v103, v76);
          uint64_t v77 = *(int *)(v37 + 24);
          v78 = (void *)((char *)__dstb + v77);
          uint64_t v79 = (void *)((char *)v36 + v77);
          uint64_t v80 = v79[1];
          void *v78 = *v79;
          v78[1] = v80;
          uint64_t v81 = *(void (**)(void *, void, uint64_t, uint64_t))(v111 + 56);
          swift_bridgeObjectRetain();
          v81(__dstb, 0, 1, v37);
        }
        *(void *)((char *)a1 + v12[8]) = *(void *)((char *)a2 + v12[8]);
        *(void *)((char *)a1 + v12[9]) = *(void *)((char *)a2 + v12[9]);
        uint64_t v82 = v12[10];
        uint64_t v62 = (char *)a1 + v82;
        uint64_t v63 = (char *)a2 + v82;
        uint64_t v64 = *(void *)((char *)a2 + v82 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v64) {
          goto LABEL_26;
        }
        long long v95 = *((_OWORD *)v63 + 1);
        *(_OWORD *)uint64_t v62 = *(_OWORD *)v63;
        *((_OWORD *)v62 + 1) = v95;
        v62[32] = v63[32];
        goto LABEL_31;
      case 3u:
        uint64_t v40 = *a2;
        uint64_t v41 = a2[1];
        char v42 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v40;
        a1[1] = v41;
        *((unsigned char *)a1 + 16) = v42;
        uint64_t v43 = a2[4];
        a1[3] = a2[3];
        a1[4] = v43;
        uint64_t v44 = a2[6];
        a1[5] = a2[5];
        a1[6] = v44;
        uint64_t v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v45 = v12[7];
        __dstc = (void *)((char *)a1 + v45);
        id v46 = (void *)((char *)a2 + v45);
        uint64_t v47 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v112 = *(void *)(v47 - 8);
        id v48 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v112 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v48(v46, 1, v47))
        {
          uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dstc, v46, *(void *)(*(void *)(v49 - 8) + 64));
        }
        else
        {
          uint64_t v83 = v46[1];
          void *__dstc = *v46;
          __dstc[1] = v83;
          uint64_t v84 = *(int *)(v47 + 20);
          char v104 = (char *)v46 + v84;
          char v108 = (char *)__dstc + v84;
          uint64_t v85 = type metadata accessor for Date();
          char v100 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
          swift_bridgeObjectRetain();
          v100(v108, v104, v85);
          uint64_t v86 = *(int *)(v47 + 24);
          uint64_t v87 = (void *)((char *)__dstc + v86);
          char v88 = (void *)((char *)v46 + v86);
          uint64_t v89 = v88[1];
          *uint64_t v87 = *v88;
          v87[1] = v89;
          v90 = *(void (**)(void *, void, uint64_t, uint64_t))(v112 + 56);
          swift_bridgeObjectRetain();
          v90(__dstc, 0, 1, v47);
        }
        *(void *)((char *)a1 + v12[8]) = *(void *)((char *)a2 + v12[8]);
        *(void *)((char *)a1 + v12[9]) = *(void *)((char *)a2 + v12[9]);
        uint64_t v91 = v12[10];
        uint64_t v62 = (char *)a1 + v91;
        uint64_t v63 = (char *)a2 + v91;
        uint64_t v64 = *(void *)((char *)a2 + v91 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v64)
        {
LABEL_26:
          *(void *)uint64_t v62 = *(void *)v63;
          *((void *)v62 + 1) = v64;
          uint64_t v92 = *((void *)v63 + 3);
          *((void *)v62 + 2) = *((void *)v63 + 2);
          *((void *)v62 + 3) = v92;
          v62[32] = v63[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v96 = *((_OWORD *)v63 + 1);
          *(_OWORD *)uint64_t v62 = *(_OWORD *)v63;
          *((_OWORD *)v62 + 1) = v96;
          v62[32] = v63[32];
        }
LABEL_31:
        *((unsigned char *)a1 + v12[11]) = *((unsigned char *)a2 + v12[11]);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v50 = *a2;
        uint64_t v51 = (void *)a2[1];
        *a1 = v50;
        swift_bridgeObjectRetain();
        id v52 = v51;
        a1[1] = v51;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void destroy for LACUIRatchetViewModel.State(uint64_t a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
      outlined consume of LACUIAuthImageConfiguration();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v3 = a1 + *(int *)(v2 + 28);
      uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v3 + *(int *)(v4 + 20);
        uint64_t v6 = type metadata accessor for Date();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(a1 + *(int *)(v2 + 40) + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 4u:
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void **)(a1 + 8);

      break;
    default:
      return;
  }
}

void *initializeWithCopy for LACUIRatchetViewModel.State(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = *a2;
      uint64_t v7 = a2[1];
      char v8 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v6;
      a1[1] = v7;
      *((unsigned char *)a1 + 16) = v8;
      uint64_t v9 = a2[4];
      a1[3] = a2[3];
      a1[4] = v9;
      uint64_t v10 = a2[6];
      a1[5] = a2[5];
      a1[6] = v10;
      uint64_t v11 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v12 = v11[7];
      __dst = (void *)((char *)a1 + v12);
      uint64_t v13 = (void *)((char *)a2 + v12);
      uint64_t v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v15 = *(void *)(v14 - 8);
      id v16 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v16(v13, 1, v14))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        uint64_t v57 = v13[1];
        void *__dst = *v13;
        __dst[1] = v57;
        uint64_t v58 = *(int *)(v14 + 20);
        long long v118 = (char *)v13 + v58;
        v122 = (char *)__dst + v58;
        uint64_t v59 = type metadata accessor for Date();
        char v114 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 16);
        swift_bridgeObjectRetain();
        v114(v122, v118, v59);
        uint64_t v60 = *(int *)(v14 + 24);
        uint64_t v61 = (void *)((char *)__dst + v60);
        uint64_t v62 = (void *)((char *)v13 + v60);
        uint64_t v63 = v62[1];
        *uint64_t v61 = *v62;
        v61[1] = v63;
        uint64_t v64 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
        swift_bridgeObjectRetain();
        v64(__dst, 0, 1, v14);
      }
      *(void *)((char *)a1 + v11[8]) = *(void *)((char *)a2 + v11[8]);
      *(void *)((char *)a1 + v11[9]) = *(void *)((char *)a2 + v11[9]);
      uint64_t v65 = v11[10];
      uint64_t v66 = (char *)a1 + v65;
      uint64_t v67 = (char *)a2 + v65;
      uint64_t v68 = *(void *)((char *)a2 + v65 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v68)
      {
        *(void *)uint64_t v66 = *(void *)v67;
        *((void *)v66 + 1) = v68;
        uint64_t v69 = *((void *)v67 + 3);
        *((void *)v66 + 2) = *((void *)v67 + 2);
        *((void *)v66 + 3) = v69;
        v66[32] = v67[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v109 = *((_OWORD *)v67 + 1);
        *(_OWORD *)uint64_t v66 = *(_OWORD *)v67;
        *((_OWORD *)v66 + 1) = v109;
        v66[32] = v67[32];
      }
      *((unsigned char *)a1 + v11[11]) = *((unsigned char *)a2 + v11[11]);
      goto LABEL_32;
    case 1u:
      uint64_t v18 = *a2;
      uint64_t v19 = a2[1];
      char v20 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v18;
      a1[1] = v19;
      *((unsigned char *)a1 + 16) = v20;
      uint64_t v21 = a2[4];
      a1[3] = a2[3];
      a1[4] = v21;
      uint64_t v22 = a2[6];
      a1[5] = a2[5];
      a1[6] = v22;
      uint64_t v23 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v24 = v23[7];
      __dsta = (void *)((char *)a1 + v24);
      uint64_t v25 = (void *)((char *)a2 + v24);
      uint64_t v26 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v27 = *(void *)(v26 - 8);
      uint64_t v28 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v27 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v28(v25, 1, v26))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dsta, v25, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        uint64_t v70 = v25[1];
        void *__dsta = *v25;
        __dsta[1] = v70;
        uint64_t v71 = *(int *)(v26 + 20);
        long long v119 = (char *)v25 + v71;
        v123 = (char *)__dsta + v71;
        uint64_t v72 = type metadata accessor for Date();
        v115 = *(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 16);
        swift_bridgeObjectRetain();
        v115(v123, v119, v72);
        uint64_t v73 = *(int *)(v26 + 24);
        uint64_t v74 = (void *)((char *)__dsta + v73);
        uint64_t v75 = (void *)((char *)v25 + v73);
        uint64_t v76 = v75[1];
        *uint64_t v74 = *v75;
        v74[1] = v76;
        uint64_t v77 = *(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56);
        swift_bridgeObjectRetain();
        v77(__dsta, 0, 1, v26);
      }
      *(void *)((char *)a1 + v23[8]) = *(void *)((char *)a2 + v23[8]);
      *(void *)((char *)a1 + v23[9]) = *(void *)((char *)a2 + v23[9]);
      uint64_t v78 = v23[10];
      uint64_t v79 = (char *)a1 + v78;
      uint64_t v80 = (char *)a2 + v78;
      uint64_t v81 = *(void *)((char *)a2 + v78 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v81)
      {
        *(void *)uint64_t v79 = *(void *)v80;
        *((void *)v79 + 1) = v81;
        uint64_t v82 = *((void *)v80 + 3);
        *((void *)v79 + 2) = *((void *)v80 + 2);
        *((void *)v79 + 3) = v82;
        v79[32] = v80[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v110 = *((_OWORD *)v80 + 1);
        *(_OWORD *)uint64_t v79 = *(_OWORD *)v80;
        *((_OWORD *)v79 + 1) = v110;
        v79[32] = v80[32];
      }
      *((unsigned char *)a1 + v23[11]) = *((unsigned char *)a2 + v23[11]);
      goto LABEL_32;
    case 2u:
      uint64_t v30 = *a2;
      uint64_t v31 = a2[1];
      char v32 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v30;
      a1[1] = v31;
      *((unsigned char *)a1 + 16) = v32;
      uint64_t v33 = a2[4];
      a1[3] = a2[3];
      a1[4] = v33;
      uint64_t v34 = a2[6];
      a1[5] = a2[5];
      a1[6] = v34;
      uint64_t v35 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v36 = v35[7];
      __dstb = (void *)((char *)a1 + v36);
      uint64_t v37 = (void *)((char *)a2 + v36);
      uint64_t v38 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v39 = *(void *)(v38 - 8);
      uint64_t v40 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v39 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v40(v37, 1, v38))
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dstb, v37, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        uint64_t v83 = v37[1];
        void *__dstb = *v37;
        __dstb[1] = v83;
        uint64_t v84 = *(int *)(v38 + 20);
        char v120 = (char *)v37 + v84;
        v124 = (char *)__dstb + v84;
        uint64_t v85 = type metadata accessor for Date();
        char v116 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
        swift_bridgeObjectRetain();
        v116(v124, v120, v85);
        uint64_t v86 = *(int *)(v38 + 24);
        uint64_t v87 = (void *)((char *)__dstb + v86);
        char v88 = (void *)((char *)v37 + v86);
        uint64_t v89 = v88[1];
        *uint64_t v87 = *v88;
        v87[1] = v89;
        v90 = *(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56);
        swift_bridgeObjectRetain();
        v90(__dstb, 0, 1, v38);
      }
      *(void *)((char *)a1 + v35[8]) = *(void *)((char *)a2 + v35[8]);
      *(void *)((char *)a1 + v35[9]) = *(void *)((char *)a2 + v35[9]);
      uint64_t v91 = v35[10];
      uint64_t v92 = (char *)a1 + v91;
      long long v93 = (char *)a2 + v91;
      uint64_t v94 = *(void *)((char *)a2 + v91 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v94)
      {
        *(void *)uint64_t v92 = *(void *)v93;
        *((void *)v92 + 1) = v94;
        uint64_t v95 = *((void *)v93 + 3);
        *((void *)v92 + 2) = *((void *)v93 + 2);
        *((void *)v92 + 3) = v95;
        v92[32] = v93[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v111 = *((_OWORD *)v93 + 1);
        *(_OWORD *)uint64_t v92 = *(_OWORD *)v93;
        *((_OWORD *)v92 + 1) = v111;
        v92[32] = v93[32];
      }
      *((unsigned char *)a1 + v35[11]) = *((unsigned char *)a2 + v35[11]);
      goto LABEL_32;
    case 3u:
      uint64_t v42 = *a2;
      uint64_t v43 = a2[1];
      char v44 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v42;
      a1[1] = v43;
      *((unsigned char *)a1 + 16) = v44;
      uint64_t v45 = a2[4];
      a1[3] = a2[3];
      a1[4] = v45;
      uint64_t v46 = a2[6];
      a1[5] = a2[5];
      a1[6] = v46;
      uint64_t v47 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v48 = v47[7];
      __dstc = (void *)((char *)a1 + v48);
      uint64_t v49 = (void *)((char *)a2 + v48);
      uint64_t v50 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v51 = *(void *)(v50 - 8);
      id v52 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v51 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v52(v49, 1, v50))
      {
        uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dstc, v49, *(void *)(*(void *)(v53 - 8) + 64));
      }
      else
      {
        uint64_t v96 = v49[1];
        void *__dstc = *v49;
        __dstc[1] = v96;
        uint64_t v97 = *(int *)(v50 + 20);
        v121 = (char *)v49 + v97;
        v125 = (char *)__dstc + v97;
        uint64_t v98 = type metadata accessor for Date();
        v117 = *(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 16);
        swift_bridgeObjectRetain();
        v117(v125, v121, v98);
        uint64_t v99 = *(int *)(v50 + 24);
        char v100 = (void *)((char *)__dstc + v99);
        v101 = (void *)((char *)v49 + v99);
        uint64_t v102 = v101[1];
        *char v100 = *v101;
        v100[1] = v102;
        uint64_t v103 = *(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56);
        swift_bridgeObjectRetain();
        v103(__dstc, 0, 1, v50);
      }
      *(void *)((char *)a1 + v47[8]) = *(void *)((char *)a2 + v47[8]);
      *(void *)((char *)a1 + v47[9]) = *(void *)((char *)a2 + v47[9]);
      uint64_t v104 = v47[10];
      v105 = (char *)a1 + v104;
      uint64_t v106 = (char *)a2 + v104;
      uint64_t v107 = *(void *)((char *)a2 + v104 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v107)
      {
        *(void *)v105 = *(void *)v106;
        *((void *)v105 + 1) = v107;
        uint64_t v108 = *((void *)v106 + 3);
        *((void *)v105 + 2) = *((void *)v106 + 2);
        *((void *)v105 + 3) = v108;
        v105[32] = v106[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v112 = *((_OWORD *)v106 + 1);
        *(_OWORD *)v105 = *(_OWORD *)v106;
        *((_OWORD *)v105 + 1) = v112;
        v105[32] = v106[32];
      }
      *((unsigned char *)a1 + v47[11]) = *((unsigned char *)a2 + v47[11]);
      goto LABEL_32;
    case 4u:
      uint64_t v54 = *a2;
      uint64_t v55 = (void *)a2[1];
      *a1 = v54;
      swift_bridgeObjectRetain();
      id v56 = v55;
      a1[1] = v55;
LABEL_32:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for LACUIRatchetViewModel.State(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of LACUIRatchetViewModel.State((uint64_t)a1, type metadata accessor for LACUIRatchetViewModel.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = *a2;
        uint64_t v7 = a2[1];
        char v8 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v6;
        a1[1] = v7;
        *((unsigned char *)a1 + 16) = v8;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        uint64_t v9 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v10 = v9[7];
        __dst = (void *)((char *)a1 + v10);
        uint64_t v11 = (void *)((char *)a2 + v10);
        uint64_t v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v13 = *(void *)(v12 - 8);
        uint64_t v14 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v14(v11, 1, v12))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          void *__dst = *v11;
          __dst[1] = v11[1];
          uint64_t v48 = *(int *)(v12 + 20);
          v101 = (char *)v11 + v48;
          v105 = (char *)__dst + v48;
          uint64_t v49 = type metadata accessor for Date();
          uint64_t v97 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16);
          swift_bridgeObjectRetain();
          v97(v105, v101, v49);
          uint64_t v50 = *(int *)(v12 + 24);
          uint64_t v51 = (void *)((char *)__dst + v50);
          id v52 = (void *)((char *)v11 + v50);
          *uint64_t v51 = *v52;
          v51[1] = v52[1];
          uint64_t v53 = *(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56);
          swift_bridgeObjectRetain();
          v53(__dst, 0, 1, v12);
        }
        *(void *)((char *)a1 + v9[8]) = *(void *)((char *)a2 + v9[8]);
        *(void *)((char *)a1 + v9[9]) = *(void *)((char *)a2 + v9[9]);
        uint64_t v54 = v9[10];
        uint64_t v55 = (char *)a1 + v54;
        id v56 = (char *)a2 + v54;
        uint64_t v57 = *(void *)((char *)a2 + v54 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v57)
        {
          *(void *)uint64_t v55 = *(void *)v56;
          *((void *)v55 + 1) = *((void *)v56 + 1);
          *((void *)v55 + 2) = *((void *)v56 + 2);
          *((void *)v55 + 3) = *((void *)v56 + 3);
          v55[32] = v56[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v88 = *(_OWORD *)v56;
          long long v89 = *((_OWORD *)v56 + 1);
          v55[32] = v56[32];
          *(_OWORD *)uint64_t v55 = v88;
          *((_OWORD *)v55 + 1) = v89;
        }
        *((unsigned char *)a1 + v9[11]) = *((unsigned char *)a2 + v9[11]);
        goto LABEL_33;
      case 1u:
        uint64_t v16 = *a2;
        uint64_t v17 = a2[1];
        char v18 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v16;
        a1[1] = v17;
        *((unsigned char *)a1 + 16) = v18;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        uint64_t v19 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v20 = v19[7];
        __dsta = (void *)((char *)a1 + v20);
        uint64_t v21 = (void *)((char *)a2 + v20);
        uint64_t v22 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v23 = *(void *)(v22 - 8);
        uint64_t v24 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v24(v21, 1, v22))
        {
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dsta, v21, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          void *__dsta = *v21;
          __dsta[1] = v21[1];
          uint64_t v58 = *(int *)(v22 + 20);
          uint64_t v102 = (char *)v21 + v58;
          uint64_t v106 = (char *)__dsta + v58;
          uint64_t v59 = type metadata accessor for Date();
          uint64_t v98 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 16);
          swift_bridgeObjectRetain();
          v98(v106, v102, v59);
          uint64_t v60 = *(int *)(v22 + 24);
          uint64_t v61 = (void *)((char *)__dsta + v60);
          uint64_t v62 = (void *)((char *)v21 + v60);
          *uint64_t v61 = *v62;
          v61[1] = v62[1];
          uint64_t v63 = *(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56);
          swift_bridgeObjectRetain();
          v63(__dsta, 0, 1, v22);
        }
        *(void *)((char *)a1 + v19[8]) = *(void *)((char *)a2 + v19[8]);
        *(void *)((char *)a1 + v19[9]) = *(void *)((char *)a2 + v19[9]);
        uint64_t v64 = v19[10];
        uint64_t v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        uint64_t v67 = *(void *)((char *)a2 + v64 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v67)
        {
          *(void *)uint64_t v65 = *(void *)v66;
          *((void *)v65 + 1) = *((void *)v66 + 1);
          *((void *)v65 + 2) = *((void *)v66 + 2);
          *((void *)v65 + 3) = *((void *)v66 + 3);
          v65[32] = v66[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v90 = *(_OWORD *)v66;
          long long v91 = *((_OWORD *)v66 + 1);
          v65[32] = v66[32];
          *(_OWORD *)uint64_t v65 = v90;
          *((_OWORD *)v65 + 1) = v91;
        }
        *((unsigned char *)a1 + v19[11]) = *((unsigned char *)a2 + v19[11]);
        goto LABEL_33;
      case 2u:
        uint64_t v26 = *a2;
        uint64_t v27 = a2[1];
        char v28 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v26;
        a1[1] = v27;
        *((unsigned char *)a1 + 16) = v28;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        uint64_t v29 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v30 = v29[7];
        __dstb = (void *)((char *)a1 + v30);
        uint64_t v31 = (void *)((char *)a2 + v30);
        uint64_t v32 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v33 = *(void *)(v32 - 8);
        uint64_t v34 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v33 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v34(v31, 1, v32))
        {
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dstb, v31, *(void *)(*(void *)(v35 - 8) + 64));
        }
        else
        {
          void *__dstb = *v31;
          __dstb[1] = v31[1];
          uint64_t v68 = *(int *)(v32 + 20);
          uint64_t v103 = (char *)v31 + v68;
          uint64_t v107 = (char *)__dstb + v68;
          uint64_t v69 = type metadata accessor for Date();
          uint64_t v99 = *(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16);
          swift_bridgeObjectRetain();
          v99(v107, v103, v69);
          uint64_t v70 = *(int *)(v32 + 24);
          uint64_t v71 = (void *)((char *)__dstb + v70);
          uint64_t v72 = (void *)((char *)v31 + v70);
          *uint64_t v71 = *v72;
          v71[1] = v72[1];
          uint64_t v73 = *(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56);
          swift_bridgeObjectRetain();
          v73(__dstb, 0, 1, v32);
        }
        *(void *)((char *)a1 + v29[8]) = *(void *)((char *)a2 + v29[8]);
        *(void *)((char *)a1 + v29[9]) = *(void *)((char *)a2 + v29[9]);
        uint64_t v74 = v29[10];
        uint64_t v75 = (char *)a1 + v74;
        uint64_t v76 = (char *)a2 + v74;
        uint64_t v77 = *(void *)((char *)a2 + v74 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v77)
        {
          *(void *)uint64_t v75 = *(void *)v76;
          *((void *)v75 + 1) = *((void *)v76 + 1);
          *((void *)v75 + 2) = *((void *)v76 + 2);
          *((void *)v75 + 3) = *((void *)v76 + 3);
          v75[32] = v76[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v92 = *(_OWORD *)v76;
          long long v93 = *((_OWORD *)v76 + 1);
          v75[32] = v76[32];
          *(_OWORD *)uint64_t v75 = v92;
          *((_OWORD *)v75 + 1) = v93;
        }
        *((unsigned char *)a1 + v29[11]) = *((unsigned char *)a2 + v29[11]);
        goto LABEL_33;
      case 3u:
        uint64_t v36 = *a2;
        uint64_t v37 = a2[1];
        char v38 = *((unsigned char *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v36;
        a1[1] = v37;
        *((unsigned char *)a1 + 16) = v38;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        uint64_t v39 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v40 = v39[7];
        __dstc = (void *)((char *)a1 + v40);
        uint64_t v41 = (void *)((char *)a2 + v40);
        uint64_t v42 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v43 = *(void *)(v42 - 8);
        char v44 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v43 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v44(v41, 1, v42))
        {
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(__dstc, v41, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          void *__dstc = *v41;
          __dstc[1] = v41[1];
          uint64_t v78 = *(int *)(v42 + 20);
          uint64_t v104 = (char *)v41 + v78;
          uint64_t v108 = (char *)__dstc + v78;
          uint64_t v79 = type metadata accessor for Date();
          char v100 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16);
          swift_bridgeObjectRetain();
          v100(v108, v104, v79);
          uint64_t v80 = *(int *)(v42 + 24);
          uint64_t v81 = (void *)((char *)__dstc + v80);
          uint64_t v82 = (void *)((char *)v41 + v80);
          *uint64_t v81 = *v82;
          v81[1] = v82[1];
          uint64_t v83 = *(void (**)(void *, void, uint64_t, uint64_t))(v43 + 56);
          swift_bridgeObjectRetain();
          v83(__dstc, 0, 1, v42);
        }
        *(void *)((char *)a1 + v39[8]) = *(void *)((char *)a2 + v39[8]);
        *(void *)((char *)a1 + v39[9]) = *(void *)((char *)a2 + v39[9]);
        uint64_t v84 = v39[10];
        uint64_t v85 = (char *)a1 + v84;
        uint64_t v86 = (char *)a2 + v84;
        uint64_t v87 = *(void *)((char *)a2 + v84 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v87)
        {
          *(void *)uint64_t v85 = *(void *)v86;
          *((void *)v85 + 1) = *((void *)v86 + 1);
          *((void *)v85 + 2) = *((void *)v86 + 2);
          *((void *)v85 + 3) = *((void *)v86 + 3);
          v85[32] = v86[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v94 = *(_OWORD *)v86;
          long long v95 = *((_OWORD *)v86 + 1);
          v85[32] = v86[32];
          *(_OWORD *)uint64_t v85 = v94;
          *((_OWORD *)v85 + 1) = v95;
        }
        *((unsigned char *)a1 + v39[11]) = *((unsigned char *)a2 + v39[11]);
        goto LABEL_33;
      case 4u:
        *a1 = *a2;
        uint64_t v46 = (void *)a2[1];
        swift_bridgeObjectRetain();
        id v47 = v46;
        a1[1] = v46;
LABEL_33:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for LACUIRatchetViewModel.State(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v7 = v6[7];
      char v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v11 = *(void *)(v10 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
        goto LABEL_11;
      }
      goto LABEL_10;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v12 = v6[7];
      char v8 = &a1[v12];
      uint64_t v9 = &a2[v12];
      uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 2u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v13 = v6[7];
      char v8 = &a1[v13];
      uint64_t v9 = &a2[v13];
      uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 3u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v14 = v6[7];
      char v8 = &a1[v14];
      uint64_t v9 = &a2[v14];
      uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
LABEL_10:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
LABEL_11:
        *(_OWORD *)char v8 = *(_OWORD *)v9;
        uint64_t v16 = *(int *)(v10 + 20);
        uint64_t v17 = &v8[v16];
        char v18 = &v9[v16];
        uint64_t v19 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
        *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
      *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
      uint64_t v20 = v6[10];
      uint64_t v21 = &a1[v20];
      uint64_t v22 = &a2[v20];
      v21[32] = v22[32];
      long long v23 = *((_OWORD *)v22 + 1);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v23;
      a1[v6[11]] = a2[v6[11]];
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *assignWithTake for LACUIRatchetViewModel.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of LACUIRatchetViewModel.State((uint64_t)a1, type metadata accessor for LACUIRatchetViewModel.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v7 = v6[7];
        char v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v11 = *(void *)(v10 - 8);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
          goto LABEL_11;
        }
        goto LABEL_7;
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v12 = v6[7];
        char v8 = &a1[v12];
        uint64_t v9 = &a2[v12];
        uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v14 = v6[7];
        char v8 = &a1[v14];
        uint64_t v9 = &a2[v14];
        uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        uint64_t v15 = v6[7];
        char v8 = &a1[v15];
        uint64_t v9 = &a2[v15];
        uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        {
LABEL_7:
          uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
LABEL_11:
          *(_OWORD *)char v8 = *(_OWORD *)v9;
          uint64_t v16 = *(int *)(v10 + 20);
          uint64_t v17 = &v8[v16];
          char v18 = &v9[v16];
          uint64_t v19 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
          *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
          (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
        }
        *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
        *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
        uint64_t v20 = v6[10];
        uint64_t v21 = &a1[v20];
        uint64_t v22 = &a2[v20];
        v21[32] = v22[32];
        long long v23 = *((_OWORD *)v22 + 1);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
        *((_OWORD *)v21 + 1) = v23;
        a1[v6[11]] = a2[v6[11]];
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for LACUIRatchetViewModel.State()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for LACUIRatchetViewModel.State()
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_255026AF8()
{
  return objectdestroy_3Tm(MEMORY[0x263F8EEA0], 57);
}

uint64_t outlined assign with copy of LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_255026CF0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(void *a1, char a2)
{
  return closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(a1, a2 & 1, v2);
}

uint64_t sub_255026D34()
{
  return objectdestroy_3Tm(MEMORY[0x263F8EED8], 56);
}

uint64_t objectdestroy_3Tm(void (*a1)(void), uint64_t a2)
{
  swift_unknownObjectRelease();

  a1(*(void *)(v2 + 48));
  return MEMORY[0x270FA0238](v2, a2, 7);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  *(void *)(v3 + 144) = v2;
  *(_OWORD *)(v3 + 128) = v4;
  return MEMORY[0x270FA2498](closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:), 0, 0);
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t outlined init with take of (key: AnyHashable, value: Any)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: AnyHashable, value: Any)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of LACUIRatchetViewModel.State(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for LACUIRatchetViewModel.State(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();

  uint64_t v5 = v0 + v3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
      outlined consume of LACUIAuthImageConfiguration();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = type metadata accessor for LACUIAuthCountdownConfiguration();
      uint64_t v7 = v5 + *(int *)(v6 + 28);
      uint64_t v8 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8))
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v7 + *(int *)(v8 + 20);
        uint64_t v10 = type metadata accessor for Date();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v5 + *(int *)(v6 + 40) + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 4u:
      swift_bridgeObjectRelease();

      break;
    default:
      break;
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

unint64_t lazy protocol witness table accessor for type CancellationError and conformance CancellationError()
{
  unint64_t result = lazy protocol witness table cache variable for type CancellationError and conformance CancellationError;
  if (!lazy protocol witness table cache variable for type CancellationError and conformance CancellationError)
  {
    type metadata accessor for CancellationError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CancellationError and conformance CancellationError);
  }
  return result;
}

void partial apply for closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(uint64_t a1)
{
  closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(a1, v1);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for LACDTORatchetStateComposite(uint64_t a1, unint64_t *a2)
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

uint64_t key path getter for LACUIFaceIDSpinnerViewModel.state : LACUIFaceIDSpinnerViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUIFaceIDSpinnerViewModel.state : LACUIFaceIDSpinnerViewModel(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 96))(*a1);
}

uint64_t LACUIFaceIDSpinnerViewModel.state.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2550273FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_255027448(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 96))(*a1);
}

uint64_t LACUIFaceIDSpinnerViewModel.state.setter()
{
  return static Published.subscript.setter();
}

void (*LACUIFaceIDSpinnerViewModel.state.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

uint64_t key path setter for LACUIFaceIDSpinnerViewModel.$state : LACUIFaceIDSpinnerViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 120))(v6);
}

uint64_t LACUIFaceIDSpinnerViewModel.$state.getter()
{
  return swift_endAccess();
}

uint64_t LACUIFaceIDSpinnerViewModel.$state.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*LACUIFaceIDSpinnerViewModel.$state.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

uint64_t LACUIFaceIDSpinnerViewModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for LACUIFaceIDSpinnerState(0);
  Published.init(initialValue:)();
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v7[1] = 0;
  type metadata accessor for LACUIFaceIDSpinnerState(0);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIFaceIDSpinnerViewModel@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUIFaceIDSpinnerViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_255027BC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 112))();
}

uint64_t ObjC metadata update function for LACUIFaceIDSpinnerViewModel()
{
  return type metadata accessor for LACUIFaceIDSpinnerViewModel();
}

uint64_t type metadata accessor for LACUIFaceIDSpinnerViewModel()
{
  uint64_t result = type metadata singleton initialization cache for LACUIFaceIDSpinnerViewModel;
  if (!type metadata singleton initialization cache for LACUIFaceIDSpinnerViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for LACUIFaceIDSpinnerViewModel()
{
  type metadata accessor for Published<LACUIFaceIDSpinnerState>();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LACUIFaceIDSpinnerViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIFaceIDSpinnerViewModel);
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

void type metadata accessor for Published<LACUIFaceIDSpinnerState>()
{
  if (!lazy cache variable for type metadata for Published<LACUIFaceIDSpinnerState>)
  {
    type metadata accessor for LACUIFaceIDSpinnerState(255);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
    }
  }
}

id LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(request:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(a1);

  return v4;
}

id LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(void *a1)
{
  id v2 = specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(a1);

  return v2;
}

void LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(configuration:)()
{
}

void LACUIOnenessUnsatisfiablePresentationHandler.init(configuration:)()
{
}

id LACUIOnenessUnsatisfiablePresentationHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(void *a1)
{
  unsigned int v3 = objc_msgSend(self, sel_deviceHasFaceID);
  id v4 = objc_msgSend(a1, sel_userInterfaceRequest);
  id v5 = objc_msgSend(v4, sel_clientInfo);

  id v6 = objc_msgSend(v5, sel_displayName);
  if (!v3)
  {
    if (v6)
    {
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v14 = v13;

      uint64_t v32 = MEMORY[0x263F8D310];
      unint64_t v33 = lazy protocol witness table accessor for type String and conformance String();
      uint64_t v30 = v12;
      uint64_t v31 = v14;
      swift_bridgeObjectRetain_n();
      uint64_t v10 = 0xD000000000000027;
      uint64_t v11 = "OPERATION_UNSUPPORTED_COMPANION_TOUCHID";
      goto LABEL_6;
    }
    uint64_t v19 = 0xD000000000000031;
    uint64_t v20 = "OPERATION_UNSUPPORTED_COMPANION_TOUCHID_ANONYMOUS";
LABEL_9:
    v36._uint64_t countAndFlagsBits = 0x75676F6C61746143;
    v36._object = (void *)0xE900000000000065;
    uint64_t v16 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v19, (void *)((unint64_t)(v20 - 32) | 0x8000000000000000), v36);
    uint64_t v18 = v21;
    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v19 = 0xD000000000000030;
    uint64_t v20 = "OPERATION_UNSUPPORTED_COMPANION_FACEID_ANONYMOUS";
    goto LABEL_9;
  }
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  uint64_t v32 = MEMORY[0x263F8D310];
  unint64_t v33 = lazy protocol witness table accessor for type String and conformance String();
  uint64_t v30 = v7;
  uint64_t v31 = v9;
  swift_bridgeObjectRetain_n();
  uint64_t v10 = 0xD000000000000026;
  uint64_t v11 = "OPERATION_UNSUPPORTED_COMPANION_FACEID";
LABEL_6:
  v35._uint64_t countAndFlagsBits = 0x75676F6C61746143;
  v35._object = (void *)0xE900000000000065;
  specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v10, (void *)((unint64_t)(v11 - 32) | 0x8000000000000000), v35);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_255043E40;
  outlined init with copy of CVarArg((uint64_t)&v30, v15 + 32);
  uint64_t v16 = String.init(format:_:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v30);
  swift_bridgeObjectRelease_n();
LABEL_10:
  v37._uint64_t countAndFlagsBits = 0x75676F6C61746143;
  v37._object = (void *)0xE900000000000065;
  uint64_t v22 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000017, (void *)0x8000000255046050, v37);
  uint64_t v24 = v23;
  v38._uint64_t countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  uint64_t v25 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v38);
  uint64_t v26 = &v1[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(void *)uint64_t v26 = 3;
  *((void *)v26 + 1) = v22;
  *((void *)v26 + 2) = v24;
  *((void *)v26 + 3) = v16;
  *((void *)v26 + 4) = v18;
  *((void *)v26 + 5) = v25;
  *((void *)v26 + 6) = v27;
  char v28 = (objc_class *)type metadata accessor for LACUIAlertScenePresentationHandler();
  v34.receiver = v1;
  v34.super_class = v28;
  return objc_msgSendSuper2(&v34, sel_init);
}

uint64_t type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler()
{
  return self;
}

uint64_t method lookup function for LACUIOnenessUnsatisfiablePresentationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIOnenessUnsatisfiablePresentationHandler);
}

uint64_t dispatch thunk of LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(request:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t default argument 1 of LACUIAuthCountdownView.init(viewModel:colorScheme:)@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t LACUIAuthCountdownView.init(viewModel:colorScheme:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  type metadata accessor for LACUIAuthCountdownViewModel();
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel);
  *a2 = ObservedObject.init(wrappedValue:)();
  a2[1] = v4;
  uint64_t v5 = type metadata accessor for LACUIAuthCountdownView();
  return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(a1, (uint64_t)a2 + *(int *)(v5 + 20), &demangling cache variable for type metadata for Environment<ColorScheme>);
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v13, a9, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  uint64_t v24 = (_OWORD *)(a9
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>)
                          + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  _OWORD v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
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
    long long v27 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v18 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  __n128 result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

uint64_t specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return outlined retain of ModifiedContent<Text, _PaddingLayout>((uint64_t)v13);
}

uint64_t LACUIAuthCountdownView.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUIAuthCountdownView.viewModel.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownView.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownView.$viewModel.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for LACUIAuthCountdownViewModel();
  uint64_t v4 = lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (void (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel);
  return MEMORY[0x270EFFB88](v1, v2, v3, v4);
}

uint64_t LACUIAuthCountdownView.colorScheme.getter@<X0>(uint64_t a1@<X8>)
{
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<ColorScheme>.Content, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content, MEMORY[0x263F18D80], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    uint64_t v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, v24, &v25);
      _os_log_impl(&dword_255001000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A285430](v23, -1, -1);
      MEMORY[0x25A285430](v22, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t LACUIAuthCountdownView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = type metadata accessor for ColorScheme();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityA);
  MEMORY[0x270FA5388](v28);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = static HorizontalAlignment.center.getter();
  *((void *)v11 + 1) = 0x4034000000000000;
  v11[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttach);
  closure #1 in LACUIAuthCountdownView.body.getter(v1, (uint64_t)&v11[*(int *)(v18 + 44)]);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v11, (uint64_t)v15, &demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  v15[*(int *)(v13 + 44)] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  type metadata accessor for LACUIAuthCountdownView();
  specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<ColorScheme>.Content, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v8);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v19 == *MEMORY[0x263F18508])
  {
    id v20 = objc_msgSend(self, sel_systemBackgroundColor);
  }
  else
  {
    int v21 = v19;
    int v22 = *MEMORY[0x263F184F8];
    uint64_t v23 = self;
    if (v21 != v22)
    {
      uint64_t v24 = MEMORY[0x25A284760](objc_msgSend(v23, sel_systemBackgroundColor));
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      goto LABEL_7;
    }
    id v20 = objc_msgSend(v23, sel_secondarySystemBackgroundColor);
  }
  uint64_t v24 = MEMORY[0x25A284760](v20);
LABEL_7:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  char v25 = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v15, (uint64_t)v17, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  long long v26 = &v17[*(int *)(v28 + 36)];
  *(void *)long long v26 = v24;
  v26[8] = v25;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v17, v29, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityA);
}

uint64_t closure #1 in LACUIAuthCountdownView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v221 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  MEMORY[0x270FA5388](v3 - 8);
  v200 = (char *)&v168 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  MEMORY[0x270FA5388](v213);
  uint64_t v218 = (uint64_t)&v168 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x270FA5388](v215);
  uint64_t v217 = (uint64_t)&v168 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v214 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  uint64_t v7 = MEMORY[0x270FA5388](v214);
  uint64_t v220 = (uint64_t)&v168 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v219 = (uint64_t)&v168 - v9;
  uint64_t v10 = type metadata accessor for LACUIAuthCountdownDelayView();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v185 = (uint64_t)&v168 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
  MEMORY[0x270FA5388](v182);
  uint64_t v184 = (uint64_t)&v168 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>);
  uint64_t v198 = *(void *)(v199 - 8);
  MEMORY[0x270FA5388](v199);
  uint64_t v183 = (uint64_t)&v168 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v168 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v211 = *(void *)(v196 - 8);
  MEMORY[0x270FA5388](v196);
  uint64_t v181 = (uint64_t)&v168 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v216 = (uint64_t)&v168 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v233 = (uint64_t)&v168 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  MEMORY[0x270FA5388](v22 - 8);
  v192 = (uint64_t *)((char *)&v168 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  MEMORY[0x270FA5388](v187);
  uint64_t v193 = (uint64_t)&v168 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x270FA5388](v189);
  uint64_t v191 = (uint64_t)&v168 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  MEMORY[0x270FA5388](v188);
  uint64_t v190 = (uint64_t)&v168 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  uint64_t v194 = *(void *)(v195 - 8);
  MEMORY[0x270FA5388](v195);
  uint64_t v186 = (uint64_t)&v168 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v212 = (uint64_t)&v168 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v226 = (uint64_t)&v168 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  MEMORY[0x270FA5388](v32 - 8);
  v201 = (uint64_t *)((char *)&v168 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v206 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  MEMORY[0x270FA5388](v206);
  uint64_t v210 = (uint64_t)&v168 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x270FA5388](v207);
  uint64_t v209 = (uint64_t)&v168 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  MEMORY[0x270FA5388](v205);
  uint64_t v208 = (uint64_t)&v168 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  uint64_t v37 = MEMORY[0x270FA5388](v204);
  uint64_t v230 = (uint64_t)&v168 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v229 = (uint64_t)&v168 - v39;
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>);
  MEMORY[0x270FA5388](v203);
  uint64_t v202 = (uint64_t)&v168 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v42 = MEMORY[0x270FA5388](v41 - 8);
  char v44 = (char *)&v168 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v168 - v45;
  uint64_t v47 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v222 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47 - 8);
  uint64_t v223 = v48;
  uint64_t v224 = (uint64_t)&v168 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>);
  uint64_t v175 = *(void *)(v176 - 8);
  uint64_t v49 = MEMORY[0x270FA5388](v176);
  v174 = (char *)&v168 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v49);
  id v52 = (char *)&v168 - v51;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
  MEMORY[0x270FA5388](v53 - 8);
  uint64_t v55 = (char *)&v168 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
  uint64_t v56 = MEMORY[0x270FA5388](v180);
  uint64_t v173 = (uint64_t)&v168 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v56);
  uint64_t v177 = (uint64_t)&v168 - v58;
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>.Storage);
  MEMORY[0x270FA5388](v178);
  uint64_t v60 = (_OWORD *)((char *)&v168 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>);
  uint64_t v62 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v179 = (char *)&v168 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  uint64_t v65 = MEMORY[0x270FA5388](v64 - 8);
  uint64_t v227 = (uint64_t)&v168 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v65);
  uint64_t v68 = (char *)&v168 - v67;
  uint64_t v225 = a1;
  uint64_t v69 = *(void *)(a1 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  uint64_t v70 = type metadata accessor for LACUIAuthCountdownConfiguration();
  BOOL v71 = *(unsigned char *)(v69 + *(int *)(v70 + 44)) == 1;
  v231 = v46;
  v232 = v68;
  v234 = (int *)v70;
  v197 = v16;
  if (v71)
  {
    uint64_t v171 = v62;
    uint64_t v172 = v61;
    uint64_t v72 = v69 + *(int *)(v70 + 40);
    uint64_t v73 = *(void *)(v72 + 8);
    if (v73)
    {
      char v74 = *(unsigned char *)(v72 + 32);
      uint64_t v76 = *(void *)(v72 + 16);
      uint64_t v75 = *(void *)(v72 + 24);
      uint64_t v77 = *(void *)v72;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
      uint64_t v78 = swift_allocObject();
      *(_OWORD *)(v78 + 16) = xmmword_255043E40;
      *(void *)(v78 + 32) = v77;
      *(void *)(v78 + 40) = v73;
      *(void *)(v78 + 48) = v76;
      *(void *)(v78 + 56) = v75;
      *(unsigned char *)(v78 + 64) = v74;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(void *)uint64_t v55 = static VerticalAlignment.center.getter();
      *((void *)v55 + 1) = 0;
      v55[16] = 1;
      v170 = &v55[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>)
                         + 44)];
      *(void *)&v235[0] = v78;
      uint64_t v79 = v224;
      outlined init with copy of LACUIAuthCountdownView(v225, v224, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
      unint64_t v80 = (*(unsigned __int8 *)(v222 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v222 + 80);
      uint64_t v81 = swift_allocObject();
      outlined init with take of LACUIAuthCountdownView(v79, v81 + v80, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
      lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
      lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
      lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
      v169 = v60;
      uint64_t v82 = v44;
      ForEach<>.init(_:content:)();
      uint64_t v83 = v175;
      uint64_t v84 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
      uint64_t v85 = v174;
      uint64_t v86 = v176;
      v84(v174, v52, v176);
      uint64_t v87 = v170;
      *(void *)v170 = 0;
      v87[8] = 1;
      long long v88 = &v87[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>))
                        + 48)];
      char v44 = v82;
      v84(v88, v85, v86);
      long long v89 = *(void (**)(char *, uint64_t))(v83 + 8);
      v89(v52, v86);
      v89(v85, v86);
      swift_bridgeObjectRelease();
      uint64_t v90 = v173;
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v55, v173, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
      *(_WORD *)(v90 + *(int *)(v180 + 36)) = 256;
      outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v55, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
      uint64_t v91 = v177;
      outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v90, v177, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v91, (uint64_t)v169, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Spacer, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      uint64_t v92 = (uint64_t)v179;
      _ConditionalContent<>.init(storage:)();
      uint64_t v93 = v91;
      uint64_t v46 = v231;
      outlined destroy of LACUIAuthCountdownDelayConfiguration?(v93, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
    }
    else
    {
      uint64_t v94 = static Alignment.center.getter();
      specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v235, 0.0, 1, 40.0, 0, v94, v95, 0, 1);
      long long v96 = v235[5];
      v60[4] = v235[4];
      v60[5] = v96;
      long long v97 = v235[7];
      v60[6] = v235[6];
      v60[7] = v97;
      long long v98 = v235[1];
      *uint64_t v60 = v235[0];
      v60[1] = v98;
      long long v99 = v235[3];
      v60[2] = v235[2];
      v60[3] = v99;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Spacer, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      uint64_t v92 = (uint64_t)v179;
      _ConditionalContent<>.init(storage:)();
    }
    uint64_t v100 = (uint64_t)v232;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v92, (uint64_t)v232, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v171 + 56))(v100, 0, 1, v172);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v68, 1, 1, v61);
  }
  uint64_t v101 = v202;
  uint64_t v102 = v225;
  LACUIAuthCountdownView.lockIcon.getter(v202);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
  uint64_t v103 = 1;
  View.accessibilityHidden(_:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v101, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>);
  v228 = v44;
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v44, (uint64_t)v46, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v104 = static HorizontalAlignment.center.getter();
  uint64_t v105 = (uint64_t)v201;
  uint64_t *v201 = v104;
  *(void *)(v105 + 8) = 0;
  *(unsigned char *)(v105 + 16) = 1;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  closure #1 in LACUIAuthCountdownView.informativeText.getter(v102, v105 + *(int *)(v106 + 44));
  char v107 = static Edge.Set.horizontal.getter();
  uint64_t v108 = v210;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v105, v210, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  uint64_t v109 = v108 + *(int *)(v206 + 36);
  *(unsigned char *)uint64_t v109 = v107;
  *(_OWORD *)(v109 + 8) = 0u;
  *(_OWORD *)(v109 + 24) = 0u;
  *(unsigned char *)(v109 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v105, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  char v110 = static Edge.Set.horizontal.getter();
  uint64_t v111 = v209;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v108, v209, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  uint64_t v112 = v111 + *(int *)(v207 + 36);
  *(unsigned char *)uint64_t v112 = v110;
  *(_OWORD *)(v112 + 8) = 0u;
  *(_OWORD *)(v112 + 24) = 0u;
  *(unsigned char *)(v112 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v108, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  uint64_t v113 = v208;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v111, v208, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  *(void *)(v113 + *(int *)(v205 + 36)) = 0x3FF0000000000000;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v111, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  uint64_t v114 = v230;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v113, v230, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  *(_WORD *)(v114 + *(int *)(v204 + 36)) = 256;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v113, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v114, v229, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  uint64_t v115 = *(void *)(*(void *)(v102 + 8)
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                   + v234[8]);
  if (v115)
  {
    swift_bridgeObjectRetain();
    uint64_t v116 = static HorizontalAlignment.leading.getter();
    uint64_t v117 = (uint64_t)v192;
    uint64_t *v192 = v116;
    *(void *)(v117 + 8) = 0x4038000000000000;
    *(unsigned char *)(v117 + 16) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    *(void *)&v235[0] = v115;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthCountdownItemConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
    lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView();
    lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration();
    uint64_t v102 = v225;
    ForEach<>.init(_:content:)();
    char v118 = static Edge.Set.horizontal.getter();
    uint64_t v119 = v193;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v117, v193, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    uint64_t v120 = v119 + *(int *)(v187 + 36);
    *(unsigned char *)uint64_t v120 = v118;
    *(_OWORD *)(v120 + 8) = 0u;
    *(_OWORD *)(v120 + 24) = 0u;
    *(unsigned char *)(v120 + 40) = 1;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v117, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    char v121 = static Edge.Set.all.getter();
    uint64_t v122 = v191;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v119, v191, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    uint64_t v123 = v122 + *(int *)(v189 + 36);
    *(unsigned char *)uint64_t v123 = v121;
    *(_OWORD *)(v123 + 8) = 0u;
    *(_OWORD *)(v123 + 24) = 0u;
    *(unsigned char *)(v123 + 40) = 1;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v119, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    uint64_t v124 = v190;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v122, v190, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
    *(void *)(v124 + *(int *)(v188 + 36)) = 0x3FF0000000000000;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v122, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
    swift_bridgeObjectRelease();
    uint64_t v125 = v186;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v124, v186, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
    uint64_t v126 = v195;
    *(_WORD *)(v125 + *(int *)(v195 + 36)) = 256;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v124, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
    uint64_t v127 = v226;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v125, v226, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
    uint64_t v128 = v126;
    uint64_t v103 = 0;
    uint64_t v129 = (uint64_t)v200;
    uint64_t v130 = v199;
    uint64_t v131 = v198;
    uint64_t v132 = v196;
  }
  else
  {
    uint64_t v129 = (uint64_t)v200;
    uint64_t v127 = v226;
    uint64_t v130 = v199;
    uint64_t v131 = v198;
    uint64_t v132 = v196;
    uint64_t v128 = v195;
  }
  uint64_t v133 = (uint64_t)v197;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v194 + 56))(v127, v103, 1, v128);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(*(void *)(v102 + 8)+ v234[7]+ OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, v133, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v211 + 48))(v133, 1, v132) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v133, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    uint64_t v134 = 1;
  }
  else
  {
    uint64_t v135 = v133;
    uint64_t v136 = v181;
    outlined init with take of LACUIAuthCountdownView(v135, v181, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    uint64_t v137 = v185;
    outlined init with copy of LACUIAuthCountdownView(v136, v185, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    char v138 = static Edge.Set.vertical.getter();
    uint64_t v139 = v184;
    outlined init with copy of LACUIAuthCountdownView(v137, v184, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
    uint64_t v140 = v139 + *(int *)(v182 + 36);
    *(unsigned char *)uint64_t v140 = v138;
    *(_OWORD *)(v140 + 8) = 0u;
    *(_OWORD *)(v140 + 24) = 0u;
    *(unsigned char *)(v140 + 40) = 1;
    outlined destroy of RoundedRectangle(v137, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayView);
    uint64_t v141 = v183;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v139, v183, &demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
    *(_WORD *)(v141 + *(int *)(v130 + 36)) = 256;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v139, &demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
    outlined destroy of RoundedRectangle(v136, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v141, v233, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>);
    uint64_t v134 = 0;
  }
  uint64_t v142 = v233;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v131 + 56))(v233, v134, 1, v130);
  *(void *)uint64_t v129 = static HorizontalAlignment.center.getter();
  *(void *)(v129 + 8) = 0;
  *(unsigned char *)(v129 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  *(void *)&v235[0] = *(void *)(*(void *)(v102 + 8)
                                  + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                                  + v234[9]);
  uint64_t v143 = v102;
  uint64_t v144 = v224;
  outlined init with copy of LACUIAuthCountdownView(v143, v224, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  unint64_t v145 = (*(unsigned __int8 *)(v222 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v222 + 80);
  uint64_t v146 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownView(v144, v146 + v145, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  char v147 = static Edge.Set.horizontal.getter();
  uint64_t v148 = v218;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v129, v218, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  uint64_t v149 = v148 + *(int *)(v213 + 36);
  *(unsigned char *)uint64_t v149 = v147;
  *(_OWORD *)(v149 + 8) = 0u;
  *(_OWORD *)(v149 + 24) = 0u;
  *(unsigned char *)(v149 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v129, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  char v150 = static Edge.Set.horizontal.getter();
  uint64_t v151 = v217;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v148, v217, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  uint64_t v152 = v151 + *(int *)(v215 + 36);
  *(unsigned char *)uint64_t v152 = v150;
  *(_OWORD *)(v152 + 8) = 0u;
  *(_OWORD *)(v152 + 24) = 0u;
  *(unsigned char *)(v152 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v148, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  uint64_t v153 = v220;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v151, v220, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  *(_WORD *)(v153 + *(int *)(v214 + 36)) = 256;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v151, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  uint64_t v154 = v219;
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v153, v219, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  uint64_t v155 = v227;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v232, v227, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  uint64_t v156 = (uint64_t)v228;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v231, (uint64_t)v228, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v157 = v229;
  uint64_t v158 = v230;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v229, v230, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  uint64_t v159 = v226;
  uint64_t v160 = v212;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v226, v212, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  uint64_t v161 = v142;
  uint64_t v162 = v216;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v161, v216, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v154, v153, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  uint64_t v163 = v155;
  uint64_t v164 = v221;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v163, v221, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  v165 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _Enviro);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v156, v164 + v165[12], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v158, v164 + v165[16], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v160, v164 + v165[20], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v162, v164 + v165[24], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  uint64_t v166 = v164 + v165[28];
  *(void *)uint64_t v166 = 0;
  *(unsigned char *)(v166 + 8) = 1;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v153, v164 + v165[32], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v154, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v233, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v159, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v157, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v231, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v232, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v153, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v162, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v160, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v158, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v228, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v227, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
}

uint64_t LACUIAuthCountdownView.barButtons(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = static VerticalAlignment.center.getter();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
  return closure #1 in LACUIAuthCountdownView.barButtons(with:)(a1, v2, a2 + *(int *)(v5 + 44));
}

uint64_t LACUIAuthCountdownView.lockIcon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Image.ResizingMode();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  MEMORY[0x270FA5388](v28);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
  MEMORY[0x270FA5388](v29);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(*(void *)(v2 + 8)
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                 + 16) & 1) != 0)
  {
    swift_bridgeObjectRetain();
    Image.init(systemName:)();
  }
  else
  {
    uint64_t v16 = one-time initialization token for current;
    swift_bridgeObjectRetain_n();
    if (v16 != -1) {
      swift_once();
    }
    id v17 = (id)static NSBundle.current;
    Image.init(_:bundle:)();
    outlined consume of LACUIAuthImageConfiguration();
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B4B8], v8);
  uint64_t v18 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  static SymbolRenderingMode.hierarchical.getter();
  uint64_t v19 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 0, 1, v19);
  uint64_t KeyPath = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v7, (uint64_t)v4 + *(int *)(v30 + 28), &demangling cache variable for type metadata for SymbolRenderingMode?);
  uint64_t *v4 = KeyPath;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v4, (uint64_t)&v13[*(int *)(v28 + 36)], &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  *(void *)uint64_t v13 = v18;
  *((void *)v13 + 1) = 0;
  *((_WORD *)v13 + 8) = 1;
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v4, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for SymbolRenderingMode?);
  swift_release();
  uint64_t v21 = static Color.blue.getter();
  uint64_t v22 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  uint64_t v23 = (uint64_t *)&v15[*(int *)(v29 + 36)];
  uint64_t *v23 = v22;
  v23[1] = v21;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v24 = v31;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v15, v31, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
  uint64_t v25 = (_OWORD *)(v24
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>)
                          + 36));
  long long v26 = v33;
  *uint64_t v25 = v32;
  v25[1] = v26;
  _OWORD v25[2] = v34;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
}

uint64_t LACUIAuthCountdownView.informativeText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = static HorizontalAlignment.center.getter();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  closure #1 in LACUIAuthCountdownView.informativeText.getter(v1, (uint64_t)&v5[*(int *)(v14 + 44)]);
  char v15 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v5, (uint64_t)v9, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  uint64_t v16 = &v9[*(int *)(v7 + 44)];
  char *v16 = v15;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v5, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  char v17 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v9, (uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  uint64_t v18 = &v13[*(int *)(v11 + 44)];
  char *v18 = v17;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  v18[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v9, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, a1, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  *(void *)(a1
            + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)
                     + 36)) = 0x3FF0000000000000;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
}

uint64_t LACUIAuthCountdownView.actionItems(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = static HorizontalAlignment.leading.getter();
  *((void *)v6 + 1) = 0x4038000000000000;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  v20[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthCountdownItemConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
  lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView();
  lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration();
  ForEach<>.init(_:content:)();
  char v15 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v6, (uint64_t)v10, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  uint64_t v16 = &v10[*(int *)(v8 + 44)];
  char *v16 = v15;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v6, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  char v17 = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v10, (uint64_t)v14, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  uint64_t v18 = &v14[*(int *)(v12 + 44)];
  char *v18 = v17;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  v18[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v10, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v14, a2, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  *(void *)(a2
            + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)
                     + 36)) = 0x3FF0000000000000;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
}

uint64_t LACUIAuthCountdownView.buttons.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = static HorizontalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  uint64_t v13 = *(void *)(v1 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  v21[1] = *(void *)(v13 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 36));
  outlined init with copy of LACUIAuthCountdownView(v1, (uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownView((uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  char v16 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v8, (uint64_t)v12, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  char v17 = &v12[*(int *)(v10 + 44)];
  *char v17 = v16;
  *(_OWORD *)(v17 + 8) = 0u;
  *(_OWORD *)(v17 + 24) = 0u;
  v17[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  char v18 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v12, a1, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  uint64_t v19 = a1
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>)
               + 36);
  *(unsigned char *)uint64_t v19 = v18;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  *(unsigned char *)(v19 + 40) = 1;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
}

uint64_t closure #1 in LACUIAuthCountdownView.barButtons(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v22 - v14;
  v22[1] = a1;
  outlined init with copy of LACUIAuthCountdownView(a2, (uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownView((uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  char v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v13, v15, v9);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>));
  v18((char *)(a3 + *(int *)(v19 + 48)), v13, v9);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v20)(v13, v9);
}

uint64_t LACUIAuthCountdownView.button(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  char v6 = *(unsigned char *)(a1 + 32);
  return closure #1 in LACUIAuthCountdownView.button(with:)((uint64_t)v5, v2, a2);
}

uint64_t closure #1 in LACUIAuthCountdownView.informativeText.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v39 = a2;
  uint64_t v2 = type metadata accessor for AccessibilityTraits();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v35 = (uint64_t)&v35 - v9;
  swift_bridgeObjectRetain();
  static Font.largeTitle.getter();
  uint64_t v10 = Text.font(_:)();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_bridgeObjectRelease();
  swift_release();
  static Font.Weight.bold.getter();
  uint64_t v15 = Text.fontWeight(_:)();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  outlined consume of Text.Storage(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v12) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v40 = v15;
  uint64_t v41 = v17;
  char v42 = v19 & 1;
  uint64_t v43 = v21;
  uint64_t v44 = KeyPath;
  char v45 = 1;
  char v46 = v12;
  uint64_t v47 = v23;
  uint64_t v48 = v24;
  uint64_t v49 = v25;
  uint64_t v50 = v26;
  char v51 = 0;
  static AccessibilityTraits.isHeader.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>);
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
  outlined consume of Text.Storage(v40, v41, v42);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v27 = v35;
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v8, v35, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  uint64_t v28 = *(void *)(v36 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  uint64_t v29 = *(void *)(v28 + 40);
  uint64_t v30 = *(void *)(v28 + 48);
  uint64_t v31 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v27, (uint64_t)v8, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  uint64_t v32 = v39;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v8, v39, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  uint64_t v33 = v32
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>))
               + 48);
  *(void *)uint64_t v33 = v29;
  *(void *)(v33 + 8) = v30;
  *(unsigned char *)(v33 + 16) = 0;
  *(void *)(v33 + 24) = MEMORY[0x263F8EE78];
  *(void *)(v33 + 32) = v31;
  *(unsigned char *)(v33 + 40) = 1;
  outlined copy of Text.Storage(v29, v30, 0);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  outlined consume of Text.Storage(v29, v30, 0);
  swift_release();
  swift_bridgeObjectRelease();
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
}

uint64_t closure #1 in closure #1 in LACUIAuthCountdownView.actionItems(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t closure #1 in LACUIAuthCountdownView.button(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v109 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v95 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v97 = (uint64_t)&v84 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v99 = *(void *)(v8 - 8);
  uint64_t v100 = v8;
  MEMORY[0x270FA5388](v8);
  long long v98 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.fontWeight(_:)>>.0);
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  uint64_t v92 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
  uint64_t v11 = MEMORY[0x270FA5388](v104);
  uint64_t v91 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v96 = (uint64_t)&v84 - v13;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>.Storage);
  MEMORY[0x270FA5388](v106);
  uint64_t v108 = (uint64_t)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>.Storage);
  MEMORY[0x270FA5388](v101);
  uint64_t v102 = (uint64_t)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
  MEMORY[0x270FA5388](v107);
  uint64_t v103 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for RoundedRectangle();
  MEMORY[0x270FA5388](v89);
  uint64_t v90 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  char v19 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
  uint64_t v84 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v24 = (char *)&v84 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v28 = (char *)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v84 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  if (*(unsigned char *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 32) != 1)
    {
      v111[0] = *(_OWORD *)(a1 + 16);
      outlined init with copy of LACUIAuthCountdownView(v105, (uint64_t)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
      unint64_t v72 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      uint64_t v73 = swift_allocObject();
      outlined init with take of LACUIAuthCountdownView((uint64_t)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v73 + v72, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
      unint64_t v74 = v73 + ((v27 + v72 + 7) & 0xFFFFFFFFFFFFFFF8);
      long long v75 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)unint64_t v74 = *(_OWORD *)a1;
      *(_OWORD *)(v74 + 16) = v75;
      *(unsigned char *)(v74 + 32) = *(unsigned char *)(a1 + 32);
      long long v110 = v111[0];
      outlined retain of LACUIAuthButtonConfiguration(a1);
      outlined retain of String((uint64_t)v111);
      lazy protocol witness table accessor for type String and conformance String();
      swift_retain();
      uint64_t v76 = v98;
      Button<>.init<A>(_:action:)();
      char v77 = static Edge.Set.all.getter();
      uint64_t v79 = v99;
      uint64_t v78 = v100;
      uint64_t v80 = (uint64_t)v95;
      (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v95, v76, v100);
      uint64_t v81 = v80 + *(int *)(v4 + 36);
      *(unsigned char *)uint64_t v81 = v77;
      *(_OWORD *)(v81 + 8) = 0u;
      *(_OWORD *)(v81 + 24) = 0u;
      *(unsigned char *)(v81 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v76, v78);
      swift_release();
      uint64_t v47 = &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>;
      uint64_t v82 = v97;
      outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v80, v97, &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v82, v108, &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
      swift_storeEnumTagMultiPayload();
      lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
      _ConditionalContent<>.init(storage:)();
      uint64_t v71 = v82;
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v71, v47);
    }
    v111[0] = *(_OWORD *)(a1 + 16);
    outlined init with copy of LACUIAuthCountdownView(v105, (uint64_t)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    unint64_t v35 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v36 = swift_allocObject();
    outlined init with take of LACUIAuthCountdownView((uint64_t)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v36 + v35, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    unint64_t v37 = v36 + ((v27 + v35 + 7) & 0xFFFFFFFFFFFFFFF8);
    long long v38 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)unint64_t v37 = *(_OWORD *)a1;
    *(_OWORD *)(v37 + 16) = v38;
    *(unsigned char *)(v37 + 32) = *(unsigned char *)(a1 + 32);
    long long v110 = v111[0];
    outlined retain of LACUIAuthButtonConfiguration(a1);
    outlined retain of String((uint64_t)v111);
    lazy protocol witness table accessor for type String and conformance String();
    swift_retain();
    uint64_t v39 = v98;
    Button<>.init<A>(_:action:)();
    static Font.Weight.bold.getter();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
    uint64_t v40 = v92;
    uint64_t v41 = v100;
    View.fontWeight(_:)();
    (*(void (**)(char *, uint64_t))(v99 + 8))(v39, v41);
    char v42 = static Edge.Set.all.getter();
    uint64_t v43 = v93;
    uint64_t v44 = (uint64_t)v91;
    uint64_t v45 = v94;
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v91, v40, v94);
    uint64_t v46 = v44 + *(int *)(v104 + 36);
    *(unsigned char *)uint64_t v46 = v42;
    *(_OWORD *)(v46 + 8) = 0u;
    *(_OWORD *)(v46 + 24) = 0u;
    *(unsigned char *)(v46 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v45);
    swift_release();
    uint64_t v47 = &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>;
    uint64_t v48 = v96;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v44, v96, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v102, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    uint64_t v49 = (uint64_t)v103;
    _ConditionalContent<>.init(storage:)();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v49, v108, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
  }
  else
  {
    uint64_t v50 = *(char **)(a1 + 16);
    uint64_t v97 = *(void *)(a1 + 24);
    long long v98 = v50;
    uint64_t v99 = v33;
    uint64_t v100 = (uint64_t)&v84 - v34;
    outlined init with copy of LACUIAuthCountdownView(v105, (uint64_t)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    unint64_t v51 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v105 = v4;
    unint64_t v52 = (v27 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v53 = swift_allocObject();
    uint64_t v54 = outlined init with take of LACUIAuthCountdownView((uint64_t)v28, v53 + v51, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
    unint64_t v55 = v53 + v52;
    long long v56 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)unint64_t v55 = *(_OWORD *)a1;
    *(_OWORD *)(v55 + 16) = v56;
    *(unsigned char *)(v55 + 32) = *(unsigned char *)(a1 + 32);
    MEMORY[0x270FA5388](v54);
    uint64_t v57 = v97;
    *(&v84 - 2) = (uint64_t)v98;
    *(&v84 - 1) = v57;
    outlined retain of LACUIAuthButtonConfiguration(a1);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    Button.init(action:label:)();
    BorderedProminentButtonStyle.init()();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
    lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, MEMORY[0x263F1A3B8]);
    uint64_t v58 = v86;
    View.buttonStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v19, v58);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v22, v20);
    uint64_t v59 = v90;
    uint64_t v60 = &v90[*(int *)(v89 + 20)];
    uint64_t v61 = *MEMORY[0x263F19860];
    uint64_t v62 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v62 - 8) + 104))(v60, v61, v62);
    __asm { FMOV            V0.2D, #14.0 }
    *uint64_t v59 = _Q0;
    uint64_t v68 = (uint64_t)&v32[*(int *)(v99 + 36)];
    outlined init with copy of LACUIAuthCountdownView((uint64_t)v59, v68, MEMORY[0x263F19048]);
    *(_WORD *)(v68
             + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                      + 36)) = 256;
    uint64_t v69 = v87;
    uint64_t v70 = v88;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v32, v24, v88);
    outlined destroy of RoundedRectangle((uint64_t)v59, MEMORY[0x263F19048]);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v24, v70);
    swift_release();
    uint64_t v47 = &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>;
    uint64_t v48 = v100;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v32, v100, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v102, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    uint64_t v49 = (uint64_t)v103;
    _ConditionalContent<>.init(storage:)();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v49, v108, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
  }
  _ConditionalContent<>.init(storage:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v49, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
  uint64_t v71 = v48;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v71, v47);
}

uint64_t LACUIAuthCountdownView.primaryButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v33[0] = a2;
  v33[1] = a3;
  uint64_t v37 = a4;
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v8 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  uint64_t v15 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a1;
  uint64_t v39 = v33[0];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
  Button.init(action:label:)();
  BorderedProminentButtonStyle.init()();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, MEMORY[0x263F1A3B8]);
  uint64_t v18 = v34;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  char v19 = v36;
  uint64_t v20 = &v36[*(int *)(v6 + 28)];
  uint64_t v21 = *MEMORY[0x263F19860];
  uint64_t v22 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  __asm { FMOV            V0.2D, #14.0 }
  _OWORD *v19 = _Q0;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
  uint64_t v29 = v37;
  uint64_t v30 = v37 + *(int *)(v28 + 36);
  outlined init with copy of LACUIAuthCountdownView((uint64_t)v19, v30, MEMORY[0x263F19048]);
  *(_WORD *)(v30
           + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                    + 36)) = 256;
  uint64_t v31 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v29, v17, v35);
  outlined destroy of RoundedRectangle((uint64_t)v19, MEMORY[0x263F19048]);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v31);
}

uint64_t LACUIAuthCountdownView.secondaryButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.fontWeight(_:)>>.0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  swift_retain();
  Button<>.init<A>(_:action:)();
  static Font.Weight.bold.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
  View.fontWeight(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v13 = static Edge.Set.all.getter();
  uint64_t v14 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v18, v12, v9);
  uint64_t v15 = v14
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>)
               + 36);
  *(unsigned char *)uint64_t v15 = v13;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  *(unsigned char *)(v15 + 40) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t closure #1 in closure #1 in LACUIAuthCountdownView.button(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  long long v3 = *(_OWORD *)(a2 + 16);
  v6[0] = *(_OWORD *)a2;
  v6[1] = v3;
  char v7 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void (**)(_OWORD *))(*(void *)v2 + 168);
  swift_retain();
  v4(v6);
  return swift_release();
}

uint64_t LACUIAuthCountdownView.barButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = a1;
  v13[1] = a2;
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  swift_retain();
  Button<>.init<A>(_:action:)();
  char v10 = static Edge.Set.all.getter();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a3, v9, v6);
  uint64_t v11 = a3
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>)
               + 36);
  *(unsigned char *)uint64_t v11 = v10;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *(unsigned char *)(v11 + 40) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

double closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)@<D0>(_OWORD *a1@<X8>)
{
  swift_bridgeObjectRetain();
  static Font.headline.getter();
  uint64_t v2 = Text.font(_:)();
  uint64_t v4 = v3;
  char v6 = v5;
  swift_bridgeObjectRelease();
  swift_release();
  static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  static Alignment.center.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v16, 0.0, 1, 0.0, 1);
  outlined consume of Text.Storage(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  long long v7 = v24;
  long long v8 = v25;
  long long v9 = v22;
  a1[8] = v23;
  a1[9] = v7;
  long long v10 = v26;
  a1[10] = v8;
  a1[11] = v10;
  long long v11 = v20;
  long long v12 = v21;
  long long v13 = v18;
  a1[4] = v19;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v9;
  long long v14 = v16[1];
  *a1 = v16[0];
  a1[1] = v14;
  double result = *(double *)&v17;
  a1[2] = v17;
  a1[3] = v13;
  return result;
}

uint64_t type metadata accessor for LACUIAuthCountdownView()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthCountdownView;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownView) {
    return swift_getSingletonMetadata();
  }
  return result;
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

uint64_t key path getter for EnvironmentValues.symbolRenderingMode : EnvironmentValues, serialized()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_25502DF98()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t key path setter for EnvironmentValues.symbolRenderingMode : EnvironmentValues, serialized(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x270FA5388](v2 - 8);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for SymbolRenderingMode?);
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_25502E054@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25502E080()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>;
  if (!lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
    lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>, (void (*)(void))lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>()
{
  return lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
    type metadata accessor for BorderedProminentButtonStyle();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
    lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, MEMORY[0x263F1A3B8]);
    swift_getOpaqueTypeConformance2();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ClipEffect<RoundedRectangle> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<Text>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration;
  if (!lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration);
  }
  return result;
}

double partial apply for closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)@<D0>(_OWORD *a1@<X8>)
{
  return closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)(a1);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Text, _PaddingLayout>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25502E6EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_25502E6F8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = v3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (uint64_t *)((char *)a1 + v6);
    unint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownView(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *initializeWithCopy for LACUIAuthCountdownView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  unint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for LACUIAuthCountdownView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + v6, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LACUIAuthCountdownView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + v7, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25502ECBC);
}

uint64_t sub_25502ECBC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25502ED84);
}

uint64_t sub_25502ED84(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for LACUIAuthCountdownView()
{
  type metadata accessor for Environment<ColorScheme>.Content();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Environment<ColorScheme>.Content()
{
  if (!lazy cache variable for type metadata for Environment<ColorScheme>.Content)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ColorScheme>.Content);
    }
  }
}

unint64_t lazy protocol witness table accessor for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier()
{
  unint64_t result = lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier;
  if (!lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier);
  }
  return result;
}

uint64_t sub_25502F0B8()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
}

uint64_t sub_25502F0F4()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Color?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Color?>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
    lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>((unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Image, _AspectRatioLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<SymbolRenderingMode?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_25502F298()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _TraitWritingModifier<LayoutPriorityTraitKey> and conformance _TraitWritingModifier<A>, &demangling cache variable for type metadata for _TraitWritingModifier<LayoutPriorityTraitKey>);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_25502F448()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_25502F554()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined retain of ModifiedContent<Text, _PaddingLayout>(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of LACUIAuthButtonConfiguration(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of String(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #3 in closure #1 in LACUIAuthCountdownView.button(with:)()
{
  uint64_t v1 = *(void *)(type metadata accessor for LACUIAuthCountdownView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return closure #1 in closure #1 in LACUIAuthCountdownView.button(with:)(v0 + v2, v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t objectdestroy_25Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for LACUIAuthCountdownView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 33, v2 | 7);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<TextAlignment> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<TextAlignment>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined init with take of LACUIAuthCountdownView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of LACUIAuthCountdownView(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of RoundedRectangle(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2)
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

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = (int *)(type metadata accessor for LACUIAuthCountdownView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t partial apply for closure #1 in closure #1 in LACUIAuthCountdownView.buttons.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for LACUIAuthCountdownView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  long long v7 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v7;
  char v10 = *(unsigned char *)(a1 + 32);
  return closure #1 in LACUIAuthCountdownView.button(with:)((uint64_t)v9, v6, a2);
}

id static LACUIIcon.genericIcon.getter()
{
  id v0 = objc_msgSend(self, sel_genericApplicationIcon);
  id result = LACUIImageWithIcon(v0);
  if (result)
  {
    id v2 = result;

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static LACUIIcon.image(forBundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = objc_allocWithZone(MEMORY[0x263F4B540]);
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)MEMORY[0x25A2848C0](a1, a2);
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

    id result = LACUIImageWithIcon(v6);
    if (result)
    {
      id v8 = result;

      return v8;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_genericIcon);
    return v9;
  }
  return result;
}

id static LACUIIcon.image(forPath:)(uint64_t a1, unint64_t a2)
{
  id v2 = specialized static LACUIIcon.icon(forPath:)(a1, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    id result = LACUIImageWithIcon(v2);
    if (result)
    {
      id v5 = result;

      return v5;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_genericIcon);
    return v6;
  }
  return result;
}

LACUIIcon __swiftcall LACUIIcon.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (LACUIIcon)objc_msgSend(v0, sel_init);
}

id LACUIIcon.init()()
{
  v1.super_class = (Class)LACUIIcon;
  return objc_msgSendSuper2(&v1, sel_init);
}

id specialized static LACUIIcon.icon(forPath:)(uint64_t a1, unint64_t a2)
{
  uint64_t v44 = type metadata accessor for URL.DirectoryHint();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  id v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for URL();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  char v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UTType();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  long long v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  long long v20 = (char *)&v41 - v19;
  if (!a2) {
    return 0;
  }
  uint64_t v21 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v21 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v21) {
    return 0;
  }
  swift_bridgeObjectRetain();
  UTType.init(_:)();
  outlined init with copy of UTType?((uint64_t)v20, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v18, v11);
    uint64_t v35 = UTType.identifier.getter();
    uint64_t v37 = v36;
    id v38 = objc_allocWithZone(MEMORY[0x263F4B540]);
    uint64_t v39 = (void *)MEMORY[0x25A2848C0](v35, v37);
    swift_bridgeObjectRelease();
    id v34 = objc_msgSend(v38, sel_initWithType_, v39);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_11;
  }
  outlined destroy of UTType?((uint64_t)v18);
  long long v22 = (void *)MEMORY[0x25A2848C0](a1, a2);
  id v23 = objc_msgSend(v22, sel_stringByExpandingTildeInPath);

  long long v24 = v23;
  if (!v23)
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    long long v24 = (void *)MEMORY[0x25A2848C0](v25);
    swift_bridgeObjectRelease();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v26 = objc_msgSend(self, sel_defaultManager);
  unsigned __int8 v27 = objc_msgSend(v26, sel_fileExistsAtPath_, v24);

  if ((v27 & 1) == 0)
  {
    outlined destroy of UTType?((uint64_t)v20);
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v28 = v41;
  uint64_t v29 = v43;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v8, 1, 1, v43);
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v5, *MEMORY[0x263F06E50], v44);
  URL.init(filePath:directoryHint:relativeTo:)();
  id v30 = objc_allocWithZone(MEMORY[0x263F4B540]);
  URL._bridgeToObjectiveC()(v31);
  uint64_t v33 = v32;
  id v34 = objc_msgSend(v30, sel_initWithURL_, v32);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
LABEL_11:
  outlined destroy of UTType?((uint64_t)v20);
  return v34;
}

unint64_t type metadata accessor for LACUIIcon()
{
  unint64_t result = lazy cache variable for type metadata for LACUIIcon;
  if (!lazy cache variable for type metadata for LACUIIcon)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACUIIcon);
  }
  return result;
}

uint64_t outlined init with copy of UTType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of UTType?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return LACUIDTOSensorNotTrustedScenePresentationHandler.init()();
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.init()()
{
  v14._uint64_t countAndFlagsBits = 0x74656863746152;
  v14._object = (void *)0xE700000000000000;
  uint64_t v1 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046170, v14);
  uint64_t v3 = v2;
  if (objc_msgSend(self, sel_deviceHasFaceID))
  {
    uint64_t v4 = 0xD000000000000022;
    id v5 = "DTO_UNAPPROVED_SENSOR_TEXT_FACE_ID";
  }
  else
  {
    uint64_t v4 = 0xD000000000000023;
    id v5 = "DTO_UNAPPROVED_SENSOR_TEXT_TOUCH_ID";
  }
  v15._uint64_t countAndFlagsBits = 0x74656863746152;
  v15._object = (void *)0xE700000000000000;
  uint64_t v6 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v4, (void *)((unint64_t)(v5 - 32) | 0x8000000000000000), v15);
  uint64_t v8 = v7;
  v16._uint64_t countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  uint64_t v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v16);
  char v10 = &v0[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(void *)char v10 = 1;
  *((void *)v10 + 1) = v1;
  *((void *)v10 + 2) = v3;
  *((void *)v10 + 3) = v6;
  *((void *)v10 + 4) = v8;
  *((void *)v10 + 5) = v9;
  *((void *)v10 + 6) = v11;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v13, sel_init);
}

void LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init(configuration:)()
{
}

void LACUIDTOSensorNotTrustedScenePresentationHandler.init(configuration:)()
{
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler()
{
  return self;
}

uint64_t method lookup function for LACUIDTOSensorNotTrustedScenePresentationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIDTOSensorNotTrustedScenePresentationHandler);
}

uint64_t dispatch thunk of LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t LACUIAuthContainerViewModel.__allocating_init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LACUIAuthState();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  Swift::String v14 = (char *)&v22 - v13;
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  uint64_t v17 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  outlined init with copy of LACUIAuthState((uint64_t)v14, (uint64_t)v12);
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthState((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v16, v8, v5);
  uint64_t v18 = v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(void *)(v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(void *)(v18 + 8) = v22;
  swift_unknownObjectWeakAssign();
  long long v23 = xmmword_255043300;
  uint64_t v19 = type metadata accessor for TaskPriority();
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v26 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 1, 1, v19);
  long long v20 = (void *)swift_allocObject();
  void v20[2] = 0;
  v20[3] = 0;
  v20[4] = v15;
  outlined init with take of LACUIAuthAction((uint64_t)&v23, (uint64_t)(v20 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v4, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:), (uint64_t)v20);
  swift_unknownObjectRelease();
  swift_release();
  return v15;
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
  outlined destroy of TaskPriority?(a1);
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

uint64_t key path getter for LACUIAuthContainerViewModel.state : LACUIAuthContainerViewModel(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 96))();
}

uint64_t key path setter for LACUIAuthContainerViewModel.state : LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACUIAuthState();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  outlined init with copy of LACUIAuthState(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of LACUIAuthState((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  static Published.subscript.setter();
  return outlined destroy of LACUIAuthState((uint64_t)v7);
}

uint64_t LACUIAuthContainerViewModel.state.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  return swift_release();
}

uint64_t key path setter for LACUIAuthContainerViewModel.$state : LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>.Publisher);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t LACUIAuthContainerViewModel.$state.getter()
{
  return swift_endAccess();
}

uint64_t LACUIAuthContainerViewModel.dataSource.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  swift_beginAccess();
  return MEMORY[0x25A2854F0](v1);
}

uint64_t LACUIAuthContainerViewModel.dataSource.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*LACUIAuthContainerViewModel.dataSource.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25A2854F0](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return LACUIAuthContainerViewModel.dataSource.modify;
}

void LACUIAuthContainerViewModel.dataSource.modify(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t LACUIAuthContainerViewModel.init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LACUIAuthState();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  uint64_t v17 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  outlined init with copy of LACUIAuthState((uint64_t)v15, (uint64_t)v13);
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthState((uint64_t)v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v16, v9, v6);
  uint64_t v18 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(void *)(v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(void *)(v18 + 8) = v22;
  swift_unknownObjectWeakAssign();
  long long v23 = xmmword_255043300;
  uint64_t v19 = type metadata accessor for TaskPriority();
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v26 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
  long long v20 = (void *)swift_allocObject();
  void v20[2] = 0;
  v20[3] = 0;
  v20[4] = v2;
  outlined init with take of LACUIAuthAction((uint64_t)&v23, (uint64_t)(v20 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v20);
  swift_unknownObjectRelease();
  swift_release();
  return v2;
}

uint64_t outlined init with copy of LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of LACUIAuthState(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall LACUIAuthContainerViewModel.refresh()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = xmmword_255043300;
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  char v9 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (void *)swift_allocObject();
  _OWORD v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  outlined init with take of LACUIAuthAction((uint64_t)&v6, (uint64_t)(v5 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v5);
  swift_release();
}

uint64_t LACUIAuthContainerViewModel.send(action:)(uint64_t a1)
{
  *(void *)(v2 + 56) = v1;
  type metadata accessor for LACUIAuthState();
  *(void *)(v2 + 64) = swift_task_alloc();
  *(void *)(v2 + 72) = swift_task_alloc();
  *(void *)(v2 + 80) = swift_task_alloc();
  *(void *)(v2 + 88) = swift_task_alloc();
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 96) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 112) = v4;
  *(unsigned char *)(v2 + 49) = *(unsigned char *)(a1 + 32);
  type metadata accessor for MainActor();
  *(void *)(v2 + 128) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v2 + 136) = v6;
  *(void *)(v2 + 144) = v5;
  return MEMORY[0x270FA2498](LACUIAuthContainerViewModel.send(action:), v6, v5);
}

uint64_t LACUIAuthContainerViewModel.send(action:)()
{
  uint64_t v1 = (*(uint64_t (**)(void))(**(void **)(v0 + 56) + 144))();
  *(void *)(v0 + 152) = v1;
  if (v1)
  {
    uint64_t v3 = v2;
    char v4 = *(unsigned char *)(v0 + 49);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 120);
    long long v22 = *(_OWORD *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void))(*(void *)v7 + 96))();
    *(_OWORD *)(v0 + 16) = v22;
    *(void *)(v0 + 32) = v6;
    *(void *)(v0 + 40) = v5;
    *(unsigned char *)(v0 + 48) = v4;
    uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
    char v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v9;
    *char v9 = v0;
    v9[1] = LACUIAuthContainerViewModel.send(action:);
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    return v21(v10, v11, v0 + 16, ObjectType, v3);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 88);
    swift_release();
    uint64_t v14 = type metadata accessor for LACUIAuthCountdownConfiguration();
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t))(**(void **)(v0 + 56) + 96))(v15);
    LOBYTE(v13) = specialized static LACUIAuthState.== infix(_:_:)(v16, v17);
    outlined destroy of LACUIAuthState(v17);
    if ((v13 & 1) == 0)
    {
      uint64_t v18 = *(void *)(v0 + 64);
      uint64_t v19 = *(void *)(v0 + 72);
      outlined init with copy of LACUIAuthState(*(void *)(v0 + 88), v19);
      swift_getKeyPath();
      swift_getKeyPath();
      outlined init with copy of LACUIAuthState(v19, v18);
      swift_retain();
      static Published.subscript.setter();
      outlined destroy of LACUIAuthState(v19);
    }
    outlined destroy of LACUIAuthState(*(void *)(v0 + 88));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
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
  uint64_t v2 = *(void *)(*v0 + 72);
  swift_task_dealloc();
  swift_unknownObjectRelease();
  outlined destroy of LACUIAuthState(v2);
  uint64_t v3 = *(void *)(v1 + 144);
  char v4 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](LACUIAuthContainerViewModel.send(action:), v4, v3);
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
  uint64_t (*v8)(void);
  uint64_t v10;

  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  swift_release();
  uint64_t v3 = outlined init with take of LACUIAuthState(v1, v2);
  char v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t))(**(void **)(v0 + 56) + 96))(v3);
  LOBYTE(v2) = specialized static LACUIAuthState.== infix(_:_:)(v4, v5);
  outlined destroy of LACUIAuthState(v5);
  if ((v2 & 1) == 0)
  {
    uint64_t v6 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 72);
    outlined init with copy of LACUIAuthState(*(void *)(v0 + 88), v7);
    swift_getKeyPath();
    swift_getKeyPath();
    outlined init with copy of LACUIAuthState(v7, v6);
    swift_retain();
    static Published.subscript.setter();
    outlined destroy of LACUIAuthState(v7);
  }
  outlined destroy of LACUIAuthState(*(void *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t LACUIAuthContainerViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource);
  return v0;
}

uint64_t LACUIAuthContainerViewModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIAuthContainerViewModel@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUIAuthContainerViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t LACUIAuthContainerViewModel.handle(action:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  v14[0] = *(void *)a1;
  uint64_t v6 = v14[0];
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  char v15 = *(unsigned char *)(a1 + 32);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  void v11[4] = v1;
  outlined init with take of LACUIAuthAction((uint64_t)v14, (uint64_t)(v11 + 5));
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v11);
  swift_release();
  return outlined consume of LACUIAuthActionCountdown(v6, v7);
}

uint64_t protocol witness for LACUIAuthCountdownViewModelHandler.handle(action:) in conformance LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  v14[0] = *(void *)a1;
  uint64_t v6 = v14[0];
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  char v15 = *(unsigned char *)(a1 + 32);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  void v11[4] = v1;
  outlined init with take of LACUIAuthAction((uint64_t)v14, (uint64_t)(v11 + 5));
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v11);
  swift_release();
  return outlined consume of LACUIAuthActionCountdown(v6, v7);
}

uint64_t closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  outlined init with take of LACUIAuthAction(a5, v5 + 16);
  uint64_t v9 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)a4 + 184) + **(int **)(*(void *)a4 + 184));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 56) = v7;
  void *v7 = v5;
  v7[1] = closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return v9(v5 + 16);
}

uint64_t closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s25LocalAuthenticationCoreUI27LACUIAuthContainerViewModelC15sendToMainActor33_B25DC98AA5C9D048A72856B75FF5B62ELL6actionyAA0E6ActionO_tFyyYacfU_TA_0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_255032728(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 96))();
}

uint64_t outlined init with take of LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
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

uint64_t outlined consume of LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2550329F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 120))();
}

uint64_t sub_255032A40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_255032A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 152);
  uint64_t v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t ObjC metadata update function for LACUIAuthContainerViewModel()
{
  return type metadata accessor for LACUIAuthContainerViewModel();
}

uint64_t type metadata accessor for LACUIAuthContainerViewModel()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthContainerViewModel;
  if (!type metadata singleton initialization cache for LACUIAuthContainerViewModel) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for LACUIAuthContainerViewModel()
{
  type metadata accessor for Published<LACUIAuthState>();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LACUIAuthContainerViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIAuthContainerViewModel);
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.__allocating_init(dataSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.refresh()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.send(action:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 184) + **(int **)(*(void *)v1 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v6(a1);
}

void type metadata accessor for Published<LACUIAuthState>()
{
  if (!lazy cache variable for type metadata for Published<LACUIAuthState>)
  {
    type metadata accessor for LACUIAuthState();
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<LACUIAuthState>);
    }
  }
}

uint64_t objectdestroyTm_1()
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + 48) >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_255032EF8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu);
  return v6(a1, v4);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x8000000255045730;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x726F4D6E7261656CLL;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701736292;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x65756E69746E6F63;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v3 = 0x8000000255045760;
      break;
    case 5:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6C65636E6163;
      break;
    case 6:
      unint64_t v5 = 0x61436D6F74737563;
      unint64_t v3 = 0xEC0000006C65636ELL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x8000000255045730;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000065;
      if (v5 == 0x726F4D6E7261656CLL) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701736292) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x65756E69746E6F63) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0x8000000255045760;
      if (v5 != 0xD000000000000015) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v2 = 0x6C65636E6163;
      goto LABEL_18;
    case 6:
      unint64_t v6 = 0xEC0000006C65636ELL;
      if (v5 != 0x61436D6F74737563) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

LocalAuthenticationCoreUI::LACUIAuthCountdownConfiguration::ActionButtonIdentifier_optional __swiftcall LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 7;
  if (v5 < 7) {
    char v7 = v5;
  }
  char *v4 = v7;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:familiarLocationsUnavailable:customCancelTitle:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v63 = a3;
  uint64_t v64 = a8;
  int v55 = a5;
  int v56 = a7;
  LODWORD(v58) = a6;
  unint64_t v61 = a4;
  uint64_t v62 = a1;
  unint64_t v59 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v65 = (uint64_t)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthCountdownItemConfiguration>);
  uint64_t v13 = swift_allocObject();
  long long v60 = xmmword_2550443B0;
  *(_OWORD *)(v13 + 16) = xmmword_2550443B0;
  uint64_t v14 = specialized static LocalizedStrings.ratchetCoolOffSecurityDelayDuration.getter();
  uint64_t v16 = v15;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  *(void *)&long long v66 = 0xD000000000000015;
  *((void *)&v66 + 1) = 0x80000002550462F0;
  char v67 = 0;
  _print_unlocked<A, B>(_:_:)();
  v17._uint64_t countAndFlagsBits = 0x656C74697425;
  v17._object = (void *)0xE600000000000000;
  String.append(_:)(v17);
  unint64_t v18 = v69;
  *(void *)(v13 + 32) = v68;
  *(void *)(v13 + 40) = v18;
  *(void *)(v13 + 48) = 0xD000000000000015;
  *(void *)(v13 + 56) = 0x80000002550462F0;
  *(unsigned char *)(v13 + 64) = 0;
  *(void *)(v13 + 72) = v14;
  *(void *)(v13 + 80) = v16;
  v70._uint64_t countAndFlagsBits = 0x74656863746152;
  v70._object = (void *)0xE700000000000000;
  uint64_t v19 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000255046310, v70);
  uint64_t v21 = v20;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  long long v57 = xmmword_2550443C0;
  long long v66 = xmmword_2550443C0;
  char v67 = 1;
  _print_unlocked<A, B>(_:_:)();
  v22._uint64_t countAndFlagsBits = 0x656C74697425;
  v22._object = (void *)0xE600000000000000;
  String.append(_:)(v22);
  unint64_t v23 = v69;
  *(void *)(v13 + 88) = v68;
  *(void *)(v13 + 96) = v23;
  *(_OWORD *)(v13 + 104) = v57;
  *(unsigned char *)(v13 + 120) = 1;
  *(void *)(v13 + 128) = v19;
  *(void *)(v13 + 136) = v21;
  if (v58)
  {
    v71._uint64_t countAndFlagsBits = 0x74656863746152;
    v71._object = (void *)0xE700000000000000;
    uint64_t v24 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002CLL, (void *)0x80000002550463C0, v71);
    uint64_t v26 = v25;
    uint64_t v68 = 0;
    unint64_t v69 = 0xE000000000000000;
    *(void *)&long long v66 = 0xD000000000000013;
    *((void *)&v66 + 1) = 0x80000002550463A0;
    char v67 = 1;
    _print_unlocked<A, B>(_:_:)();
    v27._uint64_t countAndFlagsBits = 0x656C74697425;
    v27._object = (void *)0xE600000000000000;
    String.append(_:)(v27);
    uint64_t v28 = v68;
    unint64_t v29 = v69;
    unint64_t v31 = *(void *)(v13 + 16);
    unint64_t v30 = *(void *)(v13 + 24);
    if (v31 >= v30 >> 1) {
      uint64_t v13 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1, (char *)v13);
    }
    *(void *)(v13 + 16) = v31 + 1;
    uint64_t v32 = v13 + 56 * v31;
    *(void *)(v32 + 32) = v28;
    *(void *)(v32 + 40) = v29;
    *(void *)(v32 + 48) = 0xD000000000000013;
    *(void *)(v32 + 56) = 0x80000002550463A0;
    *(unsigned char *)(v32 + 64) = 1;
    *(void *)(v32 + 72) = v24;
    *(void *)(v32 + 80) = v26;
  }
  unint64_t v33 = v61;
  if (v59)
  {
    unint64_t v58 = v59;
  }
  else
  {
    v72._uint64_t countAndFlagsBits = 0x74656863746152;
    v72._object = (void *)0xE700000000000000;
    uint64_t v62 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046340, v72);
    unint64_t v58 = v34;
  }
  swift_bridgeObjectRetain();
  if (v33)
  {
    unint64_t v59 = v33;
  }
  else
  {
    uint64_t v63 = specialized static LACUIAuthCountdownConfiguration.message(strictModeEnabled:familiarLocationsUnavailable:)(v55 & 1, v56 & 1);
    unint64_t v59 = v35;
  }
  uint64_t v36 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56);
  v37(v65, 1, 1, v36);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = v60;
  swift_bridgeObjectRetain();
  v73._uint64_t countAndFlagsBits = 0x74656863746152;
  v73._object = (void *)0xE700000000000000;
  uint64_t v39 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001DLL, (void *)0x8000000255046360, v73);
  *(void *)(v38 + 32) = 0xD000000000000012;
  *(void *)(v38 + 40) = 0x8000000255045730;
  *(void *)(v38 + 48) = v39;
  *(void *)(v38 + 56) = v40;
  *(unsigned char *)(v38 + 64) = 0;
  v74._uint64_t countAndFlagsBits = 0x74656863746152;
  v74._object = (void *)0xE700000000000000;
  uint64_t v41 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v74);
  *(void *)(v38 + 72) = 0x726F4D6E7261656CLL;
  *(void *)(v38 + 80) = 0xE900000000000065;
  *(void *)(v38 + 88) = v41;
  *(void *)(v38 + 96) = v42;
  *(unsigned char *)(v38 + 104) = 1;
  if (a10)
  {
    unint64_t v61 = 0xEC0000006C65636ELL;
    uint64_t v43 = 0x61436D6F74737563;
    *(void *)&long long v60 = a10;
  }
  else
  {
    v75._uint64_t countAndFlagsBits = 0;
    v75._object = (void *)0xE000000000000000;
    uint64_t v64 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v75);
    *(void *)&long long v60 = v44;
    unint64_t v61 = 0xE600000000000000;
    uint64_t v43 = 0x6C65636E6163;
  }
  uint64_t v45 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v46 = a9 + v45[7];
  v37(v46, 1, 1, v36);
  uint64_t v47 = v45[8];
  *(void *)(a9 + v47) = 0;
  uint64_t v48 = a9 + v45[10];
  *(unsigned char *)(v48 + 32) = 0;
  *(_OWORD *)uint64_t v48 = 0u;
  *(_OWORD *)(v48 + 16) = 0u;
  *(unsigned char *)(a9 + v45[11]) = 1;
  *(_OWORD *)a9 = xmmword_2550443D0;
  *(unsigned char *)(a9 + 16) = 0;
  unint64_t v49 = v58;
  *(void *)(a9 + 24) = v62;
  *(void *)(a9 + 32) = v49;
  unint64_t v50 = v59;
  *(void *)(a9 + 40) = v63;
  *(void *)(a9 + 48) = v50;
  swift_bridgeObjectRetain();
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?(v65, v46);
  swift_bridgeObjectRelease();
  *(void *)(a9 + v47) = v13;
  *(void *)(a9 + v45[9]) = v38;
  uint64_t result = outlined consume of LACUIAuthActionCountdown(*(void *)v48, *(void *)(v48 + 8));
  unint64_t v52 = v61;
  *(void *)uint64_t v48 = v43;
  *(void *)(v48 + 8) = v52;
  uint64_t v53 = v60;
  *(void *)(v48 + 16) = v64;
  *(void *)(v48 + 24) = v53;
  *(unsigned char *)(v48 + 32) = 2;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40._uint64_t countAndFlagsBits = 0x74656863746152;
  v40._object = (void *)0xE700000000000000;
  uint64_t v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ALL, (void *)0x80000002550463F0, v40);
  uint64_t v38 = v10;
  uint64_t v39 = v9;
  v41._uint64_t countAndFlagsBits = 0x74656863746152;
  v41._object = (void *)0xE700000000000000;
  uint64_t v11 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046410, v41);
  uint64_t v36 = v12;
  uint64_t v37 = v11;
  uint64_t v13 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v8, 1, 1, v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2550443B0;
  v42._uint64_t countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  uint64_t v16 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v42);
  *(void *)(v15 + 32) = 0xD000000000000015;
  *(void *)(v15 + 40) = 0x8000000255045760;
  *(void *)(v15 + 48) = v16;
  *(void *)(v15 + 56) = v17;
  *(unsigned char *)(v15 + 64) = 0;
  v43._uint64_t countAndFlagsBits = 0x74656863746152;
  v43._object = (void *)0xE700000000000000;
  uint64_t v18 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v43);
  *(void *)(v15 + 72) = 0x726F4D6E7261656CLL;
  *(void *)(v15 + 80) = 0xE900000000000065;
  *(void *)(v15 + 88) = v18;
  *(void *)(v15 + 96) = v19;
  *(unsigned char *)(v15 + 104) = 1;
  if (a2)
  {
    unint64_t v34 = 0xEC0000006C65636ELL;
    uint64_t v35 = a1;
    uint64_t v20 = 0x61436D6F74737563;
    uint64_t v33 = a2;
  }
  else
  {
    v44._uint64_t countAndFlagsBits = 0;
    v44._object = (void *)0xE000000000000000;
    uint64_t v21 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v44);
    uint64_t v33 = v22;
    unint64_t v34 = 0xE600000000000000;
    uint64_t v35 = v21;
    uint64_t v20 = 0x6C65636E6163;
  }
  unint64_t v23 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v24 = a3 + v23[7];
  v14((char *)v24, 1, 1, v13);
  uint64_t v25 = v23[8];
  *(void *)(a3 + v25) = 0;
  uint64_t v26 = a3 + v23[10];
  *(unsigned char *)(v26 + 32) = 0;
  *(_OWORD *)uint64_t v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  *(unsigned char *)(a3 + v23[11]) = 1;
  *(_OWORD *)a3 = xmmword_2550443D0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v27 = v38;
  *(void *)(a3 + 24) = v39;
  *(void *)(a3 + 32) = v27;
  uint64_t v28 = v36;
  *(void *)(a3 + 40) = v37;
  *(void *)(a3 + 48) = v28;
  swift_bridgeObjectRetain();
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, v24);
  swift_bridgeObjectRelease();
  *(void *)(a3 + v25) = MEMORY[0x263F8EE78];
  *(void *)(a3 + v23[9]) = v15;
  uint64_t result = outlined consume of LACUIAuthActionCountdown(*(void *)v26, *(void *)(v26 + 8));
  unint64_t v30 = v34;
  *(void *)uint64_t v26 = v20;
  *(void *)(v26 + 8) = v30;
  uint64_t v31 = v33;
  *(void *)(v26 + 16) = v35;
  *(void *)(v26 + 24) = v31;
  *(unsigned char *)(v26 + 32) = 2;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (uint64_t *)((char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a5)
  {
    int v47 = 2;
    BYTE5(v46[1]) = 0;
    HIWORD(v46[1]) = -5120;
    strcpy((char *)v46, "customCancel");
  }
  else
  {
    v46[0] = 0;
    v46[1] = 0;
    a4 = 0;
    int v47 = 0;
  }
  swift_bridgeObjectRetain();
  v49._uint64_t countAndFlagsBits = 0x74656863746152;
  v49._object = (void *)0xE700000000000000;
  uint64_t v15 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x8000000255046430, v49);
  uint64_t v44 = v16;
  uint64_t v45 = v15;
  uint64_t v48 = a4;
  uint64_t v41 = a5;
  if (a2)
  {
    uint64_t v42 = a1;
    uint64_t v43 = a2;
  }
  else
  {
    v50._uint64_t countAndFlagsBits = 0x74656863746152;
    v50._object = (void *)0xE700000000000000;
    uint64_t v42 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000020, (void *)0x8000000255046450, v50);
    uint64_t v43 = v17;
  }
  swift_bridgeObjectRetain();
  v51._uint64_t countAndFlagsBits = 0x74656863746152;
  v51._object = (void *)0xE700000000000000;
  uint64_t v18 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046480, v51);
  uint64_t v20 = v19;
  uint64_t v21 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v22 = (char *)v14 + *(int *)(v21 + 20);
  uint64_t v23 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, a3, v23);
  uint64_t v24 = (uint64_t *)((char *)v14 + *(int *)(v21 + 24));
  *uint64_t v14 = v18;
  v14[1] = v20;
  *uint64_t v24 = 0;
  v24[1] = 0;
  uint64_t v25 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v25(v14, 0, 1, v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_2550443B0;
  v52._uint64_t countAndFlagsBits = 0;
  v52._object = (void *)0xE000000000000000;
  uint64_t v27 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x445F4E4F54545542, (void *)0xEB00000000454E4FLL, v52);
  *(void *)(v26 + 32) = 1701736292;
  *(void *)(v26 + 40) = 0xE400000000000000;
  *(void *)(v26 + 48) = v27;
  *(void *)(v26 + 56) = v28;
  *(unsigned char *)(v26 + 64) = 0;
  v53._uint64_t countAndFlagsBits = 0x74656863746152;
  v53._object = (void *)0xE700000000000000;
  uint64_t v29 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v53);
  *(void *)(v26 + 72) = 0x726F4D6E7261656CLL;
  *(void *)(v26 + 80) = 0xE900000000000065;
  *(void *)(v26 + 88) = v29;
  *(void *)(v26 + 96) = v30;
  *(unsigned char *)(v26 + 104) = 1;
  uint64_t v31 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v32 = a6 + v31[7];
  v25((uint64_t *)v32, 1, 1, v21);
  uint64_t v33 = v31[8];
  *(void *)(a6 + v33) = 0;
  uint64_t v34 = a6 + v31[10];
  *(unsigned char *)(v34 + 32) = 0;
  *(_OWORD *)uint64_t v34 = 0u;
  *(_OWORD *)(v34 + 16) = 0u;
  *(unsigned char *)(a6 + v31[11]) = 1;
  *(void *)a6 = 0xD000000000000015;
  *(void *)(a6 + 8) = 0x80000002550462F0;
  *(unsigned char *)(a6 + 16) = 0;
  uint64_t v35 = v44;
  *(void *)(a6 + 24) = v45;
  *(void *)(a6 + 32) = v35;
  uint64_t v36 = v43;
  *(void *)(a6 + 40) = v42;
  *(void *)(a6 + 48) = v36;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, v32);
  swift_bridgeObjectRelease();
  *(void *)(a6 + v33) = 0;
  *(void *)(a6 + v31[9]) = v26;
  uint64_t result = outlined consume of LACUIAuthActionCountdown(*(void *)v34, *(void *)(v34 + 8));
  uint64_t v38 = v46[1];
  *(void *)uint64_t v34 = v46[0];
  *(void *)(v34 + 8) = v38;
  uint64_t v39 = v41;
  *(void *)(v34 + 16) = v48;
  *(void *)(v34 + 24) = v39;
  *(unsigned char *)(v34 + 32) = v47;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    int v33 = 2;
    BYTE5(v32[1]) = 0;
    HIWORD(v32[1]) = -5120;
    uint64_t v31 = a3;
    strcpy((char *)v32, "customCancel");
  }
  else
  {
    v32[0] = 0;
    v32[1] = 0;
    uint64_t v31 = 0;
    int v33 = 0;
  }
  swift_bridgeObjectRetain();
  v35._uint64_t countAndFlagsBits = 0x74656863746152;
  v35._object = (void *)0xE700000000000000;
  uint64_t v12 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x80000002550464A0, v35);
  uint64_t v29 = v13;
  uint64_t v30 = v12;
  uint64_t v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v11, 1, 1, v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2550443B0;
  swift_bridgeObjectRetain();
  v36._uint64_t countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  uint64_t v17 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v36);
  *(void *)(v16 + 32) = 0x65756E69746E6F63;
  *(void *)(v16 + 40) = 0xE800000000000000;
  *(void *)(v16 + 48) = v17;
  *(void *)(v16 + 56) = v18;
  *(unsigned char *)(v16 + 64) = 0;
  v37._uint64_t countAndFlagsBits = 0x74656863746152;
  v37._object = (void *)0xE700000000000000;
  uint64_t v19 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v37);
  *(void *)(v16 + 72) = 0x726F4D6E7261656CLL;
  *(void *)(v16 + 80) = 0xE900000000000065;
  *(void *)(v16 + 88) = v19;
  *(void *)(v16 + 96) = v20;
  *(unsigned char *)(v16 + 104) = 1;
  uint64_t v21 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v22 = a5 + v21[7];
  v15((char *)v22, 1, 1, v14);
  uint64_t v23 = v21[8];
  *(void *)(a5 + v23) = 0;
  uint64_t v24 = a5 + v21[10];
  *(unsigned char *)(v24 + 32) = 0;
  *(_OWORD *)uint64_t v24 = 0u;
  *(_OWORD *)(v24 + 16) = 0u;
  *(unsigned char *)(a5 + v21[11]) = 1;
  *(_OWORD *)a5 = xmmword_2550443E0;
  *(unsigned char *)(a5 + 16) = 1;
  uint64_t v25 = v29;
  *(void *)(a5 + 24) = v30;
  *(void *)(a5 + 32) = v25;
  *(void *)(a5 + 40) = v34;
  *(void *)(a5 + 48) = a2;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, v22);
  swift_bridgeObjectRelease();
  *(void *)(a5 + v23) = 0;
  *(void *)(a5 + v21[9]) = v16;
  uint64_t result = outlined consume of LACUIAuthActionCountdown(*(void *)v24, *(void *)(v24 + 8));
  uint64_t v27 = v32[1];
  *(void *)uint64_t v24 = v32[0];
  *(void *)(v24 + 8) = v27;
  *(void *)(v24 + 16) = v31;
  *(void *)(v24 + 24) = a4;
  *(unsigned char *)(v24 + 32) = v33;
  return result;
}

unint64_t LACUIAuthCountdownConfiguration.ActionButtonIdentifier.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x726F4D6E7261656CLL;
      break;
    case 2:
      unint64_t result = 1701736292;
      break;
    case 3:
      unint64_t result = 0x65756E69746E6F63;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0x6C65636E6163;
      break;
    case 6:
      unint64_t result = 0x61436D6F74737563;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

LocalAuthenticationCoreUI::LACUIAuthCountdownConfiguration::ActionButtonIdentifier_optional protocol witness for RawRepresentable.init(rawValue:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(Swift::String *a1)
{
  return LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(*a1);
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = LACUIAuthCountdownConfiguration.ActionButtonIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t LACUIAuthCountdownConfiguration.image.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return outlined copy of LACUIAuthImageConfiguration();
}

uint64_t LACUIAuthCountdownConfiguration.image.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = outlined consume of LACUIAuthImageConfiguration();
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.image.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownConfiguration.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.message.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.delayConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 28);
  return outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v3, a1);
}

uint64_t LACUIAuthCountdownConfiguration.delayConfiguration.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 28);
  return outlined assign with take of LACUIAuthCountdownDelayConfiguration?(a1, v3);
}

uint64_t (*LACUIAuthCountdownConfiguration.delayConfiguration.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.actionItems.getter()
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownConfiguration.actionItems.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.actionItems.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.actionButtons.getter()
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownConfiguration.actionButtons.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.actionButtons.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.rightBarButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 40);
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v3 + 24);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(v3 + 32);
  return outlined copy of LACUIAuthActionCountdown(v4, v5);
}

__n128 LACUIAuthCountdownConfiguration.rightBarButton.setter(__n128 *a1)
{
  __n128 v7 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  uint64_t v5 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 40);
  outlined consume of LACUIAuthActionCountdown(*(void *)v5, *(void *)(v5 + 8));
  __n128 result = v7;
  *(__n128 *)uint64_t v5 = v7;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  *(unsigned char *)(v5 + 32) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.rightBarButton.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.isShowingTopBar.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 44));
}

uint64_t LACUIAuthCountdownConfiguration.isShowingTopBar.setter(char a1)
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownConfiguration();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.isShowingTopBar.modify())(void)
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

__n128 LACUIAuthCountdownConfiguration.init(image:title:message:delayConfiguration:actionItems:actionButtons:rightBarButton:)@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 *a10)
{
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  char v15 = *((unsigned char *)a1 + 16);
  __n128 v30 = *a10;
  unint64_t v28 = a10[1].n128_u64[1];
  unint64_t v29 = a10[1].n128_u64[0];
  unsigned __int8 v27 = a10[2].n128_u8[0];
  uint64_t v16 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v17 = a9 + v16[7];
  uint64_t v18 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = v16[8];
  *(void *)(a9 + v19) = 0;
  uint64_t v20 = a9 + v16[10];
  *(unsigned char *)(v20 + 32) = 0;
  *(_OWORD *)uint64_t v20 = 0u;
  *(_OWORD *)(v20 + 16) = 0u;
  *(unsigned char *)(a9 + v16[11]) = 1;
  *(void *)a9 = v13;
  *(void *)(a9 + 8) = v14;
  *(unsigned char *)(a9 + 16) = v15;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?(a6, v17);
  swift_bridgeObjectRelease();
  *(void *)(a9 + v19) = a7;
  *(void *)(a9 + v16[9]) = a8;
  outlined consume of LACUIAuthActionCountdown(*(void *)v20, *(void *)(v20 + 8));
  __n128 result = v30;
  *(__n128 *)uint64_t v20 = v30;
  *(void *)(v20 + 16) = v29;
  *(void *)(v20 + 24) = v28;
  *(unsigned char *)(v20 + 32) = v27;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.learnMoreButton.getter@<X0>(uint64_t a1@<X8>)
{
  v4._uint64_t countAndFlagsBits = 0x74656863746152;
  v4._object = (void *)0xE700000000000000;
  uint64_t result = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v4);
  *(void *)a1 = 0x726F4D6E7261656CLL;
  *(void *)(a1 + 8) = 0xE900000000000065;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + v3 + 48);
      uint64_t v5 = *(void *)(a1 + v3 + 56);
      char v7 = *(unsigned char *)(a1 + v3 + 64);
      uint64_t v8 = *(void *)(a1 + v3 + 80);
      uint64_t v9 = *(void *)(a2 + v3 + 48);
      char v10 = *(unsigned char *)(a2 + v3 + 64);
      uint64_t v18 = *(void *)(a2 + v3 + 72);
      uint64_t v19 = *(void *)(a1 + v3 + 72);
      uint64_t v20 = *(void *)(a2 + v3 + 80);
      uint64_t v21 = *(void *)(a2 + v3 + 56);
      if ((*(void *)(a1 + v3 + 32) != *(void *)(a2 + v3 + 32)
         || *(void *)(a1 + v3 + 40) != *(void *)(a2 + v3 + 40))
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        return 0;
      }
      if (v7)
      {
        if ((v10 & 1) == 0) {
          goto LABEL_25;
        }
        if (v6 == v9 && v5 == v21) {
          goto LABEL_19;
        }
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        uint64_t v11 = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        uint64_t v12 = v20;
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        if ((v14 & 1) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v10)
        {
LABEL_25:
          outlined copy of LACUIAuthImageConfiguration();
          outlined copy of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          return 0;
        }
        if (v6 == v9 && v5 == v21)
        {
LABEL_19:
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          uint64_t v11 = v8;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          uint64_t v12 = v20;
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          outlined copy of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          goto LABEL_21;
        }
        char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        uint64_t v11 = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        uint64_t v12 = v20;
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        if ((v15 & 1) == 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          outlined consume of LACUIAuthImageConfiguration();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          outlined consume of LACUIAuthImageConfiguration();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
LABEL_21:
      if (v19 == v18 && v11 == v12)
      {
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0) {
          return 0;
        }
      }
      v3 += 56;
      --v2;
    }
    while (v2);
  }
  return 1;
}

{
  uint64_t v2;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  char v14;
  uint64_t result;

  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    for (uint64_t i = 0; ; i += 40)
    {
      uint64_t v6 = *(void *)(a1 + i + 48);
      char v7 = *(void *)(a1 + i + 56);
      uint64_t v8 = *(unsigned __int8 *)(a1 + i + 64);
      uint64_t v9 = *(void *)(a2 + i + 48);
      char v10 = *(void *)(a2 + i + 56);
      uint64_t v11 = *(unsigned __int8 *)(a2 + i + 64);
      uint64_t v12 = *(void *)(a1 + i + 32) == *(void *)(a2 + i + 32) && *(void *)(a1 + i + 40) == *(void *)(a2 + i + 40);
      if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      if (v6 == v9 && v7 == v10)
      {
        if (v8 != v11) {
          return 0;
        }
      }
      else
      {
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v14 & 1) == 0 || v8 != v11) {
          return result;
        }
      }
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t one-time initialization function for learnMoreURL()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  char v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, static LACUIAuthCountdownConfiguration.learnMoreURL);
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
  id v6 = objc_msgSend(self, sel_dtoLearnMoreLinkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v4, v0);
}

uint64_t LACUIAuthCountdownConfiguration.learnMoreURL.unsafeMutableAddressor()
{
  if (one-time initialization token for learnMoreURL != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
}

uint64_t static LACUIAuthCountdownConfiguration.learnMoreURL.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for learnMoreURL != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t static LACUIAuthCountdownConfiguration.empty.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  static Date.now.getter();
  Date.addingTimeInterval(_:)();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v6, v2);
  static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)(0, 0xE000000000000000, (uint64_t)v8, 0, 0, a1);
  return ((uint64_t (*)(char *, uint64_t))v9)(v8, v2);
}

uint64_t specialized static LACUIAuthCountdownConfiguration.message(strictModeEnabled:familiarLocationsUnavailable:)(char a1, char a2)
{
  if (a1)
  {
    uint64_t v2 = 0xD00000000000002ALL;
    uint64_t v3 = "RATCHET_COOL_OFF_MESSAGE_BEGIN_STRICT_MODE";
  }
  else
  {
    if ((a2 & 1) == 0)
    {
      uint64_t v4 = (void *)0x80000002550464C0;
      uint64_t v2 = 0xD00000000000001ELL;
      goto LABEL_7;
    }
    uint64_t v2 = 0xD000000000000034;
    uint64_t v3 = "RATCHET_COOL_OFF_MESSAGE_BEGIN_NO_FAMILIAR_LOCATIONS";
  }
  uint64_t v4 = (void *)((unint64_t)(v3 - 32) | 0x8000000000000000);
LABEL_7:
  v6._uint64_t countAndFlagsBits = 0x74656863746152;
  v6._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v2, v4, v6);
}

uint64_t specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v61 = (int **)((char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthCountdownDelayConfiguration?, LACUIAuthCountdownDelayConfiguration?));
  MEMORY[0x270FA5388](v6);
  uint64_t v64 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v59 - v11;
  MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v59 - v14;
  uint64_t v16 = *a1;
  uint64_t v17 = a1[1];
  uint64_t v19 = *a2;
  uint64_t v18 = a2[1];
  if (a1[2])
  {
    if (a2[2])
    {
      long long v60 = (void *)v13;
      if (v16 != v19 || v17 != v18) {
        goto LABEL_11;
      }
LABEL_10:
      outlined copy of LACUIAuthImageConfiguration();
      outlined copy of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      goto LABEL_12;
    }
LABEL_7:
    outlined copy of LACUIAuthImageConfiguration();
    outlined copy of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    goto LABEL_51;
  }
  if (a2[2]) {
    goto LABEL_7;
  }
  long long v60 = (void *)v13;
  if (v16 == v19 && v17 == v18) {
    goto LABEL_10;
  }
LABEL_11:
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  outlined copy of LACUIAuthImageConfiguration();
  outlined copy of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  char v21 = 0;
  if ((v20 & 1) == 0) {
    return v21 & 1;
  }
LABEL_12:
  if (a1[3] != a2[3] || a1[4] != a2[4])
  {
    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    char v21 = 0;
    if ((v22 & 1) == 0) {
      return v21 & 1;
    }
  }
  if (a1[5] != a2[5] || a1[6] != a2[6])
  {
    char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
    char v21 = 0;
    if ((v23 & 1) == 0) {
      return v21 & 1;
    }
  }
  uint64_t v24 = type metadata accessor for LACUIAuthCountdownConfiguration();
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + *(int *)(v24 + 28), (uint64_t)v15);
  unint64_t v59 = (int *)v24;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a2 + *(int *)(v24 + 28), (uint64_t)v12);
  uint64_t v25 = v64;
  uint64_t v26 = v64 + *(int *)(v6 + 48);
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, v64);
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, v26);
  uint64_t v27 = v63;
  unint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
  if (v28(v25, 1, v63) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    if (v28(v26, 1, v27) == 1) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }
  uint64_t v34 = v60;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v25, (uint64_t)v60);
  if (v28(v26, 1, v27) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v34);
LABEL_26:
    Swift::String v35 = &demangling cache variable for type metadata for (LACUIAuthCountdownDelayConfiguration?, LACUIAuthCountdownDelayConfiguration?);
    uint64_t v36 = v25;
LABEL_50:
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v36, v35);
    goto LABEL_51;
  }
  Swift::String v37 = v61;
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v26, (uint64_t)v61);
  if ((*v34 != *v37 || v34[1] != v37[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || (static Date.== infix(_:_:)() & 1) == 0)
  {
    goto LABEL_49;
  }
  uint64_t v38 = *(int *)(v27 + 24);
  uint64_t v39 = (void *)((char *)v34 + v38);
  uint64_t v40 = *(void *)((char *)v34 + v38 + 8);
  uint64_t v41 = (void *)((char *)v37 + v38);
  uint64_t v42 = v41[1];
  if (v40)
  {
    if (v42 && (*v39 == *v41 && v40 == v42 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
      goto LABEL_36;
    }
LABEL_49:
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v37);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v34);
    uint64_t v36 = v25;
    Swift::String v35 = &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?;
    goto LABEL_50;
  }
  if (v42) {
    goto LABEL_49;
  }
LABEL_36:
  outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v37);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v34);
LABEL_20:
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v25, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  unint64_t v29 = v59;
  uint64_t v30 = v59[8];
  uint64_t v31 = *(uint64_t *)((char *)a2 + v30);
  if (*(uint64_t *)((char *)a1 + v30))
  {
    if (!v31) {
      goto LABEL_51;
    }
    swift_bridgeObjectRetain();
    uint64_t v32 = swift_bridgeObjectRetain();
    char v33 = specialized static Array<A>.== infix(_:_:)(v32, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v33 & 1) == 0) {
      goto LABEL_51;
    }
  }
  else if (v31)
  {
    goto LABEL_51;
  }
  if ((specialized static Array<A>.== infix(_:_:)(*(uint64_t *)((char *)a1 + v29[9]), *(uint64_t *)((char *)a2 + v29[9])) & 1) == 0) {
    goto LABEL_51;
  }
  uint64_t v43 = v29[10];
  uint64_t v45 = *(uint64_t *)((char *)a1 + v43);
  uint64_t v44 = *(uint64_t *)((char *)a1 + v43 + 8);
  uint64_t v46 = *(uint64_t *)((char *)a1 + v43 + 16);
  uint64_t v64 = *(uint64_t *)((char *)a1 + v43 + 24);
  int v47 = *((unsigned __int8 *)a1 + v43 + 32);
  uint64_t v48 = (uint64_t)a2 + v43;
  uint64_t v50 = *(void *)v48;
  uint64_t v49 = *(void *)(v48 + 8);
  uint64_t v51 = *(void *)(v48 + 16);
  uint64_t v52 = *(void *)(v48 + 24);
  int v53 = *(unsigned __int8 *)(v48 + 32);
  LODWORD(v63) = v47;
  if (!v44)
  {
    if (!v49) {
      goto LABEL_59;
    }
    goto LABEL_56;
  }
  if (!v49)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_56:
    outlined copy of LACUIAuthActionCountdown(v50, v49);
    outlined consume of LACUIAuthActionCountdown(v45, v44);
    outlined consume of LACUIAuthActionCountdown(v50, v49);
    goto LABEL_51;
  }
  if (v45 == v50 && v44 == v49
    || (v54 = v53, v55 = _stringCompareWithSmolCheck(_:_:expecting:)(), v53 = v54, char v21 = 0, (v55 & 1) != 0))
  {
    if (v46 == v51 && v64 == v52)
    {
      if (v63 == v53)
      {
LABEL_59:
        char v21 = *((unsigned char *)a1 + v29[11]) ^ *((unsigned char *)a2 + v29[11]) ^ 1;
        return v21 & 1;
      }
LABEL_51:
      char v21 = 0;
      return v21 & 1;
    }
    int v57 = v53;
    char v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
    char v21 = 0;
    if ((v58 & 1) != 0 && v63 == v57) {
      goto LABEL_59;
    }
  }
  return v21 & 1;
}

uint64_t type metadata accessor for LACUIAuthCountdownConfiguration()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthCountdownConfiguration;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownConfiguration) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined assign with take of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    outlined copy of LACUIAuthImageConfiguration();
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    uint64_t v10 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v10;
    uint64_t v11 = a2[6];
    uint64_t v12 = a3[7];
    __dst = (void *)(a1 + v12);
    uint64_t v13 = (uint64_t *)((char *)a2 + v12);
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v11;
    uint64_t v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v19 = v13[1];
      void *__dst = *v13;
      __dst[1] = v19;
      uint64_t v20 = *(int *)(v14 + 20);
      uint64_t v36 = (char *)v13 + v20;
      Swift::String v37 = (char *)__dst + v20;
      uint64_t v21 = type metadata accessor for Date();
      Swift::String v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
      swift_bridgeObjectRetain();
      v35(v37, v36, v21);
      uint64_t v22 = *(int *)(v14 + 24);
      char v23 = (void *)((char *)__dst + v22);
      uint64_t v24 = (void *)((char *)v13 + v22);
      uint64_t v25 = v24[1];
      void *v23 = *v24;
      v23[1] = v25;
      uint64_t v26 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
      swift_bridgeObjectRetain();
      v26(__dst, 0, 1, v14);
    }
    uint64_t v27 = a3[9];
    *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(void *)(a1 + v27) = *(uint64_t *)((char *)a2 + v27);
    uint64_t v28 = a3[10];
    uint64_t v29 = a1 + v28;
    uint64_t v30 = (uint64_t)a2 + v28;
    uint64_t v31 = *(uint64_t *)((char *)a2 + v28 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v31)
    {
      *(void *)uint64_t v29 = *(void *)v30;
      *(void *)(v29 + 8) = v31;
      uint64_t v32 = *(void *)(v30 + 24);
      *(void *)(v29 + 16) = *(void *)(v30 + 16);
      *(void *)(v29 + 24) = v32;
      *(unsigned char *)(v29 + 32) = *(unsigned char *)(v30 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v33 = *(_OWORD *)(v30 + 16);
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
      *(_OWORD *)(v29 + 16) = v33;
      *(unsigned char *)(v29 + 32) = *(unsigned char *)(v30 + 32);
    }
    *(unsigned char *)(a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  outlined consume of LACUIAuthImageConfiguration();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v4 + *(int *)(v5 + 20);
    uint64_t v7 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + *(int *)(a2 + 40) + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v9;
  uint64_t v10 = a2[6];
  Swift::String v37 = a3;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v10;
  uint64_t v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v18;
    uint64_t v19 = *(int *)(v14 + 20);
    Swift::String v35 = (char *)v13 + v19;
    uint64_t v36 = (char *)v12 + v19;
    uint64_t v20 = type metadata accessor for Date();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v36, v35, v20);
    uint64_t v22 = *(int *)(v14 + 24);
    char v23 = (void *)((char *)v12 + v22);
    uint64_t v24 = (void *)((char *)v13 + v22);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
    swift_bridgeObjectRetain();
    v26(v12, 0, 1, v14);
  }
  uint64_t v27 = v37[9];
  *(void *)(a1 + v37[8]) = *(uint64_t *)((char *)a2 + v37[8]);
  *(void *)(a1 + v27) = *(uint64_t *)((char *)a2 + v27);
  uint64_t v28 = v37[10];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (uint64_t)a2 + v28;
  uint64_t v31 = *(uint64_t *)((char *)a2 + v28 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v31)
  {
    *(void *)uint64_t v29 = *(void *)v30;
    *(void *)(v29 + 8) = v31;
    uint64_t v32 = *(void *)(v30 + 24);
    *(void *)(v29 + 16) = *(void *)(v30 + 16);
    *(void *)(v29 + 24) = v32;
    *(unsigned char *)(v29 + 32) = *(unsigned char *)(v30 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v33 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    *(_OWORD *)(v29 + 16) = v33;
    *(unsigned char *)(v29 + 32) = *(unsigned char *)(v30 + 32);
  }
  *(unsigned char *)(a1 + v37[11]) = *((unsigned char *)a2 + v37[11]);
  return a1;
}

uint64_t assignWithCopy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  outlined consume of LACUIAuthImageConfiguration();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)((char *)a2 + v9);
  uint64_t v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      *uint64_t v10 = *v11;
      v10[1] = v11[1];
      uint64_t v17 = *(int *)(v12 + 20);
      uint64_t v42 = (char *)v11 + v17;
      uint64_t v43 = (char *)v10 + v17;
      uint64_t v18 = type metadata accessor for Date();
      uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      v41(v43, v42, v18);
      uint64_t v19 = *(int *)(v12 + 24);
      uint64_t v20 = (void *)((char *)v10 + v19);
      uint64_t v21 = (void *)((char *)v11 + v19);
      void *v20 = *v21;
      v20[1] = v21[1];
      uint64_t v22 = *(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56);
      swift_bridgeObjectRetain();
      v22(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v10);
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v10, v11, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(int *)(v12 + 20);
  uint64_t v32 = (char *)v10 + v31;
  long long v33 = (char *)v11 + v31;
  uint64_t v34 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  uint64_t v35 = *(int *)(v12 + 24);
  uint64_t v36 = (void *)((char *)v10 + v35);
  Swift::String v37 = (void *)((char *)v11 + v35);
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (long long *)((char *)a2 + v24);
  uint64_t v27 = *(void *)(a1 + v24 + 8);
  uint64_t v28 = *(uint64_t *)((char *)a2 + v24 + 8);
  if (v27)
  {
    if (v28)
    {
      *(void *)uint64_t v25 = *(void *)v26;
      *(void *)(v25 + 8) = *((void *)v26 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v25 + 16) = *((void *)v26 + 2);
      *(void *)(v25 + 24) = *((void *)v26 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v25 + 32) = *((unsigned char *)v26 + 32);
    }
    else
    {
      outlined destroy of LACUIAuthButtonConfiguration(v25);
      char v29 = *((unsigned char *)v26 + 32);
      long long v30 = v26[1];
      *(_OWORD *)uint64_t v25 = *v26;
      *(_OWORD *)(v25 + 16) = v30;
      *(unsigned char *)(v25 + 32) = v29;
    }
  }
  else if (v28)
  {
    *(void *)uint64_t v25 = *(void *)v26;
    *(void *)(v25 + 8) = *((void *)v26 + 1);
    *(void *)(v25 + 16) = *((void *)v26 + 2);
    *(void *)(v25 + 24) = *((void *)v26 + 3);
    *(unsigned char *)(v25 + 32) = *((unsigned char *)v26 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v38 = *v26;
    long long v39 = v26[1];
    *(unsigned char *)(v25 + 32) = *((unsigned char *)v26 + 32);
    *(_OWORD *)uint64_t v25 = v38;
    *(_OWORD *)(v25 + 16) = v39;
  }
  *(unsigned char *)(a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  return a1;
}

uint64_t outlined destroy of LACUIAuthCountdownDelayConfiguration(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of LACUIAuthButtonConfiguration(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[7];
  uint64_t v7 = (_OWORD *)(a1 + v6);
  char v8 = (_OWORD *)(a2 + v6);
  uint64_t v9 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    _OWORD *v7 = *v8;
    uint64_t v12 = *(int *)(v9 + 20);
    uint64_t v13 = (char *)v7 + v12;
    uint64_t v14 = (char *)v8 + v12;
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    *(_OWORD *)((char *)v7 + *(int *)(v9 + 24)) = *(_OWORD *)((char *)v8 + *(int *)(v9 + 24));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v16 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[10];
  uint64_t v18 = a3[11];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  long long v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(unsigned char *)(v19 + 32) = *(unsigned char *)(v20 + 32);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  return a1;
}

uint64_t assignWithTake for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  outlined consume of LACUIAuthImageConfiguration();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
      uint64_t v17 = *(int *)(v12 + 20);
      uint64_t v18 = (char *)v10 + v17;
      uint64_t v19 = (char *)v11 + v17;
      uint64_t v20 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
      *(_OWORD *)((char *)v10 + *(int *)(v12 + 24)) = *(_OWORD *)((char *)v11 + *(int *)(v12 + 24));
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v10);
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v10, v11, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v29 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v29;
  swift_bridgeObjectRelease();
  uint64_t v30 = *(int *)(v12 + 20);
  uint64_t v31 = (char *)v10 + v30;
  uint64_t v32 = (char *)v11 + v30;
  uint64_t v33 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 40))(v31, v32, v33);
  uint64_t v34 = *(int *)(v12 + 24);
  uint64_t v35 = (void *)((char *)v10 + v34);
  uint64_t v36 = (void *)((char *)v11 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  if (!*(void *)(a1 + v22 + 8))
  {
LABEL_11:
    long long v27 = *(_OWORD *)(v24 + 16);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    *(_OWORD *)(v23 + 16) = v27;
    goto LABEL_12;
  }
  uint64_t v25 = *(void *)(v24 + 8);
  if (!v25)
  {
    outlined destroy of LACUIAuthButtonConfiguration(v23);
    goto LABEL_11;
  }
  *(void *)uint64_t v23 = *(void *)v24;
  *(void *)(v23 + 8) = v25;
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(v24 + 24);
  *(void *)(v23 + 16) = *(void *)(v24 + 16);
  *(void *)(v23 + 24) = v26;
  swift_bridgeObjectRelease();
LABEL_12:
  *(unsigned char *)(v23 + 32) = *(unsigned char *)(v24 + 32);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255036F34);
}

uint64_t sub_255036F34(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255036FFC);
}

uint64_t sub_255036FFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for LACUIAuthCountdownConfiguration()
{
  type metadata accessor for LACUIAuthCountdownDelayConfiguration?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for LACUIAuthCountdownDelayConfiguration?()
{
  if (!lazy cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?)
  {
    type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    }
  }
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25503732CLL);
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

unsigned char *destructiveInjectEnumTag for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return &type metadata for LACUIAuthCountdownConfiguration.ActionButtonIdentifier;
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

uint64_t outlined init with take of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static LocalizedStrings.operationNotSupportedOnCompanionFaceId(applicationName:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v9[3] = MEMORY[0x263F8D310];
    v9[4] = lazy protocol witness table accessor for type String and conformance String();
    v9[0] = a1;
    v9[1] = a2;
    swift_bridgeObjectRetain_n();
    v10._uint64_t countAndFlagsBits = 0x75676F6C61746143;
    v10._object = (void *)0xE900000000000065;
    specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000026, (void *)0x80000002550460E0, v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_255043E40;
    outlined init with copy of CVarArg((uint64_t)v9, v5 + 32);
    uint64_t v6 = String.init(format:_:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    v8._uint64_t countAndFlagsBits = 0x75676F6C61746143;
    v8._object = (void *)0xE900000000000065;
    return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000030, (void *)0x80000002550460A0, v8);
  }
}

uint64_t static LocalizedStrings.operationNotSupportedOnCompanionTouchId(applicationName:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v9[3] = MEMORY[0x263F8D310];
    v9[4] = lazy protocol witness table accessor for type String and conformance String();
    v9[0] = a1;
    v9[1] = a2;
    swift_bridgeObjectRetain_n();
    v10._uint64_t countAndFlagsBits = 0x75676F6C61746143;
    v10._object = (void *)0xE900000000000065;
    specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000255046070, v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_255043E40;
    outlined init with copy of CVarArg((uint64_t)v9, v5 + 32);
    uint64_t v6 = String.init(format:_:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    v8._uint64_t countAndFlagsBits = 0x75676F6C61746143;
    v8._object = (void *)0xE900000000000065;
    return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000031, (void *)0x8000000255046010, v8);
  }
}

uint64_t static LocalizedStrings.authenticationRequired.getter()
{
  v1._uint64_t countAndFlagsBits = 0x75676F6C61746143;
  v1._object = (void *)0xE900000000000065;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000017, (void *)0x8000000255046050, v1);
}

uint64_t static LocalizedStrings.cancel.getter()
{
  v1._uint64_t countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensor.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046170, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorTextFaceID.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000022, (void *)0x80000002550461C0, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorTextTouchID.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000023, (void *)0x8000000255046190, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffWillBeAbleToUsePhone.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000255046310, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffiPhoneLocationNotVisible.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002CLL, (void *)0x80000002550463C0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitleBegin.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046340, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffBeginSecurityDelay.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001DLL, (void *)0x8000000255046360, v1);
}

uint64_t static LocalizedStrings.ratchetGracePeriodTitle.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ALL, (void *)0x80000002550463F0, v1);
}

uint64_t static LocalizedStrings.ratchetGracePeriodMessage.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046410, v1);
}

uint64_t static LocalizedStrings.continue.getter()
{
  v1._uint64_t countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitlePending.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x8000000255046430, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessagePending.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000020, (void *)0x8000000255046450, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffDelayTitle.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000255046480, v1);
}

uint64_t static LocalizedStrings.done.getter()
{
  v1._uint64_t countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x445F4E4F54545542, (void *)0xEB00000000454E4FLL, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitleReady.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x80000002550464A0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffLearnMore.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000255046380, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessageBeginStrictMode.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000255046520, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessageBeginNoFamiliarLocations.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000034, (void *)0x80000002550464E0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessageBegin.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x80000002550464C0, v1);
}

const char *LocalizedStrings.catalogueSuffix.unsafeMutableAddressor()
{
  return "Catalogue";
}

uint64_t static LocalizedStrings.catalogueSuffix.getter()
{
  return 0x75676F6C61746143;
}

uint64_t static LocalizedStrings.next.getter()
{
  v1._uint64_t countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(1415071054, (void *)0xE400000000000000, v1);
}

uint64_t static LocalizedStrings.ok.getter()
{
  v1._uint64_t countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v1);
}

const char *LocalizedStrings.ratchetTable.unsafeMutableAddressor()
{
  return "Ratchet";
}

uint64_t static LocalizedStrings.ratchetTable.getter()
{
  return 0x74656863746152;
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictMode.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000255046550, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictModeTextFaceID.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ELL, (void *)0x8000000255046580, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictModeTextTouchID.getter()
{
  v1._uint64_t countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002FLL, (void *)0x80000002550465B0, v1);
}

uint64_t specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(uint64_t a1, void *a2, Swift::String a3)
{
  uint64_t v5 = HIBYTE(a3._object) & 0xF;
  if (((uint64_t)a3._object & 0x2000000000000000) == 0) {
    uint64_t v5 = a3._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    String.append(_:)(a3);
    uint64_t v6 = 45;
    unint64_t v7 = 0xE100000000000000;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1) {
    swift_once();
  }
  id v9 = (id)static NSBundle.current;
  v15._object = (void *)0xE000000000000000;
  v10._uint64_t countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v11.value._object = (void *)0xEB00000000656C62;
  v12._uint64_t countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v15._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, v11, (NSBundle)v9, v12, v15)._countAndFlagsBits;
  swift_bridgeObjectRelease();

  return countAndFlagsBits;
}

uint64_t specialized static LocalizedStrings.ratchetCoolOffSecurityDelayDuration.getter()
{
  unint64_t v0 = self;
  type metadata accessor for NSNumber();
  Class isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  id v2 = objc_msgSend(v0, sel_localizedStringFromNumber_numberStyle_, isa, 1);

  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  v9[3] = MEMORY[0x263F8D310];
  v9[4] = lazy protocol witness table accessor for type String and conformance String();
  v9[0] = v3;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  v10._uint64_t countAndFlagsBits = 0x74656863746152;
  v10._object = (void *)0xE700000000000000;
  specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000028, (void *)0x8000000255046640, v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_255043E40;
  outlined init with copy of CVarArg((uint64_t)v9, v6 + 32);
  uint64_t v7 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  swift_bridgeObjectRelease();
  return v7;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

void LACUIAuthCountdownItemConfiguration.init(image:title:)(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  char v9 = *((unsigned char *)a1 + 16);
  _print_unlocked<A, B>(_:_:)();
  v10._uint64_t countAndFlagsBits = 0x656C74697425;
  v10._object = (void *)0xE600000000000000;
  String.append(_:)(v10);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0xE000000000000000;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  *(unsigned char *)(a4 + 32) = v9;
  *(void *)(a4 + 40) = a2;
  *(void *)(a4 + 48) = a3;
}

uint64_t LACUIAuthCountdownItemConfiguration.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownItemConfiguration.image.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  char v3 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return outlined copy of LACUIAuthImageConfiguration();
}

uint64_t LACUIAuthCountdownItemConfiguration.image.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = outlined consume of LACUIAuthImageConfiguration();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(unsigned char *)(v1 + 32) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownItemConfiguration.image.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownItemConfiguration.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownItemConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownItemConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t protocol witness for Identifiable.id.getter in conformance LACUIAuthCountdownItemConfiguration@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t specialized static LACUIAuthCountdownItemConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v9 = *(unsigned char *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v12 & 1) != 0))
  {
    if (v4)
    {
      if (v9)
      {
        if (v2 != v8 || v3 != v7) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else if ((v9 & 1) == 0)
    {
      if (v2 != v8 || v3 != v7)
      {
LABEL_14:
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        uint64_t result = 0;
        if ((v14 & 1) == 0) {
          return result;
        }
        goto LABEL_15;
      }
LABEL_13:
      outlined copy of LACUIAuthImageConfiguration();
      outlined copy of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
LABEL_15:
      if (v5 == v10 && v6 == v11) {
        return 1;
      }
      return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    outlined copy of LACUIAuthImageConfiguration();
    outlined copy of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in LACUIAuthCountdownItemConfiguration()
{
  return MEMORY[0x263F8D320];
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthCountdownItemConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LACUIAuthCountdownItemConfiguration()
{
  swift_bridgeObjectRelease();
  outlined consume of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  outlined consume of LACUIAuthImageConfiguration();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v5;
  outlined consume of LACUIAuthImageConfiguration();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownItemConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownItemConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownItemConfiguration()
{
  return &type metadata for LACUIAuthCountdownItemConfiguration;
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()();
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()()
{
  v14._uint64_t countAndFlagsBits = 0x74656863746152;
  v14._object = (void *)0xE700000000000000;
  uint64_t v1 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000255046550, v14);
  uint64_t v3 = v2;
  if (objc_msgSend(self, sel_deviceHasFaceID))
  {
    uint64_t v4 = 0xD00000000000002ELL;
    char v5 = "DTO_UNAPPROVED_SENSOR_STRICT_MODE_TEXT_FACE_ID";
  }
  else
  {
    uint64_t v4 = 0xD00000000000002FLL;
    char v5 = "DTO_UNAPPROVED_SENSOR_STRICT_MODE_TEXT_TOUCH_ID";
  }
  v15._uint64_t countAndFlagsBits = 0x74656863746152;
  v15._object = (void *)0xE700000000000000;
  uint64_t v6 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v4, (void *)((unint64_t)(v5 - 32) | 0x8000000000000000), v15);
  uint64_t v8 = v7;
  v16._uint64_t countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  uint64_t v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v16);
  uint64_t v10 = &v0[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(void *)uint64_t v10 = 2;
  *((void *)v10 + 1) = v1;
  *((void *)v10 + 2) = v3;
  *((void *)v10 + 3) = v6;
  *((void *)v10 + 4) = v8;
  *((void *)v10 + 5) = v9;
  *((void *)v10 + 6) = v11;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v13, sel_init);
}

void LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init(configuration:)()
{
}

void LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init(configuration:)()
{
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler()
{
  return self;
}

uint64_t method lookup function for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler);
}

uint64_t dispatch thunk of LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeWithCopy for LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if ((v4 + 1) <= 1 && v4 == -1)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthAction(uint64_t a1, long long *a2)
{
  if (*(void *)(a1 + 8) >= 0xFFFFFFFFuLL) {
    LODWORD(v4) = -1;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  unsigned int v5 = v4 + 1;
  unint64_t v6 = *((void *)a2 + 1);
  if (v6 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  unsigned int v7 = v6 + 1;
  if (v5 > 1)
  {
    if (v7 <= 1 && v6 == -1) {
      goto LABEL_13;
    }
LABEL_18:
    long long v8 = *a2;
    long long v9 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v8;
    *(_OWORD *)(a1 + 16) = v9;
    return a1;
  }
  if (v7 > 1)
  {
    if (v5) {
      goto LABEL_18;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (!v5)
  {
    if (v6 == -1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      return a1;
    }
    goto LABEL_17;
  }
  if (v6 != -1) {
    goto LABEL_18;
  }
LABEL_13:
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF) {
    int v6 = -1;
  }
  else {
    int v6 = v4;
  }
  unsigned int v7 = v6 + 1;
  unint64_t v8 = *(void *)(a2 + 8);
  if (v8 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  if (v7 > 1) {
    goto LABEL_13;
  }
  unsigned int v9 = v5 + 1;
  if (v9 > 1)
  {
    if (!v7) {
      goto LABEL_12;
    }
LABEL_13:
    long long v11 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v11;
    goto LABEL_14;
  }
  if (v7) {
    goto LABEL_13;
  }
  if (v9)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v10;
  swift_bridgeObjectRelease();
LABEL_14:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 2) {
    return (v3 - 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTag for LACUIAuthAction(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

double destructiveInjectEnumTag for LACUIAuthAction(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)a1 = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *(void *)(a1 + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthAction()
{
  return &type metadata for LACUIAuthAction;
}

unint64_t destroy for LACUIAuthAction(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthActionCountdown(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  return a1;
}

uint64_t assignWithTake for LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthActionCountdown(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthActionCountdown(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t getEnumTag for LACUIAuthActionCountdown(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t destructiveInjectEnumTag for LACUIAuthActionCountdown(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthActionCountdown()
{
  return &type metadata for LACUIAuthActionCountdown;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.init(requestIdentifier:title:message:dismissActionTitle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v12 = result;
  if (!a7)
  {
    v15._uint64_t countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    unint64_t result = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v15);
    a6 = result;
    a7 = v14;
  }
  *a8 = v12;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

id LACUIAlertScenePresentationHandler.init(configuration:)(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = &v1[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a1;
  *((_OWORD *)v5 + 1) = v3;
  *((_OWORD *)v5 + 2) = v2;
  *((void *)v5 + 6) = v4;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v7, sel_init);
}

Swift::Bool __swiftcall LACUIAlertScenePresentationHandler.canHandle(request:)(LACUIScenePresentationRequest request)
{
  id v2 = [(objc_class *)request.super.isa userInterfaceRequest];
  unsigned int v3 = objc_msgSend(v2, sel_identifier);

  return *(void *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration) == v3;
}

Swift::Void __swiftcall LACUIAlertScenePresentationHandler.handle(request:inContext:)(LACUIScenePresentationRequest request, LACUIScenePresentationContext inContext)
{
  unsigned int v3 = v2;
  userInterfaceRequest = request._userInterfaceRequest;
  Class isa = request.super.isa;
  uint64_t v6 = type metadata accessor for LACLogger();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unsigned int v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(uint64_t (**)(Class))((*MEMORY[0x263F8EED0] & *v2) + 0x60))(isa))
  {
    uint64_t v10 = *(void *)((char *)v2
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 8);
    uint64_t v11 = *(void *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 16);
    uint64_t v12 = *(void *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 24);
    uint64_t v13 = *(void *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)MEMORY[0x25A2848C0](v10, v11);
    swift_bridgeObjectRelease();
    Swift::String v15 = (void *)MEMORY[0x25A2848C0](v12, v13);
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v14, v15, 1);

    v40._uint64_t countAndFlagsBits = 0;
    v40._object = (void *)0xE000000000000000;
    uint64_t v17 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v40);
    uint64_t v19 = v18;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = userInterfaceRequest;
    uint64_t v21 = userInterfaceRequest;
    uint64_t v22 = (void *)MEMORY[0x25A2848C0](v17, v19);
    swift_bridgeObjectRelease();
    uint64_t v38 = partial apply for closure #1 in LACUIAlertScenePresentationHandler.handle(request:inContext:);
    uint64_t v39 = v20;
    aBlock._uint64_t countAndFlagsBits = MEMORY[0x263EF8330];
    aBlock._object = (void *)1107296256;
    uint64_t v36 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ();
    uint64_t v37 = &block_descriptor_2;
    uint64_t v23 = _Block_copy(&aBlock);
    swift_release();
    id v24 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v22, 0, v23);
    _Block_release(v23);

    objc_msgSend(v16, sel_addAction_, v24);
    objc_msgSend(-[LACUserInterfaceRequest presenter](v21, sel_presenter), sel_present_animated_, v16, 1);
  }
  else
  {
    static LACLogger.ui.getter();
    aBlock._uint64_t countAndFlagsBits = 0;
    aBlock._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(28);
    id v25 = objc_msgSend(v2, sel_description);
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();

    aBlock._uint64_t countAndFlagsBits = v26;
    aBlock._object = v28;
    v29._object = (void *)0x8000000255046730;
    v29._uint64_t countAndFlagsBits = 0xD000000000000018;
    String.append(_:)(v29);
    id v30 = [(objc_class *)isa description];
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v33 = v32;

    v34._uint64_t countAndFlagsBits = v31;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    LACLogger.error(_:)(aBlock);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    objc_msgSend(-[LACUserInterfaceRequest presenter](userInterfaceRequest, sel_presenter), sel_dismiss);
  }
  swift_unknownObjectRelease();
}

uint64_t LACUIAlertScenePresentationHandler.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = (_OWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration);
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 16);
  uint64_t v4 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 24);
  uint64_t v6 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 32);
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 40);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 48);
  *(_OWORD *)a1 = *v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id LACUIAlertScenePresentationHandler.__allocating_init(configuration:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  long long v5 = *(_OWORD *)(a1 + 16);
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v5;
  *((_OWORD *)v7 + 2) = v4;
  *((void *)v7 + 6) = v6;
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

id LACUIAlertScenePresentationHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void LACUIAlertScenePresentationHandler.init()()
{
}

id LACUIAlertScenePresentationHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.requestIdentifier.getter()
{
  return *(void *)v0;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.dismissActionTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for LACUIAlertScenePresentationHandler()
{
  return self;
}

uint64_t sub_255039870()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in LACUIAlertScenePresentationHandler.handle(request:inContext:)()
{
  objc_msgSend(objc_msgSend(*(id *)(v0 + 16), sel_presenter), sel_dismiss);
  return swift_unknownObjectRelease();
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

uint64_t method lookup function for LACUIAlertScenePresentationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIAlertScenePresentationHandler);
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.canHandle(request:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.handle(request:inContext:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t destroy for LACUIAlertScenePresentationHandler.Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LACUIAlertScenePresentationHandler.Configuration(void *a1, void *a2)
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
  return a1;
}

uint64_t assignWithTake for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAlertScenePresentationHandler.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAlertScenePresentationHandler.Configuration()
{
  return &type metadata for LACUIAlertScenePresentationHandler.Configuration;
}

void __swiftcall LACUIAuthButtonConfiguration.init(id:title:style:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *__return_ptr retstr, Swift::String id, Swift::String title, LocalAuthenticationCoreUI::LACUIAuthButtonStyle style)
{
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v4 = *(unsigned char *)style;
  retstr->id = id;
  retstr->title = title;
  retstr->LocalAuthenticationCoreUI::LACUIAuthButtonStyle style = v4;
}

BOOL static LACUIAuthButtonStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LACUIAuthButtonStyle.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int LACUIAuthButtonStyle.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACUIAuthButtonStyle(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LACUIAuthButtonConfiguration.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthButtonConfiguration.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.id.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthButtonConfiguration.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthButtonConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

void LACUIAuthButtonConfiguration.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

unsigned char *LACUIAuthButtonConfiguration.style.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 32) = *result;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.style.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

void __swiftcall LACUIAuthButtonConfiguration.init(title:style:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *__return_ptr retstr, Swift::String title, LocalAuthenticationCoreUI::LACUIAuthButtonStyle style)
{
  uint64_t v3 = (LocalAuthenticationCoreUI::LACUIAuthButtonStyle *)style;
  object = title._object;
  uint64_t countAndFlagsBits = title._countAndFlagsBits;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v11 = *v3;
  UUID.init()();
  uint64_t v12 = UUID.uuidString.getter();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  retstr->id._uint64_t countAndFlagsBits = v12;
  retstr->id._object = v14;
  retstr->title._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->title._object = object;
  retstr->LocalAuthenticationCoreUI::LACUIAuthButtonStyle style = v11;
}

BOOL specialized static LACUIAuthButtonConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6) {
      return v4 == v7;
    }
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    BOOL result = 0;
    if (v12) {
      return v4 == v7;
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle;
  if (!lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LACUIAuthButtonStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LACUIAuthButtonStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25503A14CLL);
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

ValueMetadata *type metadata accessor for LACUIAuthButtonStyle()
{
  return &type metadata for LACUIAuthButtonStyle;
}

uint64_t destroy for LACUIAuthButtonConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthButtonConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthButtonConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthButtonConfiguration()
{
  return &type metadata for LACUIAuthButtonConfiguration;
}

uint64_t LACUILockView_SwiftUI.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUILockView_SwiftUI.viewModel.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUILockView_SwiftUI.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUILockView_SwiftUI.$viewModel.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for LACUILockViewModel();
  unint64_t v4 = lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel();
  return MEMORY[0x270EFFB88](v1, v2, v3, v4);
}

unint64_t lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel;
  if (!lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel)
  {
    type metadata accessor for LACUILockViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel);
  }
  return result;
}

uint64_t LACUILockView_SwiftUI.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LACUILockViewModel();
  lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel();
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void LACUILockView_SwiftUI.updateUIView<A>(_:context:)(void *a1)
{
}

void LACUILockView_SwiftUI.updateView<A>(_:context:)(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    unsigned int v6 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 96);
    id v7 = a1;
    uint64_t v8 = swift_retain();
    uint64_t v9 = v6(v8);
    swift_release();
    objc_msgSend(v5, sel_setState_, v9);
    uint64_t v10 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 144);
    uint64_t v11 = swift_retain();
    id v12 = (id)v10(v11);
    swift_release();
    objc_msgSend(v5, sel_setColor_, v12);
  }
}

id LACUILockView_SwiftUI.makeUIView(context:)()
{
  id v0 = objc_allocWithZone((Class)LACUILockView);
  return objc_msgSend(v0, sel_init);
}

unint64_t instantiation function for generic protocol witness table for LACUILockView_SwiftUI(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI);
  }
  return result;
}

id protocol witness for UIViewRepresentable.makeUIView(context:) in conformance LACUILockView_SwiftUI()
{
  id v0 = objc_allocWithZone((Class)LACUILockView);
  return objc_msgSend(v0, sel_init);
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance LACUILockView_SwiftUI(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 96);
  id v4 = a1;
  uint64_t v5 = swift_retain();
  uint64_t v6 = v3(v5);
  swift_release();
  objc_msgSend(v4, sel_setState_, v6);
  id v7 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 144);
  uint64_t v8 = swift_retain();
  id v9 = (id)v7(v8);
  swift_release();
  objc_msgSend(v4, sel_setColor_, v9);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance LACUILockView_SwiftUI(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance LACUILockView_SwiftUI(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void protocol witness for View.body.getter in conformance LACUILockView_SwiftUI()
{
}

uint64_t sub_25503A93C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_25503A948(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LACUILockView_SwiftUI()
{
  return &type metadata for LACUILockView_SwiftUI;
}

uint64_t specialized static LACUIAuthState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for LACUIAuthState();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthState, LACUIAuthState));
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  outlined init with copy of LACUIAuthState(a1, (uint64_t)v14);
  outlined init with copy of LACUIAuthState(a2, v15);
  id v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    outlined init with copy of LACUIAuthState((uint64_t)v14, (uint64_t)v10);
    if (v16(v15, 1, v4) != 1)
    {
      outlined init with take of LACUIAuthCountdownConfiguration(v15, (uint64_t)v7);
      char v17 = specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(v10, v7);
      _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for LACUIAuthState);
      return v17 & 1;
    }
    _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    outlined destroy of (LACUIAuthState, LACUIAuthState)((uint64_t)v14);
    char v17 = 0;
    return v17 & 1;
  }
  _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for LACUIAuthState);
  char v17 = 1;
  return v17 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthState(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    id v7 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v40 = v8;
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      char v12 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v10;
      a1[1] = v11;
      *((unsigned char *)a1 + 16) = v12;
      uint64_t v13 = a2[4];
      a1[3] = a2[3];
      a1[4] = v13;
      uint64_t v14 = a2[6];
      a1[5] = a2[5];
      a1[6] = v14;
      uint64_t v15 = v7[7];
      __dst = (uint64_t *)((char *)a1 + v15);
      id v16 = (uint64_t *)((char *)a2 + v15);
      uint64_t v17 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v18 = *(void *)(v17 - 8);
      uint64_t v19 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v19(v16, 1, v17))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dst, v16, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        uint64_t v21 = v16[1];
        void *__dst = *v16;
        __dst[1] = v21;
        uint64_t v22 = *(int *)(v17 + 20);
        uint64_t v37 = (char *)v16 + v22;
        uint64_t v38 = (char *)__dst + v22;
        uint64_t v23 = type metadata accessor for Date();
        uint64_t v36 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        v36(v38, v37, v23);
        uint64_t v24 = *(int *)(v17 + 24);
        id v25 = (void *)((char *)__dst + v24);
        uint64_t v26 = (void *)((char *)v16 + v24);
        uint64_t v27 = v26[1];
        *id v25 = *v26;
        v25[1] = v27;
        uint64_t v28 = *(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56);
        swift_bridgeObjectRetain();
        v28(__dst, 0, 1, v17);
      }
      *(uint64_t *)((char *)a1 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
      *(uint64_t *)((char *)a1 + v7[9]) = *(uint64_t *)((char *)a2 + v7[9]);
      uint64_t v29 = v7[10];
      id v30 = (char *)a1 + v29;
      uint64_t v31 = (char *)a2 + v29;
      uint64_t v32 = *(uint64_t *)((char *)a2 + v29 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v32)
      {
        *(void *)id v30 = *(void *)v31;
        *((void *)v30 + 1) = v32;
        uint64_t v33 = *((void *)v31 + 3);
        *((void *)v30 + 2) = *((void *)v31 + 2);
        *((void *)v30 + 3) = v33;
        v30[32] = v31[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v34 = *((_OWORD *)v31 + 1);
        *(_OWORD *)id v30 = *(_OWORD *)v31;
        *((_OWORD *)v30 + 1) = v34;
        v30[32] = v31[32];
      }
      *((unsigned char *)a1 + v7[11]) = *((unsigned char *)a2 + v7[11]);
      (*(void (**)(uint64_t *, void, uint64_t, int *))(v40 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for LACUIAuthState(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    outlined consume of LACUIAuthImageConfiguration();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 28);
    uint64_t v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = v4 + *(int *)(v5 + 20);
      uint64_t v7 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = *(void *)(a1 + *(int *)(v2 + 40) + 8);
    if (result)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void *initializeWithCopy for LACUIAuthState(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v38 = v7;
    uint64_t v8 = *a2;
    uint64_t v9 = a2[1];
    char v10 = *((unsigned char *)a2 + 16);
    outlined copy of LACUIAuthImageConfiguration();
    *a1 = v8;
    a1[1] = v9;
    *((unsigned char *)a1 + 16) = v10;
    uint64_t v11 = a2[4];
    a1[3] = a2[3];
    a1[4] = v11;
    uint64_t v12 = a2[6];
    a1[5] = a2[5];
    a1[6] = v12;
    uint64_t v13 = v6[7];
    __dst = (void *)((char *)a1 + v13);
    uint64_t v14 = (uint64_t *)((char *)a2 + v13);
    uint64_t v15 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(__dst, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v19 = v14[1];
      void *__dst = *v14;
      __dst[1] = v19;
      uint64_t v20 = *(int *)(v15 + 20);
      uint64_t v35 = (char *)v14 + v20;
      uint64_t v36 = (char *)__dst + v20;
      uint64_t v21 = type metadata accessor for Date();
      long long v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
      swift_bridgeObjectRetain();
      v34(v36, v35, v21);
      uint64_t v22 = *(int *)(v15 + 24);
      uint64_t v23 = (void *)((char *)__dst + v22);
      uint64_t v24 = (void *)((char *)v14 + v22);
      uint64_t v25 = v24[1];
      void *v23 = *v24;
      v23[1] = v25;
      uint64_t v26 = *(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56);
      swift_bridgeObjectRetain();
      v26(__dst, 0, 1, v15);
    }
    *(void *)((char *)a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
    *(void *)((char *)a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
    uint64_t v27 = v6[10];
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = *(uint64_t *)((char *)a2 + v27 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v30)
    {
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v30;
      uint64_t v31 = *((void *)v29 + 3);
      *((void *)v28 + 2) = *((void *)v29 + 2);
      *((void *)v28 + 3) = v31;
      v28[32] = v29[32];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v32 = *((_OWORD *)v29 + 1);
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
      *((_OWORD *)v28 + 1) = v32;
      v28[32] = v29[32];
    }
    *((unsigned char *)a1 + v6[11]) = *((unsigned char *)a2 + v6[11]);
    (*(void (**)(void *, void, uint64_t, int *))(v38 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthState(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8((uint64_t)a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = *a2;
      uint64_t v12 = a2[1];
      char v13 = *((unsigned char *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *(void *)a1 = v11;
      *(void *)(a1 + 8) = v12;
      *(unsigned char *)(a1 + 16) = v13;
      *(void *)(a1 + 24) = a2[3];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = a2[5];
      *(void *)(a1 + 48) = a2[6];
      uint64_t v14 = v6[7];
      __dst = (void *)(a1 + v14);
      uint64_t v15 = (uint64_t *)((char *)a2 + v14);
      uint64_t v16 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v18 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v18(v15, 1, v16))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(__dst, v15, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        void *__dst = *v15;
        __dst[1] = v15[1];
        uint64_t v37 = *(int *)(v16 + 20);
        uint64_t v68 = (char *)v15 + v37;
        Swift::String v70 = (char *)__dst + v37;
        uint64_t v38 = type metadata accessor for Date();
        char v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
        swift_bridgeObjectRetain();
        v67(v70, v68, v38);
        uint64_t v39 = *(int *)(v16 + 24);
        uint64_t v40 = (void *)((char *)__dst + v39);
        uint64_t v41 = (void *)((char *)v15 + v39);
        void *v40 = *v41;
        v40[1] = v41[1];
        uint64_t v42 = *(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56);
        swift_bridgeObjectRetain();
        v42(__dst, 0, 1, v16);
      }
      *(void *)(a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
      *(void *)(a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
      uint64_t v43 = v6[10];
      uint64_t v44 = a1 + v43;
      uint64_t v45 = (long long *)((char *)a2 + v43);
      uint64_t v46 = *(uint64_t *)((char *)a2 + v43 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v46)
      {
        *(void *)uint64_t v44 = *(void *)v45;
        *(void *)(v44 + 8) = *((void *)v45 + 1);
        *(void *)(v44 + 16) = *((void *)v45 + 2);
        *(void *)(v44 + 24) = *((void *)v45 + 3);
        *(unsigned char *)(v44 + 32) = *((unsigned char *)v45 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v47 = *v45;
        long long v48 = v45[1];
        *(unsigned char *)(v44 + 32) = *((unsigned char *)v45 + 32);
        *(_OWORD *)uint64_t v44 = v47;
        *(_OWORD *)(v44 + 16) = v48;
      }
      *(unsigned char *)(a1 + v6[11]) = *((unsigned char *)a2 + v6[11]);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      return a1;
    }
LABEL_7:
    memcpy((void *)a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0(a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
    goto LABEL_7;
  }
  uint64_t v20 = *a2;
  uint64_t v21 = a2[1];
  char v22 = *((unsigned char *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v21;
  *(unsigned char *)(a1 + 16) = v22;
  outlined consume of LACUIAuthImageConfiguration();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v6[7];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)((char *)a2 + v23);
  uint64_t v26 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      *uint64_t v24 = *v25;
      v24[1] = v25[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v57 = *(int *)(v26 + 20);
      char v58 = (char *)v24 + v57;
      unint64_t v59 = (char *)v25 + v57;
      uint64_t v60 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 24))(v58, v59, v60);
      uint64_t v61 = *(int *)(v26 + 24);
      uint64_t v62 = (void *)((char *)v24 + v61);
      uint64_t v63 = (void *)((char *)v25 + v61);
      *uint64_t v62 = *v63;
      v62[1] = v63[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    goto LABEL_18;
  }
  if (v30)
  {
LABEL_18:
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v24, v25, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_19;
  }
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  uint64_t v31 = *(int *)(v26 + 20);
  __dsta = (char *)v25 + v31;
  Swift::String v73 = (char *)v24 + v31;
  uint64_t v32 = type metadata accessor for Date();
  unint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
  swift_bridgeObjectRetain();
  v69(v73, __dsta, v32);
  uint64_t v33 = *(int *)(v26 + 24);
  long long v34 = (void *)((char *)v24 + v33);
  uint64_t v35 = (void *)((char *)v25 + v33);
  void *v34 = *v35;
  v34[1] = v35[1];
  uint64_t v36 = *(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56);
  swift_bridgeObjectRetain();
  v36(v24, 0, 1, v26);
LABEL_19:
  *(void *)(a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = v6[10];
  uint64_t v51 = a1 + v50;
  uint64_t v52 = (long long *)((char *)a2 + v50);
  uint64_t v53 = *(void *)(a1 + v50 + 8);
  uint64_t v54 = *(uint64_t *)((char *)a2 + v50 + 8);
  if (v53)
  {
    if (v54)
    {
      *(void *)uint64_t v51 = *(void *)v52;
      *(void *)(v51 + 8) = *((void *)v52 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v51 + 16) = *((void *)v52 + 2);
      *(void *)(v51 + 24) = *((void *)v52 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v51 + 32) = *((unsigned char *)v52 + 32);
    }
    else
    {
      outlined destroy of LACUIAuthButtonConfiguration(v51);
      char v55 = *((unsigned char *)v52 + 32);
      long long v56 = v52[1];
      *(_OWORD *)uint64_t v51 = *v52;
      *(_OWORD *)(v51 + 16) = v56;
      *(unsigned char *)(v51 + 32) = v55;
    }
  }
  else if (v54)
  {
    *(void *)uint64_t v51 = *(void *)v52;
    *(void *)(v51 + 8) = *((void *)v52 + 1);
    *(void *)(v51 + 16) = *((void *)v52 + 2);
    *(void *)(v51 + 24) = *((void *)v52 + 3);
    *(unsigned char *)(v51 + 32) = *((unsigned char *)v52 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v64 = *v52;
    long long v65 = v52[1];
    *(unsigned char *)(v51 + 32) = *((unsigned char *)v52 + 32);
    *(_OWORD *)uint64_t v51 = v64;
    *(_OWORD *)(v51 + 16) = v65;
  }
  *(unsigned char *)(a1 + v6[11]) = *((unsigned char *)a2 + v6[11]);
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
    *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
    *(_OWORD *)((char *)a1 + 40) = *(_OWORD *)((char *)a2 + 40);
    uint64_t v8 = v6[7];
    int v9 = (_OWORD *)((char *)a1 + v8);
    int v10 = (_OWORD *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      *int v9 = *v10;
      uint64_t v14 = *(int *)(v11 + 20);
      uint64_t v15 = (char *)v9 + v14;
      uint64_t v16 = (char *)v10 + v14;
      uint64_t v17 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
      *(_OWORD *)((char *)v9 + *(int *)(v11 + 24)) = *(_OWORD *)((char *)v10 + *(int *)(v11 + 24));
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
    *(void *)((char *)a1 + v6[9]) = *(void *)((char *)a2 + v6[9]);
    uint64_t v18 = v6[10];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    v19[32] = v20[32];
    long long v21 = *((_OWORD *)v20 + 1);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    *((_OWORD *)v19 + 1) = v21;
    *((unsigned char *)a1 + v6[11]) = *((unsigned char *)a2 + v6[11]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithTake for LACUIAuthState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0(a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_7;
    }
    char v17 = *(unsigned char *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = v17;
    outlined consume of LACUIAuthImageConfiguration();
    uint64_t v18 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v18;
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v19;
    swift_bridgeObjectRelease();
    uint64_t v20 = v6[7];
    long long v21 = (void *)(a1 + v20);
    char v22 = (void *)(a2 + v20);
    uint64_t v23 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
    int v26 = v25(v21, 1, v23);
    int v27 = v25(v22, 1, v23);
    if (v26)
    {
      if (!v27)
      {
        *(_OWORD *)long long v21 = *(_OWORD *)v22;
        uint64_t v28 = *(int *)(v23 + 20);
        int v29 = (char *)v21 + v28;
        int v30 = (char *)v22 + v28;
        uint64_t v31 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
        *(_OWORD *)((char *)v21 + *(int *)(v23 + 24)) = *(_OWORD *)((char *)v22 + *(int *)(v23 + 24));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        goto LABEL_16;
      }
    }
    else
    {
      if (!v27)
      {
        uint64_t v48 = v22[1];
        *long long v21 = *v22;
        v21[1] = v48;
        swift_bridgeObjectRelease();
        uint64_t v49 = *(int *)(v23 + 20);
        uint64_t v50 = (char *)v21 + v49;
        uint64_t v51 = (char *)v22 + v49;
        uint64_t v52 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 40))(v50, v51, v52);
        uint64_t v53 = *(int *)(v23 + 24);
        uint64_t v54 = (void *)((char *)v21 + v53);
        char v55 = (void *)((char *)v22 + v53);
        uint64_t v57 = *v55;
        uint64_t v56 = v55[1];
        *uint64_t v54 = v57;
        v54[1] = v56;
        swift_bridgeObjectRelease();
LABEL_16:
        *(void *)(a1 + v6[8]) = *(void *)(a2 + v6[8]);
        swift_bridgeObjectRelease();
        *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
        swift_bridgeObjectRelease();
        uint64_t v41 = v6[10];
        uint64_t v42 = a1 + v41;
        uint64_t v43 = a2 + v41;
        if (*(void *)(a1 + v41 + 8))
        {
          uint64_t v44 = *(void *)(v43 + 8);
          if (v44)
          {
            *(void *)uint64_t v42 = *(void *)v43;
            *(void *)(v42 + 8) = v44;
            swift_bridgeObjectRelease();
            uint64_t v45 = *(void *)(v43 + 24);
            *(void *)(v42 + 16) = *(void *)(v43 + 16);
            *(void *)(v42 + 24) = v45;
            swift_bridgeObjectRelease();
LABEL_21:
            *(unsigned char *)(v42 + 32) = *(unsigned char *)(v43 + 32);
            *(unsigned char *)(a1 + v6[11]) = *(unsigned char *)(a2 + v6[11]);
            return a1;
          }
          outlined destroy of LACUIAuthButtonConfiguration(v42);
        }
        long long v46 = *(_OWORD *)(v43 + 16);
        *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
        *(_OWORD *)(v42 + 16) = v46;
        goto LABEL_21;
      }
      _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    }
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v21, v22, *(void *)(*(void *)(v40 - 8) + 64));
    goto LABEL_16;
  }
  if (v10)
  {
LABEL_7:
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v11 = v6[7];
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    uint64_t v32 = *(int *)(v14 + 20);
    uint64_t v33 = (char *)v12 + v32;
    long long v34 = (char *)v13 + v32;
    uint64_t v35 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
    *(_OWORD *)((char *)v12 + *(int *)(v14 + 24)) = *(_OWORD *)((char *)v13 + *(int *)(v14 + 24));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(void *)(a1 + v6[8]) = *(void *)(a2 + v6[8]);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  uint64_t v36 = v6[10];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(unsigned char *)(v37 + 32) = *(unsigned char *)(v38 + 32);
  long long v39 = *(_OWORD *)(v38 + 16);
  *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
  *(_OWORD *)(v37 + 16) = v39;
  *(unsigned char *)(a1 + v6[11]) = *(unsigned char *)(a2 + v6[11]);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25503C2F0);
}

uint64_t sub_25503C2F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25503C370);
}

uint64_t sub_25503C370(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t getEnumTag for LACUIAuthState(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t destructiveInjectEnumTag for LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t type metadata accessor for LACUIAuthState()
{
  uint64_t result = type metadata singleton initialization cache for LACUIAuthState;
  if (!type metadata singleton initialization cache for LACUIAuthState) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for LACUIAuthState()
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t outlined destroy of (LACUIAuthState, LACUIAuthState)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthState, LACUIAuthState));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s25LocalAuthenticationCoreUI36LACUIAuthCountdownDelayConfigurationVWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static ViewBuilder.buildEither<A, B>(first:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ConditionalContent.Storage();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static ViewBuilder.buildEither<A, B>(second:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for _ConditionalContent.Storage();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t DynamicStack.init(spacing:content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(unsigned char *)(a5 + 8) = a2 & 1;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  uint64_t v5 = (uint64_t *)(a5 + *(int *)(type metadata accessor for DynamicStack() + 40));
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for DynamicStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t DynamicStack.spacing.getter()
{
  return *(void *)v0;
}

uint64_t DynamicStack.spacing.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*DynamicStack.spacing.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t DynamicStack.content.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t DynamicStack.content.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DynamicStack.content.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t DynamicStack.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  type metadata accessor for VStack();
  type metadata accessor for HStack();
  type metadata accessor for _ConditionalContent();
  uint64_t v5 = type metadata accessor for Group();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  int v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v20 = v3;
  uint64_t v21 = v4;
  uint64_t v22 = v2;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v24 = WitnessTable;
  uint64_t v25 = v13;
  uint64_t v14 = swift_getWitnessTable();
  Group<A>.init(content:)();
  uint64_t v23 = v14;
  swift_getWitnessTable();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v15(v11, v9, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v15(v19, v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
}

uint64_t closure #1 in DynamicStack.body.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v50 = a3;
  uint64_t v5 = type metadata accessor for HStack();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v42 = (char *)&v39 - v8;
  uint64_t v9 = type metadata accessor for VStack();
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v40 = (char *)&v39 - v13;
  uint64_t v14 = type metadata accessor for DynamicTypeSize();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v39 - v19;
  uint64_t v21 = type metadata accessor for _ConditionalContent();
  uint64_t v48 = *(void *)(v21 - 8);
  uint64_t v49 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v46 = a2;
  long long v47 = (char *)&v39 - v22;
  uint64_t v45 = a1;
  type metadata accessor for DynamicStack();
  specialized Environment.wrappedValue.getter((uint64_t)v20);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v18, *MEMORY[0x263F18D70], v14);
  lazy protocol witness table accessor for type DynamicTypeSize and conformance DynamicTypeSize();
  LOBYTE(a1) = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  v23(v18, v14);
  v23(v20, v14);
  if (a1)
  {
    static HorizontalAlignment.center.getter();
    VStack.init(alignment:spacing:content:)();
    swift_getWitnessTable();
    uint64_t v25 = v40;
    uint64_t v24 = v41;
    int v26 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
    v26(v40, v12, v9);
    int v27 = *(void (**)(char *, uint64_t))(v24 + 8);
    v27(v12, v9);
    v26(v12, v25, v9);
    swift_getWitnessTable();
    uint64_t v28 = v47;
    static ViewBuilder.buildEither<A, B>(first:)((uint64_t)v12, v9);
    v27(v12, v9);
    v27(v25, v9);
  }
  else
  {
    static VerticalAlignment.center.getter();
    uint64_t v29 = (uint64_t)v43;
    HStack.init(alignment:spacing:content:)();
    swift_getWitnessTable();
    uint64_t v30 = v44;
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
    uint64_t v32 = v42;
    v31(v42, v29, v5);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v33(v29, v5);
    v31((char *)v29, (uint64_t)v32, v5);
    swift_getWitnessTable();
    uint64_t v28 = v47;
    static ViewBuilder.buildEither<A, B>(second:)(v29, v9, v5);
    v33(v29, v5);
    v33((uint64_t)v32, v5);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v51 = WitnessTable;
  uint64_t v52 = v35;
  uint64_t v36 = v49;
  swift_getWitnessTable();
  uint64_t v37 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v50, v28, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v28, v36);
}

uint64_t key path getter for EnvironmentValues.dynamicTypeSize : EnvironmentValues()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_25503D1EC()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t key path setter for EnvironmentValues.dynamicTypeSize : EnvironmentValues(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicTypeSize();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t partial apply for closure #1 in DynamicStack.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in DynamicStack.body.getter(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t associated type witness table accessor for View.Body : View in DynamicStack<A>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata instantiation function for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void type metadata completion function for DynamicStack()
{
  type metadata accessor for Environment<DynamicTypeSize>.Content();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *initializeBufferWithCopyOfBuffer for DynamicStack(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v5 = a2[3];
    v3[2] = a2[2];
    v3[3] = v5;
    uint64_t v6 = *(int *)(a3 + 40);
    uint64_t v7 = (void *)((char *)v3 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      void *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for DynamicStack(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for DynamicTypeSize();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for DynamicStack(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t outlined destroy of Environment<DynamicTypeSize>.Content(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 40);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 40);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v6);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25503D9F4);
}

uint64_t sub_25503D9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25503DABC);
}

uint64_t sub_25503DABC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata accessor for Environment<DynamicTypeSize>.Content()
{
  if (!lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    }
  }
}

uint64_t sub_25503DBC0()
{
  return swift_getWitnessTable();
}

unint64_t lazy protocol witness table accessor for type DynamicTypeSize and conformance DynamicTypeSize()
{
  unint64_t result = lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize;
  if (!lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

__n128 LACUIAuthCountdownItemView.init(configuration:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1->n128_u64[1];
  unsigned __int8 v3 = a1[2].n128_u8[0];
  unint64_t v4 = a1[2].n128_u64[1];
  unint64_t v5 = a1[3].n128_u64[0];
  a2->n128_u64[0] = a1->n128_u64[0];
  a2->n128_u64[1] = v2;
  __n128 result = a1[1];
  a2[1] = result;
  a2[2].n128_u8[0] = v3;
  a2[2].n128_u64[1] = v4;
  a2[3].n128_u64[0] = v5;
  return result;
}

uint64_t LACUIAuthCountdownItemView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  char v6 = *((unsigned char *)v1 + 32);
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownItemView.body.getter()
{
  uint64_t v1 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *(_OWORD *)(v0 + 16);
  v13[0] = *(_OWORD *)v0;
  v13[1] = v8;
  void v13[2] = *(_OWORD *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v0 + 32);
  *(void *)(v9 + 64) = *(void *)(v0 + 48);
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  *((void *)v7 + 2) = partial apply for closure #1 in LACUIAuthCountdownItemView.body.getter;
  *((void *)v7 + 3) = v9;
  uint64_t v11 = (uint64_t *)&v7[*(int *)(v5 + 40)];
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  outlined retain of LACUIAuthCountdownItemView((uint64_t)v13);
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
}

uint64_t closure #1 in LACUIAuthCountdownItemView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  MEMORY[0x270FA5388](v56);
  uint64_t v4 = (uint64_t *)((char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  MEMORY[0x270FA5388](v53);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  MEMORY[0x270FA5388](v54);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  MEMORY[0x270FA5388](v55);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
  MEMORY[0x270FA5388](v58);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v62 = (uint64_t)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v57 = (char *)&v53 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v61 = (uint64_t)&v53 - v21;
  char v22 = *(unsigned char *)(a1 + 32);
  uint64_t v60 = *(void *)(a1 + 40);
  uint64_t v59 = *(void *)(a1 + 48);
  if (v22)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = Image.init(systemName:)();
  }
  else
  {
    uint64_t v23 = one-time initialization token for current;
    swift_bridgeObjectRetain_n();
    if (v23 != -1) {
      swift_once();
    }
    id v24 = (id)static NSBundle.current;
    uint64_t v25 = Image.init(_:bundle:)();
    outlined consume of LACUIAuthImageConfiguration();
  }
  static SymbolRenderingMode.monochrome.getter();
  uint64_t v26 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 0, 1, v26);
  uint64_t KeyPath = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v7, (uint64_t)v4 + *(int *)(v56 + 28), &demangling cache variable for type metadata for SymbolRenderingMode?);
  uint64_t *v4 = KeyPath;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v4, (uint64_t)&v9[*(int *)(v53 + 36)], &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  *(void *)uint64_t v9 = v25;
  *((void *)v9 + 1) = 0;
  *((_WORD *)v9 + 8) = 1;
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v4, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for SymbolRenderingMode?);
  swift_release();
  uint64_t v28 = static Color.blue.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v9, (uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  *(void *)&v11[*(int *)(v54 + 36)] = v28;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v9, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  uint64_t v29 = static Font.title.getter();
  uint64_t v30 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v11, (uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  uint64_t v31 = (uint64_t *)&v13[*(int *)(v55 + 36)];
  *uint64_t v31 = v30;
  v31[1] = v29;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  uint64_t v32 = &v15[*(int *)(v58 + 36)];
  long long v33 = v69;
  *((_OWORD *)v32 + 4) = v68;
  *((_OWORD *)v32 + 5) = v33;
  *((_OWORD *)v32 + 6) = v70;
  long long v34 = v65;
  *(_OWORD *)uint64_t v32 = v64;
  *((_OWORD *)v32 + 1) = v34;
  long long v35 = v67;
  *((_OWORD *)v32 + 2) = v66;
  *((_OWORD *)v32 + 3) = v35;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
  uint64_t v36 = (uint64_t)v57;
  View.accessibilityHidden(_:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
  uint64_t v37 = v61;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>(v36, v61);
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = v59;
  swift_bridgeObjectRetain();
  LOBYTE(v30) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v48 = v62;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v37, v62, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v49 = v63;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v63, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  uint64_t v50 = v49
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>))
               + 48);
  uint64_t v51 = v60;
  *(void *)uint64_t v50 = v60;
  *(void *)(v50 + 8) = v39;
  *(unsigned char *)(v50 + 16) = 0;
  *(void *)(v50 + 24) = MEMORY[0x263F8EE78];
  *(void *)(v50 + 32) = v38;
  *(unsigned char *)(v50 + 40) = 0;
  *(unsigned char *)(v50 + 48) = v30;
  *(void *)(v50 + 56) = v41;
  *(void *)(v50 + 64) = v43;
  *(void *)(v50 + 72) = v45;
  *(void *)(v50 + 80) = v47;
  *(unsigned char *)(v50 + 88) = 0;
  outlined copy of Text.Storage(v51, v39, 0);
  swift_bridgeObjectRetain();
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v37, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  outlined consume of Text.Storage(v51, v39, 0);
  swift_release();
  swift_bridgeObjectRelease();
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v48, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
}

uint64_t partial apply for closure #1 in LACUIAuthCountdownItemView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in LACUIAuthCountdownItemView.body.getter(v1 + 16, a1);
}

uint64_t outlined retain of LACUIAuthCountdownItemView(uint64_t a1)
{
  return a1;
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownItemView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for View.body.getter in conformance LACUIAuthCountdownItemView()
{
  uint64_t v1 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *(_OWORD *)(v0 + 16);
  v13[0] = *(_OWORD *)v0;
  v13[1] = v8;
  void v13[2] = *(_OWORD *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v0 + 32);
  *(void *)(v9 + 64) = *(void *)(v0 + 48);
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  *((void *)v7 + 2) = closure #1 in LACUIAuthCountdownItemView.body.getterpartial apply;
  *((void *)v7 + 3) = v9;
  uint64_t v11 = (uint64_t *)&v7[*(int *)(v5 + 40)];
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  outlined retain of LACUIAuthCountdownItemView((uint64_t)v13);
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownItemView()
{
  return &type metadata for LACUIAuthCountdownItemView;
}

uint64_t sub_25503E988()
{
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  return swift_getOpaqueTypeConformance2();
}

uint64_t objectdestroyTm_2()
{
  swift_bridgeObjectRelease();
  outlined consume of LACUIAuthImageConfiguration();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t key path getter for EnvironmentValues.multilineTextAlignment : EnvironmentValues, serialized@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.multilineTextAlignment : EnvironmentValues, serialized()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_25503EAB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25503EAE0()
{
  return EnvironmentValues.font.setter();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Font?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Font?>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ForegroundStyleModifier<Color> and conformance _ForegroundStyleModifier<A>, &demangling cache variable for type metadata for _ForegroundStyleModifier<Color>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Image, _AspectRatioLayout>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25503EDA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25503EDD0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t LACUIDTOViewController.__allocating_init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a1;
  uint64_t v8 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v12 = v11 - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t *)((char *)&v22 - v16);
  uint64_t v18 = (char *)objc_allocWithZone(v4);
  *(void *)&v18[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();
  _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  swift_unknownObjectRetain();
  LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v10, a2, a3);
  *(uint64_t *)((char *)v17 + *(int *)(v12 + 28)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel();
  *uint64_t v17 = ObservedObject.init(wrappedValue:)();
  v17[1] = v19;
  _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  uint64_t v20 = UIHostingController.init(rootView:)();
  outlined destroy of LACUIAuthCountdownConfiguration(v23, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of LACUIAuthCountdownConfiguration((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  *(void *)(v20 + direct field offset for LACUIDTOViewController.handler + 8) = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v20;
}

uint64_t LACUIDTOViewController.init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LACUIAuthCountdownView();
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (uint64_t *)((char *)&v20 - v15);
  *(void *)(v3 + direct field offset for LACUIDTOViewController.handler + 8) = 0;
  swift_unknownObjectWeakInit();
  _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  swift_unknownObjectRetain();
  LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v9, a2, a3);
  *(uint64_t *)((char *)v16 + *(int *)(v11 + 28)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel();
  uint64_t *v16 = ObservedObject.init(wrappedValue:)();
  v16[1] = v17;
  _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0((uint64_t)v16, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  uint64_t v18 = UIHostingController.init(rootView:)();
  outlined destroy of LACUIAuthCountdownConfiguration(a1, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of LACUIAuthCountdownConfiguration((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownView);
  *(void *)(v18 + direct field offset for LACUIDTOViewController.handler + 8) = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v18;
}

id LACUIDTOViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LACUIDTOViewController.init(coder:)()
{
  *(void *)&v0[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void @objc LACUIDTOViewController.init(coder:)(char *a1, uint64_t a2, void *a3)
{
  *(void *)&a1[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t LACUIDTOViewController.refresh(with:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for LACUIAuthCountdownConfiguration);
  uint64_t v7 = v2 + direct field offset for LACUIDTOViewController.handler;
  uint64_t v8 = MEMORY[0x25A2854F0](v2 + direct field offset for LACUIDTOViewController.handler);
  uint64_t v9 = *(void *)(v7 + 8);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  uint64_t v10 = LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v6, v8, v9);
  uint64_t v11 = (uint64_t (*)(unsigned char *, void))dispatch thunk of UIHostingController.rootView.modify();
  uint64_t v13 = v12;
  swift_release();
  *(void *)(v13 + 8) = v10;
  return v11(v15, 0);
}

void LACUIDTOViewController.__allocating_init(rootView:)()
{
}

void LACUIDTOViewController.init(rootView:)()
{
}

void LACUIDTOViewController.__allocating_init(coder:rootView:)()
{
}

void LACUIDTOViewController.init(coder:rootView:)()
{
}

uint64_t LACUIDTOViewController.__ivar_destroyer()
{
  return outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + direct field offset for LACUIDTOViewController.handler);
}

id LACUIDTOViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t @objc LACUIDTOViewController.__ivar_destroyer(uint64_t a1)
{
  return outlined destroy of weak LACUIAuthCountdownViewModelHandler?(a1 + direct field offset for LACUIDTOViewController.handler);
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel()
{
  unint64_t result = lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel)
  {
    type metadata accessor for LACUIAuthCountdownViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel);
  }
  return result;
}

uint64_t _s25LocalAuthenticationCoreUI31LACUIAuthCountdownConfigurationVWOcTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for LACUIDTOViewController()
{
  uint64_t result = type metadata singleton initialization cache for LACUIDTOViewController;
  if (!type metadata singleton initialization cache for LACUIDTOViewController) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for LACUIDTOViewController()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for LACUIDTOViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LACUIDTOViewController);
}

uint64_t dispatch thunk of LACUIDTOViewController.__allocating_init(configuration:handler:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for LACUIDTOViewController + v0 + 32))();
}

uint64_t dispatch thunk of LACUIDTOViewController.refresh(with:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for LACUIDTOViewController + (*MEMORY[0x263F8EED0] & *v0) + 40))();
}

uint64_t ObjC metadata update function for LACUIDTOViewController()
{
  return type metadata accessor for LACUIDTOViewController();
}

uint64_t View.embedInScrollView(fillAvailableSpace:)(char a1, uint64_t a2, uint64_t a3)
{
  char v4 = a1;
  return MEMORY[0x25A284750](&v4, a2, &type metadata for EmbedInScrollViewIfNeededModifier, a3);
}

uint64_t EmbedInScrollViewIfNeededModifier.fillAvailableSpace.getter(char a1)
{
  return a1 & 1;
}

uint64_t EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *a3 = partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:);
  a3[1] = v10;
  return result;
}

uint64_t closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v21 = type metadata accessor for ScrollBounceBehavior();
  uint64_t v7 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  unint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0);
  uint64_t v14 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a1;
  static Axis.Set.vertical.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>);
  lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>();
  uint64_t v17 = ScrollView.init(_:showsIndicators:content:)();
  MEMORY[0x25A284520](v17);
  LOBYTE(a1) = static Axis.Set.vertical.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != a1) {
    Axis.Set.init(rawValue:)();
  }
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>> and conformance ScrollView<A>, &demangling cache variable for type metadata for ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>>);
  View.scrollBounceBehavior(_:axes:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v22, v16, v20);
}

uint64_t closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v25[1] = a3;
  _OWORD v25[2] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>.Storage);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v25 - v17;
  if (a1)
  {
    GeometryProxy.size.getter();
    static Alignment.center.getter();
    _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v16, a2, v6);
    uint64_t v19 = &v16[*(int *)(v13 + 36)];
    long long v20 = v31;
    *((_OWORD *)v19 + 4) = v30;
    *((_OWORD *)v19 + 5) = v20;
    *((_OWORD *)v19 + 6) = v32;
    long long v21 = v27;
    *(_OWORD *)uint64_t v19 = v26;
    *((_OWORD *)v19 + 1) = v21;
    long long v22 = v29;
    *((_OWORD *)v19 + 2) = v28;
    *((_OWORD *)v19 + 3) = v22;
    outlined init with take of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v16, (uint64_t)v18);
    outlined init with copy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v18, (uint64_t)v12);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
    _ConditionalContent<>.init(storage:)();
    return outlined destroy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v18);
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v24(v9, a2, v6);
    v24(v12, (uint64_t)v9, v6);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

LocalAuthenticationCoreUI::EmbedInScrollViewIfNeededModifier __swiftcall EmbedInScrollViewIfNeededModifier.init(fillAvailableSpace:)(Swift::Bool fillAvailableSpace)
{
  return (LocalAuthenticationCoreUI::EmbedInScrollViewIfNeededModifier)fillAvailableSpace;
}

uint64_t protocol witness for static ViewModifier._makeView(modifier:inputs:body:) in conformance EmbedInScrollViewIfNeededModifier()
{
  return MEMORY[0x270EFF510]();
}

uint64_t protocol witness for static ViewModifier._makeViewList(modifier:inputs:body:) in conformance EmbedInScrollViewIfNeededModifier()
{
  return MEMORY[0x270EFF520]();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance EmbedInScrollViewIfNeededModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t protocol witness for ViewModifier.body(content:) in conformance EmbedInScrollViewIfNeededModifier@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  char v8 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = v8;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  *a2 = partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:);
  a2[1] = v10;
  return result;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in EmbedInScrollViewIfNeededModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for EmbedInScrollViewIfNeededModifier(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EmbedInScrollViewIfNeededModifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x255040340);
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

ValueMetadata *type metadata accessor for EmbedInScrollViewIfNeededModifier()
{
  return &type metadata for EmbedInScrollViewIfNeededModifier;
}

uint64_t sub_255040378()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type GeometryReader<<<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0> and conformance GeometryReader<A>, &demangling cache variable for type metadata for GeometryReader<<<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0>);
}

uint64_t sub_2550403B4()
{
  return swift_getWitnessTable();
}

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 17) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>)
                 - 8);
  char v6 = *(unsigned char *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)(a1, v6, v7, a2);
}

uint64_t partial apply for closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)(*(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>);
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

objc_class *one-time initialization function for resourceBundle()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  unint64_t result = (objc_class *)objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.Class isa = result;
  return result;
}

uint64_t one-time initialization function for lockAndRing(uint64_t a1)
{
  return one-time initialization function for lockAndRing(a1, static ImageResource.lockAndRing, 0x646E612E6B636F6CLL, 0xED0000676E69722ELL);
}

uint64_t ImageResource.lockAndRing.unsafeMutableAddressor()
{
  return ImageResource.lockAndRing.unsafeMutableAddressor(&one-time initialization token for lockAndRing, (uint64_t)static ImageResource.lockAndRing);
}

uint64_t static ImageResource.lockAndRing.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.lockAndRing.getter(&one-time initialization token for lockAndRing, (uint64_t)static ImageResource.lockAndRing, a1);
}

uint64_t one-time initialization function for lockBadgeClockFill(uint64_t a1)
{
  return one-time initialization function for lockAndRing(a1, static ImageResource.lockBadgeClockFill, 0xD000000000000015, 0x80000002550462F0);
}

uint64_t one-time initialization function for lockAndRing(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1) {
    swift_once();
  }
  return MEMORY[0x25A284000](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.lockBadgeClockFill.unsafeMutableAddressor()
{
  return ImageResource.lockAndRing.unsafeMutableAddressor(&one-time initialization token for lockBadgeClockFill, (uint64_t)static ImageResource.lockBadgeClockFill);
}

uint64_t ImageResource.lockAndRing.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.lockBadgeClockFill.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.lockAndRing.getter(&one-time initialization token for lockBadgeClockFill, (uint64_t)static ImageResource.lockBadgeClockFill, a1);
}

uint64_t static ImageResource.lockAndRing.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static FormatStyle<>.components(style:fields:)()
{
  return MEMORY[0x270EEDCE0]();
}

uint64_t static FormatStyle<>.time(pattern:)()
{
  return MEMORY[0x270EEDD50]();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = MEMORY[0x270EEEEC0](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x270EF0898]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t static Date.ComponentsFormatStyle.Style.wide.getter()
{
  return MEMORY[0x270EF0A00]();
}

uint64_t type metadata accessor for Date.ComponentsFormatStyle.Style()
{
  return MEMORY[0x270EF0A18]();
}

uint64_t type metadata accessor for Date.ComponentsFormatStyle()
{
  return MEMORY[0x270EF0AE0]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
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

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x270FA1938]();
}

uint64_t UTType.init(_:)()
{
  return MEMORY[0x270FA1948]();
}

uint64_t static LACLogger.ui.getter()
{
  return MEMORY[0x270F47818]();
}

Swift::Void __swiftcall LACLogger.log(_:)(Swift::String a1)
{
}

uint64_t static LACLogger.dtoUI.getter()
{
  return MEMORY[0x270F47838]();
}

Swift::Void __swiftcall LACLogger.error(_:)(Swift::String a1)
{
}

uint64_t type metadata accessor for LACLogger()
{
  return MEMORY[0x270F47850]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t CurrentValueSubject.value.setter()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t Subject<>.send()()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t StateObject.wrappedValue.getter()
{
  return MEMORY[0x270EFF108]();
}

uint64_t TimelineView<>.init(_:content:)()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x270EFF538]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x270EFF598]();
}

uint64_t GeometryProxy.size.getter()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x270F001A8]();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return MEMORY[0x270F00598]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x270F00688]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x270F008D0]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x270F008D8]();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return MEMORY[0x270F00A00]();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return MEMORY[0x270F00A18]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x270F00A20]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x270F00A30]();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return MEMORY[0x270F00C78]();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return MEMORY[0x270F00C88]();
}

uint64_t EnvironmentValues.font.getter()
{
  return MEMORY[0x270F00D80]();
}

uint64_t EnvironmentValues.font.setter()
{
  return MEMORY[0x270F00D90]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x270F01070]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x270F01358]();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return MEMORY[0x270F013F0]();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return MEMORY[0x270F01440]();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return MEMORY[0x270F01460]();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return MEMORY[0x270F01510]();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return MEMORY[0x270F01520]();
}

uint64_t static SymbolRenderingMode.monochrome.getter()
{
  return MEMORY[0x270F015D0]();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return MEMORY[0x270F015F8]();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return MEMORY[0x270F01610]();
}

uint64_t UIHostingController.init(rootView:)()
{
  return MEMORY[0x270F016A0]();
}

uint64_t dispatch thunk of UIHostingController.rootView.modify()
{
  return MEMORY[0x270F016B0]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x270F01708]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x270F01778]();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return MEMORY[0x270F017F8]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x270F01800]();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return MEMORY[0x270F01818]();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return MEMORY[0x270F01940]();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return MEMORY[0x270F01950]();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return MEMORY[0x270F01D38]();
}

uint64_t PeriodicTimelineSchedule.init(from:by:)()
{
  return MEMORY[0x270F02180]();
}

uint64_t type metadata accessor for PeriodicTimelineSchedule()
{
  return MEMORY[0x270F02188]();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return MEMORY[0x270F02380]();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return MEMORY[0x270F023A0]();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return MEMORY[0x270F025C8]();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return MEMORY[0x270F025E0]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E0]();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return MEMORY[0x270F029F8]();
}

uint64_t static Axis.Set.vertical.getter()
{
  return MEMORY[0x270F02A00]();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return MEMORY[0x270F02A20]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x270F02A30]();
}

uint64_t static Edge.Set.vertical.getter()
{
  return MEMORY[0x270F02A90]();
}

uint64_t static Font.largeTitle.getter()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t static Font.title.getter()
{
  return MEMORY[0x270F02B90]();
}

uint64_t static Font.Weight.bold.getter()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t static Font.footnote.getter()
{
  return MEMORY[0x270F02D08]();
}

uint64_t static Font.headline.getter()
{
  return MEMORY[0x270F02D10]();
}

uint64_t Text.fontWeight(_:)()
{
  return MEMORY[0x270F02F28]();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return MEMORY[0x270F03010]();
}

uint64_t Text.monospacedDigit()()
{
  return MEMORY[0x270F03020]();
}

uint64_t Text.accessibilityLabel<A>(_:)()
{
  return MEMORY[0x270F03050]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x270F030A8]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03250]();
}

uint64_t View.fontWeight(_:)()
{
  return MEMORY[0x270F03360]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x270F03438]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t View.accessibilityHidden(_:)()
{
  return MEMORY[0x270F03B00]();
}

uint64_t View.accessibilityElement(children:)()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return MEMORY[0x270F03C30]();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x270F04170]();
}

uint64_t Color.init(uiColor:)()
{
  return MEMORY[0x270F04378]();
}

uint64_t static Color.blue.getter()
{
  return MEMORY[0x270F043F8]();
}

uint64_t Group<A>.init(content:)()
{
  return MEMORY[0x270F04608]();
}

uint64_t type metadata accessor for Group()
{
  return MEMORY[0x270F04620]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x270F04650]();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return MEMORY[0x270F04690]();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return MEMORY[0x270F04718]();
}

uint64_t Image.init(_:bundle:)()
{
  return MEMORY[0x270F04738]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048B0]();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return MEMORY[0x270F048E8]();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return MEMORY[0x270F04950]();
}

uint64_t type metadata accessor for HStack()
{
  return MEMORY[0x270F04960]();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t type metadata accessor for VStack()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t ForEach<>.init(_:content:)()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x270F05078]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x270FA1DF0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
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

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
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

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1CF0]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1D08]();
}

uint64_t Range<>.formatted<A>(_:)()
{
  return MEMORY[0x270EF1D48]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
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

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x270F9F1A8]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
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

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t static Duration.TimeFormatStyle.Pattern.minuteSecond.getter()
{
  return MEMORY[0x270EF2808]();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle.Pattern()
{
  return MEMORY[0x270EF2820]();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle()
{
  return MEMORY[0x270EF2838]();
}

uint64_t Duration.formatted<A>(_:)()
{
  return MEMORY[0x270EF2A10]();
}

uint64_t Duration.init(secondsComponent:attosecondsComponent:)()
{
  return MEMORY[0x270F9FF90]();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

uint64_t CA_CGPointApplyTransform()
{
  return MEMORY[0x270EFB988]();
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x270EFB990]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x270F77268]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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