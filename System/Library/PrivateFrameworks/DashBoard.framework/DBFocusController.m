@interface DBFocusController
- (BSInvalidatable)focusDeferral;
- (DBFocusAssertion)lastFocusAssertion;
- (DBFocusController)initWithScreen:(id)a3;
- (NSMutableArray)assertions;
- (NSString)displayID;
- (UIScreen)screen;
- (UIWindow)focusWindow;
- (id)description;
- (int)focusedPid;
- (void)_applyAssertion:(id)a3 withHeading:(unint64_t)a4 focusedFrame:(CGRect)a5;
- (void)_updateEventFocusWithHeading:(unint64_t)a3 focusedFrame:(CGRect)a4;
- (void)dealloc;
- (void)dropReason:(id)a3;
- (void)dropReason:(id)a3 withHeading:(unint64_t)a4 focusedFrame:(CGRect)a5;
- (void)invalidate;
- (void)setAssertions:(id)a3;
- (void)setDisplayID:(id)a3;
- (void)setFocusDeferral:(id)a3;
- (void)setFocusWindow:(id)a3;
- (void)setLastFocusAssertion:(id)a3;
- (void)setScreen:(id)a3;
- (void)takeWithPriority:(double)a3 reason:(id)a4 forWindow:(id)a5 bundleIdentifier:(id)a6 pid:(int)a7 scene:(id)a8;
- (void)takeWithPriority:(double)a3 reason:(id)a4 forWindow:(id)a5 bundleIdentifier:(id)a6 pid:(int)a7 scene:(id)a8 heading:(unint64_t)a9 focusedFrame:(CGRect)a10;
@end

@implementation DBFocusController

- (DBFocusController)initWithScreen:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DBFocusController;
  v6 = [(DBFocusController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v8 = [(UIScreen *)v7->_screen _displayID];
    uint64_t v9 = [v8 copy];
    displayID = v7->_displayID;
    v7->_displayID = (NSString *)v9;

    uint64_t v11 = objc_opt_new();
    assertions = v7->_assertions;
    v7->_assertions = (NSMutableArray *)v11;
  }
  return v7;
}

- (void)dealloc
{
  [(DBFocusController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DBFocusController;
  [(DBFocusController *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(DBFocusController *)self assertions];

  if (v3)
  {
    [(DBFocusController *)self setAssertions:0];
    [(DBFocusController *)self setLastFocusAssertion:0];
    [(DBFocusController *)self setFocusWindow:0];
  }
  v4 = [(DBFocusController *)self focusDeferral];
  [v4 invalidate];

  [(DBFocusController *)self setFocusDeferral:0];
}

- (void)takeWithPriority:(double)a3 reason:(id)a4 forWindow:(id)a5 bundleIdentifier:(id)a6 pid:(int)a7 scene:(id)a8
{
}

- (void)takeWithPriority:(double)a3 reason:(id)a4 forWindow:(id)a5 bundleIdentifier:(id)a6 pid:(int)a7 scene:(id)a8 heading:(unint64_t)a9 focusedFrame:(CGRect)a10
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  uint64_t v15 = *(void *)&a7;
  id v21 = a8;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = [[DBFocusAssertion alloc] initWithName:v24 type:0 priority:v23 window:v22 application:v15 pid:v21 scene:a3];

  -[DBFocusController _applyAssertion:withHeading:focusedFrame:](self, "_applyAssertion:withHeading:focusedFrame:", v25, a9, x, y, width, height);
}

- (void)dropReason:(id)a3
{
}

- (void)dropReason:(id)a3 withHeading:(unint64_t)a4 focusedFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  v12 = [(DBFocusController *)self assertions];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__DBFocusController_dropReason_withHeading_focusedFrame___block_invoke;
  v16[3] = &unk_2649B6CD8;
  id v17 = v11;
  id v13 = v11;
  objc_super v14 = [v12 indexesOfObjectsPassingTest:v16];

  if ([v14 count])
  {
    uint64_t v15 = [(DBFocusController *)self assertions];
    [v15 removeObjectsAtIndexes:v14];

    -[DBFocusController _updateEventFocusWithHeading:focusedFrame:](self, "_updateEventFocusWithHeading:focusedFrame:", a4, x, y, width, height);
  }
}

uint64_t __57__DBFocusController_dropReason_withHeading_focusedFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (int)focusedPid
{
  v2 = [(DBFocusController *)self lastFocusAssertion];
  int v3 = [v2 pid];

  return v3;
}

- (void)_updateEventFocusWithHeading:(unint64_t)a3 focusedFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v73 = *MEMORY[0x263EF8340];
  v10 = [(DBFocusController *)self assertions];

  if (!v10) {
    return;
  }
  id v11 = [(DBFocusController *)self assertions];
  v12 = [v11 lastObject];

  id v13 = [(DBFocusController *)self lastFocusAssertion];

  if (v13 != v12)
  {
    [(DBFocusController *)self setLastFocusAssertion:v12];
    objc_super v14 = [(DBFocusController *)self focusDeferral];
    [v14 invalidate];

    [(DBFocusController *)self setFocusDeferral:0];
    uint64_t v15 = [(DBFocusController *)self lastFocusAssertion];
    int v16 = [v15 pid];

    if (v16 >= 1)
    {
      id v17 = objc_alloc_init(MEMORY[0x263F29880]);
      v18 = (void *)MEMORY[0x263F29858];
      v19 = [(DBFocusController *)self displayID];
      v20 = [v18 displayWithHardwareIdentifier:v19];
      [v17 setDisplay:v20];

      id v21 = objc_alloc_init(MEMORY[0x263F29888]);
      id v22 = [v12 window];

      if (v22)
      {
        id v23 = (void *)MEMORY[0x263F29828];
        id v24 = [v12 window];
        uint64_t v25 = objc_msgSend(v23, "tokenForIdentifierOfCAContext:", objc_msgSend(v24, "_contextId"));
      }
      else
      {
        v26 = [v12 scene];

        if (!v26)
        {
          uint64_t v25 = 0;
          goto LABEL_9;
        }
        v27 = (void *)MEMORY[0x263F29828];
        id v24 = [v12 scene];
        v28 = [v24 identityToken];
        v29 = [v28 stringRepresentation];
        uint64_t v25 = [v27 tokenForString:v29];
      }
LABEL_9:
      [v21 setToken:v25];
      objc_msgSend(v21, "setPid:", objc_msgSend(v12, "pid"));
      unint64_t v30 = 256;
      if (a3 != 16) {
        unint64_t v30 = a3;
      }
      if (a3 == 32) {
        uint64_t v31 = 512;
      }
      else {
        uint64_t v31 = v30;
      }
      v32 = objc_msgSend(MEMORY[0x263F82F80], "_movementWithHeading:isInitial:fallbackMovementOriginatingFrame:", v31, 1, x, y, width, height);
      v33 = (void *)[objc_alloc(MEMORY[0x263F82750]) initWithFocusMovementInfo:v32];
      v34 = DBLogForCategory(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v12 scene];
        *(_DWORD *)buf = 138412546;
        v66 = v33;
        __int16 v67 = 2112;
        *(void *)v68 = v35;
        _os_log_impl(&dword_22D6F0000, v34, OS_LOG_TYPE_DEFAULT, "Sending focus movement action: %@ to scene: %@", buf, 0x16u);
      }
      v59 = (void *)v25;

      v36 = [v12 scene];
      v37 = [MEMORY[0x263EFFA08] setWithObject:v33];
      [v36 sendActions:v37];

      v38 = DBLogForCategory(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [(DBFocusController *)self displayID];
        [v12 window];
        v58 = v32;
        v41 = id v40 = v17;
        int v42 = [v41 _contextId];
        v43 = [v12 window];
        int v44 = [v12 pid];
        *(_DWORD *)buf = 138544386;
        v66 = v39;
        __int16 v67 = 1024;
        *(_DWORD *)v68 = v42;
        *(_WORD *)&v68[4] = 2114;
        *(void *)&v68[6] = v43;
        __int16 v69 = 1024;
        int v70 = v44;
        __int16 v71 = 2114;
        v72 = v59;
        _os_log_impl(&dword_22D6F0000, v38, OS_LOG_TYPE_DEFAULT, "Deferring events for display: %{public}@, to context: 0x%x for window: %{public}@, pid: %d, token: %{public}@", buf, 0x2Cu);

        id v17 = v40;
        v32 = v58;
      }
      v45 = [MEMORY[0x263F29830] sharedInstance];
      v46 = NSString;
      v47 = [(DBFocusController *)self displayID];
      v48 = [v46 stringWithFormat:@"DashBoardFocusDeferral-%@", v47];
      v49 = [v45 deferEventsMatchingPredicate:v17 toTarget:v21 withReason:v48];
      [(DBFocusController *)self setFocusDeferral:v49];
    }
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v50 = [(DBFocusController *)self assertions];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    v53 = 0;
    uint64_t v54 = *(void *)v61;
    do
    {
      uint64_t v55 = 0;
      v56 = v53;
      do
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(v50);
        }
        v53 = [*(id *)(*((void *)&v60 + 1) + 8 * v55) window];

        ++v55;
        v56 = v53;
      }
      while (v52 != v55);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v52);
  }
  else
  {
    v53 = 0;
  }

  v57 = [(DBFocusController *)self focusWindow];

  if (v57 != v53) {
    [(DBFocusController *)self setFocusWindow:v53];
  }
}

- (void)_applyAssertion:(id)a3 withHeading:(unint64_t)a4 focusedFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  v12 = [(DBFocusController *)self assertions];
  id v13 = [(DBFocusController *)self assertions];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __62__DBFocusController__applyAssertion_withHeading_focusedFrame___block_invoke;
  v31[3] = &unk_2649B6CD8;
  id v14 = v11;
  id v32 = v14;
  uint64_t v15 = [v13 indexesOfObjectsPassingTest:v31];
  [v12 removeObjectsAtIndexes:v15];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v16 = [(DBFocusController *)self assertions];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      uint64_t v21 = 0;
      uint64_t v22 = v19 + v18;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v21) priority];
        double v24 = v23;
        [v14 priority];
        if (v24 > v25)
        {
          uint64_t v22 = v19 + v21;
          goto LABEL_12;
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
      uint64_t v19 = v22;
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_12:

  v26 = [(DBFocusController *)self assertions];
  [v26 insertObject:v14 atIndex:v22];

  -[DBFocusController _updateEventFocusWithHeading:focusedFrame:](self, "_updateEventFocusWithHeading:focusedFrame:", a4, x, y, width, height);
}

uint64_t __62__DBFocusController__applyAssertion_withHeading_focusedFrame___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 name];
  uint64_t v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(DBFocusController *)self assertions];
  v6 = [v3 stringWithFormat:@"<%@:%p> -> %@", v4, self, v5];

  return v6;
}

- (UIWindow)focusWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setFocusWindow:(id)a3
{
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (NSMutableArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (DBFocusAssertion)lastFocusAssertion
{
  return self->_lastFocusAssertion;
}

- (void)setLastFocusAssertion:(id)a3
{
}

- (BSInvalidatable)focusDeferral
{
  return self->_focusDeferral;
}

- (void)setFocusDeferral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusDeferral, 0);
  objc_storeStrong((id *)&self->_lastFocusAssertion, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->_focusWindow);
}

@end