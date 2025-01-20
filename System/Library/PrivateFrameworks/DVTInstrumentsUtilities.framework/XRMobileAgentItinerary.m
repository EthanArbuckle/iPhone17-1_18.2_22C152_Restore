@interface XRMobileAgentItinerary
+ (id)inlineStop;
- (BOOL)updated;
- (XRMobileAgentStop)currentStop;
- (XRMobileAgentStop)finalDestination;
- (id)finalDestinationTicket;
- (int)_nextMovementType;
- (void)_visitNextStop:(id)a3;
- (void)finishedWithMode:(id)a3;
- (void)revisit;
- (void)setFinalDestination:(id)a3;
- (void)setFinalDestinationTicket:(id)a3;
- (void)setNextStop:(id)a3 mode:(id)a4;
- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5;
- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5 desiredQoS:(unsigned int)a6;
@end

@implementation XRMobileAgentItinerary

+ (id)inlineStop
{
  return (id)qword_2687AA318;
}

- (void)_visitNextStop:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = (uint64_t)v4;
  self->_updated = 0;
  int nextMovementType = self->_nextMovementType;
  if ((nextMovementType - 1) >= 2)
  {
    if (!nextMovementType)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_23459BEE8((void *)v9, v40, v41, v42, v43);
      }
      nextMode = self->_nextMode;
      self->_nextMode = (NSString *)@"Failed";

      self->_int nextMovementType = 3;
      goto LABEL_15;
    }
    if (nextMovementType != 3) {
      goto LABEL_15;
    }
    [v4 setMode:v5 mode:(uint64_t)self->_nextMode];
    v11 = self->_finalDestination;
    objc_storeStrong((id *)(v9 + 8), self->_finalDestinationTicket);
    *(void *)(v9 + 16) = 3;
    v12 = self->_nextMode;
    self->_nextMode = 0;

    nextStop = self->_nextStop;
    self->_nextStop = 0;

    nextStopTicket = self->_nextStopTicket;
    self->_nextStopTicket = 0;

    currentStop = self->_currentStop;
    self->_currentStop = 0;

    finalDestination = self->_finalDestination;
    self->_finalDestination = 0;

    id finalDestinationTicket = self->_finalDestinationTicket;
    self->_id finalDestinationTicket = 0;

    if (!v11)
    {
LABEL_15:
      if (*(_DWORD *)(v9 + 16) != 3) {
        sub_23459BDD0();
      }
      [v9 goodbye:v5, v6, v7, v8];
      goto LABEL_21;
    }
    goto LABEL_8;
  }
  if (self->_nextStop)
  {
    [v4 setMode:v5 mode:(uint64_t)self->_nextMode];
    v11 = self->_nextStop;
    objc_storeStrong((id *)(v9 + 8), self->_nextStopTicket);
    *(_DWORD *)(v9 + 20) = self->_nextQoS;
    *(_DWORD *)(v9 + 16) = self->_nextMovementType;
    objc_storeStrong((id *)&self->_currentStop, self->_nextStop);
    self->_int nextMovementType = 0;
    if (!v11) {
      goto LABEL_15;
    }
LABEL_8:
    v18 = (id)qword_2687A9F28;
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer((os_log_t)qword_2687A9F28, (const void *)v9);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        v25 = [v9 _agentDiagnosticsName:v21, v22, v23, v24];
        int v30 = [v11 agentStopDiagnosticsTypeCode:v26, v27, v28, v29];
        v35 = [v9 performSelector:v31 withObject:v32 withObject:v33 withObject:v34];
        int v36 = *(_DWORD *)(v9 + 16);
        int v52 = 138413058;
        v53 = v25;
        __int16 v54 = 1024;
        int v55 = v30;
        __int16 v56 = 2112;
        v57 = v35;
        __int16 v58 = 1024;
        int v59 = v36;
        _os_signpost_emit_with_name_impl(&dword_234574000, v18, OS_SIGNPOST_EVENT, v20, "Mobile Agent Moved", "Agent %@ received by %d for mode %@ movement type %d", (uint8_t *)&v52, 0x22u);
      }
    }

    [v11 _receiveMobileAgent:v37 withData:v9 withData:v38 withData:v39];
    goto LABEL_21;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    sub_23459BE28((void *)v9, (uint64_t)self, v46, v47, v48);
  }
  [self finishedWithMode:v45 failed:v47 error:v48];
  if (self->_nextMovementType != 3) {
    sub_23459BDFC();
  }
  [self _visitNextStop:v49 withTransitionContext:v9 completion:v50];
LABEL_21:
}

- (void)finishedWithMode:(id)a3
{
  id v4 = (NSString *)a3;
  nextStop = self->_nextStop;
  self->_nextStop = 0;

  nextStopTicket = self->_nextStopTicket;
  self->_nextStopTicket = 0;

  nextMode = self->_nextMode;
  self->_nextMode = v4;

  self->_int nextMovementType = 3;
  self->_updated = 1;
}

- (void)revisit
{
  self->_int nextMovementType = 2;
  self->_updated = 1;
}

- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5 desiredQoS:(unsigned int)a6
{
  v10 = (XRMobileAgentStop *)a3;
  v11 = (NSString *)a4;
  v12 = (XRMobileAgentStop *)a5;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    sub_23459BF80((uint64_t)self);
  }
  nextStop = self->_nextStop;
  self->_nextStop = v10;
  v14 = v10;

  nextStopTicket = self->_nextStopTicket;
  self->_nextStopTicket = v12;
  v16 = v12;

  nextMode = self->_nextMode;
  self->_nextMode = v11;

  self->_nextQoS = a6;
  unsigned int nextMovementType = self->_nextMovementType;
  if (nextMovementType <= 3 && nextMovementType != 1) {
    self->_unsigned int nextMovementType = 1;
  }
  self->_updated = 1;
}

- (void)setNextStop:(id)a3 mode:(id)a4 ticket:(id)a5
{
}

- (void)setNextStop:(id)a3 mode:(id)a4
{
}

- (int)_nextMovementType
{
  return self->_nextMovementType;
}

- (XRMobileAgentStop)currentStop
{
  return self->_currentStop;
}

- (BOOL)updated
{
  return self->_updated;
}

- (XRMobileAgentStop)finalDestination
{
  return self->_finalDestination;
}

- (void)setFinalDestination:(id)a3
{
}

- (id)finalDestinationTicket
{
  return self->_finalDestinationTicket;
}

- (void)setFinalDestinationTicket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalDestinationTicket, 0);
  objc_storeStrong((id *)&self->_nextMode, 0);
  objc_storeStrong((id *)&self->_nextStopTicket, 0);
  objc_storeStrong((id *)&self->_finalDestination, 0);
  objc_storeStrong((id *)&self->_currentStop, 0);

  objc_storeStrong((id *)&self->_nextStop, 0);
}

@end