@interface SBCAAutoPlayingPackageView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBCAAutoPlayingPackageView)initWithURL:(id)a3 startingState:(id)a4 endingState:(id)a5;
- (id)publishedObjectNames;
- (id)publishedObjectWithName:(id)a3;
- (void)_clearPendingCompletion;
- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
@end

@implementation SBCAAutoPlayingPackageView

- (SBCAAutoPlayingPackageView)initWithURL:(id)a3 startingState:(id)a4 endingState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v42 = 0;
  v11 = +[CAPackage packageWithContentsOfURL:v8 type:kCAPackageTypeCAMLBundle options:0 error:&v42];
  id v12 = v42;
  v13 = [v11 rootLayer];
  [v13 frame];
  v41.receiver = self;
  v41.super_class = (Class)SBCAAutoPlayingPackageView;
  v14 = -[SBCAAutoPlayingPackageView initWithFrame:](&v41, "initWithFrame:");
  v15 = v14;
  if (v14)
  {
    id v33 = v12;
    id v34 = v10;
    id v35 = v9;
    id v36 = v8;
    p_rootLayer = (id *)&v14->_rootLayer;
    objc_storeStrong((id *)&v14->_rootLayer, v13);
    [v13 frame];
    v15->_originalSize.width = v17;
    v15->_originalSize.height = v18;
    objc_storeStrong((id *)&v15->_startingState, a4);
    objc_storeStrong((id *)&v15->_endingState, a5);
    [*p_rootLayer setGeometryFlipped:[v11 isGeometryFlipped]];
    v19 = [(SBCAAutoPlayingPackageView *)v15 layer];
    [v19 addSublayer:*p_rootLayer];

    v20 = [v11 publishedObjectNames];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v21)
    {
      id v22 = v21;
      id v23 = 0;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v27 = [v11 publishedObjectWithName:v26];
          if (v27)
          {
            if (!v23) {
              id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v20, "count"));
            }
            [v23 setObject:v27 forKey:v26];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v22);
    }
    else
    {
      id v23 = 0;
    }
    v28 = (NSDictionary *)[v23 copy];
    publishedObjectMap = v15->_publishedObjectMap;
    v15->_publishedObjectMap = v28;

    v30 = (CAStateController *)[objc_alloc((Class)CAStateController) initWithLayer:v15->_rootLayer];
    stateController = v15->_stateController;
    v15->_stateController = v30;

    [(CAStateController *)v15->_stateController setDelegate:v15];
    id v9 = v35;
    [(SBCAAutoPlayingPackageView *)v15 setState:v35];

    id v8 = v36;
    id v12 = v33;
    id v10 = v34;
  }

  return v15;
}

- (void)dealloc
{
  [(CAStateController *)self->_stateController setDelegate:0];
  stateController = self->_stateController;
  self->_stateController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCAAutoPlayingPackageView;
  [(SBCAAutoPlayingPackageView *)&v4 dealloc];
}

- (id)publishedObjectWithName:(id)a3
{
  return [(NSDictionary *)self->_publishedObjectMap objectForKey:a3];
}

- (id)publishedObjectNames
{
  return [(NSDictionary *)self->_publishedObjectMap allKeys];
}

- (BOOL)setState:(id)a3
{
  return [(SBCAAutoPlayingPackageView *)self setState:a3 animated:1];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(SBCAAutoPlayingPackageView *)self setState:a3 animated:a4 transitionSpeed:0 completion:1.0];
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return [(SBCAAutoPlayingPackageView *)self setState:a3 onLayer:self->_rootLayer animated:a4 transitionSpeed:a6 completion:a5];
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  v15 = [v13 stateWithName:v12];
  if (v15)
  {
    if (v9)
    {
      if (v14)
      {
        CGFloat v17 = [(CAStateController *)self->_stateController stateOfLayer:v13];
        CGFloat v18 = [v17 name];
        [(SBCAAutoPlayingPackageView *)self _setPendingCompletion:v14 fromState:v18 toState:v12];
      }
      *(float *)&double v16 = a6;
      [(CAStateController *)self->_stateController setState:v15 ofLayer:v13 transitionSpeed:v16];
    }
    else
    {
      [(SBCAAutoPlayingPackageView *)self _clearPendingCompletion];
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
  v8.super_class = (Class)SBCAAutoPlayingPackageView;
  [(SBCAAutoPlayingPackageView *)&v8 layoutSubviews];
  [(SBCAAutoPlayingPackageView *)self bounds];
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

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  id v18 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_pendingCompletion)
  {
    BOOL v9 = [v7 toState];
    unsigned int v10 = [v9 isEqualToString:self->_pendingCompletionToState];

    if (v10)
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
  v14 = [v8 toState];
  unsigned int v15 = [v14 isEqualToString:self->_endingState];

  if (v15)
  {
    double v16 = (CAStateController *)[objc_alloc((Class)CAStateController) initWithLayer:self->_rootLayer];
    stateController = self->_stateController;
    self->_stateController = v16;

    [(CAStateController *)self->_stateController setDelegate:self];
    [(SBCAAutoPlayingPackageView *)self setState:self->_startingState animated:1 transitionSpeed:0 completion:1.0];
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

  unsigned int v15 = (NSString *)[v9 copy];
  pendingCompletionToState = self->_pendingCompletionToState;
  self->_pendingCompletionToState = v15;
}

- (void)_clearPendingCompletion
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingState, 0);
  objc_storeStrong((id *)&self->_startingState, 0);
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingCompletionFromState, 0);
  objc_storeStrong((id *)&self->_pendingCompletionToState, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);

  objc_storeStrong((id *)&self->_stateController, 0);
}

@end