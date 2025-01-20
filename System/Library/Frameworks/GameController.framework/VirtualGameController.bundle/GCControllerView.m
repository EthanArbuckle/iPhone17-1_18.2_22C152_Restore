@interface GCControllerView
- (GCControllerView)initWithCoder:(id)a3;
- (GCControllerView)initWithFrame:(CGRect)a3;
- (GCControllerView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (GCTouchController)controller;
- (id)applyPadLayout;
- (id)getConfigurationForElement:(id)a3;
- (id)getUIControlForName:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)applyPhoneLayout;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setConfigurationForElement:(id)a3 configuration:(id)a4;
- (void)setController:(id)a3;
- (void)setupPositions;
- (void)setupSide:(id)a3 thumbstick:(id)a4 buttons:(id)a5;
@end

@implementation GCControllerView

- (GCControllerView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v75.receiver = self;
  v75.super_class = (Class)GCControllerView;
  v10 = -[GCControllerView initWithFrame:](&v75, "initWithFrame:", x, y, width, height);
  if (!v10) {
    goto LABEL_33;
  }
  v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 190.0, 190.0);
  leftSide = v10->_leftSide;
  v10->_leftSide = v11;

  v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 190.0, 190.0);
  rightSide = v10->_rightSide;
  v10->_rightSide = v13;

  [(GCControllerView *)v10 addSubview:v10->_leftSide];
  [(GCControllerView *)v10 addSubview:v10->_rightSide];
  if (GCCurrentProcessLinkedOnAfter())
  {
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", GCInputButtonA, GCInputButtonB, GCInputButtonX, GCInputButtonY, GCInputLeftShoulder, GCInputRightShoulder, GCInputLeftTrigger, GCInputRightTrigger, GCInputDirectionPad, GCInputLeftThumbstick, GCInputRightThumbstick, 0);
    v16 = [v9 elements];
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __48__GCControllerView_initWithFrame_configuration___block_invoke;
    v73[3] = &unk_10418;
    id v17 = v15;
    id v74 = v17;
    v18 = [v16 objectsPassingTest:v73];

    if ([v18 count])
    {
      uint64_t v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** The configuration contains %zu elements that are not supported by the Apple touch controller.", [v18 count]);
      CFStringRef v76 = @"UnsupportedElements";
      v77 = v18;
      v71 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v72 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v70 userInfo:v71];

      objc_exception_throw(v72);
    }
    v19 = [v9 elements];
    if ([v19 containsObject:GCInputLeftThumbstick])
    {
      v20 = [v9 elements];
      unsigned int v21 = [v20 containsObject:GCInputDirectionPad];

      if (v21)
      {
        id v22 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"*** The configuration requests both 'Left Thumbstick' (GCInputLeftThumbstick) and 'Direction Pad' (GCInputDirectionPad) elements.  The Apple touch controller does not support both of these elements simultaneously." userInfo:0];
        objc_exception_throw(v22);
      }
    }
    else
    {
    }
  }
  v23 = [v9 elements];
  v24 = [v23 member:GCInputLeftThumbstick];

  if (v24)
  {
    v25 = objc_alloc_init(GCControllerThumbstickInputView);
    uint64_t v26 = 96;
LABEL_13:
    v30 = (GCControllerThumbstickInputView **)((char *)v10 + v26);
    v31 = *(Class *)((char *)&v10->super.super.super.isa + v26);
    *v30 = v25;

    [(UIView *)v10->_leftSide addSubview:*v30];
    goto LABEL_14;
  }
  v27 = [v9 elements];
  v28 = [v27 member:GCInputDirectionPad];

  if (v28)
  {
    v29 = [GCControllerDpadInputView alloc];
    [(UIView *)v10->_leftSide frame];
    v25 = -[GCControllerDpadInputView initWithFrame:](v29, "initWithFrame:");
    uint64_t v26 = 88;
    goto LABEL_13;
  }
LABEL_14:
  v32 = [v9 elements];
  v33 = [v32 member:GCInputRightThumbstick];

  if (v33)
  {
    v34 = objc_alloc_init(GCControllerThumbstickInputView);
    rightThumbstick = v10->_rightThumbstick;
    v10->_rightThumbstick = v34;

    [(UIView *)v10->_rightSide addSubview:v10->_rightThumbstick];
  }
  v36 = [v9 elements];
  v37 = [v36 member:GCInputButtonA];

  if (v37)
  {
    v38 = [[GCControllerButtonInputView alloc] initWithText:@"A"];
    buttonA = v10->_buttonA;
    v10->_buttonA = v38;

    [(UIView *)v10->_rightSide addSubview:v10->_buttonA];
  }
  v40 = [v9 elements];
  v41 = [v40 member:GCInputButtonB];

  if (v41)
  {
    v42 = [[GCControllerButtonInputView alloc] initWithText:@"B"];
    buttonB = v10->_buttonB;
    v10->_buttonB = v42;

    [(UIView *)v10->_rightSide addSubview:v10->_buttonB];
  }
  v44 = [v9 elements];
  v45 = [v44 member:GCInputButtonX];

  if (v45)
  {
    v46 = [[GCControllerButtonInputView alloc] initWithText:@"X"];
    buttonX = v10->_buttonX;
    v10->_buttonX = v46;

    [(UIView *)v10->_rightSide addSubview:v10->_buttonX];
  }
  v48 = [v9 elements];
  v49 = [v48 member:GCInputButtonY];

  if (v49)
  {
    v50 = [[GCControllerButtonInputView alloc] initWithText:@"Y"];
    buttonY = v10->_buttonY;
    v10->_buttonY = v50;

    [(UIView *)v10->_rightSide addSubview:v10->_buttonY];
  }
  v52 = [v9 elements];
  v53 = [v52 member:GCInputLeftShoulder];

  if (v53)
  {
    v54 = [[GCControllerButtonInputView alloc] initWithText:0];
    leftShoulder = v10->_leftShoulder;
    v10->_leftShoulder = v54;

    [(UIView *)v10->_leftSide addSubview:v10->_leftShoulder];
  }
  v56 = [v9 elements];
  v57 = [v56 member:GCInputRightShoulder];

  if (v57)
  {
    v58 = [[GCControllerButtonInputView alloc] initWithText:0];
    rightShoulder = v10->_rightShoulder;
    v10->_rightShoulder = v58;

    [(UIView *)v10->_leftSide addSubview:v10->_rightShoulder];
  }
  v60 = [v9 elements];
  v61 = [v60 member:GCInputLeftTrigger];

  if (v61)
  {
    v62 = [[GCControllerButtonInputView alloc] initWithText:0];
    leftTrigger = v10->_leftTrigger;
    v10->_leftTrigger = v62;

    [(UIView *)v10->_leftSide addSubview:v10->_leftTrigger];
  }
  v64 = [v9 elements];
  v65 = [v64 member:GCInputRightTrigger];

  if (v65)
  {
    v66 = [[GCControllerButtonInputView alloc] initWithText:0];
    rightTrigger = v10->_rightTrigger;
    v10->_rightTrigger = v66;

    [(UIView *)v10->_leftSide addSubview:v10->_rightTrigger];
  }
  [(GCControllerView *)v10 setOpaque:0];
  [(GCControllerView *)v10 setupPositions];
  id v68 = +[GCControllerViewFeedback sharedInstance];
LABEL_33:

  return v10;
}

uint64_t __48__GCControllerView_initWithFrame_configuration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (GCControllerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_new();
  id v9 = -[GCControllerView initWithFrame:configuration:](self, "initWithFrame:configuration:", v8, x, y, width, height);

  return v9;
}

- (void)setController:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_controller, a3);
  newValue[0] = _NSConcreteStackBlock;
  newValue[1] = 3221225472;
  newValue[2] = __34__GCControllerView_setController___block_invoke;
  newValue[3] = &unk_10440;
  id v6 = v5;
  id v39 = v6;
  -[GCControllerThumbstickInputView setValueChangedHandler:](self->_leftThumbstick, (char *)newValue);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __34__GCControllerView_setController___block_invoke_2;
  v36[3] = &unk_10440;
  id v7 = v6;
  id v37 = v7;
  -[GCControllerThumbstickInputView setValueChangedHandler:](self->_rightThumbstick, (char *)v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __34__GCControllerView_setController___block_invoke_3;
  v34[3] = &unk_10440;
  id v8 = v7;
  id v35 = v8;
  -[GCControllerDpadInputView setValueChangedHandler:](self->_dpad, (char *)v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __34__GCControllerView_setController___block_invoke_4;
  v32[3] = &unk_10468;
  id v9 = v8;
  id v33 = v9;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_buttonA, (char *)v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __34__GCControllerView_setController___block_invoke_5;
  v30[3] = &unk_10468;
  id v10 = v9;
  id v31 = v10;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_buttonB, (char *)v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __34__GCControllerView_setController___block_invoke_6;
  v28[3] = &unk_10468;
  id v11 = v10;
  id v29 = v11;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_buttonX, (char *)v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __34__GCControllerView_setController___block_invoke_7;
  v26[3] = &unk_10468;
  id v12 = v11;
  id v27 = v12;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_buttonY, (char *)v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __34__GCControllerView_setController___block_invoke_8;
  v24[3] = &unk_10468;
  id v13 = v12;
  id v25 = v13;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_leftShoulder, (char *)v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __34__GCControllerView_setController___block_invoke_9;
  v22[3] = &unk_10468;
  id v14 = v13;
  id v23 = v14;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_rightShoulder, (char *)v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __34__GCControllerView_setController___block_invoke_10;
  v20[3] = &unk_10468;
  id v15 = v14;
  id v21 = v15;
  -[GCControllerButtonInputView setValueChangedHandler:](self->_leftTrigger, (char *)v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __34__GCControllerView_setController___block_invoke_11;
  v18[3] = &unk_10468;
  id v19 = v15;
  rightTrigger = self->_rightTrigger;
  id v17 = v15;
  -[GCControllerButtonInputView setValueChangedHandler:](rightTrigger, (char *)v18);
}

id __34__GCControllerView_setController___block_invoke(uint64_t a1, float a2, float a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:forDirectionPadElement:", GCInputLeftThumbstick, a2, a3);
}

id __34__GCControllerView_setController___block_invoke_2(uint64_t a1, float a2, float a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:forDirectionPadElement:", GCInputRightThumbstick, a2, a3);
}

id __34__GCControllerView_setController___block_invoke_3(uint64_t a1, float a2, float a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:forDirectionPadElement:", GCInputDirectionPad, a2, a3);
}

id __34__GCControllerView_setController___block_invoke_4(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputButtonA forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_5(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputButtonB forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_6(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputButtonX forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_7(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputButtonY forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_8(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputLeftShoulder forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_9(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputRightShoulder forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_10(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputLeftTrigger forButtonElement:a2];
}

id __34__GCControllerView_setController___block_invoke_11(uint64_t a1, float a2)
{
  return [*(id *)(a1 + 32) setValue:GCInputRightTrigger forButtonElement:a2];
}

- (id)applyPadLayout
{
  if (result)
  {
    v1 = result;
    [result bounds];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
    float MaxX = CGRectGetMaxX(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    float MaxY = CGRectGetMaxY(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v8 = CGRectGetWidth(v20);
    [v1[2] frame];
    double v9 = CGRectGetWidth(v21);
    [v1[1] frame];
    [v1[1] setHidden:v8 < v9 + CGRectGetWidth(v22)];
    [v1[2] frame];
    double v11 = MaxX - v10 * 0.5 + -50.0;
    [v1[2] frame];
    objc_msgSend(v1[2], "setCenter:", v11, MaxY - v12 * 0.5 + -150.0);
    [v1[1] frame];
    double v14 = v13 * 0.5 + 0.0 + 50.0;
    [v1[1] frame];
    id v16 = v1[1];
    return (id *)objc_msgSend(v16, "setCenter:", v14, MaxY - v15 * 0.5 + -150.0);
  }
  return result;
}

- (void)applyPhoneLayout
{
  if (a1)
  {
    [(id)a1 bounds];
    CGFloat v3 = v2;
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    id v40 = [(id)a1 superview];
    [v40 frame];
    objc_msgSend((id)a1, "setFrame:");
    double v10 = [v40 window];
    [v10 safeAreaInsets];
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 32) = v12;
    *(void *)(a1 + 40) = v13;
    *(void *)(a1 + 48) = v14;

    __asm { FMOV            V0.2D, #4.0 }
    float64x2_t v20 = vaddq_f64(*(float64x2_t *)(a1 + 24), _Q0);
    float64x2_t v21 = vaddq_f64(*(float64x2_t *)(a1 + 40), _Q0);
    *(float64x2_t *)(a1 + 24) = v20;
    *(float64x2_t *)(a1 + 40) = v21;
    v21.f64[0] = v3;
    v20.f64[0] = v5;
    CGFloat v22 = v7;
    CGFloat v23 = v9;
    float MaxX = CGRectGetMaxX(*(CGRect *)((char *)&v20 - 8));
    v42.origin.CGFloat x = v3;
    v42.origin.CGFloat y = v5;
    v42.size.CGFloat width = v7;
    v42.size.CGFloat height = v9;
    float MaxY = CGRectGetMaxY(v42);
    v43.origin.CGFloat x = v3;
    v43.origin.CGFloat y = v5;
    v43.size.CGFloat width = v7;
    v43.size.CGFloat height = v9;
    double Height = CGRectGetHeight(v43);
    v44.origin.CGFloat x = v3;
    v44.origin.CGFloat y = v5;
    v44.size.CGFloat width = v7;
    v44.size.CGFloat height = v9;
    double Width = CGRectGetWidth(v44);
    [*(id *)(a1 + 16) frame];
    double v29 = MaxX - v28 * 0.5 - *(double *)(a1 + 48);
    double v30 = MaxY;
    [*(id *)(a1 + 16) frame];
    objc_msgSend(*(id *)(a1 + 16), "setCenter:", v29, MaxY - v31 * 0.5 - *(double *)(a1 + 40));
    v32 = *(void **)(a1 + 8);
    if (Height <= Width)
    {
      [v32 setHidden:0];
      [*(id *)(a1 + 8) frame];
      double v38 = *(double *)(a1 + 32) + v37 * 0.5 + 0.0;
      [*(id *)(a1 + 8) frame];
      double v34 = v30 - v39 * 0.5 - *(double *)(a1 + 40);
      id v35 = *(void **)(a1 + 8);
      double v36 = v38;
    }
    else
    {
      [v32 setHidden:1];
      [*(id *)(a1 + 8) frame];
      double v34 = v30 + v33 * -0.5 - *(double *)(a1 + 40);
      id v35 = *(void **)(a1 + 8);
      double v36 = -100.0;
    }
    objc_msgSend(v35, "setCenter:", v36, v34);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)GCControllerView;
  [(GCControllerView *)&v4 layoutSubviews];
  CGFloat v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom]) {
    -[GCControllerView applyPadLayout]((id *)&self->super.super.super.isa);
  }
  else {
    -[GCControllerView applyPhoneLayout]((uint64_t)self);
  }
}

- (void)setupSide:(id)a3 thumbstick:(id)a4 buttons:(id)a5
{
  id v43 = a3;
  id v7 = a4;
  id v8 = a5;
  CGFloat v9 = (char *)[v8 count];
  [v43 frame];
  double v11 = v10 * 0.5;
  [v43 frame];
  double v13 = v12 * 0.5;
  if (!v7)
  {
    switch((unint64_t)v9)
    {
      case 1uLL:
        id v35 = v8;
        uint64_t v36 = 0;
        goto LABEL_12;
      case 2uLL:
        double v37 = [v8 objectAtIndexedSubscript:0];
        objc_msgSend(v37, "setCenter:", v11 + -38.890873, v13 + 38.890873);

        double v11 = v11 + 38.890873;
        double v13 = v13 + -38.890873;
        id v35 = v8;
        uint64_t v36 = 1;
        goto LABEL_12;
      case 3uLL:
        double v38 = [v8 objectAtIndexedSubscript:0];
        objc_msgSend(v38, "setCenter:", v11 + -47.6314011, v13 + 27.4999943);

        double v39 = [v8 objectAtIndexedSubscript:1];
        objc_msgSend(v39, "setCenter:", v11 + 47.6313972, v13 + 27.5000038);

        double v11 = v11 + 0.0;
        double v13 = v13 + -55.0;
        id v35 = v8;
        uint64_t v36 = 2;
        goto LABEL_12;
      case 4uLL:
        id v40 = [v8 objectAtIndexedSubscript:0];
        objc_msgSend(v40, "setCenter:", v11, v13 + 55.0);

        v41 = [v8 objectAtIndexedSubscript:1];
        objc_msgSend(v41, "setCenter:", v11 + 55.0, v13);

        CGRect v42 = [v8 objectAtIndexedSubscript:2];
        objc_msgSend(v42, "setCenter:", v11 + -55.0, v13);

        double v13 = v13 + -55.0;
        id v35 = v8;
        uint64_t v36 = 3;
LABEL_12:
        double v31 = [v35 objectAtIndexedSubscript:v36];
        v32 = v31;
        double v33 = v11;
        double v34 = v13;
        goto LABEL_13;
      default:
        goto LABEL_14;
    }
  }
  objc_msgSend(v7, "setCenter:", v11, v13);
  if (v9)
  {
    uint64_t v14 = [v8 objectAtIndexedSubscript:0];
    [v14 frame];
    double v16 = v15 * 0.5;
    id v17 = [v8 objectAtIndexedSubscript:0];
    [v17 frame];
    double v19 = v18 * 0.5;

    [v43 frame];
    double v21 = v20 - v19;
    CGFloat v22 = [v8 objectAtIndexedSubscript:0];
    objc_msgSend(v22, "setCenter:", v16, v21);

    if (v9 != (unsigned char *)&dword_0 + 1)
    {
      [v43 frame];
      double v24 = v23 - v16;
      [v43 frame];
      double v26 = v25 - v19;
      id v27 = [v8 objectAtIndexedSubscript:1];
      objc_msgSend(v27, "setCenter:", v24, v26);

      if ((unint64_t)v9 >= 3)
      {
        double v28 = [v8 objectAtIndexedSubscript:2];
        objc_msgSend(v28, "setCenter:", v16, v19);

        if (v9 != (unsigned char *)&dword_0 + 3)
        {
          [v43 frame];
          double v30 = v29 - v16;
          double v31 = [v8 objectAtIndexedSubscript:3];
          v32 = v31;
          double v33 = v30;
          double v34 = v19;
LABEL_13:
          objc_msgSend(v31, "setCenter:", v33, v34);
        }
      }
    }
  }
LABEL_14:
}

- (void)setupPositions
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
  objc_super v4 = v3;
  id v8 = v3;
  if (self->_buttonA)
  {
    objc_msgSend(v3, "addObject:");
    objc_super v4 = v8;
  }
  if (self->_buttonB)
  {
    objc_msgSend(v4, "addObject:");
    objc_super v4 = v8;
  }
  if (self->_buttonX)
  {
    objc_msgSend(v4, "addObject:");
    objc_super v4 = v8;
  }
  if (self->_buttonY)
  {
    objc_msgSend(v4, "addObject:");
    objc_super v4 = v8;
  }
  [(GCControllerView *)self setupSide:self->_rightSide thumbstick:self->_rightThumbstick buttons:v4];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
  double v6 = v5;
  if (self->_leftShoulder) {
    objc_msgSend(v5, "addObject:");
  }
  if (self->_rightShoulder) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_leftTrigger) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_rightTrigger) {
    objc_msgSend(v6, "addObject:");
  }
  leftThumbstick = self->_leftThumbstick;
  if (!leftThumbstick) {
    leftThumbstick = self->_dpad;
  }
  [(GCControllerView *)self setupSide:self->_leftSide thumbstick:leftThumbstick buttons:v6];
}

- (id)getUIControlForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:GCInputButtonA])
  {
    id v5 = &OBJC_IVAR___GCControllerView__buttonA;
LABEL_23:
    id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    goto LABEL_24;
  }
  if ([v4 isEqualToString:GCInputButtonB])
  {
    id v5 = &OBJC_IVAR___GCControllerView__buttonB;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputButtonX])
  {
    id v5 = &OBJC_IVAR___GCControllerView__buttonX;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputButtonY])
  {
    id v5 = &OBJC_IVAR___GCControllerView__buttonY;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputDirectionPad])
  {
    id v5 = &OBJC_IVAR___GCControllerView__dpad;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputLeftThumbstick])
  {
    id v5 = &OBJC_IVAR___GCControllerView__leftThumbstick;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputRightThumbstick])
  {
    id v5 = &OBJC_IVAR___GCControllerView__rightThumbstick;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputLeftShoulder])
  {
    id v5 = &OBJC_IVAR___GCControllerView__leftShoulder;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputRightShoulder])
  {
    id v5 = &OBJC_IVAR___GCControllerView__rightShoulder;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputLeftTrigger])
  {
    id v5 = &OBJC_IVAR___GCControllerView__leftTrigger;
    goto LABEL_23;
  }
  if ([v4 isEqualToString:GCInputRightTrigger])
  {
    id v5 = &OBJC_IVAR___GCControllerView__rightTrigger;
    goto LABEL_23;
  }
  id v6 = 0;
LABEL_24:

  return v6;
}

- (id)getConfigurationForElement:(id)a3
{
  id v3 = [(GCControllerView *)self getUIControlForName:a3];
  if (v3)
  {
    id v4 = objc_opt_new();
    objc_msgSend(v4, "setHidden:", objc_msgSend(v3, "isHidden"));
    [v4 setPath:0];
    [v4 setActsAsTouchpad:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 customImage];
      [v4 setPath:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v4, "setActsAsTouchpad:", objc_msgSend(v3, "actsAsTouchpad"));
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setConfigurationForElement:(id)a3 configuration:(id)a4
{
  id v9 = a4;
  id v6 = [(GCControllerView *)self getUIControlForName:a3];
  if (v6)
  {
    objc_msgSend(v6, "setHidden:", objc_msgSend(v9, "isHidden"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [v9 path];
      [v7 setCustomImage:v8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      id v8 = v6;
      objc_msgSend(v8, "setActsAsTouchpad:", objc_msgSend(v9, "actsAsTouchpad"));
    }
  }
LABEL_7:
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GCControllerView;
  -[GCControllerView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  id v5 = (GCControllerView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self || v5 == (GCControllerView *)self->_leftSide || v5 == (GCControllerView *)self->_rightSide) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (GCControllerView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCControllerView shoukd not be encoded!" userInfo:0];
  objc_exception_throw(v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCControllerView shoukd not be encoded!" userInfo:0];
  objc_exception_throw(v4);
}

- (GCTouchController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
  objc_storeStrong((id *)&self->_rightShoulder, 0);
  objc_storeStrong((id *)&self->_leftShoulder, 0);
  objc_storeStrong((id *)&self->_rightThumbstick, 0);
  objc_storeStrong((id *)&self->_leftThumbstick, 0);
  objc_storeStrong((id *)&self->_dpad, 0);
  objc_storeStrong((id *)&self->_buttonY, 0);
  objc_storeStrong((id *)&self->_buttonX, 0);
  objc_storeStrong((id *)&self->_buttonB, 0);
  objc_storeStrong((id *)&self->_buttonA, 0);
  objc_storeStrong((id *)&self->_rightSide, 0);

  objc_storeStrong((id *)&self->_leftSide, 0);
}

@end