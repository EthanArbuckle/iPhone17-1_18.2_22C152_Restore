@interface FCUICAPackageView
+ (id)packageViewForActivity:(id)a3;
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (CAStateControllerDelegate)stateControllerDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4;
- (FCUICAPackageView)initWithURL:(id)a3;
- (NSArray)publishedObjectNames;
- (id)publishedObjectWithName:(id)a3;
- (void)_clearPendingCompletion;
- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)layoutSubviews;
- (void)setStateControllerDelegate:(id)a3;
- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
- (void)updateStateWithName:(id)a3 updateHandler:(id)a4;
@end

@implementation FCUICAPackageView

- (FCUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  v5 = [a4 URLForResource:a3 withExtension:@"ca"];
  v6 = [(FCUICAPackageView *)self initWithURL:v5];

  return v6;
}

- (FCUICAPackageView)initWithURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F15EE8];
  id v35 = 0;
  v6 = [MEMORY[0x263F15838] packageWithContentsOfURL:v4 type:v5 options:0 error:&v35];
  id v7 = v35;
  v8 = [v6 rootLayer];
  [v8 frame];
  v34.receiver = self;
  v34.super_class = (Class)FCUICAPackageView;
  v9 = -[FCUICAPackageView initWithFrame:](&v34, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    id v28 = v7;
    id v29 = v4;
    p_rootLayer = (id *)&v9->_rootLayer;
    objc_storeStrong((id *)&v9->_rootLayer, v8);
    [v8 frame];
    v10->_originalSize.width = v12;
    v10->_originalSize.height = v13;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    v14 = [(FCUICAPackageView *)v10 layer];
    [v14 addSublayer:*p_rootLayer];

    v15 = [v6 publishedObjectNames];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = 0;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v22 = [v6 publishedObjectWithName:v21];
          if (v22)
          {
            if (!v18) {
              v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v15, "count"));
            }
            [v18 setObject:v22 forKey:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    uint64_t v23 = [v18 copy];
    publishedObjectMap = v10->_publishedObjectMap;
    v10->_publishedObjectMap = (NSDictionary *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263F158B0]) initWithLayer:v10->_rootLayer];
    stateController = v10->_stateController;
    v10->_stateController = (CAStateController *)v25;

    [(CAStateController *)v10->_stateController setDelegate:v10];
    id v7 = v28;
    id v4 = v29;
  }

  return v10;
}

+ (id)packageViewForActivity:(id)a3
{
  id v3 = a3;
  id v4 = FCUIPackageNameForActivity(v3);
  if ([v4 length])
  {
    uint64_t v5 = [FCUICAPackageView alloc];
    v6 = FCUIBundle();
    id v7 = [(FCUICAPackageView *)v5 initWithPackageName:v4 inBundle:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__FCUICAPackageView_packageViewForActivity___block_invoke;
    v9[3] = &unk_264542EE8;
    id v10 = v3;
    [(FCUICAPackageView *)v7 updateStateWithName:@"ON" updateHandler:v9];
    [(FCUICAPackageView *)v7 setUserInteractionEnabled:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __44__FCUICAPackageView_packageViewForActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = (void *)[a2 copy];
    id v4 = [v3 elements];
    uint64_t v5 = (void *)[v4 copy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          CGFloat v12 = objc_msgSend(v11, "keyPath", (void)v19);
          int v13 = [v12 isEqualToString:@"fillColor"];

          if (v13)
          {
            id v14 = objc_alloc_init(MEMORY[0x263F158D0]);
            v15 = [v11 target];
            [v14 setTarget:v15];

            uint64_t v16 = [v11 keyPath];
            [v14 setKeyPath:v16];

            objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", *(void *)(a1 + 32));
            id v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setValue:", objc_msgSend(v17, "CGColor"));

            [v3 removeElement:v11];
            [v3 addElement:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)publishedObjectWithName:(id)a3
{
  return [(NSDictionary *)self->_publishedObjectMap objectForKey:a3];
}

- (NSArray)publishedObjectNames
{
  return [(NSDictionary *)self->_publishedObjectMap allKeys];
}

- (BOOL)setState:(id)a3
{
  return [(FCUICAPackageView *)self setState:a3 animated:1];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(FCUICAPackageView *)self setState:a3 animated:a4 transitionSpeed:0 completion:1.0];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return [(FCUICAPackageView *)self setState:a3 onLayer:self->_rootLayer animated:a4 transitionSpeed:a6 completion:a5];
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, uint64_t))a7;
  v15 = [v13 stateWithName:v12];
  if (v15)
  {
    if (v9)
    {
      if (v14)
      {
        id v17 = [(CAStateController *)self->_stateController stateOfLayer:v13];
        v18 = [v17 name];
        [(FCUICAPackageView *)self _setPendingCompletion:v14 fromState:v18 toState:v12];
      }
      *(float *)&double v16 = a6;
      [(CAStateController *)self->_stateController setState:v15 ofLayer:v13 transitionSpeed:v16];
    }
    else
    {
      [(FCUICAPackageView *)self _clearPendingCompletion];
      [(CAStateController *)self->_stateController setState:v15 ofLayer:v13];
      if (v14) {
        v14[2](v14, 1);
      }
    }
  }
  else if (v14)
  {
    v14[2](v14, 0);
  }

  return v15 != 0;
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  return (CAStateControllerDelegate *)WeakRetained;
}

- (void)setStateControllerDelegate:(id)a3
{
}

- (void)updateStateWithName:(id)a3 updateHandler:(id)a4
{
  rootLayer = self->_rootLayer;
  uint64_t v7 = (void (**)(id, id))a4;
  id v10 = [(CALayer *)rootLayer stateWithName:a3];
  uint64_t v8 = v7[2](v7, v10);

  if (v10) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    [(CALayer *)self->_rootLayer removeState:v10];
    [(CALayer *)self->_rootLayer addState:v8];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)FCUICAPackageView;
  [(FCUICAPackageView *)&v8 layoutSubviews];
  [(FCUICAPackageView *)self bounds];
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height) {
    double v5 = v4 / self->_originalSize.height;
  }
  else {
    double v5 = v3 / self->_originalSize.width;
  }
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  [(CALayer *)rootLayer setTransform:&v7];
}

- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained stateController:v8 didSetStateOfLayer:v6];
  }
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v11 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v10 = a5;
    [WeakRetained stateController:v11 transitionDidStart:v8 speed:v10];
  }
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (self->_pendingCompletion)
  {
    double v10 = [v8 toState];
    int v11 = [v10 isEqualToString:self->_pendingCompletionToState];

    if (v11)
    {
      (*((void (**)(void))self->_pendingCompletion + 2))();
      id pendingCompletion = self->_pendingCompletion;
      self->_id pendingCompletion = 0;

      pendingCompletionFromState = self->_pendingCompletionFromState;
      self->_pendingCompletionFromState = 0;

      pendingCompletionToState = self->_pendingCompletionToState;
      self->_pendingCompletionToState = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained stateController:v16 transitionDidStop:v9 completed:v5];
  }
}

- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id pendingCompletion = (void (**)(id, void))self->_pendingCompletion;
  if (pendingCompletion) {
    pendingCompletion[2](pendingCompletion, 0);
  }
  int v11 = (void *)[v17 copy];
  id v12 = self->_pendingCompletion;
  self->_id pendingCompletion = v11;

  id v13 = (NSString *)[v8 copy];
  pendingCompletionFromState = self->_pendingCompletionFromState;
  self->_pendingCompletionFromState = v13;

  v15 = (NSString *)[v9 copy];
  pendingCompletionToState = self->_pendingCompletionToState;
  self->_pendingCompletionToState = v15;
}

- (void)_clearPendingCompletion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingCompletionFromState, 0);
  objc_storeStrong((id *)&self->_pendingCompletionToState, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_destroyWeak((id *)&self->_stateControllerDelegate);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end