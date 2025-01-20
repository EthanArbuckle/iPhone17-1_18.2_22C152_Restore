@interface BSUICAPackageView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (BSUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4;
- (BSUICAPackageView)initWithURL:(id)a3;
- (CAStateControllerDelegate)stateControllerDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)publishedObjectNames;
- (id)publishedObjectWithName:(id)a3;
- (void)_setPendingCompletion:(void *)a3 fromState:(void *)a4 toState:;
- (void)layoutSubviews;
- (void)setStateControllerDelegate:(id)a3;
- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
@end

@implementation BSUICAPackageView

- (BSUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  v5 = [a4 URLForResource:a3 withExtension:@"ca"];
  v6 = [(BSUICAPackageView *)self initWithURL:v5];

  return v6;
}

- (BSUICAPackageView)initWithURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F3A4C0];
  id v34 = 0;
  id v24 = v4;
  v6 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v4 type:v5 options:0 error:&v34];
  id v25 = v34;
  id obj = [v6 rootLayer];
  [obj frame];
  v33.receiver = self;
  v33.super_class = (Class)BSUICAPackageView;
  v7 = -[BSUICAPackageView initWithFrame:](&v33, sel_initWithFrame_);
  if (v7)
  {
    v28 = v7;
    p_rootLayer = (id *)&v7->_rootLayer;
    objc_storeStrong((id *)&v7->_rootLayer, obj);
    [obj frame];
    v28->_originalSize.width = v8;
    v28->_originalSize.height = v9;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    v10 = [(BSUICAPackageView *)v28 layer];
    [v10 addSublayer:*p_rootLayer];

    [v6 publishedObjectNames];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v17 = [v6 publishedObjectWithName:v16];
          if (v17)
          {
            if (!v12) {
              v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
            }
            [v12 setObject:v17 forKey:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v13);
    }

    uint64_t v18 = [v12 copy];
    publishedObjectMap = v28->_publishedObjectMap;
    v28->_publishedObjectMap = (NSDictionary *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:*p_rootLayer];
    stateController = v28->_stateController;
    v28->_stateController = (CAStateController *)v20;

    [(CAStateController *)v28->_stateController setDelegate:v28];
    v7 = v28;
  }
  v22 = v7;

  return v22;
}

- (id)publishedObjectWithName:(id)a3
{
  v3 = [(NSDictionary *)self->_publishedObjectMap objectForKey:a3];

  return v3;
}

- (NSArray)publishedObjectNames
{
  return [(NSDictionary *)self->_publishedObjectMap allKeys];
}

- (BOOL)setState:(id)a3
{
  return [(BSUICAPackageView *)self setState:a3 animated:1];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(BSUICAPackageView *)self setState:a3 animated:a4 transitionSpeed:0 completion:1.0];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return [(BSUICAPackageView *)self setState:a3 onLayer:self->_rootLayer animated:a4 transitionSpeed:a6 completion:a5];
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [v13 stateWithName:v12];
  if (v15)
  {
    if (v9)
    {
      if (v14)
      {
        v17 = [(CAStateController *)self->_stateController stateOfLayer:v13];
        uint64_t v18 = [v17 name];
        -[BSUICAPackageView _setPendingCompletion:fromState:toState:](self, v14, v18, v12);
      }
      *(float *)&double v16 = a6;
      [(CAStateController *)self->_stateController setState:v15 ofLayer:v13 transitionSpeed:v16];
      goto LABEL_11;
    }
    if (self) {
      -[BSUICAPackageView _setPendingCompletion:fromState:toState:](self, 0, 0, 0);
    }
    [(CAStateController *)self->_stateController setState:v15 ofLayer:v13];
  }
  if (v14) {
    (*((void (**)(id, BOOL))v14 + 2))(v14, v15 != 0);
  }
LABEL_11:

  return v15 != 0;
}

- (void)_setPendingCompletion:(void *)a3 fromState:(void *)a4 toState:
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = a1[58];
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
    uint64_t v10 = [v16 copy];
    id v11 = (void *)a1[58];
    a1[58] = v10;

    uint64_t v12 = [v7 copy];
    id v13 = (void *)a1[57];
    a1[57] = v12;

    uint64_t v14 = [v8 copy];
    v15 = (void *)a1[56];
    a1[56] = v14;
  }
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);

  return (CAStateControllerDelegate *)WeakRetained;
}

- (void)setStateControllerDelegate:(id)a3
{
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
  v8.super_class = (Class)BSUICAPackageView;
  [(BSUICAPackageView *)&v8 layoutSubviews];
  [(BSUICAPackageView *)self bounds];
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
  uint64_t v9 = v8;
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