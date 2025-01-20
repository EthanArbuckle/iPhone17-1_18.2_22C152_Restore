@interface HSAccessoryPairingFuture
- (HFSetupPairingContext)pairingContext;
- (HFSetupPairingController)pairingController;
- (HFSetupPairingObserver)pairingObserver;
- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 accessoryAlreadyStaged:(BOOL)a4;
- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4;
- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4 accessoryAlreadyStaged:(BOOL)a5;
- (NAPromise)promise;
- (NSString)pairingStatusDescription;
- (NSString)pairingStatusTitle;
- (id)cancelPairing;
- (id)cancelPairingWithError:(id)a3;
- (id)startPairingWithHome:(id)a3;
- (unint64_t)phase;
- (void)dealloc;
- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6;
- (void)setPairingContext:(id)a3;
- (void)setPairingController:(id)a3;
- (void)setPairingObserver:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPromise:(id)a3;
- (void)updateSetupPayload:(id)a3;
@end

@implementation HSAccessoryPairingFuture

- (void)dealloc
{
  v3 = [(HSAccessoryPairingFuture *)self pairingController];
  [v3 removePairingObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HSAccessoryPairingFuture;
  [(HSAccessoryPairingFuture *)&v4 dealloc];
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4
{
  return [(HSAccessoryPairingFuture *)self initWithPairingContext:a3 discoveredAccessory:a4 accessoryAlreadyStaged:0];
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 accessoryAlreadyStaged:(BOOL)a4
{
  return [(HSAccessoryPairingFuture *)self initWithPairingContext:a3 discoveredAccessory:0 accessoryAlreadyStaged:1];
}

- (HSAccessoryPairingFuture)initWithPairingContext:(id)a3 discoveredAccessory:(id)a4 accessoryAlreadyStaged:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HSAccessoryPairingFuture;
  v11 = [(HSAccessoryPairingFuture *)&v36 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v11->_pairingContext, a3);
  v12->_phase = 0;
  v13 = (NAPromise *)objc_alloc_init((Class)NAPromise);
  promise = v12->_promise;
  v12->_promise = v13;

  if (v5)
  {
    v15 = (objc_class *)HFSetupStagedAccessoryPairingController;
LABEL_7:
    id v19 = [v15 alloc];
    v17 = [(HSAccessoryPairingFuture *)v12 pairingContext];
    id v18 = [v19 initWithContext:v17];
    goto LABEL_8;
  }
  if (!v10)
  {
    v15 = (objc_class *)HFSetupAutomaticDiscoveryPairingController;
    goto LABEL_7;
  }
  id v16 = objc_alloc((Class)HFSetupSingleAccessoryPairingController);
  v17 = [(HSAccessoryPairingFuture *)v12 pairingContext];
  id v18 = [v16 initWithContext:v17 discoveredAccessory:v10];
LABEL_8:
  v20 = v18;

  v21 = [(HSAccessoryPairingFuture *)v12 pairingContext];
  v22 = [v21 setupAccessoryDescription];
  v23 = [v22 setupAccessoryPayload];

  if (v23)
  {
    id v24 = objc_alloc((Class)HFSetupAccessoryResult);
    v25 = [(HSAccessoryPairingFuture *)v12 pairingContext];
    v26 = [v25 setupAccessoryDescription];
    v27 = [v26 setupAccessoryPayload];
    id v28 = [v24 initWithPayload:v27];
    [v20 setSetupResult:v28];

    v29 = [v20 setupResult];
    v30 = [v29 error];

    if (v30)
    {
      v31 = HFLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10006915C((uint64_t)v30, v31);
      }

      [(NAPromise *)v12->_promise finishWithError:v30];
    }
  }
  [v20 addPairingObserver:v12];
  pairingController = v12->_pairingController;
  v12->_pairingController = (HFSetupPairingController *)v20;

  v33 = HFLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(HSAccessoryPairingFuture *)v12 pairingContext];
    *(_DWORD *)buf = 138412290;
    v38 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "HSAccessoryPairingFuture initialized: %@", buf, 0xCu);
  }
LABEL_17:

  return v12;
}

- (id)startPairingWithHome:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HSAccessoryPairingFuture *)self promise];
  v6 = [v5 future];
  unsigned int v7 = [v6 isFinished];

  if (v7)
  {
    v8 = [(HSAccessoryPairingFuture *)self promise];
    id v9 = [v8 future];
  }
  else
  {
    v8 = [(HSAccessoryPairingFuture *)self cancelPairing];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006132C;
    v11[3] = &unk_1000A9840;
    v11[4] = self;
    id v12 = v4;
    id v9 = [v8 flatMap:v11];
  }

  return v9;
}

- (id)cancelPairing
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HSAccessoryPairingFuture *)self pairingController];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing controller cancelled: %@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v5 = [(HSAccessoryPairingFuture *)self pairingController];
  v6 = [v5 cancel];

  return v6;
}

- (id)cancelPairingWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    unsigned int v7 = NSStringFromClass(v6);
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-[%@ cancelPairingWithError:%@]", (uint8_t *)&v17, 0x16u);
  }
  int v8 = [(HSAccessoryPairingFuture *)self pairingController];
  id v9 = [v8 discoveredAccessoryToPair];

  [v9 updateStatus:3 error:v4];
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000691E8(self, (uint64_t)v4, v10);
  }

  v11 = +[NSError hf_mappedHMError:v4];
  id v12 = [(HSAccessoryPairingFuture *)self pairingController];
  v13 = [v12 context];
  v14 = [v13 setupAccessoryDescription];
  [v14 setCancellationReason:v11];

  v15 = [(HSAccessoryPairingFuture *)self cancelPairing];

  return v15;
}

- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = [(HSAccessoryPairingFuture *)self phase];
  [(HSAccessoryPairingFuture *)self setPhase:a4];
  v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:v13];
    id v16 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a4];
    int v25 = 138413314;
    v26 = v15;
    __int16 v27 = 2048;
    unint64_t v28 = v13;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Prox Card Pairing Phase Transition %@ (%ld) -> %@ (%ld) | statusTitle: %@", (uint8_t *)&v25, 0x34u);
  }
  if (v13 != a4)
  {
    if (a4 == 9)
    {
      __int16 v19 = [v10 discoveredAccessoryToPair];
      id v20 = [v19 error];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = +[NSError na_genericError];
      }
      int v17 = v22;

      id v18 = [(HSAccessoryPairingFuture *)self promise];
      [v18 finishWithError:v17];
    }
    else
    {
      if (a4 != 10) {
        goto LABEL_12;
      }
      int v17 = [(HSAccessoryPairingFuture *)self promise];
      id v18 = [v10 pairedAccessories];
      [v17 finishWithResult:v18];
    }
  }
LABEL_12:
  v23 = [(HSAccessoryPairingFuture *)self pairingObserver];

  if (v23)
  {
    id v24 = [(HSAccessoryPairingFuture *)self pairingObserver];
    [v24 pairingController:v10 didTransitionToPhase:a4 statusTitle:v11 statusDescription:v12];
  }
}

- (NSString)pairingStatusTitle
{
  v2 = [(HSAccessoryPairingFuture *)self pairingController];
  v3 = [v2 statusTitle];

  return (NSString *)v3;
}

- (NSString)pairingStatusDescription
{
  v2 = [(HSAccessoryPairingFuture *)self pairingController];
  v3 = [v2 statusDescription];

  return (NSString *)v3;
}

- (void)updateSetupPayload:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)HFSetupAccessoryResult) initWithPayload:v4];

  BOOL v5 = [(HSAccessoryPairingFuture *)self pairingController];
  [v5 setSetupResult:v6];
}

- (HFSetupPairingObserver)pairingObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingObserver);

  return (HFSetupPairingObserver *)WeakRetained;
}

- (void)setPairingObserver:(id)a3
{
}

- (NAPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (HFSetupPairingController)pairingController
{
  return self->_pairingController;
}

- (void)setPairingController:(id)a3
{
}

- (HFSetupPairingContext)pairingContext
{
  return self->_pairingContext;
}

- (void)setPairingContext:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingContext, 0);
  objc_storeStrong((id *)&self->_pairingController, 0);
  objc_storeStrong((id *)&self->_promise, 0);

  objc_destroyWeak((id *)&self->_pairingObserver);
}

@end