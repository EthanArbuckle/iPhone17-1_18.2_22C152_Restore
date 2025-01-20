@interface DOCKeyboardFocusManager
+ (DOCKeyboardFocusManager)sharedManager;
+ (id)allDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4;
+ (id)directionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4;
+ (id)selectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4;
+ (id)systemProvidedDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4;
+ (id)systemProvidedSelectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4;
+ (void)_applySystemOverridePriority:(id)a3;
- (BOOL)_isRegistered:(id)a3;
- (BOOL)externalFirstResponderInFlight;
- (BOOL)requestCurrentFocus:(id)a3;
- (BOOL)restoreCurrentlyFocused;
- (DOCKeyboardFocusManager)init;
- (NSPointerArray)allKeyboardFocusable;
- (id)adjacentFocusableToFocusable:(id)a3 direction:(int64_t)a4;
- (id)currentlyFocused;
- (void)_printAllRegisteredFocusable;
- (void)registerKeyboardFocusable:(id)a3;
- (void)setAllKeyboardFocusable:(id)a3;
- (void)setExternalFirstResponderInFlight:(BOOL)a3;
- (void)unregisterKeyboardFocusable:(id)a3;
@end

@implementation DOCKeyboardFocusManager

- (BOOL)requestCurrentFocus:(id)a3
{
  id v4 = a3;
  v5 = +[DOCKeyboardFocusManager sharedManager];
  char v6 = [v5 externalFirstResponderInFlight];

  if ((v6 & 1) == 0
    && ([(DOCKeyboardFocusManager *)self registerKeyboardFocusable:v4],
        [v4 acceptsKeyboardFocus])
    && [v4 becomeKeyboardFocused])
  {
    objc_storeWeak((id *)&self->_currentlyFocused, v4);
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (DOCKeyboardFocusManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__DOCKeyboardFocusManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager__sharedInstance;
  return (DOCKeyboardFocusManager *)v2;
}

- (void)registerKeyboardFocusable:(id)a3
{
  id v4 = a3;
  if (!-[NSPointerArray doc_containsPointer:](self->_allKeyboardFocusable, "doc_containsPointer:")) {
    [(NSPointerArray *)self->_allKeyboardFocusable addPointer:v4];
  }
}

- (BOOL)externalFirstResponderInFlight
{
  return self->_externalFirstResponderInFlight;
}

uint64_t __40__DOCKeyboardFocusManager_sharedManager__block_invoke()
{
  sharedManager__sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (DOCKeyboardFocusManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCKeyboardFocusManager;
  v2 = [(DOCKeyboardFocusManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    allKeyboardFocusable = v2->_allKeyboardFocusable;
    v2->_allKeyboardFocusable = (NSPointerArray *)v3;
  }
  return v2;
}

+ (id)allDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = [MEMORY[0x263EFF980] array];
  BOOL v7 = [(id)objc_opt_class() directionalKeyCommandsWithAction:a3 prioritize:v4];
  [v6 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() selectionKeyCommandsWithAction:a3 prioritize:v4];
  [v6 addObjectsFromArray:v8];

  v9 = [(id)objc_opt_class() systemProvidedSelectionKeyCommandsWithAction:a3 prioritize:v4];
  [v6 addObjectsFromArray:v9];

  v10 = [(id)objc_opt_class() systemProvidedDirectionalKeyCommandsWithAction:a3 prioritize:v4];
  [v6 addObjectsFromArray:v10];

  v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v11;
}

+ (id)directionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  BOOL v4 = a4;
  v10[2] = *MEMORY[0x263EF8340];
  objc_super v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0x80000 action:a3];
  v10[0] = v6;
  BOOL v7 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:0x80000 action:a3];
  v10[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  if (v4) {
    [(id)objc_opt_class() _applySystemOverridePriority:v8];
  }
  return v8;
}

+ (id)systemProvidedDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  BOOL v4 = a4;
  v12[4] = *MEMORY[0x263EF8340];
  objc_super v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0 action:a3];
  v12[0] = v6;
  BOOL v7 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:0 action:a3];
  v12[1] = v7;
  v8 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:0 action:a3];
  v12[2] = v8;
  v9 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:0 action:a3];
  v12[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  if (v4) {
    [(id)objc_opt_class() _applySystemOverridePriority:v10];
  }
  return v10;
}

+ (id)selectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  BOOL v4 = a4;
  v12[4] = *MEMORY[0x263EF8340];
  objc_super v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:655360 action:a3];
  v12[0] = v6;
  BOOL v7 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:655360 action:a3];
  v12[1] = v7;
  v8 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:655360 action:a3];
  v12[2] = v8;
  v9 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:655360 action:a3];
  v12[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  if (v4) {
    [(id)objc_opt_class() _applySystemOverridePriority:v10];
  }
  return v10;
}

+ (id)systemProvidedSelectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  BOOL v4 = a4;
  v12[4] = *MEMORY[0x263EF8340];
  objc_super v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0x20000 action:a3];
  v12[0] = v6;
  BOOL v7 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:0x20000 action:a3];
  v12[1] = v7;
  v8 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:0x20000 action:a3];
  v12[2] = v8;
  v9 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:0x20000 action:a3];
  v12[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  if (v4) {
    [(id)objc_opt_class() _applySystemOverridePriority:v10];
  }
  return v10;
}

+ (void)_applySystemOverridePriority:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setWantsPriorityOverSystemBehavior:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)unregisterKeyboardFocusable:(id)a3
{
  allKeyboardFocusable = self->_allKeyboardFocusable;
  id v5 = a3;
  uint64_t v6 = [(NSPointerArray *)allKeyboardFocusable doc_indexOfPointer:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSPointerArray *)self->_allKeyboardFocusable removePointerAtIndex:v6];
    [(NSPointerArray *)self->_allKeyboardFocusable compact];
  }
  p_currentlyFocused = &self->_currentlyFocused;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentlyFocused);

  if (WeakRetained == v5)
  {
    objc_storeWeak((id *)p_currentlyFocused, 0);
  }
}

- (id)currentlyFocused
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyFocused);
  return WeakRetained;
}

- (BOOL)restoreCurrentlyFocused
{
  p_currentlyFocused = &self->_currentlyFocused;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyFocused);

  if (!WeakRetained) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_currentlyFocused);
  BOOL v6 = [(DOCKeyboardFocusManager *)self requestCurrentFocus:v5];

  return v6;
}

- (id)adjacentFocusableToFocusable:(id)a3 direction:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 absoluteFrame];
  CGFloat v38 = v8;
  CGFloat v39 = v7;
  CGFloat v36 = v10;
  CGFloat v37 = v9;
  v45[0] = xmmword_213653240;
  v45[1] = xmmword_213653250;
  v45[2] = xmmword_213653260;
  v45[3] = xmmword_213653270;
  long long v11 = 0;
  if ([(NSPointerArray *)self->_allKeyboardFocusable count])
  {
    unint64_t v12 = 0;
    double v14 = *MEMORY[0x263F00148];
    double v13 = *(double *)(MEMORY[0x263F00148] + 8);
    double v15 = 1.79769313e308;
    do
    {
      id v16 = [(NSPointerArray *)self->_allKeyboardFocusable pointerAtIndex:v12];
      v17 = v16;
      if (v16 == v6
        || ![v16 acceptsKeyboardFocus]
        || ![v17 isInKeyWindow])
      {
        goto LABEL_14;
      }
      [v17 absoluteFrame];
      CGFloat v42 = v19;
      CGFloat v43 = v18;
      CGFloat v41 = v20;
      CGFloat v22 = v21;
      v48.origin.x = v39;
      v48.origin.y = v38;
      v48.size.width = v37;
      v48.size.height = v36;
      double MidX = CGRectGetMidX(v48);
      v49.origin.x = v39;
      v49.origin.y = v38;
      v49.size.width = v37;
      v49.size.height = v36;
      double MidY = CGRectGetMidY(v49);
      v50.origin.x = v43;
      v50.origin.y = v42;
      v50.size.width = v41;
      v50.size.height = v22;
      double v23 = CGRectGetMidX(v50);
      v51.origin.x = v43;
      v51.origin.y = v42;
      v51.size.width = v41;
      v51.size.height = v22;
      CGFloat v24 = CGRectGetMidY(v51);
      uint64_t v25 = 0;
      double v26 = v23 - MidX;
      double v27 = v24 - MidY;
      double v28 = sqrt((v13 - v27) * (v13 - v27) + (v14 - (v23 - MidX)) * (v14 - (v23 - MidX)));
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      double v30 = 2.22507386e-308;
      v31 = (double *)v45 + 1;
      do
      {
        double v32 = (v27 * *v31 + v26 * *(v31 - 1))
            / v28
            / sqrt((v13 - *v31) * (v13 - *v31) + (v14 - *(v31 - 1)) * (v14 - *(v31 - 1)));
        if (v32 > v30)
        {
          double v30 = v32;
          uint64_t v29 = v25;
        }
        ++v25;
        v31 += 2;
      }
      while (v25 != 4);
      if (v29 == a4 && v28 < v15)
      {
        id v34 = v17;

        long long v11 = v34;
      }
      else
      {
LABEL_14:
        double v28 = v15;
      }

      ++v12;
      double v15 = v28;
    }
    while (v12 < [(NSPointerArray *)self->_allKeyboardFocusable count]);
  }

  return v11;
}

- (void)_printAllRegisteredFocusable
{
  if ([(NSPointerArray *)self->_allKeyboardFocusable count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [(NSPointerArray *)self->_allKeyboardFocusable pointerAtIndex:v3];
      [v4 absoluteFrame];
      id v5 = NSStringFromCGRect(v6);
      NSLog(&cfstr_FocusableEntit.isa, v4, v5);

      ++v3;
    }
    while (v3 < [(NSPointerArray *)self->_allKeyboardFocusable count]);
  }
}

- (BOOL)_isRegistered:(id)a3
{
  return [(NSPointerArray *)self->_allKeyboardFocusable doc_indexOfPointer:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setExternalFirstResponderInFlight:(BOOL)a3
{
  self->_externalFirstResponderInFlight = a3;
}

- (NSPointerArray)allKeyboardFocusable
{
  return (NSPointerArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllKeyboardFocusable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeyboardFocusable, 0);
  objc_destroyWeak((id *)&self->_currentlyFocused);
}

@end