@interface _FEFocusMovementRequest
- (BOOL)allowsDeferral;
- (BOOL)allowsFocusingCurrentItem;
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (BOOL)isMovementRequest;
- (BOOL)overridesDeferredFocusUpdate;
- (BOOL)requiresEnvironmentValidation;
- (BOOL)requiresNextFocusedItem;
- (BOOL)shouldPerformHapticFeedback;
- (BOOL)shouldPlayFocusSound;
- (BOOL)shouldScrollIfNecessary;
- (_FEFocusInputDeviceInfo)inputDeviceInfo;
- (_FEFocusItemInfo)focusedItemInfo;
- (_FEFocusMovementInfo)movementInfo;
- (_FEFocusMovementRequest)fallbackRequest;
- (_FEFocusMovementRequest)init;
- (_FEFocusMovementRequest)initWithFocusSystem:(id)a3;
- (_FEFocusSearchInfo)searchInfo;
- (_FEFocusSystem)focusSystem;
- (id)_requestByRedirectingRequestToFocusSystem:(id)a3;
- (void)setFocusedItemInfo:(id)a3;
- (void)setInputDeviceInfo:(id)a3;
- (void)setMovementInfo:(id)a3;
- (void)setOverridesDeferredFocusUpdate:(BOOL)a3;
- (void)setSearchInfo:(id)a3;
- (void)setShouldPerformHapticFeedback:(BOOL)a3;
@end

@implementation _FEFocusMovementRequest

- (_FEFocusMovementRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusMovementRequest.m" lineNumber:18 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_FEFocusMovementRequest)initWithFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_FEFocusMovementRequest.m", 24, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusMovementRequest;
  v6 = [(_FEFocusMovementRequest *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_focusSystem, v5);
  }

  return v7;
}

- (id)_requestByRedirectingRequestToFocusSystem:(id)a3
{
  id v4 = a3;
  id v5 = [[_FEFocusMovementRequest alloc] initWithFocusSystem:v4];

  objc_storeStrong((id *)&v5->_movementInfo, self->_movementInfo);
  return v5;
}

- (_FEFocusItemInfo)focusedItemInfo
{
  focusedItemInfo = self->_focusedItemInfo;
  if (!focusedItemInfo)
  {
    id v4 = [(_FEFocusMovementRequest *)self focusSystem];
    id v5 = [v4 focusedItem];
    v6 = +[_FEFocusItemInfo infoWithItem:v5];
    v7 = self->_focusedItemInfo;
    self->_focusedItemInfo = v6;

    focusedItemInfo = self->_focusedItemInfo;
  }
  return focusedItemInfo;
}

- (_FEFocusMovementInfo)movementInfo
{
  movementInfo = self->_movementInfo;
  if (!movementInfo)
  {
    id v4 = +[_FEFocusMovementInfo _movementWithHeading:0 isInitial:1];
    id v5 = self->_movementInfo;
    self->_movementInfo = v4;

    movementInfo = self->_movementInfo;
  }
  return movementInfo;
}

- (_FEFocusSearchInfo)searchInfo
{
  searchInfo = self->_searchInfo;
  if (!searchInfo)
  {
    id v4 = +[_FEFocusSearchInfo defaultInfo];
    id v5 = self->_searchInfo;
    self->_searchInfo = v4;

    searchInfo = self->_searchInfo;
  }
  return searchInfo;
}

- (_FEFocusMovementRequest)fallbackRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  id v4 = [WeakRetained _hostFocusSystem];

  if (v4)
  {
    id v5 = [(_FEFocusMovementRequest *)self _requestByRedirectingRequestToFocusSystem:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (_FEFocusMovementRequest *)v5;
}

- (BOOL)isMovementRequest
{
  return 1;
}

- (BOOL)shouldScrollIfNecessary
{
  return 1;
}

- (BOOL)shouldPlayFocusSound
{
  return 1;
}

- (BOOL)requiresNextFocusedItem
{
  return 1;
}

- (BOOL)requiresEnvironmentValidation
{
  return 1;
}

- (BOOL)allowsFocusingCurrentItem
{
  return 0;
}

- (BOOL)allowsDeferral
{
  return 0;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return 0;
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (_FEFocusSystem *)WeakRetained;
}

- (BOOL)shouldPerformHapticFeedback
{
  return self->_shouldPerformHapticFeedback;
}

- (void)setShouldPerformHapticFeedback:(BOOL)a3
{
  self->_shouldPerformHapticFeedback = a3;
}

- (_FEFocusInputDeviceInfo)inputDeviceInfo
{
  return self->_inputDeviceInfo;
}

- (void)setInputDeviceInfo:(id)a3
{
}

- (void)setFocusedItemInfo:(id)a3
{
}

- (void)setMovementInfo:(id)a3
{
}

- (void)setSearchInfo:(id)a3
{
}

- (BOOL)overridesDeferredFocusUpdate
{
  return self->_overridesDeferredFocusUpdate;
}

- (void)setOverridesDeferredFocusUpdate:(BOOL)a3
{
  self->_overridesDeferredFocusUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_focusedItemInfo, 0);
  objc_storeStrong((id *)&self->_inputDeviceInfo, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end