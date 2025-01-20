@interface DRFlockAnimator
- (BOOL)badgeAppeared;
- (DRFlockLayoutOutput)lastLayout;
- (void)_runAnimatableWithBarelyBouncyAnimation:(id)a3;
- (void)_runAnimatableWithBouncyAnimation:(id)a3;
- (void)_runAnimatableWithBouncyAnimation:(id)a3 response:(double)a4;
- (void)_runAnimatableWithOneToOneTracking:(id)a3;
- (void)_runAnimatableWithOneToOneTracking:(id)a3 response:(double)a4;
- (void)_runBadgeLayout:(id)a3 oneToOneTrack:(BOOL)a4 bouncy:(BOOL)a5 slowOffset:(BOOL)a6;
- (void)_runWithoutRetargeting:(id)a3;
- (void)animateFlockLayoutOutput:(id)a3;
- (void)setBadgeAppeared:(BOOL)a3;
- (void)setLastLayout:(id)a3;
@end

@implementation DRFlockAnimator

- (void)animateFlockLayoutOutput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DRFlockAnimator *)self lastLayout];
  if (!v5)
  {
    BOOL v7 = 0;
    goto LABEL_5;
  }
  id v6 = [v4 touchesCount];
  BOOL v7 = v6 != [(id)v5 touchesCount];
  v8 = [v4 badgeLayout];
  unsigned int v9 = [v8 justBecameVisible];

  if (v9)
  {
LABEL_5:
    v10 = [v4 badgeLayout];
    v11 = [v10 position];
    [(DRFlockAnimator *)self _runWithoutRetargeting:v11];

    v12 = [v4 badgeLayout];
    v13 = [v12 offset];
    [(DRFlockAnimator *)self _runWithoutRetargeting:v13];

    v14 = [v4 badgeLayout];
    v15 = [v14 alpha];
    [(DRFlockAnimator *)self _runWithoutRetargeting:v15];
  }
  v16 = [v4 itemLayouts];
  v17 = (char *)[v16 count] - 1;

  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v19 = [v4 itemLayouts];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000236BC;
  v26[3] = &unk_100055AA8;
  BOOL v30 = v7;
  v26[4] = self;
  id v20 = (id)v5;
  id v27 = v20;
  v29 = v17;
  BOOL v31 = IsReduceMotionEnabled;
  id v21 = v4;
  id v28 = v21;
  [v19 enumerateObjectsUsingBlock:v26];

  v22 = [v21 badgeLayout];
  if (v22)
  {
    if (v5)
    {
      v23 = [v21 itemLayouts];
      id v24 = [v23 count];
      v25 = [v20 itemLayouts];
      uint64_t v5 = v24 > [v25 count];
    }
    -[DRFlockAnimator _runBadgeLayout:oneToOneTrack:bouncy:slowOffset:](self, "_runBadgeLayout:oneToOneTrack:bouncy:slowOffset:", v22, [v21 reduceBadgeAnimationSpring], v7, v5);
  }
  [(DRFlockAnimator *)self setLastLayout:v21];
}

- (void)_runBadgeLayout:(id)a3 oneToOneTrack:(BOOL)a4 bouncy:(BOOL)a5 slowOffset:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v21 = v10;
  if (v7)
  {
    v11 = [v10 position];
    [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v11];
  }
  else
  {
    v12 = [v10 offsetAdjustment];

    if (v12)
    {
      v13 = [v21 offsetAdjustment];
      [(DRFlockAnimator *)self _runWithoutRetargeting:v13];
    }
    unsigned int v14 = [(DRFlockAnimator *)self badgeAppeared];
    v11 = [v21 position];
    if (!v14)
    {
      [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v11];

      v17 = [v21 size];
      [(DRFlockAnimator *)self _runWithoutRetargeting:v17];

      [(DRFlockAnimator *)self setBadgeAppeared:1];
      if (v6) {
        goto LABEL_8;
      }
LABEL_14:
      if (v8)
      {
        v18 = [v21 offsetAdjustment];

        v15 = [v21 offset];
        if (v18) {
          [(DRFlockAnimator *)self _runAnimatableWithOneToOneTracking:v15];
        }
        else {
          [(DRFlockAnimator *)self _runWithoutRetargeting:v15];
        }
      }
      else
      {
        v15 = [v21 offset];
        [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v15];
      }
      goto LABEL_19;
    }
    [(DRFlockAnimator *)self _runAnimatableWithOneToOneTracking:v11];
  }

  if (!v6) {
    goto LABEL_14;
  }
LABEL_8:
  v15 = [v21 offset];
  if (qword_1000647A0 != -1) {
    dispatch_once(&qword_1000647A0, &stru_100055AC8);
  }
  if (byte_1000647A8) {
    double v16 = sub_1000246A0();
  }
  else {
    double v16 = 0.35;
  }
  [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v15 response:v16];
LABEL_19:

  v19 = [v21 size];
  [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v19];

  id v20 = [v21 alpha];
  [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v20];
}

- (void)_runAnimatableWithBouncyAnimation:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (qword_1000647A0 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&qword_1000647A0, &stru_100055B28);
    id v5 = v7;
  }
  if (byte_1000647A8)
  {
    double v6 = sub_100024858();
    id v5 = v7;
  }
  else
  {
    double v6 = 0.0015;
  }
  [(DRFlockAnimator *)self _runAnimatableWithBouncyAnimation:v5 response:v6];
}

- (void)_runAnimatableWithBouncyAnimation:(id)a3 response:(double)a4
{
  id v5 = a3;
  if (qword_1000647A0 != -1) {
    dispatch_once(&qword_1000647A0, &stru_100055B88);
  }
  double v6 = 1.0;
  if (byte_1000647A8)
  {
    double v6 = sub_100024A10();
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055BE8);
    }
  }
  if (byte_1000647A8)
  {
    if (qword_1000647F8 != -1) {
      dispatch_once(&qword_1000647F8, &stru_100055C08);
    }
    if ((byte_100064800 & 1) == 0)
    {
      v13 = sub_100028320();
      unsigned int v14 = [v13 objectForKey:@"FlockInitialTopStackDampingRatio"];
      v15 = v14;
      if (v14) {
        [v14 doubleValue];
      }
      else {
        uint64_t v16 = 0x3FE6A09E667E556ELL;
      }
      qword_100064808 = v16;
      byte_100064800 = 1;
    }
    double v7 = *(double *)&qword_100064808;
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055C48);
    }
  }
  else
  {
    double v7 = 0.707106781;
  }
  if (byte_1000647A8)
  {
    if (qword_100064810 != -1) {
      dispatch_once(&qword_100064810, &stru_100055C68);
    }
    if ((byte_100064818 & 1) == 0)
    {
      v17 = sub_100028320();
      v18 = [v17 objectForKey:@"FlockInitialTopStackResponse"];
      v19 = v18;
      if (v18) {
        [v18 doubleValue];
      }
      else {
        uint64_t v20 = 0x3FE4CCCCCCCCCCCDLL;
      }
      qword_100064820 = v20;
      byte_100064818 = 1;
    }
    double v8 = *(double *)&qword_100064820;
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055CA8);
    }
  }
  else
  {
    double v8 = 0.65;
  }
  double v9 = 1.0;
  if (byte_1000647A8)
  {
    double v9 = sub_100024DDC();
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055D08);
    }
  }
  double v10 = 1.0;
  if (byte_1000647A8) {
    double v10 = sub_100024F90();
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100023E74;
  v21[3] = &unk_100054B58;
  id v22 = v5;
  id v11 = v5;
  v12 = [v11 completionBlock];
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v21 tracking:v12 initialDampingRatio:v6 initialResponse:a4 dampingRatioSmoothing:v7 responseSmoothing:v8 targetSmoothing:v9 projectionDeceleration:v10 animations:0.0 completion:0.0];
}

- (void)_runAnimatableWithBarelyBouncyAnimation:(id)a3
{
  id v3 = a3;
  if (qword_1000647A0 != -1) {
    dispatch_once(&qword_1000647A0, &stru_100055D68);
  }
  if (byte_1000647A8)
  {
    if (qword_100064858 != -1) {
      dispatch_once(&qword_100064858, &stru_100055D88);
    }
    if ((byte_100064860 & 1) == 0)
    {
      double v10 = sub_100028320();
      id v11 = [v10 objectForKey:@"FlockFirstItemDampingRatio"];
      v12 = v11;
      if (v11) {
        [v11 doubleValue];
      }
      else {
        uint64_t v13 = 0x3FE9DE00D1B71759;
      }
      qword_100064868 = v13;
      byte_100064860 = 1;
    }
    double v4 = *(double *)&qword_100064868;
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055DC8);
    }
  }
  else
  {
    double v4 = 0.80835;
  }
  if (byte_1000647A8)
  {
    if (qword_100064870 != -1) {
      dispatch_once(&qword_100064870, &stru_100055DE8);
    }
    if ((byte_100064878 & 1) == 0)
    {
      unsigned int v14 = sub_100028320();
      v15 = [v14 objectForKey:@"FlockFirstItemResponse"];
      uint64_t v16 = v15;
      if (v15) {
        [v15 doubleValue];
      }
      else {
        uint64_t v17 = 0x3FCAFEC56D5CFAADLL;
      }
      qword_100064880 = v17;
      byte_100064878 = 1;
    }
    double v5 = *(double *)&qword_100064880;
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055CA8);
    }
  }
  else
  {
    double v5 = 0.2109;
  }
  double v6 = 1.0;
  if (byte_1000647A8)
  {
    double v6 = sub_100024DDC();
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055D08);
    }
  }
  double v7 = 1.0;
  if (byte_1000647A8) {
    double v7 = sub_100024F90();
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100024204;
  v18[3] = &unk_100054B58;
  id v19 = v3;
  id v8 = v3;
  double v9 = [v8 completionBlock];
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v18 tracking:v9 dampingRatioSmoothing:v4 responseSmoothing:v5 targetSmoothing:v6 projectionDeceleration:v7 animations:0.0 completion:0.0];
}

- (void)_runAnimatableWithOneToOneTracking:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (qword_1000647A0 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&qword_1000647A0, &stru_100055B28);
    id v5 = v7;
  }
  if (byte_1000647A8)
  {
    double v6 = sub_100024858();
    id v5 = v7;
  }
  else
  {
    double v6 = 0.0015;
  }
  [(DRFlockAnimator *)self _runAnimatableWithOneToOneTracking:v5 response:v6];
}

- (void)_runAnimatableWithOneToOneTracking:(id)a3 response:(double)a4
{
  id v5 = a3;
  if (qword_1000647A0 != -1) {
    dispatch_once(&qword_1000647A0, &stru_100055B88);
  }
  double v6 = 1.0;
  if (byte_1000647A8)
  {
    double v6 = sub_100024A10();
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055CA8);
    }
  }
  double v7 = 1.0;
  if (byte_1000647A8)
  {
    double v7 = sub_100024DDC();
    if (qword_1000647A0 != -1) {
      dispatch_once(&qword_1000647A0, &stru_100055D08);
    }
  }
  double v8 = 1.0;
  if (byte_1000647A8) {
    double v8 = sub_100024F90();
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000244E4;
  v11[3] = &unk_100054B58;
  id v12 = v5;
  id v9 = v5;
  double v10 = [v9 completionBlock];
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v11 tracking:v10 dampingRatioSmoothing:v6 responseSmoothing:a4 targetSmoothing:v7 projectionDeceleration:v8 animations:0.0 completion:0.0];
}

- (void)_runWithoutRetargeting:(id)a3
{
  id v7 = a3;
  id v3 = [v7 animationBlock];

  if (v3)
  {
    id v4 = [v7 animationBlock];
    +[UIView _performWithoutRetargetingAnimations:v4];
  }
  id v5 = [v7 completionBlock];

  if (v5)
  {
    double v6 = [v7 completionBlock];
    v6[2](v6, 1, 0);
  }
}

- (DRFlockLayoutOutput)lastLayout
{
  return self->_lastLayout;
}

- (void)setLastLayout:(id)a3
{
}

- (BOOL)badgeAppeared
{
  return self->_badgeAppeared;
}

- (void)setBadgeAppeared:(BOOL)a3
{
  self->_badgeAppeared = a3;
}

- (void).cxx_destruct
{
}

@end