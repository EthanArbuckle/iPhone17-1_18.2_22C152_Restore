@interface WFMediaRouteState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (MPAVRoute)route;
- (WFMediaRouteState)initWithRoute:(id)a3;
@end

@implementation WFMediaRouteState

- (void).cxx_destruct
{
}

- (MPAVRoute)route
{
  return self->_route;
}

- (WFMediaRouteState)initWithRoute:(id)a3
{
  id v5 = a3;
  v6 = [v5 routeName];
  v7 = [v5 groupUID];
  v8 = [v5 routeUID];
  v9 = -[WFMediaRouteDescriptor initWithRouteUID:groupUID:routeName:isLocalDevice:]([WFMediaRouteDescriptor alloc], "initWithRouteUID:groupUID:routeName:isLocalDevice:", v8, v7, v6, [v5 isDeviceSpeakerRoute]);
  v14.receiver = self;
  v14.super_class = (Class)WFMediaRouteState;
  v10 = [(WFVariableSubstitutableParameterState *)&v14 initWithValue:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_route, a3);
    v12 = v11;
  }

  return v11;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315906;
      objc_super v14 = "WFEnforceClass";
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      id v10 = v18;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  if ([v8 count])
  {
    v11 = [MEMORY[0x263F86DD8] modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5)
    {
LABEL_3:
      uint64_t v6 = [MEMORY[0x263F86DD8] JSONDictionaryFromModel:v5 error:0];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"WFMediaRouteState.m", 25, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFMediaRouteDescriptor class]]" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end