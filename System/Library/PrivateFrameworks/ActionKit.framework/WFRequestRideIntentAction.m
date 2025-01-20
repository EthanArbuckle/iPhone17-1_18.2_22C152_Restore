@interface WFRequestRideIntentAction
- (INInteraction)requestRideInteraction;
- (WFIntentExecutor)rideStatusExecutor;
- (WFRequestRideIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFRideOptionsLoader)rideOptionsLoader;
- (id)disabledOnPlatforms;
- (id)displayableAppDescriptor;
- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4;
- (id)errorFromHandleResponse:(id)a3 intent:(id)a4;
- (id)errorFromListRideOptionsResponse:(id)a3 intent:(id)a4;
- (id)errorFromRequestRideResponse:(id)a3 intent:(id)a4;
- (id)mustVerifyCredentialsError;
- (id)noServiceInAreaError;
- (id)previousRideNeedsCompletionError;
- (id)previousRideNeedsFeedback;
- (id)rideScheduledTooFarError;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)serviceTemporarilyUnavailableError;
- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4;
- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4;
- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveError:(id)a4;
- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveUpdate:(id)a4;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)rideOptionsLoader:(id)a3 errorFromListRideOptionsError:(id)a4 updatedErrorHandler:(id)a5;
- (void)setRequestRideInteraction:(id)a3;
- (void)setRideStatusExecutor:(id)a3;
@end

@implementation WFRequestRideIntentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideInteraction, 0);
  objc_storeStrong((id *)&self->_rideStatusExecutor, 0);
  objc_storeStrong((id *)&self->_rideOptionsLoader, 0);
}

- (void)setRequestRideInteraction:(id)a3
{
}

- (INInteraction)requestRideInteraction
{
  return self->_requestRideInteraction;
}

- (void)setRideStatusExecutor:(id)a3
{
}

- (WFIntentExecutor)rideStatusExecutor
{
  return self->_rideStatusExecutor;
}

- (WFRideOptionsLoader)rideOptionsLoader
{
  return self->_rideOptionsLoader;
}

- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = getWFActionsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFRequestRideIntentAction intentExecutor:receivingRideStatusDidReceiveError:]";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Get Ride Status failed with %{public}@", buf, 0x16u);
  }

  [v7 stopReceivingRideStatusUpdates];
  [(WFRequestRideIntentAction *)self setRideStatusExecutor:0];
  v9 = [(WFRequestRideIntentAction *)self requestRideInteraction];
  v10.receiver = self;
  v10.super_class = (Class)WFRequestRideIntentAction;
  [(WFHandleIntentAction *)&v10 handleExecutionCompletionWithInteraction:v9 error:0];
}

- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 rideStatus];
  uint64_t v9 = [v8 phase];

  if (v9 >= 2)
  {
    objc_super v10 = [(WFRequestRideIntentAction *)self requestRideInteraction];
    v11 = [v10 intentResponse];
    v12 = (void *)[v11 copy];

    __int16 v13 = [v7 rideStatus];
    id v14 = (void *)[v13 copy];
    [v12 setRideStatus:v14];

    uint64_t v15 = [(WFRequestRideIntentAction *)self requestRideInteraction];
    [v15 _setIntentResponse:v12];

    [v6 stopReceivingRideStatusUpdates];
    [(WFRequestRideIntentAction *)self setRideStatusExecutor:0];
    v16 = [(WFRequestRideIntentAction *)self requestRideInteraction];
    v17.receiver = self;
    v17.super_class = (Class)WFRequestRideIntentAction;
    [(WFHandleIntentAction *)&v17 handleExecutionCompletionWithInteraction:v16 error:0];
  }
}

- (void)rideOptionsLoader:(id)a3 errorFromListRideOptionsError:(id)a4 updatedErrorHandler:(id)a5
{
  id v16 = a4;
  id v7 = (void (**)(id, void))a5;
  v8 = [v16 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F87230]];

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [v16 code];
  if ((unint64_t)(v10 - 102) < 2)
  {
    v11 = [v16 userInfo];
    v12 = [v11 objectForKey:*MEMORY[0x263F87238]];
    __int16 v13 = [v11 objectForKey:*MEMORY[0x263F87240]];
    id v14 = [(WFRequestRideIntentAction *)self errorFromListRideOptionsResponse:v13 intent:v12];
    if (v14) {
      id v15 = v14;
    }
    else {
      id v15 = v16;
    }
    ((void (**)(id, id))v7)[2](v7, v15);

    goto LABEL_10;
  }
  if (v10 == 100) {
    [(WFHandleIntentAction *)self getErrorFromExtensionError:v16 completionHandler:v7];
  }
  else {
LABEL_9:
  }
    ((void (**)(id, id))v7)[2](v7, v16);
LABEL_10:
}

- (id)displayableAppDescriptor
{
  v3 = [(WFHandleSystemIntentAction *)self intentDescriptor];

  if (v3)
  {
    v4 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263F0F988]);
    v4 = (void *)[v5 initWithBundleIdentifier:*MEMORY[0x263F85518]];
  }
  return v4;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFRequestRideIntentAction *)self errorFromRequestRideResponse:v6 intent:v7];
  int v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRequestRideIntentAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromHandleResponse:v6 intent:v7];
  }
  v11 = v10;

  return v11;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFRequestRideIntentAction *)self errorFromRequestRideResponse:v6 intent:v7];
  int v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRequestRideIntentAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromHandleResponse:v6 intent:v7];
  }
  v11 = v10;

  return v11;
}

- (id)errorFromRequestRideResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  id v10 = v7;
  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if (v9 && (isKindOfClass & 1) != 0)
    {
      switch([v9 code])
      {
        case 6:
          uint64_t v13 = [(WFRequestRideIntentAction *)self mustVerifyCredentialsError];
          break;
        case 7:
          uint64_t v13 = [(WFRequestRideIntentAction *)self noServiceInAreaError];
          break;
        case 8:
          uint64_t v13 = [(WFRequestRideIntentAction *)self serviceTemporarilyUnavailableError];
          break;
        case 9:
          uint64_t v13 = [(WFRequestRideIntentAction *)self previousRideNeedsCompletionError];
          break;
        case 10:
          uint64_t v13 = [(WFRequestRideIntentAction *)self rideScheduledTooFarError];
          break;
        default:
          goto LABEL_11;
      }
      v12 = (void *)v13;
    }
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  return v12;
}

- (id)errorFromListRideOptionsResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  id v10 = v7;
  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if (v9 && (isKindOfClass & 1) != 0)
    {
      switch([v9 code])
      {
        case 6:
          uint64_t v13 = [(WFRequestRideIntentAction *)self mustVerifyCredentialsError];
          break;
        case 7:
          uint64_t v13 = [(WFRequestRideIntentAction *)self noServiceInAreaError];
          break;
        case 8:
          uint64_t v13 = [(WFRequestRideIntentAction *)self serviceTemporarilyUnavailableError];
          break;
        case 9:
          uint64_t v13 = [(WFRequestRideIntentAction *)self previousRideNeedsCompletionError];
          break;
        case 10:
          uint64_t v13 = [(WFRequestRideIntentAction *)self previousRideNeedsFeedback];
          break;
        default:
          goto LABEL_11;
      }
      v12 = (void *)v13;
    }
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  return v12;
}

- (id)previousRideNeedsFeedback
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Feedback Required");
  v4 = WFLocalizedString(@"Your previous ride needs your feedback. Please give your feedback in the app.");
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)rideScheduledTooFarError
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"Too Far in Advance");
  v3 = WFLocalizedString(@"The scheduled ride time is too far in advance.");
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F870B8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F08338];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v4 errorWithDomain:v5 code:5 userInfo:v7];

  return v8;
}

- (id)previousRideNeedsCompletionError
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Ride Not Completed");
  v4 = WFLocalizedString(@"A previous ride needs your feedback before you can request a new ride.");
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)serviceTemporarilyUnavailableError
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Service Temporarily Unavailable");
  v4 = WFLocalizedString(@"Service is temporarily unavailable. Please try again later.");
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)noServiceInAreaError
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"No Service Available");
  v4 = WFLocalizedString(@"There is no service available in the requested area.");
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)mustVerifyCredentialsError
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Sign In Required");
  v4 = WFLocalizedString(@"Your current credentials are invalid. You must sign into the app in order to request a ride.");
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v5 _codableDescription];
    uint64_t v7 = [v6 attributeByName:@"pickupLocation"];
    v8 = [(WFRequestRideIntentAction *)self parameterForKey:WFRequestRideActionPickupLocationParameterKey];
    id v9 = [v5 pickupLocation];
    v48 = v8;
    id v10 = [v8 definition];
    v49 = v7;
    v11 = objc_msgSend(v7, "wf_parameterStateForIntentValue:parameterDefinition:", v9, v10);
    v52 = [v11 serializedRepresentation];

    v12 = [v6 attributeByName:@"dropOffLocation"];
    uint64_t v13 = [(WFRequestRideIntentAction *)self parameterForKey:WFRequestRideActionDropOffLocationParameterKey];
    id v14 = [v5 dropOffLocation];
    v46 = v13;
    id v15 = [v13 definition];
    v47 = v12;
    id v16 = objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v14, v15);
    v51 = [v16 serializedRepresentation];

    objc_super v17 = [v6 attributeByName:@"rideOptionName"];
    v18 = [(WFRequestRideIntentAction *)self parameterForKey:WFRequestRideActionRideOptionParameterKey];
    v19 = [v5 rideOptionName];
    v44 = v18;
    v20 = [v18 definition];
    v45 = v17;
    v21 = objc_msgSend(v17, "wf_parameterStateForIntentValue:parameterDefinition:", v19, v20);
    v50 = [v21 serializedRepresentation];

    v22 = [v6 attributeByName:@"partySize"];
    v23 = [(WFRequestRideIntentAction *)self parameterForKey:WFRequestRideActionPartySizeParameterKey];
    v24 = [v5 partySize];
    v42 = v23;
    v25 = [v23 definition];
    v43 = v22;
    v26 = objc_msgSend(v22, "wf_parameterStateForIntentValue:parameterDefinition:", v24, v25);
    v27 = [v26 serializedRepresentation];

    v28 = [v6 attributeByName:@"paymentMethod"];
    v29 = [(WFRequestRideIntentAction *)self parameterForKey:WFRequestRideActionPaymentMethodParameterKey];
    v30 = [v5 paymentMethod];
    v31 = [v29 definition];
    v32 = objc_msgSend(v28, "wf_parameterStateForIntentValue:parameterDefinition:", v30, v31);
    v33 = [v32 serializedRepresentation];

    id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v35 = v34;
    if (v52) {
      [v34 setObject:v52 forKeyedSubscript:WFRequestRideActionPickupLocationParameterKey];
    }
    if (v51) {
      [v35 setObject:v51 forKeyedSubscript:WFRequestRideActionDropOffLocationParameterKey];
    }
    if (v50) {
      [v35 setObject:v50 forKeyedSubscript:WFRequestRideActionRideOptionParameterKey];
    }
    if (v27) {
      [v35 setObject:v27 forKeyedSubscript:WFRequestRideActionPartySizeParameterKey];
    }
    if (v33) {
      [v35 setObject:v33 forKeyedSubscript:WFRequestRideActionPaymentMethodParameterKey];
    }
    v36 = (void *)[objc_alloc(MEMORY[0x263F0FBB8]) initWithIntent:v5];
    v37 = [MEMORY[0x263F0F9B0] sharedResolver];
    v38 = [v37 resolvedIntentMatchingDescriptor:v36];

    v39 = [v38 appDescriptor];
    v40 = [v39 serializedRepresentation];
    [v35 setObject:v40 forKeyedSubscript:*MEMORY[0x263F87200]];
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 intentResponse];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8 = 0;
    goto LABEL_6;
  }
  id v9 = [v8 rideStatus];
  uint64_t v10 = [v9 phase];

  if (v10 > 1)
  {
LABEL_6:
    v16.receiver = self;
    v16.super_class = (Class)WFRequestRideIntentAction;
    [(WFHandleIntentAction *)&v16 handleExecutionCompletionWithInteraction:v6 error:v7];
    goto LABEL_7;
  }
  [(WFRequestRideIntentAction *)self setRequestRideInteraction:v6];
  v11 = objc_opt_new();
  v12 = [(WFHandleIntentAction *)self appBundleIdentifier];
  [v11 _setLaunchId:v12];

  [v11 _setExecutionContext:7];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F86C40]) initWithIntent:v11 donateInteraction:0 groupIdentifier:0];
  [(WFRequestRideIntentAction *)self setRideStatusExecutor:v13];

  id v14 = [(WFRequestRideIntentAction *)self rideStatusExecutor];
  [v14 setDelegate:self];

  id v15 = [(WFRequestRideIntentAction *)self rideStatusExecutor];
  [v15 startReceivingRideStatusUpdates];

LABEL_7:
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  if (!v8)
  {
    objc_super v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFRequestRideIntentAction.m", 95, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      v8[2](v8, 0);
      goto LABEL_15;
    }
    if (v7) {
      goto LABEL_8;
    }
LABEL_11:
    id v9 = 0;
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
LABEL_12:
  id v10 = v9;

  v11 = [v10 rideStatus];

  if (!v11) {
    goto LABEL_14;
  }
  v12 = [MEMORY[0x263F337C8] itemWithObject:v11];
  uint64_t v13 = (void *)MEMORY[0x263F337B0];
  v17[0] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v15 = [v13 collectionWithItems:v14];
  ((void (**)(id, void *))v8)[2](v8, v15);

LABEL_15:
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_super v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"dropOffLocation"];

  if (v18)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__WFRequestRideIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v20[3] = &unk_264E5C080;
    id v21 = v16;
    [v15 getObjectRepresentation:v20 forClass:getCLPlacemarkClass_45473()];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WFRequestRideIntentAction;
    [(WFHandleIntentAction *)&v19 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

uint64_t __87__WFRequestRideIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFRequestRideIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)WFRequestRideIntentAction;
  id v5 = [(WFHandleIntentAction *)&v37 initWithIdentifier:a3 definition:a4 serializedParameters:a5];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F0F9B8];
    uint64_t v38 = *MEMORY[0x263F0F6C0];
    v39[0] = MEMORY[0x263EFFA88];
    id v7 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    v8 = [v6 optionsWithDictionary:v7];

    id v9 = [MEMORY[0x263F0F9B0] sharedResolver];
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 setOptions:v8 forIntentClassName:v11];

    id v12 = objc_alloc_init(WFRideOptionsLoader);
    rideOptionsLoader = v5->_rideOptionsLoader;
    v5->_rideOptionsLoader = v12;

    id v14 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v14 setDelegate:v5];

    id v15 = [(WFHandleSystemIntentAction *)v5 intentDescriptor];
    id v16 = [v15 bundleIdentifier];
    objc_super v17 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v17 setAppBundleIdentifier:v16];

    int v18 = [(WFRequestRideIntentAction *)v5 parameterStateForKey:WFRequestRideActionDropOffLocationParameterKey fallingBackToDefaultValue:0];
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v19 = v18;
      }
      else {
        objc_super v19 = 0;
      }
    }
    else
    {
      objc_super v19 = 0;
    }
    id v20 = v19;

    id v21 = [v20 value];

    v22 = [v21 placemark];
    v23 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v23 setDropOffLocation:v22];

    v24 = [(WFRequestRideIntentAction *)v5 parameterStateForKey:WFRequestRideActionPickupLocationParameterKey fallingBackToDefaultValue:0];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    id v26 = v25;

    v27 = [v26 value];

    v28 = [v27 placemark];
    v29 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v29 setPickupLocation:v28];

    v30 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [(WFRequestRideIntentAction *)v5 addEventObserver:v30];

    v31 = [(WFRequestRideIntentAction *)v5 parameterForKey:WFRequestRideActionRideOptionParameterKey];
    v32 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v32 setRideOptionParameterParameter:v31];

    [v31 setAction:v5];
    v33 = [(WFRequestRideIntentAction *)v5 parameterForKey:WFRequestRideActionPaymentMethodParameterKey];
    id v34 = [(WFRequestRideIntentAction *)v5 rideOptionsLoader];
    [v34 setPaymentMethodParameterParameter:v33];

    v35 = v5;
  }

  return v5;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFRequestRideIntentAction;
  v2 = [(WFHandleIntentAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end