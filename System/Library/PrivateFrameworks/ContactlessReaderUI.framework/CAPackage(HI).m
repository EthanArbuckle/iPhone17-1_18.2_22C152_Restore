@interface CAPackage(HI)
- (id)_stateController;
- (id)availableStates;
- (id)availableStatesOnLayer:()HI;
- (void)transitionToStateWithName:()HI;
- (void)transitionToStateWithName:()HI onLayer:;
@end

@implementation CAPackage(HI)

- (void)transitionToStateWithName:()HI
{
  id v4 = a3;
  id v5 = [a1 rootLayer];
  [a1 transitionToStateWithName:v4 onLayer:v5];
}

- (void)transitionToStateWithName:()HI onLayer:
{
  id v6 = a4;
  id v9 = [v6 stateWithName:a3];
  v7 = [a1 _stateController];
  LODWORD(v8) = 1.0;
  [v7 setState:v9 ofLayer:v6 transitionSpeed:v8];
}

- (id)availableStates
{
  v2 = [a1 rootLayer];
  v3 = [a1 availableStatesOnLayer:v2];

  return v3;
}

- (id)availableStatesOnLayer:()HI
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = [v3 array];
  id v6 = [v4 states];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__CAPackage_HI__availableStatesOnLayer___block_invoke;
  v9[3] = &unk_265048A28;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

- (id)_stateController
{
  v2 = objc_getAssociatedObject(a1, sel__stateController);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F158B0]);
    id v4 = [a1 rootLayer];
    v2 = (void *)[v3 initWithLayer:v4];

    objc_setAssociatedObject(a1, sel__stateController, v2, (void *)1);
  }
  return v2;
}

@end