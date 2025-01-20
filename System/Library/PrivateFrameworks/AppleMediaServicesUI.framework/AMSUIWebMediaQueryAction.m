@interface AMSUIWebMediaQueryAction
- (AMSUIWebMediaQueryAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)bundleIDs;
- (NSArray)storeItemIDs;
- (NSNumber)observing;
- (id)runAction;
- (void)setBundleIDs:(id)a3;
- (void)setObserving:(id)a3;
- (void)setStoreItemIDs:(id)a3;
@end

@implementation AMSUIWebMediaQueryAction

- (AMSUIWebMediaQueryAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebMediaQueryAction;
  v7 = [(AMSUIWebAction *)&v19 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"bundleIDs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    bundleIDs = v7->_bundleIDs;
    v7->_bundleIDs = v9;

    v11 = [v6 objectForKeyedSubscript:@"observing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v13 = v12;
    if (!v12)
    {
      v14 = [v6 objectForKeyedSubscript:@"enabled"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v14;
      }
      else {
        id v13 = 0;
      }
    }
    objc_storeStrong((id *)&v7->_observing, v13);
    if (!v12) {

    }
    v15 = [v6 objectForKeyedSubscript:@"storeItemIDs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }

    storeItemIDs = v7->_storeItemIDs;
    v7->_storeItemIDs = v16;
  }
  return v7;
}

- (id)runAction
{
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebMediaQueryAction;
  id v3 = [(AMSUIWebAction *)&v16 runAction];
  v4 = [(AMSUIWebMediaQueryAction *)self observing];
  uint64_t v5 = [(AMSUIWebMediaQueryAction *)self bundleIDs];
  uint64_t v6 = [(AMSUIWebMediaQueryAction *)self storeItemIDs];
  v7 = [(AMSUIWebAction *)self context];
  v8 = [v7 dataProvider];
  v9 = [v8 appQueryManager];

  if (v4 && ([v4 BOOLValue] & 1) == 0)
  {
    if (v5 | v6)
    {
      [v9 stopObservingAppsWithBundleIDs:v5];
      [v9 stopObservingAppsWithStoreItemIDs:v6];
    }
    else
    {
      [v9 stopObservingAllApps];
    }
    v14 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    if ([(id)v5 count])
    {
      v11 = objc_msgSend(v9, "queryAppsWithBundleIDs:startObserving:", v5, objc_msgSend(v4, "BOOLValue"));
      [v10 addObject:v11];
    }
    if ([(id)v6 count])
    {
      id v12 = objc_msgSend(v9, "queryAppsWithStoreItemIDs:startObserving:", v6, objc_msgSend(v4, "BOOLValue"));
      [v10 addObject:v12];
    }
    id v13 = [MEMORY[0x263F27B58] promiseWithAll:v10];
    v14 = [v13 promiseAdapter];
  }
  return v14;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSNumber)observing
{
  return self->_observing;
}

- (void)setObserving:(id)a3
{
}

- (NSArray)storeItemIDs
{
  return self->_storeItemIDs;
}

- (void)setStoreItemIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemIDs, 0);
  objc_storeStrong((id *)&self->_observing, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end