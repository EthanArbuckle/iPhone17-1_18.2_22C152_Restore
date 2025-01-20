@interface WFContentGraphViewController
- (BOOL)coercing;
- (BOOL)useSmallBubbles;
- (CKForceLayoutAnimator)animator;
- (WFContentCoercionNodeView)rootNodeView;
- (WFContentGraphViewController)initWithContentItem:(id)a3;
- (WFContentItem)contentItem;
- (void)done;
- (void)loadView;
- (void)panNode:(id)a3;
- (void)setAnimator:(id)a3;
- (void)setCoercing:(BOOL)a3;
- (void)setRootNodeView:(id)a3;
- (void)tapNode:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFContentGraphViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (void)setCoercing:(BOOL)a3
{
  self->_coercing = a3;
}

- (BOOL)coercing
{
  return self->_coercing;
}

- (void)setRootNodeView:(id)a3
{
}

- (WFContentCoercionNodeView)rootNodeView
{
  return self->_rootNodeView;
}

- (void)setAnimator:(id)a3
{
}

- (CKForceLayoutAnimator)animator
{
  return self->_animator;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)panNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    animator = self->_animator;
    v7 = [v4 view];
    [(CKForceLayoutAnimator *)animator releaseNode:v7];
    goto LABEL_6;
  }
  if (v5 == 2)
  {
    v10 = [(CKForceLayoutAnimator *)self->_animator referenceView];
    [v4 translationInView:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v15 = [(CKForceLayoutAnimator *)self->_animator referenceView];
    objc_msgSend(v4, "setTranslation:inView:", v15, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, v12, v14);
    v16 = self->_animator;
    v17 = [v4 view];
    v18 = [v4 view];
    [v18 center];
    [(CKForceLayoutAnimator *)v16 fixNode:v17 atPosition:vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, v19), *(float64x2_t *)&v21.a, v20))];

    [(CKForceLayoutAnimator *)self->_animator setAlpha:0.100000001];
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    v6 = self->_animator;
    v7 = [v4 view];
    v8 = [v4 view];
    [v8 center];
    -[CKForceLayoutAnimator fixNode:atPosition:](v6, "fixNode:atPosition:", v7);

LABEL_6:
  }
LABEL_8:
}

- (void)done
{
}

- (void)tapNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFContentGraphViewController *)self presentedViewController];
  if (v5)
  {
  }
  else if (!self->_coercing)
  {
    v6 = [v4 view];
    v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
    [v7 setFromValue:&unk_26DF64F98];
    [v7 setToValue:&unk_26DF64FA8];
    [v7 setDuration:0.300000012];
    LODWORD(v8) = 2139095039;
    [v7 setRepeatCount:v8];
    [v7 setAutoreverses:1];
    v9 = [v6 layer];
    [v9 addAnimation:v7 forKey:@"pulsate"];

    self->_coercing = 1;
    v10 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__WFContentGraphViewController_tapNode___block_invoke;
    v12[3] = &unk_264900E88;
    id v13 = v6;
    CGFloat v14 = self;
    id v11 = v6;
    dispatch_async(v10, v12);
  }
}

void __40__WFContentGraphViewController_tapNode___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) node];
  v3 = (void *)[MEMORY[0x263F33768] new];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WFContentGraphViewController_tapNode___block_invoke_2;
  v6[3] = &unk_2649008F0;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 runCoercionWithOptions:v3 completionHandler:v6];
}

void __40__WFContentGraphViewController_tapNode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WFContentGraphViewController_tapNode___block_invoke_3;
  v11[3] = &unk_264900F78;
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __40__WFContentGraphViewController_tapNode___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      v2 = [WFContentItemViewController alloc];
      v3 = [*(id *)(a1 + 32) firstObject];
      id v4 = [(WFContentItemViewController *)v2 initWithContentItem:v3];

      if (!v4)
      {
LABEL_9:
        id v11 = [*(id *)(a1 + 48) layer];
        [v11 removeAnimationForKey:@"pulsate"];
        goto LABEL_10;
      }
    }
    else
    {
      if ((unint64_t)[*(id *)(a1 + 32) count] < 2) {
        goto LABEL_9;
      }
      id v4 = objc_alloc_init(WFContentItemsViewController);
      [(WFContentItemsViewController *)v4 setContentItems:*(void *)(a1 + 32)];
      if (!v4) {
        goto LABEL_9;
      }
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v4];
    double v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 40) action:sel_done];
    id v9 = [(WFContentItemsViewController *)v4 navigationItem];
    [v9 setRightBarButtonItem:v8];

    [v7 setModalPresentationStyle:2];
    id v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__WFContentGraphViewController_tapNode___block_invoke_4;
    v12[3] = &unk_264900E88;
    void v12[4] = v10;
    id v13 = *(id *)(a1 + 48);
    [v10 presentViewController:v7 animated:1 completion:v12];

    return;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 976) = 0;
  id v5 = [*(id *)(a1 + 48) layer];
  [v5 removeAnimationForKey:@"pulsate"];

  WFUserInterfaceFromViewController();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [MEMORY[0x263F336E8] alertWithError:*(void *)(a1 + 56)];
  [v11 presentAlert:v6];

LABEL_10:
}

void __40__WFContentGraphViewController_tapNode___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = 0;
  id v1 = [*(id *)(a1 + 40) layer];
  [v1 removeAnimationForKey:@"pulsate"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContentGraphViewController;
  [(WFContentGraphViewController *)&v4 viewDidDisappear:a3];
  [(CKForceLayoutAnimator *)self->_animator stop];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)WFContentGraphViewController;
  [(WFContentGraphViewController *)&v7 viewDidLayoutSubviews];
  v3 = [(WFContentGraphViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  id v6 = [v5 colorWithAlphaComponent:0.95];
  [v4 setBackgroundColor:v6];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)WFContentGraphViewController;
  [(WFContentGraphViewController *)&v5 viewDidLayoutSubviews];
  animator = self->_animator;
  [(CKForceLayoutAnimator *)animator alpha];
  [(CKForceLayoutAnimator *)animator setAlpha:v4 + 0.100000001];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContentGraphViewController;
  [(WFContentGraphViewController *)&v4 viewWillAppear:a3];
  [(CKForceLayoutAnimator *)self->_animator start];
}

- (void)loadView
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)WFContentGraphViewController;
  [(WFContentGraphViewController *)&v41 loadView];
  v2 = [(WFContentGraphViewController *)self view];
  [v2 setClipsToBounds:1];

  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  objc_super v4 = [(WFContentGraphViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [CKForceLayoutAnimator alloc];
  id v6 = [(WFContentGraphViewController *)self view];
  objc_super v7 = [(CKForceLayoutAnimator *)v5 initWithReferenceView:v6];
  p_animator = &self->_animator;
  animator = self->_animator;
  self->_animator = v7;

  BOOL v10 = [(WFContentGraphViewController *)self useSmallBubbles];
  double v11 = 150.0;
  if (v10) {
    double v11 = 60.0;
  }
  -[CKForceLayoutAnimator setLinkDistance:](*p_animator, "setLinkDistance:", v11, 992);
  BOOL v12 = [(WFContentGraphViewController *)self useSmallBubbles];
  double v13 = -5000.0;
  if (v12) {
    double v13 = -1000.0;
  }
  [(CKForceLayoutAnimator *)*p_animator setCharge:v13];
  uint64_t v35 = 0;
  v36 = (id *)&v35;
  uint64_t v37 = 0x3042000000;
  v38 = __Block_byref_object_copy__4343;
  v39 = __Block_byref_object_dispose__4344;
  id v40 = 0;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __40__WFContentGraphViewController_loadView__block_invoke;
  v34[3] = &unk_2649008C8;
  v34[4] = self;
  v34[5] = &v35;
  id v14 = (uint64_t (**)(void, void))[v34 copy];
  objc_storeWeak(v36 + 5, v14);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = [(WFContentItem *)self->_contentItem allSupportedItemClasses];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    id obj = v15;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        double v20 = (void *)MEMORY[0x263F337A8];
        contentItem = self->_contentItem;
        v22 = (void *)[MEMORY[0x263F33768] new];
        v23 = [v20 searchForCoercingItem:contentItem toItemClass:v19 options:v22];

        for (j = 0; ; j = (void *)v25)
        {
          uint64_t v25 = [v23 nextPathNode];

          if (!v25) {
            break;
          }
          id v26 = (id)v14[2](v14, v25);
        }
      }
      id v15 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v16);
  }

  [*(id *)((char *)&self->super.super.super.isa + v27) setAlpha:0.25];
  _Block_object_dispose(&v35, 8);
  objc_destroyWeak(&v40);
}

WFContentCoercionNodeView *__40__WFContentGraphViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 992) nodes];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __40__WFContentGraphViewController_loadView__block_invoke_2;
    v31[3] = &unk_2649008A0;
    id v5 = v3;
    id v32 = v5;
    id v6 = [v4 objectsPassingTest:v31];
    objc_super v7 = [v6 anyObject];

    if (!v7)
    {
      double v8 = *MEMORY[0x263F00148];
      double v9 = *(double *)(MEMORY[0x263F00148] + 8);
      if ([*(id *)(a1 + 32) useSmallBubbles]) {
        double v10 = 50.0;
      }
      else {
        double v10 = 100.0;
      }
      double v11 = [WFContentCoercionNodeView alloc];
      BOOL v12 = [v5 parent];
      objc_super v7 = -[WFContentCoercionNodeView initWithFrame:isRootNode:](v11, "initWithFrame:isRootNode:", v12 == 0, v8, v9, v10, v10);

      [(WFContentCoercionNodeView *)v7 setNode:v5];
      double v13 = [(WFContentCoercionNodeView *)v7 node];
      id v14 = [v13 parent];

      if (v14)
      {
        id v15 = [*(id *)(a1 + 32) view];
        [v15 bounds];
        double Width = CGRectGetWidth(v34);
        uint64_t v17 = [*(id *)(a1 + 32) view];
        [v17 bounds];
        CGFloat v18 = CGRectGetWidth(v35);
        double v19 = Width + (double)arc4random_uniform(v18);
        double v20 = [*(id *)(a1 + 32) view];
        [v20 bounds];
        CGFloat Height = CGRectGetHeight(v36);
        -[WFContentCoercionNodeView setCenter:](v7, "setCenter:", v19, (double)arc4random_uniform(Height));
      }
      v22 = [*(id *)(a1 + 32) view];
      [v22 addSubview:v7];

      [*(id *)(*(void *)(a1 + 32) + 992) addNode:v7];
      v23 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:*(void *)(a1 + 32) action:sel_tapNode_];
      v24 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:*(void *)(a1 + 32) action:sel_panNode_];
      [(WFContentCoercionNodeView *)v7 addGestureRecognizer:v23];
      [(WFContentCoercionNodeView *)v7 addGestureRecognizer:v24];
    }
    uint64_t v25 = [(WFContentCoercionNodeView *)v7 node];
    id v26 = [v25 parent];

    if (!v26) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1000), v7);
    }
    WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 40));
    v28 = [v5 parent];
    v29 = WeakRetained[2](WeakRetained, v28);

    if (v29) {
      [*(id *)(*(void *)(a1 + 32) + 992) linkNode:v7 toNode:v29];
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

uint64_t __40__WFContentGraphViewController_loadView__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [MEMORY[0x263EFF980] array];
  objc_super v7 = [v5 node];
  double v8 = [v7 parent];

  if (v8)
  {
    do
    {
      double v9 = [v8 itemOrItemClass];
      [v6 addObject:objc_opt_class()];

      uint64_t v10 = [v8 parent];

      double v8 = (void *)v10;
    }
    while (v10);
  }
  double v11 = [MEMORY[0x263EFF980] array];
  uint64_t v12 = [*(id *)(a1 + 32) parent];
  if (v12)
  {
    double v13 = (void *)v12;
    do
    {
      id v14 = [v13 itemOrItemClass];
      [v11 addObject:objc_opt_class()];

      uint64_t v15 = [v13 parent];

      double v13 = (void *)v15;
    }
    while (v15);
  }
  uint64_t v16 = [v5 node];
  uint64_t v17 = [v16 itemOrItemClass];
  uint64_t v18 = objc_opt_class();
  double v19 = [*(id *)(a1 + 32) itemOrItemClass];
  if (v18 == objc_opt_class()) {
    char v20 = [v6 isEqual:v11];
  }
  else {
    char v20 = 0;
  }
  *a3 = v20;

  uint64_t v21 = *a3;
  return v21;
}

- (BOOL)useSmallBubbles
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (WFContentGraphViewController)initWithContentItem:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContentGraphViewController.m", 29, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContentGraphViewController;
  objc_super v7 = [(WFContentGraphViewController *)&v12 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentItem, a3);
    double v9 = WFLocalizedString(@"Content Item Graph");
    [(WFContentGraphViewController *)v8 setTitle:v9];
  }
  return v8;
}

@end