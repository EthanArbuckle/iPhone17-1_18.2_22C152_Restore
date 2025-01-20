@interface AMSUIWebFlowAction
- (AMSUIWebFlowAction)initWithContext:(id)a3;
- (AMSUIWebFlowAction)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebLoadingPageModel)loadingPage;
- (AMSUIWebNavigationBarModel)navigationBar;
- (AMSUIWebPageProvider)replacementPage;
- (BOOL)deferredPresentation;
- (CGSize)modalWindowSize;
- (NSDictionary)metrics;
- (NSString)backgroundColor;
- (id)actionData;
- (id)runAction;
- (int64_t)animationType;
- (int64_t)popToRelativeIndex;
- (int64_t)presentationType;
- (int64_t)replacementType;
- (void)_runWithType:(int64_t)a3 options:(id)a4;
- (void)setActionData:(id)a3;
- (void)setAnimationType:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDeferredPresentation:(BOOL)a3;
- (void)setLoadingPage:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setModalWindowSize:(CGSize)a3;
- (void)setNavigationBar:(id)a3;
- (void)setPopToRelativeIndex:(int64_t)a3;
- (void)setPresentationType:(int64_t)a3;
- (void)setReplacementPage:(id)a3;
- (void)setReplacementType:(int64_t)a3;
@end

@implementation AMSUIWebFlowAction

- (AMSUIWebFlowAction)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebFlowAction;
  result = [(AMSUIWebAction *)&v4 initWithContext:a3];
  if (result) {
    result->_presentationType = 5;
  }
  return result;
}

- (AMSUIWebFlowAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)AMSUIWebFlowAction;
  v8 = [(AMSUIWebAction *)&v43 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"animationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v42 = v10;
    uint64_t v11 = [v10 integerValue];
    v12 = [v6 objectForKeyedSubscript:@"actionData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    id actionData = v8->_actionData;
    v8->_id actionData = v13;

    v8->_animationType = v11;
    v15 = [v6 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }

    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = v16;

    v18 = [v6 objectForKeyedSubscript:@"metrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }

    metrics = v8->_metrics;
    v8->_metrics = v19;

    +[AMSUIWebModel windowSizeFromJSObject:v6 key:@"modalWindowSize"];
    v8->_modalWindowSize.width = v21;
    v8->_modalWindowSize.height = v22;
    v23 = [v6 objectForKeyedSubscript:@"deferredPresentation"];
    if (objc_opt_respondsToSelector()) {
      char v24 = [v23 BOOLValue];
    }
    else {
      char v24 = 0;
    }
    v8->_deferredPresentation = v24;
    v25 = [v6 objectForKeyedSubscript:@"loadingPage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }

    v27 = [[AMSUIWebLoadingPageModel alloc] initWithJSObject:v26 context:v7];
    loadingPage = v8->_loadingPage;
    v8->_loadingPage = v27;

    v29 = [v6 objectForKeyedSubscript:@"navigationBar"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    v31 = [[AMSUIWebNavigationBarModel alloc] initWithJSObject:v30 context:v7];
    navigationBar = v8->_navigationBar;
    v8->_navigationBar = v31;

    v33 = [v6 objectForKeyedSubscript:@"popToRelativeIndex"];
    if (objc_opt_respondsToSelector())
    {
      v34 = [v6 objectForKeyedSubscript:@"popToRelativeIndex"];
      v8->_popToRelativeIndex = [v34 longLongValue];
    }
    else
    {
      v8->_popToRelativeIndex = 0x8000000000000000;
    }

    v35 = [v6 objectForKeyedSubscript:@"presentationType"];
    if (objc_opt_respondsToSelector()) {
      v8->_presentationType = [v35 integerValue];
    }
    v36 = [v6 objectForKeyedSubscript:@"replacementPage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }

    if (v37)
    {
      uint64_t v38 = +[AMSUIWebModel pageModelFromJSObject:v37 context:v7];
      replacementPage = v8->_replacementPage;
      v8->_replacementPage = (AMSUIWebPageProvider *)v38;
    }
    v40 = [v6 objectForKeyedSubscript:@"replacementType"];
    if (objc_opt_respondsToSelector()) {
      v8->_replacementType = [v40 integerValue];
    }
  }
  return v8;
}

- (id)runAction
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebFlowAction;
  id v3 = [(AMSUIWebAction *)&v26 runAction];
  objc_super v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int64_t v8 = [(AMSUIWebFlowAction *)self presentationType];
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v6;
    __int16 v29 = 2114;
    id v30 = v7;
    __int16 v31 = 2048;
    int64_t v32 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running flow action with type: %ld", buf, 0x20u);
  }
  v9 = [(AMSUIWebAction *)self context];
  if (([v9 bootstrapComplete] & 1) != 0
    || [(AMSUIWebFlowAction *)self presentationType] == 4)
  {

LABEL_8:
    id v10 = objc_alloc_init(AMSUIWebFlowOptions);
    [(AMSUIWebFlowOptions *)v10 setAnimated:[(AMSUIWebFlowAction *)self animationType] != 0];
    uint64_t v11 = [(AMSUIWebFlowAction *)self backgroundColor];
    [(AMSUIWebFlowOptions *)v10 setBackgroundColor:v11];

    v12 = [(AMSUIWebFlowAction *)self loadingPage];
    [(AMSUIWebFlowOptions *)v10 setLoadingPage:v12];

    id v13 = [(AMSUIWebFlowAction *)self navigationBar];
    [(AMSUIWebFlowOptions *)v10 setNavigationBar:v13];

    v14 = [(AMSUIWebFlowAction *)self actionData];
    [(AMSUIWebFlowOptions *)v10 setPageData:v14];

    [(AMSUIWebFlowOptions *)v10 setDeferredPresentation:[(AMSUIWebFlowAction *)self deferredPresentation]];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    CGFloat v22 = __31__AMSUIWebFlowAction_runAction__block_invoke;
    v23 = &unk_2643E34D0;
    char v24 = self;
    v25 = v10;
    v15 = v10;
    dispatch_async(MEMORY[0x263EF83A0], &v20);
    v16 = objc_msgSend(MEMORY[0x263F27E10], "promiseWithResult:", MEMORY[0x263EFFA88], v20, v21, v22, v23, v24);

    goto LABEL_9;
  }
  int64_t v18 = [(AMSUIWebFlowAction *)self presentationType];

  if (v18 == 5) {
    goto LABEL_8;
  }
  v19 = (void *)MEMORY[0x263F27E10];
  AMSError();
  v15 = (AMSUIWebFlowOptions *)objc_claimAutoreleasedReturnValue();
  v16 = [v19 promiseWithError:v15];
LABEL_9:

  return v16;
}

uint64_t __31__AMSUIWebFlowAction_runAction__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 presentationType];
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 _runWithType:v3 options:v4];
}

- (void)_runWithType:(int64_t)a3 options:(id)a4
{
  id v16 = a4;
  v5 = [(AMSUIWebAction *)self context];
  uint64_t v6 = [v5 flowController];

  switch([(AMSUIWebFlowAction *)self presentationType])
  {
    case 0:
      if ([(AMSUIWebFlowAction *)self replacementType])
      {
        id v7 = [(AMSUIWebFlowAction *)self replacementPage];
        int64_t v8 = [(AMSUIWebAction *)self context];
        v9 = [v8 flowController];
        id v10 = [v9 currentContainer];
        id v11 = (id)[v6 replaceWithPageModel:v7 forContainer:v10 options:v16];
      }
      else
      {
        v12 = [(AMSUIWebAction *)self context];
        id v13 = [v12 flowController];
        v14 = [v13 currentContainer];
        id v15 = (id)[v6 refreshPageForContainer:v14 options:v16];
      }
      break;
    case 1:
    case 3:
      objc_msgSend(v16, "setModalPresentationStyle:", -[AMSUIWebFlowAction presentationType](self, "presentationType") != 3);
      objc_msgSend(v16, "setModalTransitionStyle:", -[AMSUIWebFlowAction animationType](self, "animationType") == 2);
      [(AMSUIWebFlowAction *)self modalWindowSize];
      objc_msgSend(v16, "setModalWindowSize:");
      [v6 presentWithOptions:v16];
      break;
    case 2:
      [v6 pushWithOptions:v16];
      break;
    case 4:
      [v6 dismissViewController];
      break;
    case 5:
      if ([(AMSUIWebFlowAction *)self popToRelativeIndex] == 0x8000000000000000) {
        [v6 popViewController];
      }
      else {
        objc_msgSend(v6, "popViewControllerToRelativeIndex:", -[AMSUIWebFlowAction popToRelativeIndex](self, "popToRelativeIndex"));
      }
      break;
    default:
      break;
  }
}

- (id)actionData
{
  return self->_actionData;
}

- (void)setActionData:(id)a3
{
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)deferredPresentation
{
  return self->_deferredPresentation;
}

- (void)setDeferredPresentation:(BOOL)a3
{
  self->_deferredPresentation = a3;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (AMSUIWebLoadingPageModel)loadingPage
{
  return self->_loadingPage;
}

- (void)setLoadingPage:(id)a3
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (CGSize)modalWindowSize
{
  double width = self->_modalWindowSize.width;
  double height = self->_modalWindowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setModalWindowSize:(CGSize)a3
{
  self->_modalWindowSize = a3;
}

- (AMSUIWebNavigationBarModel)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (int64_t)popToRelativeIndex
{
  return self->_popToRelativeIndex;
}

- (void)setPopToRelativeIndex:(int64_t)a3
{
  self->_popToRelativeIndex = a3;
}

- (int64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(int64_t)a3
{
  self->_presentationType = a3;
}

- (AMSUIWebPageProvider)replacementPage
{
  return self->_replacementPage;
}

- (void)setReplacementPage:(id)a3
{
}

- (int64_t)replacementType
{
  return self->_replacementType;
}

- (void)setReplacementType:(int64_t)a3
{
  self->_replacementType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementPage, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_loadingPage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong(&self->_actionData, 0);
}

@end