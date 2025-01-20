@interface WFMediaRoutePickerParameter
- (BOOL)hidesAccessoryIconInEditor;
- (BOOL)liveUpdatesPossibleStatesInEditor;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)preferParameterValuePicker;
- (BOOL)shouldDefaultToLocalDeviceEndpoint;
- (BOOL)wf_alwaysScaleIconImage;
- (Class)singleStateClass;
- (WFMediaRoutePicker)routePicker;
- (WFMediaRoutePickerParameter)initWithDefinition:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)sortedStatesForAvailableRoutes:(id)a3;
- (int64_t)routeType;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)routePickerDidUpdateAvailableRoutes:(id)a3;
- (void)setRoutePicker:(id)a3;
- (void)startDiscoveringRoutes;
- (void)stopDiscoveringRoutes;
@end

@implementation WFMediaRoutePickerParameter

- (void).cxx_destruct
{
}

- (void)setRoutePicker:(id)a3
{
}

- (void)routePickerDidUpdateAvailableRoutes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__WFMediaRoutePickerParameter_routePickerDidUpdateAvailableRoutes___block_invoke;
  v6[3] = &unk_264E5DED8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __67__WFMediaRoutePickerParameter_routePickerDidUpdateAvailableRoutes___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) availableRoutes];
  id v6 = [v2 sortedStatesForAvailableRoutes:v3];

  id v4 = *(void **)(a1 + 32);
  if (v6)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:v6];
    [v4 setPossibleStatesCollection:v5];
  }
  else
  {
    [v4 setPossibleStatesCollection:0];
  }
}

- (BOOL)liveUpdatesPossibleStatesInEditor
{
  return 1;
}

- (BOOL)hidesAccessoryIconInEditor
{
  return 1;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 value];
  int v5 = [v4 isLocalDevice];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F85308]);
    id v7 = [getMPAVRoutingControllerClass() _currentDeviceRoutingIconImage];
    v8 = (void *)[v6 initWithPlatformImage:v7];
  }
  else
  {
    id v7 = [v3 route];
    if (v7)
    {
      id v9 = objc_alloc(MEMORY[0x263F85308]);
      v10 = [getMPAVRoutingControllerClass() _iconImageForRoute:v7];
      v8 = (void *)[v9 initWithPlatformImage:v10];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (id)sortedStatesForAvailableRoutes:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19931;
  v20 = __Block_byref_object_dispose__19932;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__WFMediaRoutePickerParameter_sortedStatesForAvailableRoutes___block_invoke;
  v15[3] = &unk_264E58A58;
  v15[4] = self;
  v15[5] = &v16;
  int v5 = objc_msgSend(v4, "if_compactMap:", v15);
  id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"value.routeName" ascending:1];
  v22[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v8 = [v5 sortedArrayUsingDescriptors:v7];

  if ([(WFMediaRoutePickerParameter *)self routeType] == 3)
  {
    id v9 = v8;
  }
  else
  {
    v10 = (void *)[v8 mutableCopy];
    id v9 = v10;
    if (v17[5])
    {
      objc_msgSend(v10, "removeObject:");
      [v9 insertObject:v17[5] atIndex:0];
    }
    else
    {
      uint64_t v11 = WFGetLocalDeviceMediaRoute();
      v12 = (void *)v17[5];
      v17[5] = v11;

      uint64_t v13 = v17[5];
      if (v13) {
        [v9 insertObject:v13 atIndex:0];
      }
    }
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

WFMediaRouteState *__62__WFMediaRoutePickerParameter_sortedStatesForAvailableRoutes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) routeType] != 3) {
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)getMPAVOutputDeviceRouteClass_softClass;
  uint64_t v14 = getMPAVOutputDeviceRouteClass_softClass;
  if (!getMPAVOutputDeviceRouteClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getMPAVOutputDeviceRouteClass_block_invoke;
    v10[3] = &unk_264E5EC88;
    v10[4] = &v11;
    __getMPAVOutputDeviceRouteClass_block_invoke((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (WFAvailableListeningModesForRoute(v3),
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v7 >= 2))
  {
LABEL_7:
    v8 = [[WFMediaRouteState alloc] initWithRoute:v3];
    if ([v3 isDeviceSpeakerRoute]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = objc_msgSend(a4, "value", a3);
  id v5 = [v4 routeName];

  return v5;
}

- (BOOL)shouldDefaultToLocalDeviceEndpoint
{
  v2 = [(WFMediaRoutePickerParameter *)self definition];
  id v3 = [v2 objectForKey:*MEMORY[0x263F872E0]];
  char v4 = [v3 isEqualToString:@"Local"];

  return v4;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  v10 = (void (**)(id, void *, void))a5;
  id v6 = [(WFDynamicEnumerationParameter *)self possibleStates];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F0FCB8]);
    v8 = [(WFDynamicEnumerationParameter *)self possibleStates];
    id v9 = (void *)[v7 initWithItems:v8];
  }
  else
  {
    id v9 = 0;
  }
  v10[2](v10, v9, 0);
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  if ([(WFMediaRoutePickerParameter *)self shouldDefaultToLocalDeviceEndpoint])
  {
    id v3 = WFGetLocalDeviceMediaRoute();
  }
  else
  {
    id v3 = 0;
  }
  char v4 = [v3 serializedRepresentation];

  return v4;
}

- (void)stopDiscoveringRoutes
{
  id v3 = [(WFMediaRoutePickerParameter *)self routePicker];
  [v3 removeAvailableRoutesObserver:self];
}

- (void)startDiscoveringRoutes
{
  id v3 = [(WFMediaRoutePickerParameter *)self routePicker];
  [v3 addAvailableRoutesObserver:self];
}

- (WFMediaRoutePicker)routePicker
{
  routePicker = self->_routePicker;
  if (!routePicker)
  {
    char v4 = [[WFMediaRoutePicker alloc] initWithRouteType:[(WFMediaRoutePickerParameter *)self routeType]];
    id v5 = self->_routePicker;
    self->_routePicker = v4;

    routePicker = self->_routePicker;
  }
  return routePicker;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = [a3 value];
  char v4 = [v3 displayName];

  return v4;
}

- (int64_t)routeType
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(WFMediaRoutePickerParameter *)self definition];
  id v3 = [v2 objectForKey:@"RouteType"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315906;
      v12 = "WFEnforceClass";
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      id v8 = v16;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  if ([v6 isEqualToString:@"Endpoint"])
  {
    int64_t v9 = 1;
  }
  else if ([v6 isEqualToString:@"HandoffEndpoint"])
  {
    int64_t v9 = 2;
  }
  else if ([v6 isEqualToString:@"ListeningModeCapableOutputDevice"])
  {
    int64_t v9 = 3;
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (WFMediaRoutePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFMediaRoutePickerParameter;
  id v3 = [(WFMediaRoutePickerParameter *)&v7 initWithDefinition:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)wf_alwaysScaleIconImage
{
  return 1;
}

@end