@interface TKPage
- (BOOL)dataLoading;
- (BOOL)shouldShowLoading;
- (NSDictionary)data;
- (NSString)viewName;
- (NSURLRequest)dataRequest;
- (TKPage)initWithViewName:(id)a3;
- (UIViewController)viewController;
- (id)createViewController;
- (void)dataError;
- (void)dataLoaded:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)didFinishLoading:(id)a3 data:(id)a4 responseError:(id)a5;
- (void)didLoadData:(BOOL)a3;
- (void)dispose;
- (void)hideLoadingViewController;
- (void)load;
- (void)loadData:(id)a3 postData:(id)a4;
- (void)loadRequest:(id)a3;
- (void)reload;
- (void)reloadWithDelayedShowLoading:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDataRequest:(id)a3;
- (void)setShouldShowLoading:(BOOL)a3;
- (void)showLoadingViewController;
@end

@implementation TKPage

- (TKPage)initWithViewName:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)TKPage;
  v14 = [(TKPage *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    uint64_t v4 = [location[0] copy];
    viewName = v14->_viewName;
    v14->_viewName = (NSString *)v4;

    id v10 = objc_alloc(MEMORY[0x263F80CC8]);
    id v11 = objc_alloc_init(MEMORY[0x263F80CD0]);
    uint64_t v6 = objc_msgSend(v10, "initWithSchema:");
    dataObject = v14->_dataObject;
    v14->_dataObject = (TMLJSONObject *)v6;

    v14->_shouldShowLoading = 1;
  }
  v9 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(TKPage *)self dispose];
  v2.receiver = v4;
  v2.super_class = (Class)TKPage;
  [(TKPage *)&v2 dealloc];
}

- (UIViewController)viewController
{
  v5 = self;
  obj[1] = (id)a2;
  obj[0] = objc_loadWeakRetained((id *)&self->_weakViewController);
  if (!obj[0])
  {
    obj[0] = [(TKPage *)v5 createViewController];

    objc_storeWeak((id *)&v5->_weakViewController, obj[0]);
  }
  id v6 = obj[0];
  objc_storeStrong(obj, 0);
  objc_super v2 = v6;
  return (UIViewController *)v2;
}

- (id)createViewController
{
  v25 = self;
  v24[1] = (id)a2;
  id v13 = +[TKApplication shared];
  id v12 = (id)[v13 repository];
  v24[0] = (id)[v12 tmlPathForName:v25->_viewName];

  if ([v24[0] length])
  {
    id v22 = objc_alloc_init(MEMORY[0x263F80CB8]);
    id v9 = (id)[MEMORY[0x263F80CE0] weakReferenceWithObject:v25];
    objc_msgSend(v22, "addObject:withIdentifier:");

    [v22 addObject:v25->_dataObject withIdentifier:@"data"];
    [v22 makeWeakObjectWithIdentifier:@"owner"];
    if ([v22 loadSourceFromPath:v24[0]])
    {
      id v21 = (id)[v22 rootObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v21 setTkPage:v25];
        objc_storeStrong((id *)&v25->_context, v22);
        objc_initWeak(&location, v25);
        uint64_t v4 = (void *)MEMORY[0x263F80CD8];
        uint64_t v14 = MEMORY[0x263EF8330];
        int v15 = -1073741824;
        int v16 = 0;
        v17 = __30__TKPage_createViewController__block_invoke;
        v18 = &unk_26485AC20;
        objc_copyWeak(&v19, &location);
        [v4 runBlock:&v14 onFinalize:v21];
        id v26 = v21;
        int v23 = 1;
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
      else
      {
        id v6 = +[TKApplication shared];
        id v5 = (id)[NSString stringWithFormat:@"View failed to load (invalid root object): %@", v24[0]];
        id v26 = (id)objc_msgSend(v6, "newErrorViewController:");

        int v23 = 1;
      }
      objc_storeStrong(&v21, 0);
    }
    else
    {
      id v8 = +[TKApplication shared];
      id v7 = (id)[NSString stringWithFormat:@"View failed to load: %@", v24[0]];
      id v26 = (id)objc_msgSend(v8, "newErrorViewController:");

      int v23 = 1;
    }
    objc_storeStrong(&v22, 0);
  }
  else
  {
    id v11 = +[TKApplication shared];
    id v10 = (id)[NSString stringWithFormat:@"View not found: %@", v25->_viewName];
    id v26 = (id)objc_msgSend(v11, "newErrorViewController:");

    int v23 = 1;
  }
  objc_storeStrong(v24, 0);
  objc_super v2 = v26;
  return v2;
}

void __30__TKPage_createViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dispose];
}

- (void)dispose
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = self->_context;
  objc_storeStrong((id *)&v7->_context, 0);
  [v6[0] dispose];
  id v4 = objc_alloc(MEMORY[0x263F80CC8]);
  id v5 = (id)[(TMLJSONObject *)v7->_dataObject SCHEMA];
  uint64_t v2 = objc_msgSend(v4, "initWithSchema:");
  dataObject = v7->_dataObject;
  v7->_dataObject = (TMLJSONObject *)v2;

  objc_storeStrong((id *)&v7->_dataRequest, 0);
  objc_storeStrong(v6, 0);
}

- (NSDictionary)data
{
  return (NSDictionary *)[(TMLJSONObject *)self->_dataObject rawJSON];
}

- (void)setData:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(TMLJSONObject *)v4->_dataObject setRawJSONSync:location[0]];
  objc_storeStrong(location, 0);
}

- (void)load
{
  if (!self->_ready)
  {
    if (self->_dataRequest) {
      [(TKPage *)self reloadWithDelayedShowLoading:1];
    }
  }
}

- (void)reload
{
}

- (void)loadData:(id)a3 postData:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v7 = (id)[location[0] absoluteString];
  BOOL v8 = [v7 length] != 0;

  if (v8)
  {
    id v4 = objc_alloc(MEMORY[0x263F089E0]);
    id v9 = (id)[v4 initWithURL:location[0]];
    if ([v11 count])
    {
      id v5 = +[TKUtils httpDataURLEncoded:v11];
      objc_msgSend(v9, "setHTTPBody:");
    }
    [(TKPage *)v13 loadRequest:v9];
    objc_storeStrong(&v9, 0);
    int v10 = 0;
  }
  else
  {
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)loadRequest:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(TKPage *)v4 setDataRequest:location[0]];
  [(TKPage *)v4 reloadWithDelayedShowLoading:1];
  objc_storeStrong(location, 0);
}

- (void)reloadWithDelayedShowLoading:(BOOL)a3
{
  v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  if (self->_networkTask)
  {
    [(TKNetworkTask *)v18->_networkTask cancel];
    objc_storeStrong((id *)&v18->_networkTask, 0);
  }
  SEL v3 = [(NSURLRequest *)v18->_dataRequest URL];
  BOOL v8 = v3 != 0;

  if (v8)
  {
    -[TKPage willChangeValueForKey:](v18, "willChangeValueForKey:");
    v18->_dataLoading = 1;
    [(TKPage *)v18 didChangeValueForKey:@"dataLoading"];
    [(TKPage *)v18 showLoadingViewController];
    objc_initWeak(&location, v18);
    id v6 = +[TKNetwork shared];
    dataRequest = v18->_dataRequest;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = __39__TKPage_reloadWithDelayedShowLoading___block_invoke;
    id v13 = &unk_26485AC48;
    objc_copyWeak(v14, &location);
    id v4 = (TKNetworkTask *)(id)[v6 loadRequest:dataRequest priority:1 completion:&v9];
    networkTask = v18->_networkTask;
    v18->_networkTask = v4;

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __39__TKPage_reloadWithDelayedShowLoading___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained didFinishLoading:location[0] data:v9 responseError:v8];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didFinishLoading:(id)a3 data:(id)a4 responseError:(id)a5
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = v11;
  if (location[0] && v12)
  {
    id v8 = v10;
    id v5 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v12 options:0 error:&v8];
    objc_storeStrong(&v10, v8);
    id v9 = v5;
    [(TKPage *)v14 dataLoaded:v5 withError:v10];
    objc_storeStrong(&v9, 0);
  }
  else
  {
    [(TKPage *)v14 dataLoaded:0 withError:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)dataLoaded:(id)a3 withError:(id)a4
{
  int v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  objc_initWeak(&from, v23);
  if (location[0])
  {
    dataObject = v23->_dataObject;
    id v6 = location[0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    SEL v17 = __31__TKPage_dataLoaded_withError___block_invoke;
    v18 = &unk_26485AC98;
    objc_copyWeak(&v19, &from);
    [(TMLJSONObject *)dataObject setRawJSONAsync:v6 completion:&v14];
    objc_destroyWeak(&v19);
  }
  else
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __31__TKPage_dataLoaded_withError___block_invoke_3;
    id v12 = &unk_26485AC20;
    objc_copyWeak(&v13, &from);
    dispatch_async(queue, &v8);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&from);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __31__TKPage_dataLoaded_withError___block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  uint64_t v11 = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __31__TKPage_dataLoaded_withError___block_invoke_2;
  uint64_t v8 = &unk_26485AC70;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_destroyWeak(&v9);
}

void __31__TKPage_dataLoaded_withError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didLoadData:*(unsigned char *)(a1 + 40) & 1];
}

void __31__TKPage_dataLoaded_withError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dataError];
}

- (void)dataError
{
  self->_dataLoading = 0;
  [(TKPage *)self didChangeValueForKey:@"dataLoading"];
  [(TKPage *)self hideLoadingViewController];
  [(TKPage *)self emitTMLSignal:@"dataError" withArguments:&unk_26DD5EDE8];
}

- (void)didLoadData:(BOOL)a3
{
  BOOL v3 = a3;
  -[TKPage willChangeValueForKey:](self, "willChangeValueForKey:");
  self->_dataLoading = 0;
  [(TKPage *)self didChangeValueForKey:@"dataLoading"];
  [(TKPage *)self hideLoadingViewController];
  if (v3) {
    [(TKPage *)self emitTMLSignal:@"dataLoaded" withArguments:0];
  }
}

- (void)showLoadingViewController
{
  v40 = self;
  v39[1] = (id)a2;
  if (self->_shouldShowLoading)
  {
    v39[0] = objc_loadWeakRetained((id *)&v40->_loadingViewController);
    id WeakRetained = objc_loadWeakRetained((id *)&v40->_weakViewController);
    if (v39[0]
      || !WeakRetained
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v37 = 1;
    }
    else
    {
      id v36 = (id)[WeakRetained view];
      id v13 = +[TKApplication shared];
      uint64_t v2 = (void *)[v13 newLoadingViewController];
      id v3 = v39[0];
      v39[0] = v2;

      if (v39[0])
      {
        [WeakRetained addChildViewController:v39[0]];
        id v35 = (id)[v39[0] view];
        [v36 bounds];
        *(double *)&long long v33 = v4;
        *((double *)&v33 + 1) = v5;
        *(double *)&long long v34 = v6;
        *((double *)&v34 + 1) = v7;
        long long v31 = v33;
        long long v32 = v34;
        objc_msgSend(v35, "setFrame:", v4, v5, v6, v7);
        [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
        objc_opt_class();
        char v30 = (objc_opt_isKindOfClass() ^ 1) & 1;
        [v35 setAutoresizingMask:18];
        id v9 = (id)[MEMORY[0x263F82438] sharedApplication];
        [v9 statusBarOrientationAnimationDuration];
        double v10 = v8 / 2.0;

        double v29 = v10;
        char v12 = (void *)MEMORY[0x263F82E00];
        id v11 = v36;
        uint64_t v21 = MEMORY[0x263EF8330];
        int v22 = -1073741824;
        int v23 = 0;
        v24 = __35__TKPage_showLoadingViewController__block_invoke;
        v25 = &unk_26485ACC0;
        id v26 = v36;
        id v27 = v35;
        char v28 = v30 & 1;
        uint64_t v14 = MEMORY[0x263EF8330];
        int v15 = -1073741824;
        int v16 = 0;
        SEL v17 = __35__TKPage_showLoadingViewController__block_invoke_2;
        v18 = &unk_26485A9C8;
        id v19 = v39[0];
        id v20 = WeakRetained;
        [v12 transitionWithView:v11 duration:5243008 options:&v21 animations:&v14 completion:v10];
        objc_storeWeak((id *)&v40->_loadingViewController, v39[0]);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v35, 0);
        int v37 = 0;
      }
      else
      {
        int v37 = 1;
      }
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(&WeakRetained, 0);
    objc_storeStrong(v39, 0);
  }
}

void __35__TKPage_showLoadingViewController__block_invoke(uint64_t a1)
{
  v16[4] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    v1 = (void *)MEMORY[0x263F08938];
    id v14 = (id)[*(id *)(a1 + 40) leftAnchor];
    id v13 = (id)[*(id *)(a1 + 32) leftAnchor];
    id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v16[0] = v12;
    id v11 = (id)[*(id *)(a1 + 40) rightAnchor];
    id v10 = (id)[*(id *)(a1 + 32) rightAnchor];
    id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
    v16[1] = v9;
    id v8 = (id)[*(id *)(a1 + 40) topAnchor];
    id v7 = (id)[*(id *)(a1 + 32) topAnchor];
    id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
    v16[2] = v6;
    id v5 = (id)[*(id *)(a1 + 40) bottomAnchor];
    id v4 = (id)[*(id *)(a1 + 32) bottomAnchor];
    id v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
    v16[3] = v3;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
    objc_msgSend(v1, "activateConstraints:");
  }
}

uint64_t __35__TKPage_showLoadingViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
}

- (void)hideLoadingViewController
{
  int v23 = self;
  v22[1] = (id)a2;
  v22[0] = objc_loadWeakRetained((id *)&self->_loadingViewController);
  id WeakRetained = objc_loadWeakRetained((id *)&v23->_weakViewController);
  id v21 = (id)[WeakRetained viewIfLoaded];

  if (v22[0] && v21)
  {
    id v3 = (id)[MEMORY[0x263F82438] sharedApplication];
    [v3 statusBarOrientationAnimationDuration];
    double v4 = v2 / 2.0;

    v19[1] = *(id *)&v4;
    objc_msgSend(v22[0], "willMoveToParentViewController:");
    id v6 = (void *)MEMORY[0x263F82E00];
    id v5 = v21;
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    SEL v17 = __35__TKPage_hideLoadingViewController__block_invoke;
    v18 = &unk_26485A9F0;
    v19[0] = v22[0];
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __35__TKPage_hideLoadingViewController__block_invoke_2;
    id v12 = &unk_26485AA18;
    id v13 = v22[0];
    [v6 transitionWithView:v5 duration:5243008 options:&v14 animations:&v8 completion:v4];
    objc_storeWeak((id *)&v23->_loadingViewController, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v19, 0);
    int v20 = 0;
  }
  else
  {
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
}

void __35__TKPage_hideLoadingViewController__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 removeFromSuperview];
}

uint64_t __35__TKPage_hideLoadingViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromParentViewController];
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSURLRequest)dataRequest
{
  return self->_dataRequest;
}

- (void)setDataRequest:(id)a3
{
}

- (BOOL)dataLoading
{
  return self->_dataLoading;
}

- (BOOL)shouldShowLoading
{
  return self->_shouldShowLoading;
}

- (void)setShouldShowLoading:(BOOL)a3
{
  self->_shouldShowLoading = a3;
}

- (void).cxx_destruct
{
}

@end