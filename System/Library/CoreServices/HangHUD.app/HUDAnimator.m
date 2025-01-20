@interface HUDAnimator
+ (id)sharedAnimator;
- (HUDAnimator)init;
- (id)beginAnimationFromValue:(double)a3 toValue:(double)a4 duration:(double)a5 updateBlock:(id)a6 completionBlock:(id)a7;
- (void)displayLinkFired:(id)a3;
- (void)endAnimation:(id)a3;
- (void)updateAnimation:(id)a3 toValue:(double)a4 duration:(double)a5;
- (void)updateDisplayLink;
@end

@implementation HUDAnimator

- (HUDAnimator)init
{
  v11.receiver = self;
  v11.super_class = (Class)HUDAnimator;
  v2 = [(HUDAnimator *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    animations = v2->_animations;
    v2->_animations = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationQueue", 0);
    animationQueue = v2->_animationQueue;
    v2->_animationQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationDisplayLinkQueue", 0);
    displayLinkAccessQueue = v2->_displayLinkAccessQueue;
    v2->_displayLinkAccessQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedAnimator
{
  if (qword_10003E920 != -1) {
    dispatch_once(&qword_10003E920, &stru_1000306D0);
  }
  v2 = (void *)qword_10003E918;

  return v2;
}

- (id)beginAnimationFromValue:(double)a3 toValue:(double)a4 duration:(double)a5 updateBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v14 = +[NSUUID UUID];
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055BC;
  block[3] = &unk_1000306F8;
  double v26 = a3;
  double v27 = a4;
  double v28 = a5;
  id v24 = v12;
  id v25 = v13;
  id v16 = v14;
  id v22 = v16;
  v23 = self;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync((dispatch_queue_t)displayLinkAccessQueue, block);
  [(HUDAnimator *)self updateDisplayLink];
  id v19 = v16;

  return v19;
}

- (void)updateAnimation:(id)a3 toValue:(double)a4 duration:(double)a5
{
  id v8 = a3;
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100005730;
  v14 = &unk_100030748;
  v15 = self;
  id v16 = v8;
  double v17 = a4;
  double v18 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)displayLinkAccessQueue, &v11);
  [(HUDAnimator *)self updateDisplayLink];
}

- (void)endAnimation:(id)a3
{
  id v4 = a3;
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000059A4;
  v7[3] = &unk_100030770;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)displayLinkAccessQueue, v7);
}

- (void)updateDisplayLink
{
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BEC;
  block[3] = &unk_100030668;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)displayLinkAccessQueue, block);
}

- (void)displayLinkFired:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100005FD0;
  v18[4] = sub_100005FE0;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100005FD0;
  v16[4] = sub_100005FE0;
  id v17 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  CFTimeInterval v5 = CACurrentMediaTime();
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005FE8;
  block[3] = &unk_1000307F8;
  void block[4] = self;
  void block[5] = v18;
  *(CFTimeInterval *)&block[8] = v5;
  block[6] = v16;
  block[7] = &v12;
  dispatch_sync((dispatch_queue_t)displayLinkAccessQueue, block);
  animationQueue = self->_animationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000619C;
  v10[3] = &unk_100030820;
  *(CFTimeInterval *)&v10[6] = v5;
  v10[4] = v18;
  v10[5] = v16;
  dispatch_sync((dispatch_queue_t)animationQueue, v10);
  if (*((unsigned char *)v13 + 24))
  {
    id v8 = self->_displayLinkAccessQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000063B0;
    v9[3] = &unk_100030668;
    v9[4] = self;
    dispatch_sync((dispatch_queue_t)v8, v9);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkAccessQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

@end