@interface GroupAnimation
+ (double)defaultAnimationDuration;
+ (id)animation;
+ (id)animationForAnimatedFlag:(BOOL)a3;
+ (id)animationForImplicitAnimationState;
- (BOOL)_hasPrepared;
- (BOOL)hasAnimations;
- (BOOL)hasStarted;
- (BOOL)isAnimated;
- (BOOL)isEmpty;
- (BOOL)preventsAnimationDuringPreparation;
- (GroupAnimation)init;
- (double)delay;
- (double)duration;
- (double)initialVelocity;
- (double)springDamping;
- (id)addCompletionWaitBlockWithReason:(id)a3;
- (unint64_t)options;
- (void)_childAnimationsDidComplete;
- (void)_enterCompletionWaitDispatchGroupWithReason:(id)a3;
- (void)_leaveCompletionWaitDispatchGroupWithReason:(id)a3;
- (void)addAnimations:(id)a3;
- (void)addAnimations:(id)a3 completion:(id)a4;
- (void)addChildAnimation:(id)a3;
- (void)addCompletion:(id)a3;
- (void)addPreparation:(id)a3;
- (void)addPreparation:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)animate;
- (void)complete:(BOOL)a3;
- (void)dealloc;
- (void)prepare;
- (void)runInCurrentContext;
- (void)runWithCurrentOptions;
- (void)runWithDefaultOptions;
- (void)runWithDelay:(double)a3 initialVelocity:(double)a4 options:(unint64_t)a5;
- (void)runWithDuration:(double)a3 delay:(double)a4 options:(unint64_t)a5;
- (void)runWithDuration:(double)a3 delay:(double)a4 springDamping:(double)a5 initialVelocity:(double)a6 options:(unint64_t)a7;
- (void)runWithoutAnimation;
- (void)setAnimated:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setInitialVelocity:(double)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPreventsAnimationDuringPreparation:(BOOL)a3;
- (void)setSpringDamping:(double)a3;
@end

@implementation GroupAnimation

+ (id)animation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (GroupAnimation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GroupAnimation;
  id v2 = [(GroupAnimation *)&v6 init];
  if (v2)
  {
    v3 = sub_2E8F4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v8 = v2;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    [(id)objc_opt_class() defaultAnimationDuration];
    v2->_duration = v4;
    v2->_animated = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id waitBlock = self->_waitBlock;
  if (waitBlock)
  {
    v5 = (void (**)(id, void))objc_retainBlock(waitBlock);
    id v6 = self->_waitBlock;
    self->_id waitBlock = 0;

    self->_initiatingWaitBlock = 0;
    v5[2](v5, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)GroupAnimation;
  [(GroupAnimation *)&v7 dealloc];
}

- (BOOL)hasAnimations
{
  return [(NSMutableArray *)self->_animations count] != 0;
}

- (BOOL)isEmpty
{
  return !self->_preparations
      && ![(NSMutableArray *)self->_animations count]
      && [(NSMutableArray *)self->_completions count] == 0;
}

- (void)addPreparation:(id)a3
{
}

- (void)addAnimations:(id)a3
{
}

- (void)addCompletion:(id)a3
{
}

- (void)addAnimations:(id)a3 completion:(id)a4
{
}

- (void)addPreparation:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_2E8F4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v36 = 134349314;
    v37 = self;
    __int16 v38 = 2080;
    v39 = "-[GroupAnimation addPreparation:animations:completion:]";
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v36, 0x16u);
  }

  if (v8)
  {
    if (!self->_didPrepare) {
      goto LABEL_5;
    }
    v24 = MAPSGetMapsAssertLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = +[NSString stringWithFormat:@"cannot add preparations, already prepared"];
      int v36 = 136316162;
      v37 = (GroupAnimation *)"-[GroupAnimation addPreparation:animations:completion:]";
      __int16 v38 = 2080;
      v39 = "GroupAnimation.m";
      __int16 v40 = 1024;
      int v41 = 101;
      __int16 v42 = 2080;
      v43 = "!preparations || !_didPrepare";
      __int16 v44 = 2112;
      v45 = v25;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v36, 0x30u);
    }
    if (_isInternalInstall())
    {
      v26 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = +[NSThread callStackSymbols];
        int v36 = 138412290;
        v37 = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
      }
    }
    if (!self->_didPrepare)
    {
LABEL_5:
      preparations = self->_preparations;
      if (!preparations)
      {
        v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v14 = self->_preparations;
        self->_preparations = v13;

        preparations = self->_preparations;
      }
      id v15 = [v8 copy];
      [(NSMutableArray *)preparations addObject:v15];
    }
  }
  if (v9)
  {
    if (self->_didAnimate)
    {
      v28 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = +[NSString stringWithFormat:@"cannot add animations, already animated"];
        int v36 = 136316162;
        v37 = (GroupAnimation *)"-[GroupAnimation addPreparation:animations:completion:]";
        __int16 v38 = 2080;
        v39 = "GroupAnimation.m";
        __int16 v40 = 1024;
        int v41 = 108;
        __int16 v42 = 2080;
        v43 = "!animations || !_didAnimate";
        __int16 v44 = 2112;
        v45 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v36, 0x30u);
      }
      if (_isInternalInstall())
      {
        v30 = MAPSGetMapsAssertLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = +[NSThread callStackSymbols];
          int v36 = 138412290;
          v37 = v31;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
        }
      }
    }
    animations = self->_animations;
    if (!animations)
    {
      v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v18 = self->_animations;
      self->_animations = v17;

      animations = self->_animations;
    }
    id v19 = [v9 copy];
    [(NSMutableArray *)animations addObject:v19];
  }
  if (v10)
  {
    if (self->_didComplete)
    {
      v32 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = +[NSString stringWithFormat:@"cannot add completions, already completed"];
        int v36 = 136316162;
        v37 = (GroupAnimation *)"-[GroupAnimation addPreparation:animations:completion:]";
        __int16 v38 = 2080;
        v39 = "GroupAnimation.m";
        __int16 v40 = 1024;
        int v41 = 115;
        __int16 v42 = 2080;
        v43 = "!completion || !_didComplete";
        __int16 v44 = 2112;
        v45 = v33;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v36, 0x30u);
      }
      if (_isInternalInstall())
      {
        v34 = MAPSGetMapsAssertLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = +[NSThread callStackSymbols];
          int v36 = 138412290;
          v37 = v35;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);
        }
      }
    }
    completions = self->_completions;
    if (!completions)
    {
      v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v22 = self->_completions;
      self->_completions = v21;

      completions = self->_completions;
    }
    id v23 = [v10 copy];
    [(NSMutableArray *)completions addObject:v23];
  }
}

- (void)addChildAnimation:(id)a3
{
  id v4 = a3;
  v5 = sub_2E8F4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349570;
    id v15 = self;
    __int16 v16 = 2080;
    v17 = "-[GroupAnimation addChildAnimation:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{public}p] %s:%@", buf, 0x20u);
  }

  if (v4)
  {
    id v6 = v4;
    objc_super v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

    v12 = +[NSString stringWithFormat:@"waiting for child animation %@", v11];
    v13 = [(GroupAnimation *)self addCompletionWaitBlockWithReason:v12];
    [v6 addCompletion:v13];
  }
}

- (id)addCompletionWaitBlockWithReason:(id)a3
{
  id v4 = a3;
  [(GroupAnimation *)self _enterCompletionWaitDispatchGroupWithReason:v4];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2F320;
  v9[3] = &unk_72A98;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_retainBlock(v9);
  objc_super v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)_enterCompletionWaitDispatchGroupWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_2E8F4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{public}p] entering completion wait group for reason: %@", buf, 0x16u);
  }

  childAnimationCompletionGroup = self->_childAnimationCompletionGroup;
  if (childAnimationCompletionGroup)
  {
    dispatch_group_enter(childAnimationCompletionGroup);
    goto LABEL_14;
  }
  objc_super v7 = sub_2E8F4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v23 = self;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[%{public}p] creating child completion animation group", buf, 0xCu);
  }

  id v8 = (OS_dispatch_group *)dispatch_group_create();
  id v9 = self->_childAnimationCompletionGroup;
  self->_childAnimationCompletionGroup = v8;

  dispatch_group_enter((dispatch_group_t)self->_childAnimationCompletionGroup);
  id v10 = self->_childAnimationCompletionGroup;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2F624;
  block[3] = &unk_60EC8;
  block[4] = self;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  if (!self->_initiatingWaitBlock)
  {
    self->_initiatingWaitBlock = 1;
    id v11 = self;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      v14 = [(GroupAnimation *)v11 performSelector:"accessibilityIdentifier"];
      id v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        __int16 v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_13;
      }
    }
    __int16 v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_13:

    v17 = +[NSString stringWithFormat:@"%@: blocking on our own complete method call", v16];
    __int16 v18 = [(GroupAnimation *)v11 addCompletionWaitBlockWithReason:v17];
    id v19 = [v18 copy];
    id waitBlock = v11->_waitBlock;
    v11->_id waitBlock = v19;
  }
LABEL_14:
}

- (void)_leaveCompletionWaitDispatchGroupWithReason:(id)a3
{
  id v4 = (char *)a3;
  if (self->_childAnimationCompletionGroup) {
    goto LABEL_2;
  }
  id v6 = MAPSGetMapsAssertLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = +[NSString stringWithFormat:@"[%p] cannot leave childAnimationCompletionGroup, never entered", self];
    *(_DWORD *)buf = 136316162;
    id v11 = (GroupAnimation *)"-[GroupAnimation _leaveCompletionWaitDispatchGroupWithReason:]";
    __int16 v12 = 2080;
    v13 = "GroupAnimation.m";
    __int16 v14 = 1024;
    int v15 = 170;
    __int16 v16 = 2080;
    v17 = "_childAnimationCompletionGroup != nil";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
  }
  if (_isInternalInstall())
  {
    id v8 = MAPSGetMapsAssertLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if (self->_childAnimationCompletionGroup)
  {
LABEL_2:
    id v5 = sub_2E8F4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      id v11 = self;
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{public}p] leaving completion wait group for reason: %@", buf, 0x16u);
    }

    dispatch_group_leave((dispatch_group_t)self->_childAnimationCompletionGroup);
  }
}

- (BOOL)hasStarted
{
  return self->_didPrepare || self->_didAnimate || self->_didComplete;
}

- (BOOL)_hasPrepared
{
  return ![(NSMutableArray *)self->_preparations count] || self->_didPrepare;
}

- (void)prepare
{
  if (self->_didPrepare || self->_didAnimate || self->_didComplete)
  {
    v20 = MAPSGetMapsAssertLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = +[NSString stringWithFormat:@"cannot call -prepare if any phase already ran"];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[GroupAnimation prepare]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "GroupAnimation.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v26) = 191;
      WORD2(v26) = 2080;
      *(void *)((char *)&v26 + 6) = "!_didPrepare && !_didAnimate && !_didComplete";
      HIWORD(v26) = 2112;
      id v27 = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (_isInternalInstall())
    {
      v22 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] preparing", buf, 0xCu);
  }

  if (!self->_waitBlock && !self->_initiatingWaitBlock)
  {
    self->_initiatingWaitBlock = 1;
    id v4 = self;
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      objc_super v7 = [(GroupAnimation *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_13;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_13:

    id v10 = +[NSString stringWithFormat:@"%@: blocking on our own complete method call", v9];
    id v11 = [(GroupAnimation *)v4 addCompletionWaitBlockWithReason:v10];
    id v12 = [v11 copy];
    id waitBlock = self->_waitBlock;
    self->_id waitBlock = v12;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v26 = sub_2FDAC;
  *((void *)&v26 + 1) = sub_2FDBC;
  id v27 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_2FDC4;
  v24[3] = &unk_72AC0;
  v24[4] = buf;
  __int16 v14 = objc_retainBlock(v24);
  while (1)
  {
    id v15 = [(NSMutableArray *)self->_preparations count];
    preparations = self->_preparations;
    if (!v15) {
      break;
    }
    id v17 = [(NSMutableArray *)preparations copy];
    __int16 v18 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v17;

    id v19 = self->_preparations;
    self->_preparations = 0;

    if ([(GroupAnimation *)self preventsAnimationDuringPreparation]) {
      +[UIView performWithoutAnimation:v14];
    }
    else {
      ((void (*)(void *))v14[2])(v14);
    }
  }
  self->_preparations = 0;

  self->_didPrepare = 1;
  _Block_object_dispose(buf, 8);
}

- (void)animate
{
  if (![(GroupAnimation *)self _hasPrepared] || self->_didAnimate)
  {
    id v11 = MAPSGetMapsAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = +[NSString stringWithFormat:@"cannot call -animate if -prepare or -animate was already called"];
      *(_DWORD *)buf = 136316162;
      v21 = (GroupAnimation *)"-[GroupAnimation animate]";
      __int16 v22 = 2080;
      id v23 = "GroupAnimation.m";
      __int16 v24 = 1024;
      int v25 = 227;
      __int16 v26 = 2080;
      id v27 = "[self _hasPrepared] && !_didAnimate";
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (_isInternalInstall())
    {
      v13 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v21 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] animating", buf, 0xCu);
  }
  while (1)
  {

    if (![(NSMutableArray *)self->_animations count]) {
      break;
    }
    id v4 = [(NSMutableArray *)self->_animations copy];
    animations = self->_animations;
    self->_animations = 0;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v3 = v4;
    id v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v9) + 16))();
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  id v10 = self->_animations;
  self->_animations = 0;

  self->_didAnimate = 1;
}

- (void)_childAnimationsDidComplete
{
  v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349314;
    id v6 = self;
    __int16 v7 = 2080;
    uint64_t v8 = "-[GroupAnimation _childAnimationsDidComplete]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v5, 0x16u);
  }

  if (self->_readyToComplete)
  {
    [(GroupAnimation *)self complete:1];
  }
  else
  {
    id v4 = sub_2E8F4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 134349056;
      id v6 = self;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Not ready to complete yet", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)complete:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (![(GroupAnimation *)self _hasPrepared] || !v4->_didAnimate || v4->_didComplete)
  {
    __int16 v26 = MAPSGetMapsAssertLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = +[NSString stringWithFormat:@"cannot call -complete: if no other phase already ran"];
      *(_DWORD *)buf = 136316162;
      int v36 = "-[GroupAnimation complete:]";
      __int16 v37 = 2080;
      __int16 v38 = "GroupAnimation.m";
      __int16 v39 = 1024;
      int v40 = 254;
      __int16 v41 = 2080;
      __int16 v42 = "[self _hasPrepared] && _didAnimate && !_didComplete";
      __int16 v43 = 2112;
      __int16 v44 = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (_isInternalInstall())
    {
      __int16 v28 = MAPSGetMapsAssertLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v36 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  int v5 = sub_2E8F4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349570;
    int v36 = (const char *)v4;
    __int16 v37 = 2080;
    __int16 v38 = "-[GroupAnimation complete:]";
    __int16 v39 = 1024;
    int v40 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%{public}p] %s:%d", buf, 0x1Cu);
  }

  v4->_readyToComplete = 1;
  if (v4->_waitBlock)
  {
    id v6 = sub_2E8F4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      int v36 = (const char *)v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[%{public}p] waiting for _waitBlock", buf, 0xCu);
    }

    uint64_t v7 = (uint64_t)objc_retainBlock(v4->_waitBlock);
    id waitBlock = v4->_waitBlock;
    v4->_id waitBlock = 0;

    v4->_initiatingWaitBlock = 0;
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3);
LABEL_10:

    return;
  }
  childAnimationCompletionGroup = v4->_childAnimationCompletionGroup;
  uint64_t v7 = sub_2E8F4();
  BOOL v10 = os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO);
  if (childAnimationCompletionGroup)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134349056;
      int v36 = (const char *)v4;
      _os_log_impl(&dword_0, (os_log_t)v7, OS_LOG_TYPE_INFO, "[%{public}p] ready to complete, but waiting on child animations", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (v10)
  {
    *(_DWORD *)buf = 134349312;
    int v36 = (const char *)v4;
    __int16 v37 = 1024;
    LODWORD(v38) = v3;
    _os_log_impl(&dword_0, (os_log_t)v7, OS_LOG_TYPE_INFO, "[%{public}p] complete:%d", buf, 0x12u);
  }

  if ([(NSMutableArray *)v4->_completions count])
  {
    do
    {
      id v11 = sub_2E8F4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = (const char *)[(NSMutableArray *)v4->_completions count];
        *(_DWORD *)buf = 134349312;
        int v36 = (const char *)v4;
        __int16 v37 = 2048;
        __int16 v38 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "[%{public}p] will execute %lu completions", buf, 0x16u);
      }

      id v13 = [(NSMutableArray *)v4->_completions copy];
      completions = v4->_completions;
      long long v15 = v4;
      v4->_completions = 0;

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v13;
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void (***)(void, void))(*((void *)&v30 + 1) + 8 * i);
            __int16 v22 = sub_2E8F4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              id v23 = objc_retainBlock(v21);
              *(_DWORD *)buf = 134349314;
              int v36 = (const char *)v15;
              __int16 v37 = 2112;
              __int16 v38 = (const char *)v23;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "[%{public}p] executing completion block: %@", buf, 0x16u);
            }
            v21[2](v21, v3);
          }
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v18);
      }

      id v4 = v15;
    }
    while ([(NSMutableArray *)v15->_completions count]);
  }
  __int16 v24 = sub_2E8F4();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    int v36 = (const char *)v4;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "[%{public}p] executed all completion blocks", buf, 0xCu);
  }

  int v25 = v4->_completions;
  v4->_completions = 0;

  v4->_didComplete = 1;
}

- (void)runWithDefaultOptions
{
  [(id)objc_opt_class() defaultAnimationDuration];

  -[GroupAnimation runWithDuration:delay:options:](self, "runWithDuration:delay:options:", 0);
}

- (void)runWithCurrentOptions
{
  [(GroupAnimation *)self springDamping];
  if (v3 <= 0.0)
  {
    [(GroupAnimation *)self initialVelocity];
    if (v9 <= 0.0)
    {
      [(GroupAnimation *)self duration];
      double v16 = v15;
      [(GroupAnimation *)self delay];
      double v18 = v17;
      unint64_t v19 = [(GroupAnimation *)self options];
      [(GroupAnimation *)self runWithDuration:v19 delay:v16 options:v18];
    }
    else
    {
      [(GroupAnimation *)self delay];
      double v11 = v10;
      [(GroupAnimation *)self initialVelocity];
      double v13 = v12;
      unint64_t v14 = [(GroupAnimation *)self options];
      [(GroupAnimation *)self runWithDelay:v14 initialVelocity:v11 options:v13];
    }
  }
  else
  {
    [(GroupAnimation *)self duration];
    double v5 = v4;
    [(GroupAnimation *)self delay];
    double v7 = v6;
    [(GroupAnimation *)self springDamping];
    [(GroupAnimation *)self initialVelocity];
    unint64_t v8 = [(GroupAnimation *)self options];
    -[GroupAnimation runWithDuration:delay:springDamping:initialVelocity:options:](self, "runWithDuration:delay:springDamping:initialVelocity:options:", v8, v5, v7);
  }
}

- (void)runWithDuration:(double)a3 delay:(double)a4 options:(unint64_t)a5
{
  if ([(GroupAnimation *)self isAnimated])
  {
    double v9 = sub_2E8F4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349824;
      double v13 = self;
      __int16 v14 = 2048;
      double v15 = a3;
      __int16 v16 = 2048;
      double v17 = a4;
      __int16 v18 = 2048;
      unint64_t v19 = a5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "[%{public}p] runWithDuration:%#.1lf delay:%#.1lfs options:%lu", buf, 0x2Au);
    }

    [(GroupAnimation *)self prepare];
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_30BBC;
    v11[3] = &unk_60EC8;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_30BC4;
    v10[3] = &unk_72608;
    +[UIView animateWithDuration:a5 delay:v11 options:v10 animations:a3 completion:a4];
  }
  else
  {
    [(GroupAnimation *)self runWithoutAnimation];
  }
}

- (void)runWithDelay:(double)a3 initialVelocity:(double)a4 options:(unint64_t)a5
{
  if ([(GroupAnimation *)self isAnimated])
  {
    double v9 = sub_2E8F4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349824;
      double v13 = self;
      __int16 v14 = 2048;
      double v15 = a3;
      __int16 v16 = 2048;
      double v17 = a4;
      __int16 v18 = 2048;
      unint64_t v19 = a5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "[%{public}p] runWithDelay:%#.1lf initialVelocity:%lf options:%lu", buf, 0x2Au);
    }

    [(GroupAnimation *)self prepare];
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_30DA4;
    v11[3] = &unk_60EC8;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_30DAC;
    v10[3] = &unk_72608;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:a5 initialSpringVelocity:v11 options:v10 animations:a3 completion:a4];
  }
  else
  {
    [(GroupAnimation *)self runWithoutAnimation];
  }
}

- (void)runWithDuration:(double)a3 delay:(double)a4 springDamping:(double)a5 initialVelocity:(double)a6 options:(unint64_t)a7
{
  if ([(GroupAnimation *)self isAnimated])
  {
    double v13 = sub_2E8F4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134350336;
      double v17 = self;
      __int16 v18 = 2048;
      double v19 = a3;
      __int16 v20 = 2048;
      double v21 = a4;
      __int16 v22 = 2048;
      double v23 = a5;
      __int16 v24 = 2048;
      double v25 = a6;
      __int16 v26 = 2048;
      unint64_t v27 = a7;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[%{public}p] runWithDuration:%#.1lfs delay:%#.1lfs springDamping:%lf initialVelocity:%lf options:%lu", buf, 0x3Eu);
    }

    [(GroupAnimation *)self prepare];
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_30FB8;
    v15[3] = &unk_60EC8;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_30FC0;
    v14[3] = &unk_72608;
    +[UIView animateWithDuration:a7 delay:v15 usingSpringWithDamping:v14 initialSpringVelocity:a3 options:a4 animations:a5 completion:a6];
  }
  else
  {
    [(GroupAnimation *)self runWithoutAnimation];
  }
}

- (void)runWithoutAnimation
{
  double v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    double v6 = self;
    __int16 v7 = 2080;
    unint64_t v8 = "-[GroupAnimation runWithoutAnimation]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] %s", buf, 0x16u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_310DC;
  v4[3] = &unk_60EC8;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
}

- (void)runInCurrentContext
{
  double v3 = sub_2E8F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134349314;
    double v5 = self;
    __int16 v6 = 2080;
    __int16 v7 = "-[GroupAnimation runInCurrentContext]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v4, 0x16u);
  }

  [(GroupAnimation *)self prepare];
  [(GroupAnimation *)self animate];
  [(GroupAnimation *)self complete:1];
}

+ (double)defaultAnimationDuration
{
  return 0.25;
}

+ (id)animationForAnimatedFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 setAnimated:v3];

  return v4;
}

+ (id)animationForImplicitAnimationState
{
  id v2 = objc_msgSend(a1, "animationForAnimatedFlag:", +[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters"));
  [v2 setPreventsAnimationDuringPreparation:1];

  return v2;
}

- (BOOL)preventsAnimationDuringPreparation
{
  return self->_preventsAnimationDuringPreparation;
}

- (void)setPreventsAnimationDuringPreparation:(BOOL)a3
{
  self->_preventsAnimationDuringPreparation = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(double)a3
{
  self->_springDamping = a3;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waitBlock, 0);
  objc_storeStrong((id *)&self->_childAnimationCompletionGroup, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);

  objc_storeStrong((id *)&self->_preparations, 0);
}

@end