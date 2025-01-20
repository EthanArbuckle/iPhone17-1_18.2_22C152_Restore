@interface PKBaseCarCommandHandler
- (BOOL)_carKeyPass:(id)a3 correspondsToAllSpokenPhrase:(id)a4;
- (BOOL)_findExactMatchOnSpokenPhraseForCarPass:(id)a3 spokenPhrase:(id)a4 completion:(id)a5;
- (BOOL)isCarReadyForCommunication;
- (BOOL)isCurrentFunctionAlreadyInDesiredState:(int64_t)a3;
- (PKBaseCarCommandHandler)init;
- (PKBaseCarCommandHandler)initWithDelegate:(id)a3;
- (PKIntentHandlerDelegate)delegate;
- (id)_carKeyPassForUniqueIdentifier:(id)a3;
- (id)_getVehicleReport:(id)a3;
- (id)handleGetCurrentFunctionState;
- (int64_t)prepareCarWithResolvedCarName:(id)a3 toHandleDesiredFunctions:(id)a4;
- (void)_secureElementPassCorrespondingToPhrase:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handlePerformAction:(int64_t)a3 withDesiredStatus:(int64_t)a4 completion:(id)a5;
- (void)handleSetCurrentFunctionToDesiredStatus:(int64_t)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)resolveCarNameForSpokenString:(id)a3 withCompletion:(id)a4;
@end

@implementation PKBaseCarCommandHandler

- (PKBaseCarCommandHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKBaseCarCommandHandler;
  v2 = [(PKBaseCarCommandHandler *)&v9 init];
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.siri.CarCommands.intents.session", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (PKBaseCarCommandHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKBaseCarCommandHandler;
  v5 = [(PKBaseCarCommandHandler *)&v12 init];
  if (v5)
  {
    dispatch_queue_t v6 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v5->_paymentService;
    v5->_paymentService = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passkit.intents.session", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  [(PKBaseCarCommandHandler *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKBaseCarCommandHandler;
  [(PKBaseCarCommandHandler *)&v3 dealloc];
}

- (void)invalidate
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    trackedHandle = self->_trackedHandle;
    if (trackedHandle) {
      [(PKPaymentSessionHandle *)trackedHandle invalidateSession];
    }
  }
}

- (id)_carKeyPassForUniqueIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[PKPassLibrary sharedInstance];
  v5 = [v4 passWithUniqueID:v3];

  dispatch_queue_t v6 = [v5 secureElementPass];

  return v6;
}

- (id)_getVehicleReport:(id)a3
{
  id v3 = a3;
  id v20 = 0;
  id v4 = [(id)PKGetClassNFDigitalCarKeySession() vehicleReports:&v20];
  id v5 = v20;
  if (v5)
  {
    dispatch_queue_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_D3530, v6, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: failed to fetch vehicle report.", buf, 2u);
    }

    id v7 = 0;
  }
  else
  {
    *(void *)buf = 0;
    v15 = buf;
    uint64_t v16 = 0x3032000000;
    v17 = sub_34C4;
    v18 = sub_34D4;
    id v19 = 0;
    v8 = [v3 devicePrimaryPaymentApplication];
    dispatch_queue_t v9 = [v8 subcredentials];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_34DC;
    v11[3] = &unk_1A3BA0;
    v13 = buf;
    id v12 = v4;
    [v9 enumerateObjectsUsingBlock:v11];

    id v7 = *((id *)v15 + 5);
    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (void)_secureElementPassCorrespondingToPhrase:(id)a3 completion:(id)a4
{
  dispatch_queue_t v6 = (void (**)(id, uint64_t))a4;
  id v7 = a3;
  v8 = +[PKPassLibrary sharedInstance];
  dispatch_queue_t v9 = [v8 passesOfType:1];

  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = [v9 count];
    _os_log_impl(&def_D3530, v10, OS_LOG_TYPE_DEFAULT, "Number of secureElementPasses %lu", (uint8_t *)&v15, 0xCu);
  }

  v11 = objc_msgSend(v9, "pk_objectsPassingTest:", &stru_1A3BE0);
  id v12 = [v7 spokenPhrase];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl(&def_D3530, v10, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Spoken Phrase: %@", (uint8_t *)&v15, 0xCu);
  }

  if (![(PKBaseCarCommandHandler *)self _findExactMatchOnSpokenPhraseForCarPass:v9 spokenPhrase:v12 completion:v6])
  {
    if (v12)
    {
      uint64_t v13 = +[NSSet set];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&def_D3530, v10, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Getting a generic request for carName. Returning all carKeyPasses", (uint8_t *)&v15, 2u);
      }

      uint64_t v13 = +[NSSet setWithArray:v11];
    }
    v14 = (void *)v13;
    v6[2](v6, v13);
  }
}

- (BOOL)_findExactMatchOnSpokenPhraseForCarPass:(id)a3 spokenPhrase:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (v9)
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_3944;
    v21 = &unk_1A3C08;
    v22 = self;
    id v23 = v9;
    v11 = objc_msgSend(v8, "pk_objectsPassingTest:", &v18);
    id v12 = objc_msgSend(v11, "count", v18, v19, v20, v21, v22);
    BOOL v13 = v12 != 0;
    if (v12)
    {
      v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v11 count];
        *(_DWORD *)buf = 134217984;
        id v25 = v15;
        _os_log_impl(&def_D3530, v14, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Found %lu exact match(es).", buf, 0xCu);
      }

      id v16 = +[NSSet setWithArray:v11];
      v10[2](v10, v16);
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_carKeyPass:(id)a3 correspondsToAllSpokenPhrase:(id)a4
{
  id v5 = a3;
  dispatch_queue_t v6 = [a4 lowercaseString];
  id v7 = +[NSCharacterSet whitespaceCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

  id v9 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  v11 = [v5 localizedDescription];
  id v12 = [v11 lowercaseString];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        if (!objc_msgSend(v12, "containsString:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20))
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (void)resolveCarNameForSpokenString:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3BCC;
  v8[3] = &unk_1A3C70;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(PKBaseCarCommandHandler *)self _secureElementPassCorrespondingToPhrase:v7 completion:v8];
}

- (int64_t)prepareCarWithResolvedCarName:(id)a3 toHandleDesiredFunctions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  currentFunction = self->_currentFunction;
  self->_currentFunction = 0;

  currentFunctionStatus = self->_currentFunctionStatus;
  self->_currentFunctionStatus = 0;

  currentCarKeyPass = self->_currentCarKeyPass;
  self->_currentCarKeyPass = 0;

  v11 = [v6 vocabularyIdentifier];
  id v12 = [(PKBaseCarCommandHandler *)self _carKeyPassForUniqueIdentifier:v11];
  if (v12)
  {
    objc_storeStrong((id *)&self->_currentCarKeyPass, v12);
    v40 = v12;
    id v13 = [(PKBaseCarCommandHandler *)self _getVehicleReport:v12];
    id v14 = PKLogFacilityTypeGetObject();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        int64_t v25 = 2;
        _os_log_impl(&def_D3530, v14, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: No vehicle report. This means that the car is not a BT-enabled car and it doesn't support RKE", buf, 2u);
        long long v20 = 0;
      }
      else
      {
        long long v20 = 0;
        int64_t v25 = 2;
      }
      v27 = v14;
      goto LABEL_40;
    }
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_D3530, v14, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Retrieved vehicle report. Retrieving function.", buf, 2u);
    }
    v39 = v11;
    id v37 = v6;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v7;
    uint64_t v16 = v7;
    id v17 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
    oslog = v14;
    if (v17)
    {
      id v18 = v17;
      char v19 = 0;
      long long v20 = 0;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v16);
          }
          long long v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v13 isRKEFunctionSupported:v23])
          {
            v24 = v23;

            char v19 = 1;
            long long v20 = v24;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v18);
    }
    else
    {
      char v19 = 0;
      long long v20 = 0;
    }

    v26 = [v40 supportedSiriIntents];
    v27 = [v26 supportedCarKeyIntents];

    if ((v19 & 1) != 0 && v27 && ([v27 containsObject:v20] & 1) == 0)
    {
      p_super = oslog;
      v11 = v39;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v20;
        v34 = "PKBaseCarCommandHandler: Function (%@) not an approved and supported intent";
        goto LABEL_37;
      }
    }
    else
    {
      p_super = oslog;
      BOOL v29 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
      v11 = v39;
      if (v19)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&def_D3530, oslog, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Retrieved function. Retrieving function status.", buf, 2u);
        }

        v30 = [v13 getStatusForRKEFunction:v20];
        BOOL v31 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        id v7 = v36;
        id v6 = v37;
        if (v30)
        {
          if (v31)
          {
            *(_DWORD *)buf = 138412546;
            v46 = v20;
            __int16 v47 = 2112;
            v48 = v30;
            _os_log_impl(&def_D3530, oslog, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Successfully retrieved function (%@). Status is (%@)", buf, 0x16u);
          }

          objc_storeStrong((id *)&self->_currentFunction, v20);
          v32 = self->_currentFunctionStatus;
          self->_currentFunctionStatus = v30;
          v33 = v30;

          p_super = &v33->super.super;
          int64_t v25 = 3;
        }
        else
        {
          if (v31)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&def_D3530, oslog, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Unable to retrieve function status. Car likely not connected.", buf, 2u);
          }
          int64_t v25 = 1;
        }
        goto LABEL_39;
      }
      if (v29)
      {
        *(_DWORD *)buf = 138412290;
        v46 = v16;
        v34 = "PKBaseCarCommandHandler: No supported functions matching %@.";
LABEL_37:
        _os_log_impl(&def_D3530, p_super, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
      }
    }
    int64_t v25 = 2;
    id v7 = v36;
    id v6 = v37;
LABEL_39:

LABEL_40:
    id v12 = v40;
    goto LABEL_41;
  }
  long long v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_D3530, v20, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: No car was specified. Either we have no cars stored, or this is an error and we failed to set the identifier.", buf, 2u);
  }
  int64_t v25 = 0;
LABEL_41:

  return v25;
}

- (id)handleGetCurrentFunctionState
{
  if (self->_currentCarKeyPass
    && self->_currentFunction
    && (currentFunctionStatus = self->_currentFunctionStatus) != 0)
  {
    id v3 = currentFunctionStatus;
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&def_D3530, v4, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: No car was specified, or we unable to retrieve the function and function status. Either we have no cars stored, or this is an error and we failed to set the identifier.", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (BOOL)isCarReadyForCommunication
{
  if (self->_currentCarKeyPass && self->_currentFunction && self->_currentFunctionStatus) {
    return 1;
  }
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&def_D3530, v3, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: No car was specified, or we were unable to retrieve the function and function status. Either we have no cars stored, or this is an error and we failed to set the identifier.", v4, 2u);
  }

  return 0;
}

- (BOOL)isCurrentFunctionAlreadyInDesiredState:(int64_t)a3
{
  NSInteger v4 = [(NSNumber *)self->_currentFunctionStatus integerValue];
  if (v4 == a3)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&def_D3530, v5, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Function all ready in desired state.", v7, 2u);
    }
  }
  return v4 == a3;
}

- (void)handlePerformAction:(int64_t)a3 withDesiredStatus:(int64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t))a5;
  if ([(PKBaseCarCommandHandler *)self isCarReadyForCommunication])
  {
    if ([(PKBaseCarCommandHandler *)self isCurrentFunctionAlreadyInDesiredState:a4])
    {
      v8[2](v8, 1);
    }
    else
    {
      id v9 = +[NSNumber numberWithInteger:a3];
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        currentFunction = self->_currentFunction;
        id v12 = [(PKSecureElementPass *)self->_currentCarKeyPass uniqueID];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = currentFunction;
        *(_WORD *)&buf[22] = 2112;
        v49 = v12;
        _os_log_impl(&def_D3530, v10, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Sending action (%@) to function (%@) on car (%@).", buf, 0x20u);
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_4AD4;
      v46[3] = &unk_1A3CC0;
      __int16 v47 = v8;
      id v13 = objc_retainBlock(v46);
      objc_initWeak(&location, self);
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v49 = sub_34C4;
      v50 = sub_34D4;
      v51 = self->_currentCarKeyPass;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x3032000000;
      v43[3] = sub_34C4;
      v43[4] = sub_34D4;
      long long v44 = self->_currentFunction;
      uint64_t v39 = 0;
      v40 = (atomic_uchar *)&v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 1;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      id v36 = sub_34C4;
      id v37 = sub_34D4;
      id v38 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_4BF8;
      v25[3] = &unk_1A3D38;
      objc_copyWeak(&v32, &location);
      id v14 = v13;
      id v27 = v14;
      v28 = &v39;
      BOOL v29 = &v33;
      v30 = buf;
      BOOL v31 = v43;
      id v15 = v9;
      id v26 = v15;
      uint64_t v16 = +[PKPaymentSession startDigitalCarKeySessionWithCompletion:v25];
      if (v16)
      {
        int v17 = 1;
        atomic_compare_exchange_strong(v40 + 24, (unsigned __int8 *)&v17, 0);
        if (v17 == 1)
        {
          objc_storeStrong((id *)&self->_trackedHandle, v16);
          dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
          char v19 = (void *)v34[5];
          v34[5] = (uint64_t)v18;

          long long v20 = v34[5];
          dispatch_time_t v21 = dispatch_time(0, 10000000000);
          dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
          long long v22 = v34[5];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_4F48;
          v23[3] = &unk_1A3D60;
          objc_copyWeak(&v24, &location);
          dispatch_source_set_event_handler(v22, v23);
          dispatch_resume((dispatch_object_t)v34[5]);
          objc_destroyWeak(&v24);
        }
      }

      objc_destroyWeak(&v32);
      _Block_object_dispose(&v33, 8);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v43, 8);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)handleSetCurrentFunctionToDesiredStatus:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  if (self->_currentCarKeyPass && (id v7 = self->_currentFunction) != 0 && self->_currentFunctionStatus)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&def_D3530, v8, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Requesting to set function (%@) to state (%li)", buf, 0x16u);
    }

    unint64_t v9 = [(NSNumber *)self->_currentFunctionStatus integerValue];
    if (v9 == a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_D3530, v8, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Function all ready in desired state.", buf, 2u);
      }

      v6[2](v6, 1);
    }
    else if (self->_currentFunction && self->_currentCarKeyPass)
    {
      if (v9 > 4) {
        v11 = 0;
      }
      else {
        v11 = off_1A3D80[v9];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        currentFunction = self->_currentFunction;
        id v13 = [(PKSecureElementPass *)self->_currentCarKeyPass uniqueID];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = currentFunction;
        *(_WORD *)&buf[22] = 2112;
        v49 = v13;
        _os_log_impl(&def_D3530, v8, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Sending action (%@) to function (%@) on car (%@).", buf, 0x20u);
      }
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_5618;
      v46[3] = &unk_1A3CC0;
      __int16 v47 = v6;
      id v14 = objc_retainBlock(v46);
      objc_initWeak(&location, self);
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v49 = sub_34C4;
      v50 = sub_34D4;
      v51 = self->_currentCarKeyPass;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x3032000000;
      v43[3] = sub_34C4;
      v43[4] = sub_34D4;
      long long v44 = self->_currentFunction;
      uint64_t v39 = 0;
      v40 = (atomic_uchar *)&v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 1;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      id v36 = sub_34C4;
      id v37 = sub_34D4;
      id v38 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_573C;
      v25[3] = &unk_1A3D38;
      objc_copyWeak(&v32, &location);
      id v15 = v14;
      v28 = &v39;
      BOOL v29 = &v33;
      v30 = buf;
      BOOL v31 = v43;
      id v26 = v11;
      id v27 = v15;
      uint64_t v16 = +[PKPaymentSession startDigitalCarKeySessionWithCompletion:v25];
      if (v16)
      {
        int v17 = 1;
        atomic_compare_exchange_strong(v40 + 24, (unsigned __int8 *)&v17, 0);
        if (v17 == 1)
        {
          objc_storeStrong((id *)&self->_trackedHandle, v16);
          dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
          char v19 = (void *)v34[5];
          v34[5] = (uint64_t)v18;

          long long v20 = v34[5];
          dispatch_time_t v21 = dispatch_time(0, 10000000000);
          dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
          long long v22 = v34[5];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_5A8C;
          v23[3] = &unk_1A3D60;
          objc_copyWeak(&v24, &location);
          dispatch_source_set_event_handler(v22, v23);
          dispatch_resume((dispatch_object_t)v34[5]);
          objc_destroyWeak(&v24);
        }
      }

      objc_destroyWeak(&v32);
      _Block_object_dispose(&v33, 8);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v43, 8);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&location);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_D3530, v8, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: Not NearField linkable or we're missing vital information, cannot send action.", buf, 2u);
      }

      v6[2](v6, 0);
    }
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_D3530, v10, OS_LOG_TYPE_DEFAULT, "PKBaseCarCommandHandler: No car was specified, or we were unable to retrieve the function and function status. Either we have no cars stored, or this is an error and we failed to set the identifier.", buf, 2u);
    }

    v6[2](v6, 0);
  }
}

- (PKIntentHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKIntentHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentFunctionStatus, 0);
  objc_storeStrong((id *)&self->_currentFunction, 0);
  objc_storeStrong((id *)&self->_currentCarKeyPass, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_trackedHandle, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end