@interface MRUListeningModeController
- (MRUHearingServiceController)hearingServiceController;
- (MRUListeningModeController)initWithOutputDeviceRouteController:(id)a3;
- (MRUListeningModeControllerDelegate)delegate;
- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController;
- (NSArray)availablePrimaryListeningModes;
- (NSArray)availableSecondaryListeningModes;
- (NSString)primaryListeningMode;
- (NSString)secondaryListeningMode;
- (id)listeningModeErrorMessageForOutputDevice:(id)a3;
- (id)sortedListeningModes:(id)a3 excludeModes:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHearingServiceController:(id)a3;
- (void)setListeningMode:(id)a3 forOutputDeviceRoute:(id)a4 previousListeningMode:(id)a5 completion:(id)a6;
- (void)setPrimaryListeningMode:(id)a3 completion:(id)a4;
- (void)setSecondaryListeningMode:(id)a3 completion:(id)a4;
- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3;
- (void)updatePrimaryListeningMode;
- (void)updateSecondaryListeningMode;
@end

@implementation MRUListeningModeController

- (NSArray)availableSecondaryListeningModes
{
  return self->_availableSecondaryListeningModes;
}

- (NSArray)availablePrimaryListeningModes
{
  return self->_availablePrimaryListeningModes;
}

- (MRUListeningModeController)initWithOutputDeviceRouteController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUListeningModeController;
  v6 = [(MRUListeningModeController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    [(MRUSystemOutputDeviceRouteController *)v7->_outputDeviceRouteController addObserver:v7];
    [(MRUListeningModeController *)v7 updatePrimaryListeningMode];
    [(MRUListeningModeController *)v7 updateSecondaryListeningMode];
  }

  return v7;
}

- (void)setHearingServiceController:(id)a3
{
  v4 = (MRUHearingServiceController *)a3;
  [(MRUHearingServiceController *)self->_hearingServiceController removeObserver:self];
  hearingServiceController = self->_hearingServiceController;
  self->_hearingServiceController = v4;
  v6 = v4;

  [(MRUHearingServiceController *)self->_hearingServiceController addObserver:self];

  [(MRUListeningModeController *)self updatePrimaryListeningMode];
}

- (void)setPrimaryListeningMode:(id)a3 completion:(id)a4
{
  id v6 = a4;
  outputDeviceRouteController = self->_outputDeviceRouteController;
  id v8 = a3;
  objc_super v9 = [(MRUSystemOutputDeviceRouteController *)outputDeviceRouteController primaryOutputDeviceRoute];
  primaryListeningMode = self->_primaryListeningMode;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__MRUListeningModeController_setPrimaryListeningMode_completion___block_invoke;
  v12[3] = &unk_1E5F0E6B0;
  id v13 = v6;
  id v11 = v6;
  [(MRUListeningModeController *)self setListeningMode:v8 forOutputDeviceRoute:v9 previousListeningMode:primaryListeningMode completion:v12];
}

uint64_t __65__MRUListeningModeController_setPrimaryListeningMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSecondaryListeningMode:(id)a3 completion:(id)a4
{
  id v6 = a4;
  outputDeviceRouteController = self->_outputDeviceRouteController;
  id v8 = a3;
  objc_super v9 = [(MRUSystemOutputDeviceRouteController *)outputDeviceRouteController secondaryOutputDeviceRoute];
  secondaryListeningMode = self->_secondaryListeningMode;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__MRUListeningModeController_setSecondaryListeningMode_completion___block_invoke;
  v12[3] = &unk_1E5F0E6B0;
  id v13 = v6;
  id v11 = v6;
  [(MRUListeningModeController *)self setListeningMode:v8 forOutputDeviceRoute:v9 previousListeningMode:secondaryListeningMode completion:v12];
}

uint64_t __67__MRUListeningModeController_setSecondaryListeningMode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3
{
  [(MRUListeningModeController *)self updatePrimaryListeningMode];

  [(MRUListeningModeController *)self updateSecondaryListeningMode];
}

- (void)setListeningMode:(id)a3 forOutputDeviceRoute:(id)a4 previousListeningMode:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 logicalLeaderOutputDevice];
  v15 = MCLogCategoryVolume();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = objc_opt_class();
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    v37 = v14;
    _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ set bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", buf, 0x2Au);
  }

  v16 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController systemRoute];
  v17 = [v16 endpoint];

  v18 = [v11 routeUID];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke;
  v24[3] = &unk_1E5F0E6D8;
  v24[4] = self;
  id v25 = v11;
  id v26 = v10;
  id v27 = v12;
  id v28 = v14;
  id v29 = v13;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  [v17 setListeningMode:v22 outputDeviceUID:v18 queue:MEMORY[0x1E4F14428] completion:v24];
}

void __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if ([v5 code] == -11910)
  {
    id v6 = [*(id *)(a1 + 32) listeningModeErrorMessageForOutputDevice:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = 0;
  }
  v7 = MCLogCategoryVolume();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ set bluetooth to listening mode completed: %{public}@ | %{public}@ | device: %{public}@ | error: %@", buf, 0x34u);
  }

  (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v3 == 0, v6);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v13 = v12;
  if (*(void *)(a1 + 56)) {
    v14 = *(__CFString **)(a1 + 56);
  }
  else {
    v14 = @"nil";
  }
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F77188]];
  if (*(void *)(a1 + 48)) {
    v15 = *(__CFString **)(a1 + 48);
  }
  else {
    v15 = @"nil";
  }
  [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F77178]];
  v16 = +[MRUSystemOutputDeviceRouteController outputContextDescription];
  [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F77180]];

  v18 = v13;
  id v17 = v13;
  MRAnalyticsSendEvent();
}

id __101__MRUListeningModeController_setListeningMode_forOutputDeviceRoute_previousListeningMode_completion___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updatePrimaryListeningMode
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  v4 = [v3 logicalLeaderOutputDevice];

  id v5 = [v4 currentBluetoothListeningMode];
  if ([(MRUHearingServiceController *)self->_hearingServiceController primaryListeningModeOffAllowed])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F15F50]];
  }
  v7 = [v4 availableBluetoothListeningModes];
  uint64_t v8 = [(MRUListeningModeController *)self sortedListeningModes:v7 excludeModes:v6];

  if ([v6 containsObject:v5])
  {
    uint64_t v9 = [v8 firstObject];

    id v5 = (void *)v9;
  }
  BOOL v10 = [(NSArray *)self->_availablePrimaryListeningModes isEqualToArray:v8];
  if (!v10)
  {
    uint64_t v11 = MCLogCategoryVolume();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      availablePrimaryListeningModes = self->_availablePrimaryListeningModes;
      int v19 = 138544130;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = availablePrimaryListeningModes;
      __int16 v25 = 2114;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ update available primary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    objc_storeStrong((id *)&self->_availablePrimaryListeningModes, v8);
  }
  BOOL v14 = [(NSString *)self->_primaryListeningMode isEqualToString:v5];
  if (!v14)
  {
    v15 = MCLogCategoryVolume();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      primaryListeningMode = self->_primaryListeningMode;
      int v19 = 138544130;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v5;
      __int16 v23 = 2114;
      uint64_t v24 = (NSArray *)primaryListeningMode;
      __int16 v25 = 2114;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ update primary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    objc_storeStrong((id *)&self->_primaryListeningMode, v5);
  }
  v18 = [(MRUListeningModeController *)self delegate];
  if (!v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 listeningModeController:self didChangeAvailablePrimaryListeningMode:v8];
  }
  if (!v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 listeningModeController:self didChangePrimaryListeningMode:v5];
  }
}

- (void)updateSecondaryListeningMode
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController secondaryOutputDeviceRoute];
  v4 = [v3 logicalLeaderOutputDevice];

  id v5 = [v4 currentBluetoothListeningMode];
  if ([(MRUHearingServiceController *)self->_hearingServiceController secondaryListeningModeOffAllowed])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F15F50]];
  }
  v7 = [v4 availableBluetoothListeningModes];
  uint64_t v8 = [(MRUListeningModeController *)self sortedListeningModes:v7 excludeModes:v6];

  if ([v6 containsObject:v5])
  {
    uint64_t v9 = [v8 firstObject];

    id v5 = (void *)v9;
  }
  BOOL v10 = [(NSArray *)self->_availableSecondaryListeningModes isEqualToArray:v8];
  if (!v10)
  {
    uint64_t v11 = MCLogCategoryVolume();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      availableSecondaryListeningModes = self->_availableSecondaryListeningModes;
      int v19 = 138544130;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = availableSecondaryListeningModes;
      __int16 v25 = 2114;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ update available secondary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    objc_storeStrong((id *)&self->_availableSecondaryListeningModes, v8);
  }
  BOOL v14 = [(NSString *)self->_secondaryListeningMode isEqualToString:v5];
  if (!v14)
  {
    v15 = MCLogCategoryVolume();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      secondaryListeningMode = self->_secondaryListeningMode;
      int v19 = 138544130;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v5;
      __int16 v23 = 2114;
      uint64_t v24 = (NSArray *)secondaryListeningMode;
      __int16 v25 = 2114;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ update secondary bluetooth to listening mode: %{public}@ | %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    objc_storeStrong((id *)&self->_secondaryListeningMode, v5);
  }
  v18 = [(MRUListeningModeController *)self delegate];
  if (!v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 listeningModeController:self didChangeAvailableSecondaryListeningModes:v8];
  }
  if (!v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 listeningModeController:self didChangeSecondaryListeningMode:v5];
  }
}

- (id)sortedListeningModes:(id)a3 excludeModes:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v8 = *MEMORY[0x1E4F15F50];
  if ([v6 containsObject:*MEMORY[0x1E4F15F50]]
    && ([v5 containsObject:v8] & 1) == 0)
  {
    [v7 addObject:v8];
  }
  uint64_t v9 = *MEMORY[0x1E4F15F40];
  if ([v6 containsObject:*MEMORY[0x1E4F15F40]]
    && ([v5 containsObject:v9] & 1) == 0)
  {
    [v7 addObject:v9];
  }
  uint64_t v10 = *MEMORY[0x1E4F15F48];
  if ([v6 containsObject:*MEMORY[0x1E4F15F48]]
    && ([v5 containsObject:v10] & 1) == 0)
  {
    [v7 addObject:v10];
  }
  uint64_t v11 = *MEMORY[0x1E4F15F38];
  if ([v6 containsObject:*MEMORY[0x1E4F15F38]]
    && ([v5 containsObject:v11] & 1) == 0)
  {
    [v7 addObject:v11];
  }

  return v7;
}

- (id)listeningModeErrorMessageForOutputDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isB515Route])
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessageB515];
  }
  else if ([v3 isB507Route])
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessageB507];
  }
  else if ([v3 isB494Route])
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessageB494];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 isB498Route])
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessageB498];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 isB607Route])
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessageB607];
  }
  else
  {
    uint64_t v4 = +[MRUStringsProvider listeningModeErrorMessage];
  }
  id v5 = (void *)v4;

  return v5;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUHearingServiceController)hearingServiceController
{
  return self->_hearingServiceController;
}

- (MRUListeningModeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUListeningModeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)primaryListeningMode
{
  return self->_primaryListeningMode;
}

- (NSString)secondaryListeningMode
{
  return self->_secondaryListeningMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryListeningMode, 0);
  objc_storeStrong((id *)&self->_availableSecondaryListeningModes, 0);
  objc_storeStrong((id *)&self->_primaryListeningMode, 0);
  objc_storeStrong((id *)&self->_availablePrimaryListeningModes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hearingServiceController, 0);

  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end