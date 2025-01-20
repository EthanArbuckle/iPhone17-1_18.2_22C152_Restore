@interface SiriIntentsSnippetViewController
- (BOOL)hasDefaultTapActionForTemplatedStackSnippetView:(id)a3;
- (BOOL)isIndicatingActivity;
- (BOOL)usePlatterStyle;
- (CGSize)maximumSizeForRemoteViewController:(id)a3;
- (CGSize)minimumSizeForRemoteViewController:(id)a3;
- (SiriIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)defaultViewInsets;
- (double)desiredHeight;
- (id)navigationTitleForTemplatedStackSnippetView:(id)a3;
- (id)sashImageForTemplatedStackSnippetView:(id)a3;
- (id)sashTitleForTemplatedStackSnippetView:(id)a3;
- (id)snippet;
- (void)_connectToWidgetForInteraction:(id)a3;
- (void)_finishLoadingViewIfNecessary;
- (void)_redactTemplateViewControllersForRepresentedKeyPaths:(id)a3;
- (void)_updateTemplateViewControllerCompression;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)mapTemplateViewController:(id)a3 didModifyPlacemark:(id)a4;
- (void)presentDetailsForTemplateViewController:(id)a3;
- (void)remoteViewController:(id)a3 desiresConstrainedSize:(CGSize)a4;
- (void)remoteViewControllerServiceDidTerminate:(id)a3;
- (void)selectionTemplateViewControllerWasSelected:(id)a3;
- (void)setSnippet:(id)a3;
- (void)siriDidDeactivate;
- (void)viewDidLayoutSubviews;
- (void)viewWantsDefaultTapAction:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SiriIntentsSnippetViewController

- (SiriIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SiriIntentsSnippetViewController;
  v4 = [(SiriIntentsSnippetViewController *)&v17 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(SiriIntentsSnippetViewController *)v4 setLoading:1];
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    templateViewControllers = v5->_templateViewControllers;
    v5->_templateViewControllers = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    templateViewControllerSetsByKeyPaths = v5->_templateViewControllerSetsByKeyPaths;
    v5->_templateViewControllerSetsByKeyPaths = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    detailSnippetsForAceIds = v5->_detailSnippetsForAceIds;
    v5->_detailSnippetsForAceIds = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serverBoundCommandsForAceIds = v5->_serverBoundCommandsForAceIds;
    v5->_serverBoundCommandsForAceIds = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingServerBoundCommandsForTemplateModelIdentifiers = v5->_pendingServerBoundCommandsForTemplateModelIdentifiers;
    v5->_pendingServerBoundCommandsForTemplateModelIdentifiers = v14;
  }
  return v5;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)SiriUITemplatedStackSnippetView);
  [v3 setDataSource:self];
  [v3 setDelegate:self];
  [(SiriIntentsSnippetViewController *)self setView:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SiriIntentsSnippetViewController;
  [(SiriIntentsSnippetViewController *)&v18 viewWillDisappear:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_templateViewControllers;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v8), "prepareForDismissal", (void)v14);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  v9 = [(SAIntentGroupSnippet *)self->_snippet processSynapseFlowCommand];
  if ([(NSMutableDictionary *)self->_pendingServerBoundCommandsForTemplateModelIdentifiers count]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v11 = [(NSMutableDictionary *)self->_pendingServerBoundCommandsForTemplateModelIdentifiers allValues];
    v12 = [v11 arrayByAddingObject:v9];

    v13 = [(SiriIntentsSnippetViewController *)self delegate];
    [v13 siriViewController:self performAceCommands:v12];

    [(NSMutableDictionary *)self->_pendingServerBoundCommandsForTemplateModelIdentifiers removeAllObjects];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriIntentsSnippetViewController;
  [(SiriIntentsSnippetViewController *)&v5 didMoveToParentViewController:a3];
  v4 = [(SiriIntentsSnippetViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriIntentsSnippetViewController;
  [(SiriIntentsSnippetViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(SiriIntentsSnippetViewController *)self delegate];
  [v3 siriViewControllerHeightDidChange:self];
}

- (void)setSnippet:(id)a3
{
  objc_super v5 = (SAIntentGroupSnippet *)a3;
  p_snippet = &self->_snippet;
  if (self->_snippet != v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = v5;
      objc_storeStrong((id *)&self->_snippet, a3);
      uint64_t v7 = [(SAIntentGroupSnippet *)*p_snippet appId];
      v8 = +[LSApplicationProxy applicationProxyForIdentifier:v7];

      v9 = +[UIImage _iconForResourceProxy:v8 format:5];
      appIconImage = self->_appIconImage;
      self->_appIconImage = v9;

      v50 = v8;
      v11 = [v8 localizedName];
      appName = self->_appName;
      self->_appName = v11;

      v13 = [(SAIntentGroupSnippet *)*p_snippet title];
      id v14 = [v13 length];
      if (v14)
      {
        long long v15 = [(SAIntentGroupSnippet *)*p_snippet title];
      }
      else
      {
        long long v15 = 0;
      }
      objc_storeStrong((id *)&self->_navigationTitle, v15);
      if (v14) {

      }
      long long v16 = [(SiriIntentsSnippetViewController *)self view];
      [v16 reloadData];

      [(NSMutableDictionary *)self->_detailSnippetsForAceIds removeAllObjects];
      [(NSMutableDictionary *)self->_serverBoundCommandsForAceIds removeAllObjects];
      [(NSMutableSet *)self->_templateViewControllers enumerateObjectsUsingBlock:&stru_83D8];
      [(NSMutableSet *)self->_templateViewControllers removeAllObjects];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
      v49 = &self->_snippet;
      id obj = [(SAIntentGroupSnippet *)*p_snippet snippetTemplates];
      id v54 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v54)
      {
        uint64_t v53 = *(void *)v65;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v65 != v53) {
              objc_enumerationMutation(obj);
            }
            uint64_t v55 = v17;
            objc_super v18 = *(void **)(*((void *)&v64 + 1) + 8 * v17);
            v19 = +[SiriUITemplateViewController templateViewControllerForTemplateModel:v18];
            [v19 setDelegate:self];
            if ([v19 isActive])
            {
              [(SiriIntentsSnippetViewController *)self addChildViewController:v19];
              v20 = [(SiriIntentsSnippetViewController *)self view];
              v21 = [v19 view];
              [v20 addTemplateSubview:v21];

              [v19 didMoveToParentViewController:self];
            }
            [(NSMutableSet *)self->_templateViewControllers addObject:v19];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            v22 = [v18 intentSlotKeyPaths];
            id v23 = [v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v61;
              do
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v61 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v60 + 1) + 8 * i);
                  id v28 = [(NSMutableDictionary *)self->_templateViewControllerSetsByKeyPaths objectForKey:v27];
                  if (!v28)
                  {
                    id v28 = objc_alloc_init((Class)NSMutableSet);
                    [(NSMutableDictionary *)self->_templateViewControllerSetsByKeyPaths setObject:v28 forKey:v27];
                  }
                  [v28 addObject:v19];
                }
                id v24 = [v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
              }
              while (v24);
            }

            v29 = [v18 detailSnippet];
            v30 = v29;
            if (v29)
            {
              detailSnippetsForAceIds = self->_detailSnippetsForAceIds;
              v32 = [v29 aceId];
              [(NSMutableDictionary *)detailSnippetsForAceIds setObject:v30 forKey:v32];
            }
            v33 = objc_msgSend(v18, "intents_serverBoundCommand");
            v34 = v33;
            if (v33)
            {
              serverBoundCommandsForAceIds = self->_serverBoundCommandsForAceIds;
              v36 = [v33 aceId];
              [(NSMutableDictionary *)serverBoundCommandsForAceIds setObject:v34 forKey:v36];
            }
            uint64_t v17 = v55 + 1;
          }
          while ((id)(v55 + 1) != v54);
          id v54 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v54);
      }

      if ([(SAIntentGroupSnippet *)*v49 widgetAllowed])
      {
        v37 = [(SAIntentGroupSnippet *)*v49 intent];
        v38 = [v37 typeName];
        v39 = [(SAIntentGroupSnippet *)*v49 intent];
        v40 = [v39 data];
        v41 = INIntentCreate();

        id v42 = objc_alloc((Class)NSString);
        v43 = [v41 intentId];
        v44 = [v41 typeName];
        v45 = [v41 launchId];
        id v46 = [v42 initWithFormat:@"%@-%@-%@", v43, v44, v45];

        v47 = [v46 dataUsingEncoding:4];
        if ([v47 length])
        {
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_2A24;
          v56[3] = &unk_8428;
          id v57 = objc_alloc_init((Class)AFSecurityConnection);
          id v58 = v41;
          v59 = self;
          id v48 = v57;
          [v48 processData:v47 usingProcedure:5 completion:v56];
        }
        else
        {
          id v48 = [objc_alloc((Class)INInteraction) initWithIntent:v41 response:0];
          [(SiriIntentsSnippetViewController *)self _connectToWidgetForInteraction:v48];
        }
        objc_super v5 = v51;
      }
      else
      {
        [(SiriIntentsSnippetViewController *)self _finishLoadingViewIfNecessary];
        objc_super v5 = v51;
      }
    }
  }
}

- (void)siriDidDeactivate
{
  v4.receiver = self;
  v4.super_class = (Class)SiriIntentsSnippetViewController;
  [(SiriIntentsSnippetViewController *)&v4 siriDidDeactivate];
  id v3 = [(INUIRemoteViewController *)self->_remoteViewController disconnect];
}

- (UIEdgeInsets)defaultViewInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)desiredHeight
{
  v2 = [(SiriIntentsSnippetViewController *)self view];
  [v2 desiredHeight];
  double v4 = v3;

  return v4;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (BOOL)isIndicatingActivity
{
  return 1;
}

- (void)_connectToWidgetForInteraction:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2E8C;
  v5[3] = &unk_84A0;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  +[INUIRemoteViewController requestRemoteViewControllerForInteraction:v4 delegate:self connectionHandler:v5];
}

- (void)_finishLoadingViewIfNecessary
{
  [(SiriIntentsSnippetViewController *)self _updateTemplateViewControllerCompression];
  if ([(SiriIntentsSnippetViewController *)self isLoading])
  {
    [(SiriIntentsSnippetViewController *)self setLoading:0];
    id v3 = [(SiriIntentsSnippetViewController *)self delegate];
    [v3 siriSnippetViewControllerViewDidLoad:self];
  }
}

- (void)_updateTemplateViewControllerCompression
{
  remoteViewController = self->_remoteViewController;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_templateViewControllers;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setCompressed:", remoteViewController != 0, (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_redactTemplateViewControllersForRepresentedKeyPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableSet *)self->_templateViewControllers mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        long long v9 = [(NSMutableDictionary *)self->_templateViewControllerSetsByKeyPaths objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
              if ([v5 containsObject:v14])
              {
                [v14 setActive:0];
                [v5 removeObject:v14];
                [v14 didMoveToParentViewController:0];
                long long v15 = [v14 view];
                [v15 removeFromTemplatedSuperview];

                [v14 removeFromParentViewController];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v11);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8 * (void)k);
        if (([v21 isActive] & 1) == 0)
        {
          [v21 setActive:1];
          [(SiriIntentsSnippetViewController *)self addChildViewController:v21];
          v22 = [(SiriIntentsSnippetViewController *)self view];
          id v23 = [v21 view];
          [v22 addTemplateSubview:v23];

          [v21 didMoveToParentViewController:self];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v18);
  }
}

- (id)sashImageForTemplatedStackSnippetView:(id)a3
{
  return self->_appIconImage;
}

- (id)sashTitleForTemplatedStackSnippetView:(id)a3
{
  return self->_appName;
}

- (id)navigationTitleForTemplatedStackSnippetView:(id)a3
{
  return self->_navigationTitle;
}

- (BOOL)hasDefaultTapActionForTemplatedStackSnippetView:(id)a3
{
  id v3 = [(SAIntentGroupSnippet *)self->_snippet commands];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (CGSize)minimumSizeForRemoteViewController:(id)a3
{
  BOOL v4 = [(SiriIntentsSnippetViewController *)self delegate];
  [v4 siriViewControllerVisibleContentArea:self];
  double v6 = v5;

  double v7 = 120.0;
  double v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)maximumSizeForRemoteViewController:(id)a3
{
  BOOL v4 = [(SiriIntentsSnippetViewController *)self delegate];
  [v4 siriViewControllerVisibleContentArea:self];
  double v6 = v5;

  double v7 = 200.0;
  double v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)remoteViewController:(id)a3 desiresConstrainedSize:(CGSize)a4
{
  double height = a4.height;
  id v5 = [(SiriIntentsSnippetViewController *)self view];
  [v5 adjustAuxiliaryViewHeight:1 animated:0 completion:height];
}

- (void)remoteViewControllerServiceDidTerminate:(id)a3
{
  [(SiriIntentsSnippetViewController *)self _finishLoadingViewIfNecessary];
  BOOL v4 = [(SiriIntentsSnippetViewController *)self view];
  id v5 = [v4 auxiliaryView];

  if (v5)
  {
    id v6 = [(SiriIntentsSnippetViewController *)self view];
    [v6 setAuxiliaryView:0 atIndex:0 initialHeight:1 animated:0 completion:0.0];
  }
}

- (void)presentDetailsForTemplateViewController:(id)a3
{
  BOOL v4 = [a3 templateModelPrivate];
  id v5 = [v4 detailIdentifier];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_detailSnippetsForAceIds objectForKey:v5];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = [(SiriIntentsSnippetViewController *)self delegate];
      id v10 = v7;
      long long v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [v8 siriSnippetViewController:self pushSirilandSnippets:v9];
    }
  }
}

- (void)selectionTemplateViewControllerWasSelected:(id)a3
{
  id v4 = a3;
  [v4 setSelected:1];
  id v5 = [v4 templateModelPrivate];
  uint64_t v6 = [v5 commandIdentifier];

  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_serverBoundCommandsForAceIds objectForKey:v6];
    if (v7)
    {
      double v8 = (void *)v7;
      pendingServerBoundCommandsForTemplateModelIdentifiers = self->_pendingServerBoundCommandsForTemplateModelIdentifiers;
      id v10 = [v4 templateModelPrivate];
      id v11 = [v10 modelIdentifier];
      [(NSMutableDictionary *)pendingServerBoundCommandsForTemplateModelIdentifiers setObject:v8 forKey:v11];
    }
  }
  uint64_t v12 = [(SiriIntentsSnippetViewController *)self childViewControllers];
  v13 = [v12 count];
  id v14 = [v12 indexOfObject:v4];
  id v15 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", v14, v13 - v14);
  id v16 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, v14 + 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_3B74;
  v18[3] = &unk_84C8;
  v18[4] = self;
  v18[5] = v14;
  id v17 = objc_retainBlock(v18);
  [v12 enumerateObjectsAtIndexes:v15 options:0 usingBlock:v17];
  [v12 enumerateObjectsAtIndexes:v16 options:2 usingBlock:v17];
}

- (void)mapTemplateViewController:(id)a3 didModifyPlacemark:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [v17 templateModelPrivate];
  double v8 = [v7 commandIdentifier];

  if (v8)
  {
    long long v9 = [(NSMutableDictionary *)self->_serverBoundCommandsForAceIds objectForKey:v8];
    if (v9)
    {
      id v10 = v9;
      if ([v9 conformsToProtocol:&OBJC_PROTOCOL___SAIntentGroupSetMapLocation])
      {
        id v11 = INIntentSlotValueTransformToLocation();
        id v12 = objc_alloc_init((Class)SAIntentGroupProtobufMessage);
        v13 = [v11 data];
        [v12 setData:v13];

        [v10 setLocation:v12];
      }
      pendingServerBoundCommandsForTemplateModelIdentifiers = self->_pendingServerBoundCommandsForTemplateModelIdentifiers;
      id v15 = [v17 templateModelPrivate];
      id v16 = [v15 modelIdentifier];
      [(NSMutableDictionary *)pendingServerBoundCommandsForTemplateModelIdentifiers setObject:v10 forKey:v16];
    }
  }
}

- (void)viewWantsDefaultTapAction:(id)a3
{
  id v4 = [(SAIntentGroupSnippet *)self->_snippet commands];
  id v5 = [v4 count];

  if (v5)
  {
    id v8 = [(SiriIntentsSnippetViewController *)self delegate];
    id v6 = [(SAIntentGroupSnippet *)self->_snippet commands];
    [v8 siriViewController:self performAceCommands:v6];
  }
  else
  {
    uint64_t v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SiriIntentsSnippetViewController viewWantsDefaultTapAction:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s No snippet commands to perform.", buf, 0xCu);
    }
  }
}

- (id)snippet
{
  return self->_snippet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appIconImage, 0);
  objc_storeStrong((id *)&self->_pendingServerBoundCommandsForTemplateModelIdentifiers, 0);
  objc_storeStrong((id *)&self->_serverBoundCommandsForAceIds, 0);
  objc_storeStrong((id *)&self->_detailSnippetsForAceIds, 0);
  objc_storeStrong((id *)&self->_templateViewControllerSetsByKeyPaths, 0);
  objc_storeStrong((id *)&self->_templateViewControllers, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_snippet, 0);
}

@end