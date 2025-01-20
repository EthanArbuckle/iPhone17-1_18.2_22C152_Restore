@interface SCATAuxiliaryElementManagerViewController
- (BOOL)_elementContainsAllSubviewsOfView:(id)a3 view:(id)a4;
- (BOOL)isTransitioningToOrFromActive;
- (id)viewsRequiringStateUpdate;
- (void)loadView;
- (void)setTransitioningToOrFromActive:(BOOL)a3;
- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATAuxiliaryElementManagerViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [v3 setAutoresizingMask:18];
  [(SCATAuxiliaryElementManagerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SCATAuxiliaryElementManagerViewController;
  [(SCATAuxiliaryElementManagerViewController *)&v3 viewDidLoad];
  [(SCATAuxiliaryElementManagerViewController *)self updateCustomFocusingViewStateForViewsWithElement:0];
}

- (id)viewsRequiringStateUpdate
{
  return 0;
}

- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v4 parentGroup];
  }
  v6 = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [(SCATAuxiliaryElementManagerViewController *)self viewsRequiringStateUpdate];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v11);
        unsigned int v13 = [v4 isGroup];
        if (v13) {
          LOBYTE(v13) = [(SCATAuxiliaryElementManagerViewController *)self _elementContainsAllSubviewsOfView:v4 view:v12];
        }
        uint64_t v14 = 1;
        if (v12 != v4 && (v13 & 1) == 0)
        {
          uint64_t v15 = (uint64_t)[v6 containsObject:v12];
          if ((v15 & 1) != 0
            || (sub_1000A02FC(v15, v6, v12) & 1) != 0
            || (+[AXSettings sharedInstance],
                v16 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v17 = [v16 assistiveTouchGroupElementsEnabled],
                v16,
                (v17 & 1) == 0))
          {
            uint64_t v14 = 2;
          }
          else
          {
            uint64_t v14 = 0;
          }
        }
        [v12 updateFocusState:v14];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (BOOL)_elementContainsAllSubviewsOfView:(id)a3 view:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isDescendantOfView:", v6, (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)isTransitioningToOrFromActive
{
  return self->_transitioningToOrFromActive;
}

- (void)setTransitioningToOrFromActive:(BOOL)a3
{
  self->_transitioningToOrFromActive = a3;
}

@end