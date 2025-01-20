@interface LaunchTransitionController
+ (id)controllerForTransitioningBetweenMessagesController:(id)a3 andLaunchController:(id)a4;
- (LaunchViewController)launchController;
- (MessagesViewController)messagesController;
- (id)transitionCompletionBlock;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)performAnimatedTransitionByFadingSplash:(id)a3;
- (void)performAnimatedTransitionByMovingVideo:(id)a3;
- (void)setLaunchController:(id)a3;
- (void)setMessagesController:(id)a3;
- (void)setTransitionCompletionBlock:(id)a3;
@end

@implementation LaunchTransitionController

+ (id)controllerForTransitioningBetweenMessagesController:(id)a3 andLaunchController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setMessagesController:v7];

  [v8 setLaunchController:v6];

  return v8;
}

- (void)performAnimatedTransitionByFadingSplash:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EF80;
  v6[3] = &unk_100034790;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EFF0;
  v4[3] = &unk_100034880;
  id v5 = a3;
  id v3 = v5;
  +[UIView animateWithDuration:v6 animations:v4 completion:0.2];
}

- (void)performAnimatedTransitionByMovingVideo:(id)a3
{
  id v117 = a3;
  v113 = self;
  v4 = [(LaunchTransitionController *)self launchController];
  v139 = [v4 view];
  v119 = v4;
  v116 = [v4 videoController];
  id v5 = [v116 view];
  [v4 detachVideoController];
  v118 = [(LaunchTransitionController *)self messagesController];
  id v6 = [v118 view];
  id v7 = [v118 paddleView];
  [v7 setAutomaticallyStartsPlaying:0];
  id v8 = [v6 superview];
  v115 = [v7 superview];
  id v9 = objc_alloc((Class)UIView);
  v114 = v8;
  [v8 bounds];
  id v10 = [v9 initWithFrame:];
  [v10 setUserInteractionEnabled:0];
  [v8 addSubview:v10];
  id v11 = objc_alloc((Class)UIView);
  [v10 bounds];
  id v12 = [v11 initWithFrame:];
  [v10 addSubview:v12];
  [v7 center];
  double v14 = v13;
  double v16 = v15;
  v17 = [v7 superview];
  [v12 convertPoint:v17 fromView:v14];
  double v19 = v18;
  double v21 = v20;

  [v5 center];
  double v23 = v22;
  double v25 = v24;
  v26 = [v5 superview];
  [v10 convertPoint:v26 fromView:v23];
  double v28 = v27;
  double v30 = v29;

  v135 = v6;
  [v12 addSubview:v6];
  [v12 addSubview:v7];
  v112 = v10;
  [v10 addSubview:v139];
  [v10 addSubview:v5];
  [v5 setCenter:v28, v30];
  v111 = v7;
  [v7 setCenter:v19, v21];
  [v5 frame];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v126 = v37;
  v141 = v12;
  [v7 frameForVideoInCoordinateSpace:v12];
  CGFloat rect = v171.size.width;
  memset(&v170, 0, sizeof(v170));
  CGFloat x = v171.origin.x;
  CGFloat v131 = v171.origin.x;
  CGFloat height = v171.size.height;
  CGFloat y = v171.origin.y;
  CGFloat v129 = v171.origin.y;
  CGFloat v40 = v171.size.height;
  double Width = CGRectGetWidth(v171);
  v172.origin.CGFloat x = v32;
  v172.origin.CGFloat y = v34;
  v172.size.width = v36;
  v172.size.CGFloat height = v126;
  sCGFloat x = Width / CGRectGetWidth(v172);
  v173.origin.CGFloat x = x;
  v173.origin.CGFloat y = y;
  v173.size.width = rect;
  v173.size.CGFloat height = v40;
  double v42 = CGRectGetHeight(v173);
  v174.origin.CGFloat x = v32;
  v174.origin.CGFloat y = v34;
  v174.size.width = v36;
  v174.size.CGFloat height = v126;
  CGFloat v43 = CGRectGetHeight(v174);
  CATransform3DMakeScale(&v170, sx, v42 / v43, 1.0);
  memset(&v169, 0, sizeof(v169));
  v175.origin.CGFloat x = v131;
  v175.origin.CGFloat y = v129;
  v175.size.width = rect;
  v175.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v175);
  v176.origin.CGFloat x = v32;
  v176.origin.CGFloat y = v34;
  v176.size.width = v36;
  CGFloat v45 = v36;
  v176.size.CGFloat height = v126;
  CGFloat v46 = MidX - CGRectGetMidX(v176);
  v177.origin.CGFloat x = v131;
  v177.origin.CGFloat y = v129;
  v177.size.width = rect;
  v177.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v177);
  v178.origin.CGFloat x = v32;
  v178.origin.CGFloat y = v34;
  v178.size.width = v45;
  v178.size.CGFloat height = v126;
  CGFloat v48 = CGRectGetMidY(v178);
  CATransform3DMakeTranslation(&v169, v46, MidY - v48, 0.0);
  long long v167 = *(_OWORD *)&v170.m12;
  long long v168 = *(_OWORD *)&v170.m14;
  long long v164 = *(_OWORD *)&v170.m33;
  long long v165 = *(_OWORD *)&v170.m41;
  long long v166 = *(_OWORD *)&v170.m43;
  double v49 = v170.m11 * 0.75;
  double v50 = v170.m22 * 0.75;
  long long v163 = *(_OWORD *)&v170.m31;
  long long v162 = *(_OWORD *)&v170.m23;
  [v12 setAlpha:0.0];
  CGAffineTransformMakeScale(&v161, 0.75, 0.75);
  CGAffineTransform v160 = v161;
  [v6 setTransform:&v160];
  [v5 bounds];
  double v51 = CGRectGetWidth(v179);
  [v5 bounds];
  double v52 = CGRectGetHeight(v180);
  if (v51 < v52) {
    double v52 = v51;
  }
  [v5 _setContinuousCornerRadius:v52 / 5.0];
  v53 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v54 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  [v53 setTimingFunction:v54];

  [v53 setFillMode:kCAFillModeForwards];
  [v53 setDuration:0.2275];
  [v53 setBeginTime:0.0];
  uint64_t v55 = kCAAnimationRelative;
  [v53 setBeginTimeMode:kCAAnimationRelative];
  long long v130 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v128 = *(_OWORD *)&a.m31;
  *(_OWORD *)&a.m33 = v130;
  long long v127 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)sxCATransform3D a = *(_OWORD *)&a.m41;
  *(_OWORD *)&a.m43 = v127;
  long long v123 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v122 = *(_OWORD *)&a.m11;
  *(_OWORD *)&a.m13 = v123;
  long long v121 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v120 = *(_OWORD *)&a.m21;
  *(_OWORD *)&a.m23 = v121;
  v56 = +[NSValue valueWithCATransform3D:&a];
  [v53 setFromValue:v56];

  CATransform3DMakeScale(&v158, 1.05, 1.05, 1.0);
  v57 = +[NSValue valueWithCATransform3D:&v158];
  [v53 setToValue:v57];

  v107 = v5;
  v58 = [v5 layer];
  [v58 addAnimation:v53 forKey:@"expand-transform"];

  v59 = [v139 layer];
  [v59 addAnimation:v53 forKey:@"expand-transform"];

  v60 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v61 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  [v60 setTimingFunction:v61];

  [v60 setFillMode:kCAFillModeForwards];
  [v60 setDuration:0.1625];
  [v60 setBeginTime:0.2275];
  [v60 setBeginTimeMode:v55];
  v109 = v53;
  v62 = [v53 toValue];
  rectCATransform3D a = v60;
  [v60 setFromValue:v62];

  CATransform3D a = v170;
  CATransform3D b = v169;
  CATransform3DConcat(&v157, &a, &b);
  v63 = +[NSValue valueWithCATransform3D:&v157];
  [v60 setToValue:v63];

  v64 = [v5 layer];
  [v64 addAnimation:v60 forKey:@"move-transform"];

  v65 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v66 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
  [v65 setTimingFunction:v66];

  [v65 setFillMode:];
  [v65 setDuration:0.2275];
  [v65 setBeginTime:0.2275];
  [v65 setBeginTimeMode:v55];
  v67 = [v6 layer];
  v68 = [v67 valueForKeyPath:@"transform"];
  v110 = v65;
  [v65 setFromValue:v68];

  *(_OWORD *)&a.m31 = v128;
  *(_OWORD *)&a.m33 = v130;
  *(_OWORD *)&a.m41 = *(_OWORD *)sxa;
  *(_OWORD *)&a.m43 = v127;
  *(_OWORD *)&a.m11 = v122;
  *(_OWORD *)&a.m13 = v123;
  *(_OWORD *)&a.m21 = v120;
  *(_OWORD *)&a.m23 = v121;
  v69 = +[NSValue valueWithCATransform3D:&a];
  [v65 setToValue:v69];

  v70 = [v6 layer];
  [v70 addAnimation:v65 forKey:@"blend-transform"];

  v71 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v72 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  [v71 setTimingFunction:v72];

  [v71 setFillMode:kCAFillModeForwards];
  [v71 setDuration:0.2275];
  [v71 setBeginTime:0.2275];
  [v71 setBeginTimeMode:v55];
  v73 = [v53 toValue];
  v108 = v71;
  [v71 setFromValue:v73];

  *(_OWORD *)&a.m31 = v128;
  *(_OWORD *)&a.m33 = v130;
  *(_OWORD *)&a.m41 = *(_OWORD *)sxa;
  *(_OWORD *)&a.m43 = v127;
  *(_OWORD *)&a.m11 = v122;
  *(_OWORD *)&a.m13 = v123;
  *(_OWORD *)&a.m21 = v120;
  *(_OWORD *)&a.m23 = v121;
  v74 = +[NSValue valueWithCATransform3D:&a];
  [v71 setToValue:v74];

  v75 = [v139 layer];
  [v75 addAnimation:v71 forKey:@"blend-transform"];

  v76 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  v77 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v76 setTimingFunction:v77];

  [v76 setFillMode:kCAFillModeBoth];
  [v76 setDuration:0.2275];
  [v76 setBeginTime:0.2275];
  [v76 setBeginTimeMode:v55];
  v78 = [v141 layer];
  v79 = [v78 valueForKeyPath:@"opacity"];
  *(void *)&long long v130 = v76;
  [v76 setFromValue:v79];

  LODWORD(v80) = 1.0;
  v81 = +[NSNumber numberWithFloat:v80];
  [v76 setToValue:v81];

  v82 = [v141 layer];
  [v82 addAnimation:v76 forKey:@"blend-opacity"];

  v83 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  v84 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v83 setTimingFunction:v84];

  [v83 setFillMode:kCAFillModeBoth];
  [v83 setDuration:0.2275];
  [v83 setBeginTime:0.2275];
  [v83 setBeginTimeMode:v55];
  v85 = [v139 layer];
  v86 = [v85 valueForKeyPath:@"opacity"];
  [v83 setFromValue:v86];

  v87 = +[NSNumber numberWithFloat:0.0];
  *(void *)&long long v128 = v83;
  [v83 setToValue:v87];

  v88 = [v139 layer];
  [v88 addAnimation:v83 forKey:@"blend-opacity"];

  v89 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v90 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v89 setTimingFunction:v90];

  [v89 setFillMode:kCAFillModeForwards];
  [v89 setDuration:0.13];
  [v89 setBeginTime:0.39];
  [v89 setBeginTimeMode:v55];
  v91 = [recta toValue];
  [v89 setFromValue:v91];

  *(_OWORD *)&a.m12 = v167;
  *(_OWORD *)&a.m14 = v168;
  a.m11 = v49;
  a.m22 = v50;
  *(_OWORD *)&a.m33 = v164;
  *(_OWORD *)&a.m41 = v165;
  *(_OWORD *)&a.m43 = v166;
  *(_OWORD *)&a.m31 = v163;
  *(_OWORD *)&a.m23 = v162;
  CATransform3D b = v169;
  CATransform3DConcat(&v155, &a, &b);
  v92 = +[NSValue valueWithCATransform3D:&v155];
  [v89 setToValue:v92];

  v93 = [v107 layer];
  *(void *)&long long v127 = v89;
  [v93 addAnimation:v89 forKey:@"bounce-down-transform"];

  v94 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  v95 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  [v94 setTimingFunction:v95];

  [v94 setFillMode:kCAFillModeForwards];
  [v94 setDuration:0.13];
  [v94 setBeginTime:0.52];
  [v94 setBeginTimeMode:v55];
  v96 = [v89 fromValue];
  [v94 setFromValue:v96];

  CATransform3D a = v170;
  CATransform3D b = v169;
  CATransform3DConcat(&v154, &a, &b);
  v97 = +[NSValue valueWithCATransform3D:&v154];
  [v94 setToValue:v97];

  v98 = +[WeakCAAnimationDelegate weakAnimationDelegate:v113];
  [v94 setDelegate:v98];

  [v94 setRemovedOnCompletion:0];
  v99 = [v107 layer];
  [v99 addAnimation:v94 forKey:@"bounce-up-transform"];

  [v141 setAlpha:1.0];
  [v139 setAlpha:0.0];
  long long v100 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v153[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v153[1] = v100;
  v153[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v135 setTransform:v153];
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_100020130;
  v142[3] = &unk_100034F08;
  id v143 = v115;
  id v144 = v111;
  id v145 = v107;
  id v146 = v116;
  id v147 = v114;
  id v148 = v135;
  id v149 = v139;
  id v150 = v112;
  v151 = v113;
  id v152 = v117;
  id v134 = v117;
  id v101 = v112;
  id v140 = v139;
  id v136 = v135;
  id v132 = v114;
  id v102 = v116;
  id v103 = v107;
  id v104 = v111;
  id v105 = v115;
  v106 = objc_retainBlock(v142);
  [(LaunchTransitionController *)v113 setTransitionCompletionBlock:v106];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = [(LaunchTransitionController *)self transitionCompletionBlock];
  if (v5)
  {
    [(LaunchTransitionController *)self setTransitionCompletionBlock:0];
    v5[2]();
  }
}

- (MessagesViewController)messagesController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesController);

  return (MessagesViewController *)WeakRetained;
}

- (void)setMessagesController:(id)a3
{
}

- (LaunchViewController)launchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchController);

  return (LaunchViewController *)WeakRetained;
}

- (void)setLaunchController:(id)a3
{
}

- (id)transitionCompletionBlock
{
  return self->_transitionCompletionBlock;
}

- (void)setTransitionCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_launchController);

  objc_destroyWeak((id *)&self->_messagesController);
}

@end