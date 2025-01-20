@interface TKDefaultPage
- (TKDefaultPage)initWithDataRequest:(id)a3;
- (id)createViewController;
- (void)dataLoaded:(id)a3 withError:(id)a4;
- (void)loadChildPage:(id)a3 withError:(id)a4;
@end

@implementation TKDefaultPage

- (TKDefaultPage)initWithDataRequest:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)TKDefaultPage;
  v8 = [(TKPage *)&v6 initWithViewName:@"_"];
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    [(TKPage *)v8 setDataRequest:location[0]];
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)createViewController
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(TKContainerViewController);
  [v4[0] setTkPage:v5];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (void)dataLoaded:(id)a3 withError:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __38__TKDefaultPage_dataLoaded_withError___block_invoke;
  v10 = &unk_26485A9A0;
  v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __38__TKDefaultPage_dataLoaded_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadChildPage:withError:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

- (void)loadChildPage:(id)a3 withError:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = [(TKPage *)v19 viewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = (id)[location[0] objectForKeyedSubscript:@"view"];
    if ([v14 length])
    {
      id v13 = [[TKPage alloc] initWithViewName:v14];
      v4 = [(TKPage *)v19 dataRequest];
      -[TKPage setDataRequest:](v13, "setDataRequest:");

      [(TKPage *)v13 setData:location[0]];
      id v12 = [(TKPage *)v13 viewController];
      [v16 setChildViewController:v12];
      [(TKPage *)v19 didLoadData:1];
      [(TKPage *)v13 didLoadData:1];
      objc_storeStrong((id *)&v12, 0);
      objc_storeStrong((id *)&v13, 0);
      int v15 = 0;
    }
    else
    {
      v9 = [(TKPage *)v19 viewController];
      id v8 = +[TKApplicationViewController applicationViewController:](TKApplicationViewController, "applicationViewController:");
      char v10 = [v8 handleApplicationControllerError];

      if ((v10 & 1) == 0)
      {
        id v7 = +[TKApplication shared];
        id v6 = (id)[v17 localizedDescription];
        id v5 = (id)objc_msgSend(v7, "newErrorViewController:");
        objc_msgSend(v16, "setChildViewController:");
      }
      [(TKPage *)v19 dataError];
      int v15 = 1;
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    int v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

@end