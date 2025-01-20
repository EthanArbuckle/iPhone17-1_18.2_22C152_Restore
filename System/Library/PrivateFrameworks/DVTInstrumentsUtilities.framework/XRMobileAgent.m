@interface XRMobileAgent
+ (void)initialize;
- (BOOL)holdsItinerary:(id)a3;
- (NSString)agentDiagnosticsName;
- (NSString)mode;
- (OS_os_log)loggingHandle;
- (XRMobileAgentItinerary)itinerary;
- (id)activateUsingCompletionOperationAtStop:(id)a3 activationTicket:(id)a4;
- (id)ticket;
- (int)movementType;
- (int)nextMovementType;
- (unsigned)desiredQoS;
- (void)__park;
- (void)activateAtStop:(id)a3 activationTicket:(id)a4 activationQoS:(unsigned int)a5 finalDestination:(id)a6 finalTicket:(id)a7;
- (void)activateAtStop:(id)a3 activationTicket:(id)a4 finalDestination:(id)a5 finalTicket:(id)a6;
- (void)activateWithFinalDestination:(id)a3 ticket:(id)a4;
- (void)executeStopOnItinerary:(id)a3;
- (void)goodbye;
- (void)hello;
- (void)setMode:(id)a3;
@end

@implementation XRMobileAgent

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)qword_2687AA318;
    qword_2687AA318 = v2;

    uint64_t v4 = objc_opt_new();
    v5 = (void *)qword_2687AA320;
    qword_2687AA320 = v4;

    v10 = [MEMORY[0x263EFFA40] standardUserDefaults:v6, v7, v8, v9];
    int v14 = [v10 XREnableInternalSignposts:v12:v13];

    if (v14)
    {
      qword_2687A9F28 = (uint64_t)os_log_create("com.apple.dt.utilities", "Mobile Agent");
      MEMORY[0x270F9A758]();
    }
  }
}

- (void)activateAtStop:(id)a3 activationTicket:(id)a4 activationQoS:(unsigned int)a5 finalDestination:(id)a6 finalTicket:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v35 = a3;
  id v13 = a4;
  id v14 = a6;
  id v19 = a7;
  if (!v35)
  {
    v33 = [MEMORY[0x263F08690] currentHandler:v15, v16, v17, v18];
    [v33 handleFailureInMethod:v34 object:a2 file:@"XRMobileAgent.m" lineNumber:64 description:@"Invalid parameter not satisfying: %@", @"activationStop != nil"];
  }
  if (self->_itinerary) {
    sub_23459BCC0();
  }
  v20 = (XRMobileAgentItinerary *)objc_opt_new();
  itinerary = self->_itinerary;
  self->_itinerary = v20;

  [self->_itinerary setFinalDestination:v22 withIdentifier:(uint64_t)v14 forRoute:(id)v23 withCompletion:(id)v24];
  [self->_itinerary setFinalDestinationTicket:v25 ticket:v26 ticket:v27];
  [self->_itinerary setNextStop:v28 mode:(uint64_t)v35 ticket:@"Activating" desiredQoS:(uint64_t)v13 ticket:v9];
  [self goodbye:v29 with:v30 and:v31 and:v32];
}

- (void)activateAtStop:(id)a3 activationTicket:(id)a4 finalDestination:(id)a5 finalTicket:(id)a6
{
}

- (void)activateWithFinalDestination:(id)a3 ticket:(id)a4
{
}

- (void)__park
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (id)qword_2687A9F28;
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9F28, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      mode = self->_mode;
      int v9 = 138412290;
      v10 = mode;
      _os_signpost_emit_with_name_impl(&dword_234574000, v3, OS_SIGNPOST_EVENT, v5, "Mobile Agent Parked", "Parked in mode %@", (uint8_t *)&v9, 0xCu);
    }
  }

  id ticket = self->_ticket;
  self->_id ticket = 0;

  itinerary = self->_itinerary;
  self->_itinerary = 0;

  self->_movementType = 0;
}

- (void)executeStopOnItinerary:(id)a3
{
  id v13 = a3;
  [self v4:v5 v6:v7];
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v8;
  if (v8 != @"Activating" && (v8 == @"Failed" || v8 == @"Finished")) {
    [v13 finishedWithMode:v9 after:v8 with:v10 and:v11];
  }
}

- (BOOL)holdsItinerary:(id)a3
{
  return self->_itinerary == a3;
}

- (NSString)agentDiagnosticsName
{
  return (NSString *)@"Mobile Agent";
}

- (unsigned)desiredQoS
{
  return self->_desiredQoS;
}

- (OS_os_log)loggingHandle
{
  return (OS_os_log *)(id)qword_2687A9F28;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (int)movementType
{
  return self->_movementType;
}

- (XRMobileAgentItinerary)itinerary
{
  return self->_itinerary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_itinerary, 0);

  objc_storeStrong(&self->_ticket, 0);
}

- (id)ticket
{
  return self->_ticket;
}

- (void)hello
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x237DC0DF0](self, a2);
  int movementType = self->_movementType;
  if ((movementType - 1) >= 2)
  {
    if (!movementType) {
      abort();
    }
  }
  else
  {
    uint64_t v5 = (id)qword_2687A9F28;
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9F28, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        uint64_t v12 = [self _agentDiagnosticsName:v8 withOptions:v9 withContext:v10 withCompletion:v11];
        mode = self->_mode;
        int v14 = self->_movementType;
        int v33 = 138412802;
        v34 = v12;
        __int16 v35 = 2112;
        v36 = mode;
        __int16 v37 = 1024;
        int v38 = v14;
        _os_signpost_emit_with_name_impl(&dword_234574000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Mobile Agent Exec", "Agent %@ executing mode %@.  Movement type is %d", (uint8_t *)&v33, 0x1Cu);
      }
    }

    [self executeStopOnItinerary:v15 itinerary:v16 stop:v17];
    uint64_t v18 = (id)qword_2687A9F28;
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9F28, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        int v25 = [self nextMovementType:v21 withMovementType:v22 withMovementType:v23 withMovementType:v24];
        int v33 = 67109120;
        LODWORD(v34) = v25;
        _os_signpost_emit_with_name_impl(&dword_234574000, v18, OS_SIGNPOST_INTERVAL_END, v20, "Mobile Agent Exec", "Finished with next movement type %d", (uint8_t *)&v33, 8u);
      }
    }

    if ([self->_itinerary _updateWithItinerary:v26 fromItinerary:v27 toItinerary:v28 withTransitionContext:v29] == NO) {
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_23459BCEC(self, (const char *)&self->_itinerary, v30, v31, v32);
    }
  }
}

- (void)goodbye
{
  if (self->_movementType == 3)
  {
    [self a2:v2 v3:v3 v4:v4];
    MEMORY[0x270F9A6D0](self, sel___park, v6, v7, v8);
  }
  else
  {
    itinerary = self->_itinerary;
    [itinerary _visitNextStop:a2 withTransitionContext:v3 completion:v4];
  }
}

- (int)nextMovementType
{
  return ((uint64_t (*)(XRMobileAgentItinerary *, char *))MEMORY[0x270F9A6D0])(self->_itinerary, sel__nextMovementType);
}

- (id)activateUsingCompletionOperationAtStop:(id)a3 activationTicket:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_opt_new();
  if (v7) {
    [self activateAtStop:v8 activationTicket:(uint64_t)v7 finalDestination:(uint64_t)v6 activationTicket:qword_2687AA320 finalTicket:v9];
  }
  else {
    [self activateAtStop:v8 activationTicket:v6 finalDestination:v9 finalTicket:v9];
  }

  return v9;
}

@end