@interface CURangingSession
- (CURangingSession)init;
- (NSArray)peers;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)measurementHandler;
- (id)measurementHandlerEx;
- (id)statusChangedHandler;
- (unsigned)flags;
- (unsigned)statusFlags;
- (void)_invalidate;
- (void)_invalidated;
- (void)_update;
- (void)_updateInitiator;
- (void)_updatePeers;
- (void)_updateResponder;
- (void)activate;
- (void)addSample:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)session:(id)a3 didChangeProximitySensorState:(unint64_t)a4;
- (void)session:(id)a3 didEstimateScores:(id)a4;
- (void)session:(id)a3 didFailwithError:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMeasurementHandler:(id)a3;
- (void)setMeasurementHandlerEx:(id)a3;
- (void)setPeers:(id)a3;
- (void)setStatusChangedHandler:(id)a3;
@end

@implementation CURangingSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong(&self->_measurementHandlerEx, 0);
  objc_storeStrong(&self->_measurementHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_prRangingSession, 0);
  objc_storeStrong((id *)&self->_prResponder, 0);
  objc_storeStrong((id *)&self->_peersRanging, 0);
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (NSArray)peers
{
  return self->_peers;
}

- (void)setMeasurementHandlerEx:(id)a3
{
}

- (id)measurementHandlerEx
{
  return self->_measurementHandlerEx;
}

- (void)setMeasurementHandler:(id)a3
{
}

- (id)measurementHandler
{
  return self->_measurementHandler;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)session:(id)a3 didChangeProximitySensorState:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v7 = (PRSharingSession *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  prRangingSession = self->_prRangingSession;

  if (prRangingSession != v7) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_11;
      }
      ucat = self->_ucat;
    }
    if (a4 > 3) {
      v14 = "?";
    }
    else {
      v14 = off_1E55BE918[a4];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0x1Eu, (uint64_t)"PR sensor state changed: %s\n", v9, v10, v11, v12, (uint64_t)v14);
  }
LABEL_11:
  uint64_t statusFlags = self->_statusFlags;
  unsigned int v16 = statusFlags & 0xFFFFFFFE | (a4 == 3);
  if (v16 == statusFlags)
  {
    v17 = self->_ucat;
    if (v17->var0 > 10) {
      return;
    }
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0xAu)) {
        return;
      }
      v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0xAu, (uint64_t)"Status unchanged: %#{flags}\n", v9, v10, v11, v12, statusFlags);
    return;
  }
  self->_uint64_t statusFlags = v16;
  v18 = self->_ucat;
  if (v18->var0 > 30) {
    goto LABEL_21;
  }
  if (v18->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu)) {
      goto LABEL_21;
    }
    v18 = self->_ucat;
  }
  LogPrintF((uint64_t)v18, (uint64_t)"-[CURangingSession session:didChangeProximitySensorState:]", 0x1Eu, (uint64_t)"Status changed: %#{flags} -> %#{flags}\n", v9, v10, v11, v12, statusFlags);
LABEL_21:
  v19 = (void (**)(void))_Block_copy(self->_statusChangedHandler);
  if (v19)
  {
    v20 = v19;
    v19[2]();
    v19 = v20;
  }
}

- (void)session:(id)a3 didFailwithError:(id)a4
{
  id v18 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (PRSharingSession *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  prRangingSession = self->_prRangingSession;

  v13 = v18;
  if (prRangingSession != v7) {
    goto LABEL_9;
  }
  self->_prRangingInitiated = 0;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    uint64_t v15 = (uint64_t)v18;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
      uint64_t v15 = (uint64_t)v18;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didFailwithError:]", 0x5Au, (uint64_t)"### PR Ranging failed: %{error}\n", v9, v10, v11, v12, v15);
  }
LABEL_6:
  unsigned int v16 = _Block_copy(self->_errorHandler);
  v17 = v16;
  if (v16) {
    (*((void (**)(void *, id))v16 + 2))(v16, v18);
  }

  v13 = v18;
LABEL_9:
}

- (void)session:(id)a3 didEstimateScores:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v6 = (PRSharingSession *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_prRangingSession != v6) {
    goto LABEL_30;
  }
  v8 = (void (**)(void *, CURangingPeer *, CURangingMeasurement *))_Block_copy(self->_measurementHandlerEx);
  if (!v8) {
    goto LABEL_29;
  }
  v40 = self;
  uint64_t v39 = mach_absolute_time();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v36 = v7;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  uint64_t v38 = *(void *)v42;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v42 != v38) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
      v13 = objc_alloc_init(CURangingPeer);
      v14 = [v12 btAddress];
      [(CURangingPeer *)v13 setDeviceAddress:v14];

      uint64_t v15 = objc_alloc_init(CURangingMeasurement);
      [(CURangingMeasurement *)v15 setTimestampTicks:v39];
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = [v12 scoreId];
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v35 = v16;
      v17 = (void *)[[NSString alloc] initWithFormat:@"%llu"];
      [(CURangingMeasurement *)v15 setIdentifier:v17];

      id v18 = [v12 range];
      v19 = v18;
      if (v18)
      {
        [v18 measurement];
        -[CURangingMeasurement setDistanceMeters:](v15, "setDistanceMeters:");
        [v19 uncertainty];
        -[CURangingMeasurement setDistanceError:](v15, "setDistanceError:");
        int v20 = 1;
      }
      else
      {
        int v20 = 0;
      }
      v21 = [v12 angle];
      v22 = v21;
      if (v21)
      {
        [v21 measurement];
        -[CURangingMeasurement setHorizontalAngle:](v15, "setHorizontalAngle:");
        [v22 uncertainty];
        -[CURangingMeasurement setHorizontalError:](v15, "setHorizontalError:");
        v20 |= 2u;
      }
      [v12 score];
      -[CURangingMeasurement setPtsScore:](v15, "setPtsScore:");
      [(CURangingMeasurement *)v15 setFlags:v20 | 8u];
      ucat = v40->_ucat;
      if (ucat->var0 <= 10)
      {
        if (ucat->var0 != -1) {
          goto LABEL_18;
        }
        if (_LogCategory_Initialize((uint64_t)v40->_ucat, 0xAu))
        {
          ucat = v40->_ucat;
LABEL_18:
          v24 = [(CURangingPeer *)v13 deviceAddress];
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession session:didEstimateScores:]", 0xAu, (uint64_t)"Ranging measurement: peer %@, %@\n", v25, v26, v27, v28, (uint64_t)v24);
        }
      }
      v8[2](v8, v13, v15);

      ++v11;
    }
    while (v10 != v11);
    uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    uint64_t v10 = v29;
  }
  while (v29);
LABEL_24:

  id v7 = v36;
  if (![obj count])
  {
    v34 = v40->_ucat;
    if (v34->var0 <= 10)
    {
      if (v34->var0 != -1) {
        goto LABEL_27;
      }
      if (_LogCategory_Initialize((uint64_t)v34, 0xAu))
      {
        v34 = v40->_ucat;
LABEL_27:
        LogPrintF((uint64_t)v34, (uint64_t)"-[CURangingSession session:didEstimateScores:]", 0xAu, (uint64_t)"Ranging measurement: no devices\n", v30, v31, v32, v33, v35);
      }
    }
  }
LABEL_29:

LABEL_30:
}

- (void)_updatePeers
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v63 = v2;
  id obj = v2->_peersRanging;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
  id v4 = 0;
  if (v3)
  {
    uint64_t v59 = *(void *)v87;
    do
    {
      uint64_t v61 = v3;
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v87 != v59) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        id v7 = [v6 contactKey];
        if (v7)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          v8 = v63->_peers;
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v82 objects:v94 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v83;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v83 != v10) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v12 = [*(id *)(*((void *)&v82 + 1) + 8 * j) deviceAddress];
                char v13 = [v12 isEqual:v7];

                if (v13)
                {

                  goto LABEL_19;
                }
              }
              uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v82 objects:v94 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }

          id v14 = v4;
          if (!v4) {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          id v4 = v14;
          [v14 addObject:v6];
        }
LABEL_19:
      }
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v3);
  }
  v55 = v4;

  v56 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obja = v63->_peers;
  uint64_t v15 = [(NSArray *)obja countByEnumeratingWithState:&v78 objects:v93 count:16];
  id v16 = 0;
  if (v15)
  {
    uint64_t v60 = *(void *)v79;
    do
    {
      uint64_t v62 = v15;
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v79 != v60) {
          objc_enumerationMutation(obja);
        }
        id v18 = [*(id *)(*((void *)&v78 + 1) + 8 * k) deviceAddress];
        if (v18)
        {
          v19 = (void *)[objc_alloc((Class)getPRTrustedContactClass[0]()) initWithContactKey:v18];
          if (v19)
          {
            [(NSArray *)v56 addObject:v19];
            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            int v20 = v63->_peersRanging;
            uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v74 objects:v92 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v75;
              while (2)
              {
                for (uint64_t m = 0; m != v21; ++m)
                {
                  if (*(void *)v75 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  v24 = [*(id *)(*((void *)&v74 + 1) + 8 * m) contactKey];
                  char v25 = [v24 isEqual:v18];

                  if (v25)
                  {

                    goto LABEL_40;
                  }
                }
                uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v74 objects:v92 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }

            id v26 = v16;
            if (!v16) {
              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            id v16 = v26;
            [v26 addObject:v19];
          }
LABEL_40:
        }
      }
      uint64_t v15 = [(NSArray *)obja countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v15);
  }

  peersRanging = v63->_peersRanging;
  v63->_peersRanging = v56;

  uint64_t v28 = v16;
  objc_sync_exit(v63);

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v29 = v55;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (!v30) {
    goto LABEL_56;
  }
  uint64_t v31 = *(void *)v71;
  do
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v71 != v31) {
        objc_enumerationMutation(v29);
      }
      uint64_t v33 = *(void **)(*((void *)&v70 + 1) + 8 * v32);
      uint64_t v38 = [v33 contactKey];
      p_var0 = &v63->_ucat->var0;
      if (*p_var0 <= 30)
      {
        if (*p_var0 != -1) {
          goto LABEL_50;
        }
        if (_LogCategory_Initialize((uint64_t)p_var0, 0x1Eu))
        {
          p_var0 = &v63->_ucat->var0;
LABEL_50:
          LogPrintF((uint64_t)p_var0, (uint64_t)"-[CURangingSession _updatePeers]", 0x1Eu, (uint64_t)"Responder remove peer: %@\n", v34, v35, v36, v37, (uint64_t)v38);
        }
      }
      prResponder = v63->_prResponder;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __32__CURangingSession__updatePeers__block_invoke;
      v69[3] = &unk_1E55BEEA0;
      v69[4] = v63;
      v69[5] = v38;
      [(PRContactAllowlist *)prResponder removeTrustedContact:v33 withCompletionHandler:v69];

      ++v32;
    }
    while (v30 != v32);
    uint64_t v41 = [v29 countByEnumeratingWithState:&v70 objects:v91 count:16];
    uint64_t v30 = v41;
  }
  while (v41);
LABEL_56:

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v42 = v28;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v65 objects:v90 count:16];
  if (!v43) {
    goto LABEL_69;
  }
  uint64_t v44 = *(void *)v66;
  while (2)
  {
    uint64_t v45 = 0;
    while (2)
    {
      if (*(void *)v66 != v44) {
        objc_enumerationMutation(v42);
      }
      uint64_t v46 = *(void **)(*((void *)&v65 + 1) + 8 * v45);
      v51 = [v46 contactKey];
      v52 = &v63->_ucat->var0;
      if (*v52 <= 30)
      {
        if (*v52 != -1) {
          goto LABEL_63;
        }
        if (_LogCategory_Initialize((uint64_t)v52, 0x1Eu))
        {
          v52 = &v63->_ucat->var0;
LABEL_63:
          LogPrintF((uint64_t)v52, (uint64_t)"-[CURangingSession _updatePeers]", 0x1Eu, (uint64_t)"Responder add peer: %@\n", v47, v48, v49, v50, (uint64_t)v51);
        }
      }
      v53 = v63->_prResponder;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __32__CURangingSession__updatePeers__block_invoke_2;
      v64[3] = &unk_1E55BEEA0;
      v64[4] = v63;
      v64[5] = v51;
      [(PRContactAllowlist *)v53 addTrustedContact:v46 withCompletionHandler:v64];

      if (v43 != ++v45) {
        continue;
      }
      break;
    }
    uint64_t v54 = [v42 countByEnumeratingWithState:&v65 objects:v90 count:16];
    uint64_t v43 = v54;
    if (v54) {
      continue;
    }
    break;
  }
LABEL_69:
}

uint64_t __32__CURangingSession__updatePeers__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = v5;
  if (!v5 && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(int *)v5 > 90) {
    goto LABEL_7;
  }
  uint64_t v12 = v10;
  if (*(_DWORD *)v5 != -1) {
    goto LABEL_5;
  }
  uint64_t v5 = _LogCategory_Initialize(v5, 0x5Au);
  uint64_t v10 = v12;
  if (v5)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
LABEL_5:
    uint64_t v5 = LogPrintF(v5, (uint64_t)"-[CURangingSession _updatePeers]_block_invoke", 0x5Au, (uint64_t)"### Responder remove peer failed: %@, %{error}\n", v6, v7, v8, v9, *(void *)(a1 + 40));
    uint64_t v10 = v12;
  }
LABEL_7:
  return MEMORY[0x1F41817F8](v5, v10);
}

uint64_t __32__CURangingSession__updatePeers__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = v5;
  if (!v5 && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(int *)v5 > 90) {
    goto LABEL_7;
  }
  uint64_t v12 = v10;
  if (*(_DWORD *)v5 != -1) {
    goto LABEL_5;
  }
  uint64_t v5 = _LogCategory_Initialize(v5, 0x5Au);
  uint64_t v10 = v12;
  if (v5)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
LABEL_5:
    uint64_t v5 = LogPrintF(v5, (uint64_t)"-[CURangingSession _updatePeers]_block_invoke_2", 0x5Au, (uint64_t)"### Responder add peer failed: %@, %{error}\n", v6, v7, v8, v9, *(void *)(a1 + 40));
    uint64_t v10 = v12;
  }
LABEL_7:
  return MEMORY[0x1F41817F8](v5, v10);
}

- (void)_updateResponder
{
  if (!self->_prResponder)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _updateResponder]", 0x1Eu, (uint64_t)"PR ranging responder start\n", v2, v3, v4, v5, v10);
    }
LABEL_6:
    uint64_t v8 = (PRContactAllowlist *)objc_alloc_init((Class)getPRContactAllowlistClass[0]());
    prResponder = self->_prResponder;
    self->_prResponder = v8;
  }
  if (self->_peersChanged)
  {
    self->_peersChanged = 0;
    [(CURangingSession *)self _updatePeers];
  }
}

- (void)_updateInitiator
{
  prRangingSession = self->_prRangingSession;
  if (!prRangingSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _updateInitiator]", 0x1Eu, (uint64_t)"PR ranging initiator start\n", v2, v3, v4, v5, v12);
    }
LABEL_6:
    uint64_t v9 = (PRSharingSession *)[objc_alloc((Class)getPRSharingSessionClass[0]()) initWithDelegate:self delegateQueue:self->_dispatchQueue];
    uint64_t v10 = self->_prRangingSession;
    self->_prRangingSession = v9;
  }
  if ((self->_flags & 1) == 0 && !self->_prRangingInitiated)
  {
    if (!prRangingSession) {
      goto LABEL_14;
    }
    uint64_t v11 = self->_ucat;
    if (v11->var0 > 30) {
      goto LABEL_14;
    }
    if (v11->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu)) {
        goto LABEL_14;
      }
      uint64_t v11 = self->_ucat;
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CURangingSession _updateInitiator]", 0x1Eu, (uint64_t)"PR ranging initiator restart\n", v2, v3, v4, v5, v12);
LABEL_14:
    [(PRSharingSession *)self->_prRangingSession startInitiating];
    self->_prRangingInitiated = 1;
  }
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    if (self->_flags) {
      [(CURangingSession *)self _updateResponder];
    }
    else {
      [(CURangingSession *)self _updateInitiator];
    }
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id measurementHandler = self->_measurementHandler;
    self->_id measurementHandler = 0;

    id measurementHandlerEx = self->_measurementHandlerEx;
    self->_id measurementHandlerEx = 0;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v15);
    }
  }
}

- (void)_invalidate
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_prRangingInitiated)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession _invalidate]", 0x1Eu, (uint64_t)"PR ranging initiator stop\n", v2, v3, v4, v5, v25);
    }
LABEL_6:
    [(PRSharingSession *)self->_prRangingSession stopInitiating];
    self->_prRangingInitiated = 0;
  }
  prRangingSession = self->_prRangingSession;
  self->_prRangingSession = 0;

  if (self->_prResponder)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = self->_peersRanging;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v10) {
      goto LABEL_21;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        v19 = [v14 contactKey];
        int v20 = self->_ucat;
        if (v20->var0 <= 30)
        {
          if (v20->var0 != -1) {
            goto LABEL_15;
          }
          if (_LogCategory_Initialize((uint64_t)v20, 0x1Eu))
          {
            int v20 = self->_ucat;
LABEL_15:
            LogPrintF((uint64_t)v20, (uint64_t)"-[CURangingSession _invalidate]", 0x1Eu, (uint64_t)"Responder remove peer on invalidate: %@\n", v15, v16, v17, v18, (uint64_t)v19);
          }
        }
        prResponder = self->_prResponder;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __31__CURangingSession__invalidate__block_invoke;
        v26[3] = &unk_1E55BEEA0;
        v26[4] = self;
        v26[5] = v19;
        [(PRContactAllowlist *)prResponder removeTrustedContact:v14 withCompletionHandler:v26];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v22 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v11 = v22;
      if (!v22)
      {
LABEL_21:

        v23 = self->_prResponder;
        self->_prResponder = 0;

        break;
      }
    }
  }
  peersRanging = self->_peersRanging;
  self->_peersRanging = 0;

  [(CURangingSession *)self _invalidated];
}

uint64_t __31__CURangingSession__invalidate__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = v5;
  if (!v5 && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(int *)v5 > 90) {
    goto LABEL_7;
  }
  uint64_t v12 = v10;
  if (*(_DWORD *)v5 != -1) {
    goto LABEL_5;
  }
  uint64_t v5 = _LogCategory_Initialize(v5, 0x5Au);
  uint64_t v10 = v12;
  if (v5)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
LABEL_5:
    uint64_t v5 = LogPrintF(v5, (uint64_t)"-[CURangingSession _invalidate]_block_invoke", 0x5Au, (uint64_t)"### Responder remove peer failed: %@, %{error}\n", v6, v7, v8, v9, *(void *)(a1 + 40));
    uint64_t v10 = v12;
  }
LABEL_7:
  return MEMORY[0x1F41817F8](v5, v10);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CURangingSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CURangingSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 9)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 9) = 1;
  uint64_t v10 = *(void **)(result + 32);
  uint64_t v11 = (int *)v10[6];
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void **)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = (int *)v10[6];
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CURangingSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
    uint64_t v10 = *(void **)(v9 + 32);
  }
LABEL_6:
  return [v10 _invalidate];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CURangingSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CURangingSession_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 48);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CURangingSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  *(unsigned char *)(v9 + 8) = 1;
  BOOL v12 = *(void **)(a1 + 32);
  return [v12 _update];
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CURangingSession_addSample___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __30__CURangingSession_addSample___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 48);
  if (*v9 <= 10)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v9, (uint64_t)"-[CURangingSession addSample:]_block_invoke", 0xAu, (uint64_t)"Add sample: %@\n", a5, a6, a7, a8, *(void *)(a1 + 40));
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v9, 0xAu))
    {
      uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 48);
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v10 = [*(id *)(a1 + 40) deviceAddress];
  if (v10)
  {
    BOOL v11 = [*(id *)(a1 + 40) deviceModel];
    if (!v11)
    {
LABEL_13:

      goto LABEL_14;
    }
    BOOL v12 = *(void **)(*(void *)(a1 + 32) + 40);
    double v13 = (double)(int)[*(id *)(a1 + 40) rawRSSI];
    uint64_t v14 = [*(id *)(a1 + 40) channel];
    id v22 = 0;
    char v15 = [v12 addRssiSample:v14 channel:v10 forPeer:v11 peerDeviceModel:&v22 withError:v13];
    id v20 = v22;
    if ((v15 & 1) == 0)
    {
      uint64_t v21 = *(int **)(*(void *)(a1 + 32) + 48);
      if (*v21 <= 90)
      {
        if (*v21 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v21, 0x5Au)) {
            goto LABEL_12;
          }
          uint64_t v21 = *(int **)(*(void *)(a1 + 32) + 48);
        }
        LogPrintF((uint64_t)v21, (uint64_t)"-[CURangingSession addSample:]_block_invoke", 0x5Au, (uint64_t)"### Add sample failed: %@, %{error}\n", v16, v17, v18, v19, *(void *)(a1 + 40));
      }
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
}

- (void)setPeers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  id v6 = self;
  objc_sync_enter(v6);
  peers = v6->_peers;
  id v8 = v5;
  uint64_t v9 = peers;
  if (v8 == v9)
  {

    goto LABEL_14;
  }
  uint64_t v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    char v11 = [(NSArray *)v8 isEqual:v9];

    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  ucat = v6->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v6->_ucat, 0x1Eu)) {
        goto LABEL_11;
      }
      ucat = v6->_ucat;
    }
    uint64_t v13 = [(NSArray *)v6->_peers count];
    [(NSArray *)v8 count];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CURangingSession setPeers:]", 0x1Eu, (uint64_t)"Update peers: %d -> %d total\n", v14, v15, v16, v17, v13);
  }
LABEL_11:
  objc_storeStrong((id *)&v6->_peers, v5);
  if (!v6->_peersChanged)
  {
    v6->_peersChanged = 1;
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__CURangingSession_setPeers___block_invoke;
      block[3] = &unk_1E55BFC18;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_14:
  objc_sync_exit(v6);
}

uint64_t __29__CURangingSession_setPeers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD3C8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CURangingSession;
  [(CURangingSession *)&v4 dealloc];
}

- (CURangingSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)CURangingSession;
  uint64_t v2 = [(CURangingSession *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURangingSession;
    uint64_t v3 = v2;
  }

  return v2;
}

@end