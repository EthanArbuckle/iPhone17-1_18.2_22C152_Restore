@interface _FEFocusUpdateRequest
+ (id)requestForRemovingFocusInFocusSystem:(id)a3;
- (BOOL)allowsDeferral;
- (BOOL)allowsFocusingCurrentItem;
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (BOOL)canMergeWithRequest:(id)a3;
- (BOOL)isFocusRemovalRequest;
- (BOOL)isMovementRequest;
- (BOOL)isValidInFocusSystem:(id)a3;
- (BOOL)requiresEnvironmentValidation;
- (BOOL)requiresNextFocusedItem;
- (BOOL)resetsUpdateThrottle;
- (BOOL)shouldPerformHapticFeedback;
- (BOOL)shouldPlayFocusSound;
- (BOOL)shouldScrollIfNecessary;
- (_FEFocusEnvironment)destinationEnvironment;
- (_FEFocusEnvironment)environment;
- (_FEFocusInputDeviceInfo)inputDeviceInfo;
- (_FEFocusSystem)focusSystem;
- (_FEFocusUpdateRequest)init;
- (_FEFocusUpdateRequest)initWithEnvironment:(id)a3;
- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4;
- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestByMergingWithRequest:(id)a3;
- (id)requestByRedirectingRequestToEnvironment:(id)a3;
- (id)requestByRedirectingRequestToNextContainerEnvironment;
- (void)cacheCurrentFocusSystem;
- (void)setAllowsDeferral:(BOOL)a3;
- (void)setAllowsFocusingCurrentItem:(BOOL)a3;
- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3;
- (void)setResetsUpdateThrottle:(BOOL)a3;
- (void)setScrollIfNecessary:(BOOL)a3;
- (void)setShouldPlayFocusSound:(BOOL)a3;
@end

@implementation _FEFocusUpdateRequest

- (_FEFocusUpdateRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusUpdateRequest.m" lineNumber:27 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_FEFocusUpdateRequest)initWithEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 33, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusUpdateRequest;
  v6 = [(_FEFocusUpdateRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_focusSystem, 0);
    objc_storeWeak((id *)&v7->_environment, v5);
    objc_storeWeak((id *)&v7->_destinationEnvironment, v5);
    v7->_allowsDeferral = 1;
    v7->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v7;
}

- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 46, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 47, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)_FEFocusUpdateRequest;
  objc_super v10 = [(_FEFocusUpdateRequest *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_focusSystem, v7);
    objc_storeWeak((id *)&v11->_environment, v9);
    objc_storeWeak((id *)&v11->_destinationEnvironment, v9);
    v11->_allowsDeferral = 1;
    v11->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v11;
}

- (_FEFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    objc_super v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 60, @"Invalid parameter not satisfying: %@", @"destinationEnvironment" object file lineNumber description];
  }
  if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v10, v11))
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = v11;
    if (v11)
    {
      v18 = NSString;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
    }
    else
    {
      v21 = @"(nil)";
    }

    id v22 = v10;
    if (v22)
    {
      v23 = NSString;
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
    }
    else
    {
      v26 = @"(nil)";
    }

    [v16 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 61, @"Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@", v21, v26 object file lineNumber description];
  }
  v12 = [(_FEFocusUpdateRequest *)self initWithFocusSystem:v9 environment:v10];
  v13 = v12;
  if (v12) {
    objc_storeWeak((id *)&v12->_destinationEnvironment, v11);
  }

  return v13;
}

+ (id)requestForRemovingFocusInFocusSystem:(id)a3
{
  id v3 = a3;
  v4 = [[_FEFocusUpdateRequest alloc] initWithFocusSystem:v3 environment:v3];

  v4->_isFocusRemovalRequest = 1;
  v4->_allowsFocusingCurrentItem = 1;
  return v4;
}

- (id)requestByRedirectingRequestToEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = (id *)[(_FEFocusUpdateRequest *)self copy];
  objc_storeWeak(v5 + 4, v4);
  objc_storeWeak(v5 + 2, v4);

  objc_storeWeak(v5 + 3, 0);
  return v5;
}

- (id)requestByRedirectingRequestToNextContainerEnvironment
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78___FEFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke;
  v6[3] = &unk_265328298;
  v6[4] = self;
  v6[5] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);

  if (v8[5])
  {
    id v4 = -[_FEFocusUpdateRequest requestByRedirectingRequestToEnvironment:](self, "requestByRedirectingRequestToEnvironment:");
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v6 = [v4 initWithEnvironment:WeakRetained];

  id v7 = objc_loadWeakRetained((id *)&self->_focusSystem);
  objc_storeWeak((id *)(v6 + 24), v7);

  id v8 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  objc_storeWeak((id *)(v6 + 16), v8);

  *(unsigned char *)(v6 + 10) = self->_isFocusRemovalRequest;
  *(unsigned char *)(v6 + 11) = self->_shouldPlayFocusSound;
  *(unsigned char *)(v6 + 12) = self->_allowsFocusingCurrentItem;
  *(unsigned char *)(v6 + 9) = self->_allowsDeferral;
  *(unsigned char *)(v6 + 8) = self->_scrollIfNecessary;
  *(unsigned char *)(v6 + 13) = self->_allowsOverridingPreferedFocusEnvironments;
  *(unsigned char *)(v6 + 14) = self->_resetsUpdateThrottle;
  return (id)v6;
}

- (BOOL)canMergeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(_FEFocusUpdateRequest *)self focusSystem];
  uint64_t v6 = [v4 focusSystem];
  id v7 = (void *)v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v10 = v8 || v5 == (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (WeakRetained)
  {
    id v12 = [v4 destinationEnvironment];
    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
      id v14 = [v4 destinationEnvironment];
      BOOL v15 = v13 == v14;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  if (v10)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_environment);
    id v17 = [v4 environment];
    if (v16 == v17 && v15)
    {
      int isFocusRemovalRequest = self->_isFocusRemovalRequest;
      BOOL v20 = isFocusRemovalRequest == [v4 isFocusRemovalRequest];
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)requestByMergingWithRequest:(id)a3
{
  id v4 = (id *)a3;
  if (![(_FEFocusUpdateRequest *)self canMergeWithRequest:v4])
  {
    v18 = logger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_24F3F0000, v18, OS_LOG_TYPE_FAULT, "Cannot merge focus update requests that are not allowed to be merged.", v19, 2u);
    }
  }
  id v5 = [_FEFocusUpdateRequest alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v7 = [(_FEFocusUpdateRequest *)v5 initWithEnvironment:WeakRetained];

  id v8 = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v8)
  {
    objc_storeWeak((id *)(v7 + 24), v8);
  }
  else
  {
    id v9 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)(v7 + 24), v9);
  }
  id v10 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (v10)
  {
    objc_storeWeak((id *)(v7 + 16), v10);
  }
  else
  {
    id v11 = objc_loadWeakRetained(v4 + 2);
    objc_storeWeak((id *)(v7 + 16), v11);
  }
  *(unsigned char *)(v7 + 10) = self->_isFocusRemovalRequest;
  if (self->_allowsDeferral) {
    uint64_t v12 = [v4 allowsDeferral];
  }
  else {
    uint64_t v12 = 0;
  }
  [(id)v7 setAllowsDeferral:v12];
  if (self->_scrollIfNecessary) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = [v4 shouldScrollIfNecessary];
  }
  [(id)v7 setScrollIfNecessary:v13];
  if (self->_shouldPlayFocusSound) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = [v4 shouldPlayFocusSound];
  }
  [(id)v7 setShouldPlayFocusSound:v14];
  if (self->_allowsFocusingCurrentItem) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = [v4 allowsFocusingCurrentItem];
  }
  [(id)v7 setAllowsFocusingCurrentItem:v15];
  if (self->_resetsUpdateThrottle) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = [v4 resetsUpdateThrottle];
  }
  [(id)v7 setResetsUpdateThrottle:v16];

  return (id)v7;
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_environment);
    if (v5
      && (+[_FEFocusSystem focusSystemForEnvironment:v5],
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = v6;
    }
    else
    {
      id v4 = 0;
    }
  }
  return (_FEFocusSystem *)v4;
}

- (void)cacheCurrentFocusSystem
{
  id v3 = [(_FEFocusUpdateRequest *)self focusSystem];
  objc_storeWeak((id *)&self->_focusSystem, v3);
}

- (BOOL)isValidInFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_FEFocusUpdateRequest.m", 206, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained
    && ([(_FEFocusUpdateRequest *)self focusSystem],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v5))
  {
    id v9 = +[_FEFocusSystem focusSystemForEnvironment:WeakRetained];
    BOOL v8 = v9 == v5;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isMovementRequest
{
  return 0;
}

- (BOOL)requiresNextFocusedItem
{
  return 0;
}

- (BOOL)requiresEnvironmentValidation
{
  return 0;
}

- (BOOL)shouldPerformHapticFeedback
{
  return 0;
}

- (_FEFocusInputDeviceInfo)inputDeviceInfo
{
  return 0;
}

- (BOOL)shouldScrollIfNecessary
{
  return self->_scrollIfNecessary;
}

- (void)setScrollIfNecessary:(BOOL)a3
{
  self->_scrollIfNecessary = a3;
}

- (_FEFocusEnvironment)destinationEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (_FEFocusEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (BOOL)allowsDeferral
{
  return self->_allowsDeferral;
}

- (void)setAllowsDeferral:(BOOL)a3
{
  self->_allowsDeferral = a3;
}

- (BOOL)isFocusRemovalRequest
{
  return self->_isFocusRemovalRequest;
}

- (BOOL)shouldPlayFocusSound
{
  return self->_shouldPlayFocusSound;
}

- (void)setShouldPlayFocusSound:(BOOL)a3
{
  self->_shouldPlayFocusSound = a3;
}

- (BOOL)allowsFocusingCurrentItem
{
  return self->_allowsFocusingCurrentItem;
}

- (void)setAllowsFocusingCurrentItem:(BOOL)a3
{
  self->_allowsFocusingCurrentItem = a3;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (BOOL)resetsUpdateThrottle
{
  return self->_resetsUpdateThrottle;
}

- (void)setResetsUpdateThrottle:(BOOL)a3
{
  self->_resetsUpdateThrottle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_destroyWeak((id *)&self->_destinationEnvironment);
}

@end