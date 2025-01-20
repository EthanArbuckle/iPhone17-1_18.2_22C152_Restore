@interface ContinuityCaptureShieldUICAPackageView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (CALayer)rootLayer;
- (CAStateControllerDelegate)stateControllerDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ContinuityCaptureShieldUICAPackageView)initWithPackageName:(id)a3 type:(id)a4 inBundle:(id)a5;
- (NSArray)publishedObjectNames;
- (id)publishedObjectWithName:(id)a3;
- (void)_clearPendingCompletion;
- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)layoutSubviews;
- (void)setStateControllerDelegate:(id)a3;
- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
@end

@implementation ContinuityCaptureShieldUICAPackageView

- (ContinuityCaptureShieldUICAPackageView)initWithPackageName:(id)a3 type:(id)a4 inBundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if ((id)kCAPackageTypeCAMLBundle == v9) {
    CFStringRef v12 = @"ca";
  }
  else {
    CFStringRef v12 = @"caar";
  }
  if ((id)kCAPackageTypeCAMLFile == v9) {
    CFStringRef v13 = @"caml";
  }
  else {
    CFStringRef v13 = v12;
  }
  v14 = [v10 URLForResource:v8 withExtension:v13];
  id v47 = 0;
  v15 = +[_ContinuityCaptureShieldUICAPackage packageWithContentsOfURL:v14 type:v9 options:0 error:&v47];
  id v16 = v47;
  v17 = [v15 rootLayer];
  [v17 frame];
  v46.receiver = self;
  v46.super_class = (Class)ContinuityCaptureShieldUICAPackageView;
  v18 = -[ContinuityCaptureShieldUICAPackageView initWithFrame:](&v46, "initWithFrame:");
  v19 = v18;
  if (v18)
  {
    id v37 = v16;
    v38 = v14;
    v39 = v11;
    id v40 = v9;
    id v41 = v8;
    p_rootLayer = (id *)&v18->_rootLayer;
    objc_storeStrong((id *)&v18->_rootLayer, v17);
    [v17 frame];
    v19->_originalSize.width = v21;
    v19->_originalSize.height = v22;
    [*p_rootLayer setGeometryFlipped:[v15 isGeometryFlipped]];
    v23 = [(ContinuityCaptureShieldUICAPackageView *)v19 layer];
    [v23 addSublayer:*p_rootLayer];

    v24 = [v15 publishedObjectNames];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v25 = [v24 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v25)
    {
      id v26 = v25;
      id v27 = 0;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v31 = [v15 publishedObjectWithName:v30];
          if (v31)
          {
            if (!v27) {
              id v27 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v24, "count"));
            }
            [v27 setObject:v31 forKey:v30];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v26);
    }
    else
    {
      id v27 = 0;
    }
    v32 = (NSDictionary *)[v27 copy];
    publishedObjectMap = v19->_publishedObjectMap;
    v19->_publishedObjectMap = v32;

    v34 = (CAStateController *)[objc_alloc((Class)CAStateController) initWithLayer:v19->_rootLayer];
    stateController = v19->_stateController;
    v19->_stateController = v34;

    [(CAStateController *)v19->_stateController setDelegate:v19];
    id v9 = v40;
    id v8 = v41;
    v14 = v38;
    v11 = v39;
    id v16 = v37;
  }

  return v19;
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
  return [(ContinuityCaptureShieldUICAPackageView *)self setState:a3 animated:1];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(ContinuityCaptureShieldUICAPackageView *)self setState:a3 animated:a4 transitionSpeed:&stru_100014588 completion:1.0];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return [(ContinuityCaptureShieldUICAPackageView *)self setState:a3 onLayer:self->_rootLayer animated:a4 transitionSpeed:a6 completion:a5];
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  if (v12)
  {
    id v16 = [v13 stateWithName:v12];
    BOOL v18 = v16 != 0;
    if (v16)
    {
      if (v9)
      {
        if (v14)
        {
          v19 = [(CAStateController *)self->_stateController stateOfLayer:v13];
          v20 = [v19 name];
          [(ContinuityCaptureShieldUICAPackageView *)self _setPendingCompletion:v14 fromState:v20 toState:v12];
        }
        *(float *)&double v17 = a6;
        [(CAStateController *)self->_stateController setState:v16 ofLayer:v13 transitionSpeed:v17];
      }
      else
      {
        [(ContinuityCaptureShieldUICAPackageView *)self _clearPendingCompletion];
        [(CAStateController *)self->_stateController setState:v16 ofLayer:v13];
        if (v14) {
          v14[2](v14, 1);
        }
      }
    }
    else if (v14)
    {
      v14[2](v14, 0);
    }
  }
  else
  {
    *(float *)&double v15 = a6;
    [(CAStateController *)self->_stateController setInitialStatesOfLayer:v13 transitionSpeed:v15];
    BOOL v18 = 1;
    if (v14) {
      v14[2](v14, 1);
    }
  }

  return v18;
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
  v8.super_class = (Class)ContinuityCaptureShieldUICAPackageView;
  [(ContinuityCaptureShieldUICAPackageView *)&v8 layoutSubviews];
  [(ContinuityCaptureShieldUICAPackageView *)self bounds];
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
    unsigned int v11 = [v10 isEqualToString:self->_pendingCompletionToState];

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
  id v11 = [v17 copy];
  id v12 = self->_pendingCompletion;
  self->_id pendingCompletion = v11;

  id v13 = (NSString *)[v8 copy];
  pendingCompletionFromState = self->_pendingCompletionFromState;
  self->_pendingCompletionFromState = v13;

  double v15 = (NSString *)[v9 copy];
  pendingCompletionToState = self->_pendingCompletionToState;
  self->_pendingCompletionToState = v15;
}

- (void)_clearPendingCompletion
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
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