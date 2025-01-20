@interface FCUIFocusEnablementIndicatorSystemApertureManager
+ (id)managerWithSystemApertureElementRegistrar:(id)a3;
- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4;
- (id)_initWithSystemApertureElementRegistrar:(id)a3;
- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6;
- (void)postActivity:(id)a3 enabled:(BOOL)a4;
- (void)revokeWithReason:(id)a3;
@end

@implementation FCUIFocusEnablementIndicatorSystemApertureManager

+ (id)managerWithSystemApertureElementRegistrar:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSystemApertureElementRegistrar:v3];

  return v4;
}

- (id)_initWithSystemApertureElementRegistrar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIFocusEnablementIndicatorSystemApertureManager;
  v6 = [(FCUIFocusEnablementIndicatorManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elementRegistrar, a3);
  }

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registeredPersistentElementAssertion);
  if ([WeakRetained isValid])
  {
    id v9 = objc_loadWeakRetained((id *)&self->_lastPresentedPersistentElement);

    if (v9)
    {
      if (!v6
        || ([v9 activityDescription],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v6 isEqual:v10],
            v10,
            v11))
      {
        [v9 setActivityEnabled:v6 != 0];
        BOOL v12 = 1;
        goto LABEL_15;
      }
    }
  }
  else
  {

    id v9 = 0;
  }
  if ([(SAInvalidatable *)self->_registeredElementAssertion isValid])
  {
    id v13 = objc_loadWeakRetained((id *)&self->_lastPresentedElement);
    if (v13 && (!v6 || [v6 isEqual:v7]))
    {
      [v13 setActivityEnabled:v6 != 0];
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
    id v13 = 0;
  }

LABEL_15:
  return v12;
}

- (void)revokeWithReason:(id)a3
{
  id v4 = a3;
  if ([(SAInvalidatable *)self->_registeredElementAssertion isValid]) {
    [(SAInvalidatable *)self->_registeredElementAssertion invalidateWithReason:v4];
  }
}

- (void)postActivity:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[FCUIFocusEnablementIndicatorSystemApertureElement alloc] initWithActivityDescription:v6 enabled:v4];
  v8 = [(SAElementRegistering *)self->_elementRegistrar registerElement:v7];
  registeredElementAssertion = self->_registeredElementAssertion;
  self->_registeredElementAssertion = v8;

  objc_initWeak(&location, self);
  v10 = self->_registeredElementAssertion;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__FCUIFocusEnablementIndicatorSystemApertureManager_postActivity_enabled___block_invoke;
  v11[3] = &unk_264542DA0;
  objc_copyWeak(&v12, &location);
  [(SAInvalidatable *)v10 addInvalidationBlock:v11];
  objc_storeWeak((id *)&self->_lastPresentedElement, v7);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __74__FCUIFocusEnablementIndicatorSystemApertureManager_postActivity_enabled___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained && WeakRetained[6] == v5)
  {
    WeakRetained[6] = 0;

    objc_storeWeak(v4 + 7, 0);
  }
}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registeredPersistentElementAssertion);
  if ([WeakRetained isValid])
  {
    id v13 = objc_loadWeakRetained((id *)&self->_lastPresentedPersistentElement);
    v14 = [v13 activityDescription];
    int v15 = [v14 isEqual:v10];

    if (v15)
    {
      id v16 = WeakRetained;
      goto LABEL_16;
    }
    [WeakRetained invalidateWithReason:@"Activity changed"];
  }
  if (v11)
  {
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v18 = 0;
        goto LABEL_15;
      }
      v17 = [v11 createPersistentFocusPickerElementForActivityDescription:v10 enabled:v8];
    }
    else
    {
      v17 = [v11 createPersistentFocusElementForActivityDescription:v10 enabled:v8];
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    v17 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)[FCUIFocusEnablementIndicatorSystemApertureActivityElement alloc] initWithActivityDescription:v10 enabled:v8];
    goto LABEL_14;
  }
  v18 = 0;
  if (objc_opt_respondsToSelector())
  {
    v17 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)[FCUIFocusEnablementIndicatorSystemApertureActivityElement alloc] initForPickerWithActivityDescription:v10 enabled:v8];
LABEL_14:
    v18 = v17;
  }
LABEL_15:
  objc_storeWeak((id *)&self->_lastPresentedPersistentElement, v18);
  id v16 = [(SAElementRegistering *)self->_elementRegistrar registerElement:v18];
  objc_storeWeak((id *)&self->_registeredPersistentElementAssertion, v16);
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __133__FCUIFocusEnablementIndicatorSystemApertureManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke;
  v20[3] = &unk_264542DA0;
  objc_copyWeak(&v21, &location);
  [v16 addInvalidationBlock:v20];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

LABEL_16:
  return v16;
}

void __133__FCUIFocusEnablementIndicatorSystemApertureManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 8);

    if (v5 == v6)
    {
      objc_storeWeak(v4 + 8, 0);
      objc_storeWeak(v4 + 9, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastPresentedPersistentElement);
  objc_destroyWeak((id *)&self->_registeredPersistentElementAssertion);
  objc_destroyWeak((id *)&self->_lastPresentedElement);
  objc_storeStrong((id *)&self->_registeredElementAssertion, 0);
  objc_destroyWeak((id *)&self->_elementProvider);
  objc_storeStrong((id *)&self->_elementRegistrar, 0);
}

@end