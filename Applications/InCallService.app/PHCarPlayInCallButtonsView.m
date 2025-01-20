@interface PHCarPlayInCallButtonsView
- (BOOL)canBecomeFirstResponder;
- (NSArray)buttonsArray;
- (NSMutableArray)buttonDividerViews;
- (NSMutableDictionary)buttonsDictionary;
- (PHCarPlayInCallButtonsView)initWithFrame:(CGRect)a3;
- (PHCarPlayInCallButtonsViewDelegate)delegate;
- (float)buttonDistributionScalingFactor;
- (float)distributedFractionForUndistributedFraction:(float)a3;
- (id)buttonForButtonType:(int)a3 createIfNecessary:(BOOL)a4 createWithHorizontalPositionFraction:(float)a5;
- (id)existingButtonsNotInArray:(id)a3;
- (id)keyForButtonType:(int)a3;
- (id)preferredFocusEnvironments;
- (int)buttonsMode;
- (int64_t)highlightedControlIndex;
- (int64_t)numberOfControls;
- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forButton:(id)a4;
- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forDividerView:(id)a4;
- (void)buttonWasTapped:(id)a3;
- (void)dealloc;
- (void)removeButtons:(id)a3;
- (void)setButtonDistributionScalingFactor:(float)a3;
- (void)setButtonDividerViews:(id)a3;
- (void)setButtonsArray:(id)a3;
- (void)setButtonsDictionary:(id)a3;
- (void)setButtonsMode:(int)a3;
- (void)setButtonsMode:(int)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setHighlightedControlIndex:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)updateButtonsForCallModelState;
@end

@implementation PHCarPlayInCallButtonsView

- (PHCarPlayInCallButtonsView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PHCarPlayInCallButtonsView;
  v3 = -[PHCarPlayInCallButtonsView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1066779279;
    [(PHCarPlayInCallButtonsView *)v3 setButtonDistributionScalingFactor:v4];
    v6 = +[NSMutableDictionary dictionary];
    [(PHCarPlayInCallButtonsView *)v5 setButtonsDictionary:v6];

    v7 = +[NSMutableArray array];
    [(PHCarPlayInCallButtonsView *)v5 setButtonDividerViews:v7];

    v8 = +[UIColor tableBackgroundColor];
    [(PHCarPlayInCallButtonsView *)v5 setBackgroundColor:v8];

    [(PHCarPlayInCallButtonsView *)v5 setOpaque:0];
    v5->_buttonsMode = -1;
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"callModelChangedNotification:" name:TUCallModelChangedNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"phoneCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  self->_delegate = 0;
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallButtonsView;
  [(PHCarPlayInCallButtonsView *)&v4 dealloc];
}

- (int64_t)numberOfControls
{
  v2 = [(PHCarPlayInCallButtonsView *)self buttonsArray];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:1 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  [v4 setToggledOn:v3];
}

- (void)setButtonsMode:(int)a3 animated:(BOOL)a4
{
  v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v72 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "buttonsMode: %d", buf, 8u);
  }

  LODWORD(v7) = 1066779279;
  [(PHCarPlayInCallButtonsView *)self setButtonDistributionScalingFactor:v7];
  switch(a3)
  {
    case 0:
      v8 = [(PHCarPlayInCallButtonsView *)self delegate];
      unsigned int v9 = [v8 isKeypadAllowed];

      v10 = &off_1002DF7B8;
      v11 = &off_1002DF7A0;
      goto LABEL_22;
    case 1:
      v13 = [(PHCarPlayInCallButtonsView *)self delegate];
      unsigned int v9 = [v13 isKeypadAllowed];

      v10 = &off_1002DF7E8;
      v11 = &off_1002DF7D0;
      goto LABEL_22;
    case 2:
      objc_super v12 = &off_1002DF800;
      goto LABEL_25;
    case 3:
      v14 = [(PHCarPlayInCallButtonsView *)self delegate];
      unsigned int v15 = [v14 canSendMessage];

      if (v15)
      {
        LODWORD(v16) = 1.25;
        [(PHCarPlayInCallButtonsView *)self setButtonDistributionScalingFactor:v16];
        objc_super v12 = &off_1002DF830;
      }
      else
      {
        objc_super v12 = &off_1002DF848;
      }
      goto LABEL_25;
    case 4:
      objc_super v12 = &off_1002DF818;
      goto LABEL_25;
    case 5:
      v17 = +[TUCallCenter sharedInstance];
      unsigned int v18 = [v17 isHoldAndAnswerAllowed];

      if (v18)
      {
        v19 = +[TUCallCenter sharedInstance];
        uint64_t v20 = [v19 callWithStatus:2];
        if (v20)
        {
          v21 = (void *)v20;
          v22 = +[TUCallCenter sharedInstance];
          v23 = [v22 callWithStatus:1];

          if (v23)
          {
            v70[0] = &off_1002DF060;
            v24 = [(PHCarPlayInCallButtonsView *)self delegate];
            if ([v24 isSendToVoicemailAllowed]) {
              uint64_t v25 = 16;
            }
            else {
              uint64_t v25 = 13;
            }
            v26 = +[NSNumber numberWithInt:v25];
            v70[1] = v26;
            v27 = &off_1002DF078;
            v28 = v70;
LABEL_40:
            v28[2] = v27;
            +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
            objc_super v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

            LODWORD(v47) = 1.25;
            [(PHCarPlayInCallButtonsView *)self setButtonDistributionScalingFactor:v47];
            goto LABEL_25;
          }
        }
        else
        {
        }
        v69[0] = &off_1002DF060;
        v24 = [(PHCarPlayInCallButtonsView *)self delegate];
        if ([v24 isSendToVoicemailAllowed]) {
          uint64_t v46 = 16;
        }
        else {
          uint64_t v46 = 13;
        }
        v26 = +[NSNumber numberWithInt:v46];
        v69[1] = v26;
        v27 = &off_1002DF090;
        v28 = v69;
        goto LABEL_40;
      }
      v30 = [(PHCarPlayInCallButtonsView *)self delegate];
      unsigned int v9 = [v30 canSendMessage];

      v10 = &off_1002DF890;
      v11 = &off_1002DF878;
LABEL_22:
      if (v9) {
        objc_super v12 = v11;
      }
      else {
        objc_super v12 = v10;
      }
LABEL_25:
      v31 = +[NSMutableArray array];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1000CB114;
      v65[3] = &unk_1002D01F0;
      v65[4] = self;
      double v67 = (float)(1.0 / (float)((float)(unint64_t)[v12 count] + 1.0));
      id v32 = v31;
      id v66 = v32;
      [v12 enumerateObjectsUsingBlock:v65];
      [(PHCarPlayInCallButtonsView *)self setNeedsLayout];
      [(PHCarPlayInCallButtonsView *)self layoutIfNeeded];
      [(PHCarPlayInCallButtonsView *)self setButtonsArray:v32];
      v33 = +[NSMutableArray array];
      v34 = [(PHCarPlayInCallButtonsView *)self existingButtonsNotInArray:v32];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v35 = [v34 countByEnumeratingWithState:&v61 objects:v68 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v62;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v62 != v37) {
              objc_enumerationMutation(v34);
            }
            if ([*(id *)(*((void *)&v61 + 1) + 8 * i) isSelected]) {
              [(PHCarPlayInCallButtonsView *)self setNeedsFocusUpdate];
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v61 objects:v68 count:16];
        }
        while (v36);
      }
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1000CB1A0;
      v56[3] = &unk_1002CDF98;
      id v57 = v32;
      v58 = self;
      id v39 = v34;
      id v59 = v39;
      id v40 = v33;
      id v60 = v40;
      id v41 = v32;
      v42 = objc_retainBlock(v56);
      v48 = _NSConcreteStackBlock;
      uint64_t v49 = 3221225472;
      v50 = sub_1000CB4C0;
      v51 = &unk_1002D0218;
      int v55 = a3;
      v52 = self;
      id v53 = v39;
      id v54 = v40;
      id v43 = v40;
      id v44 = v39;
      v45 = objc_retainBlock(&v48);
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v42, v45, 0.349999994, v48, v49, v50, v51, v52);
      [(PHCarPlayInCallButtonsView *)self updateButtonsForCallModelState];
      self->_buttonsMode = a3;

      return;
    case 6:
      objc_super v12 = &off_1002DF860;
      goto LABEL_25;
    case 7:
      v29 = [(PHCarPlayInCallButtonsView *)self delegate];
      unsigned int v9 = [v29 isKeypadAllowed];

      v10 = &off_1002DF8C0;
      v11 = &off_1002DF8A8;
      goto LABEL_22;
    default:
      objc_super v12 = 0;
      goto LABEL_25;
  }
}

- (void)removeButtons:(id)a3
{
  id v13 = a3;
  id v4 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
  v5 = [v4 keyEnumerator];

  v6 = +[NSMutableArray array];
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      unsigned int v9 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
      v10 = [v9 objectForKey:v8];

      if ([v13 containsObject:v10])
      {
        [v10 removeFromSuperview];
        [v6 addObject:v8];
      }

      uint64_t v11 = [v5 nextObject];

      v8 = (void *)v11;
    }
    while (v11);
  }
  objc_super v12 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
  [v12 removeObjectsForKeys:v6];
}

- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forButton:(id)a4
{
  id v11 = a4;
  v6 = [v11 horizontalPositioningConstraint];

  if (v6)
  {
    v8 = [v11 horizontalPositioningConstraint];
    [(PHCarPlayInCallButtonsView *)self removeConstraint:v8];
  }
  *(float *)&double v7 = a3;
  [(PHCarPlayInCallButtonsView *)self distributedFractionForUndistributedFraction:v7];
  v10 = +[NSLayoutConstraint constraintWithItem:v11 attribute:9 relatedBy:0 toItem:self attribute:2 multiplier:v9 constant:0.0];
  [(PHCarPlayInCallButtonsView *)self addConstraint:v10];
  [v11 setHorizontalPositioningConstraint:v10];
}

- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forDividerView:(id)a4
{
  id v11 = a4;
  v6 = [v11 horizontalPositioningConstraint];

  if (v6)
  {
    v8 = [v11 horizontalPositioningConstraint];
    [(PHCarPlayInCallButtonsView *)self removeConstraint:v8];
  }
  *(float *)&double v7 = a3;
  [(PHCarPlayInCallButtonsView *)self distributedFractionForUndistributedFraction:v7];
  v10 = +[NSLayoutConstraint constraintWithItem:v11 attribute:9 relatedBy:0 toItem:self attribute:2 multiplier:v9 constant:0.0];
  [(PHCarPlayInCallButtonsView *)self addConstraint:v10];
  [v11 setHorizontalPositioningConstraint:v10];
}

- (float)distributedFractionForUndistributedFraction:(float)a3
{
  float v3 = a3 + -0.5;
  [(PHCarPlayInCallButtonsView *)self buttonDistributionScalingFactor];
  return (float)(v3 * v4) + 0.5;
}

- (void)updateButtonsForCallModelState
{
  id v12 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:3 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  if (v12)
  {
    float v3 = [(PHCarPlayInCallButtonsView *)self delegate];
    [v12 setEnabled:[v3 isAddCallAllowed]];
  }
  float v4 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:5 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  if (v4)
  {
    v5 = [(PHCarPlayInCallButtonsView *)self delegate];
    [v4 setEnabled:[v5 isMergeCallsAllowed]];
  }
  v6 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:6 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  if (v6)
  {
    double v7 = [(PHCarPlayInCallButtonsView *)self delegate];
    [v6 setEnabled:[v7 isSwapCallsAllowed]];
  }
  v8 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:2 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  if (v8)
  {
    float v9 = [(PHCarPlayInCallButtonsView *)self delegate];
    [v8 setEnabled:[v9 isKeypadEnabled]];
  }
  v10 = [(PHCarPlayInCallButtonsView *)self buttonForButtonType:17 createIfNecessary:0 createWithHorizontalPositionFraction:0.0];
  if (v10)
  {
    id v11 = [(PHCarPlayInCallButtonsView *)self delegate];
    [v10 setToggledOn:[v11 isHoldEnabled]];
  }
}

- (id)buttonForButtonType:(int)a3 createIfNecessary:(BOOL)a4 createWithHorizontalPositionFraction:(float)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  float v9 = [(PHCarPlayInCallButtonsView *)self delegate];
  id v10 = [v9 currentCallState];

  id v11 = [(PHCarPlayInCallButtonsView *)self keyForButtonType:v7];
  id v12 = +[NSString stringWithFormat:@"%@%ld", v11, v10];

  id v13 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (v14) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = !v6;
  }
  if (!v15)
  {
    double v16 = [PHCarPlayInCallButton alloc];
    v17 = [(PHCarPlayInCallButtonsView *)self delegate];
    id v14 = -[PHCarPlayInCallButton initForButtonType:callState:](v16, "initForButtonType:callState:", v7, [v17 currentCallState]);

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 addTarget:self action:"buttonWasTapped:" forControlEvents:64];
    [(PHCarPlayInCallButtonsView *)self addSubview:v14];
    LODWORD(v18) = 1148846080;
    v19 = +[NSLayoutConstraint constraintWithItem:v14 attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:58.0 priority:v18];
    [(PHCarPlayInCallButtonsView *)self addConstraint:v19];
    *(float *)&double v20 = a5;
    [(PHCarPlayInCallButtonsView *)self applyHorizontalPositioningConstraintWithFraction:v14 forButton:v20];
    [v14 setAlpha:0.0];
    v21 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
    [v21 setObject:v14 forKeyedSubscript:v12];

    if (v7 == 1)
    {
      v22 = [(PHCarPlayInCallButtonsView *)self delegate];
      -[PHCarPlayInCallButtonsView setMuted:](self, "setMuted:", [v22 isMuted]);
    }
  }

  return v14;
}

- (id)existingButtonsNotInArray:(id)a3
{
  id v4 = a3;
  v5 = [(PHCarPlayInCallButtonsView *)self buttonsDictionary];
  BOOL v6 = [v5 allValues];
  id v7 = [v6 mutableCopy];

  [v7 removeObjectsInArray:v4];

  return v7;
}

- (id)keyForButtonType:(int)a3
{
  if (a3 > 0x12) {
    return 0;
  }
  else {
    return off_1002D0238[a3];
  }
}

- (void)buttonWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCarPlayInCallButtonsView *)self delegate];
  [v5 inCallButtonWasTapped:v4];
}

- (id)preferredFocusEnvironments
{
  int buttonsMode = self->_buttonsMode;
  if (buttonsMode == 5)
  {
LABEL_4:
    float v3 = [(PHCarPlayInCallButtonsView *)self buttonsArray];
    uint64_t v4 = [v3 objectAtIndex:0];
    goto LABEL_6;
  }
  if (buttonsMode != 3)
  {
    if (buttonsMode) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  float v3 = [(PHCarPlayInCallButtonsView *)self buttonsArray];
  uint64_t v4 = [v3 lastObject];
LABEL_6:
  id v5 = (void *)v4;

  if (v5)
  {
    v8 = v5;
    BOOL v6 = +[NSArray arrayWithObjects:&v8 count:1];

    goto LABEL_9;
  }
LABEL_8:
  BOOL v6 = &__NSArray0__struct;
LABEL_9:

  return v6;
}

- (int)buttonsMode
{
  return self->_buttonsMode;
}

- (void)setButtonsMode:(int)a3
{
  self->_int buttonsMode = a3;
}

- (PHCarPlayInCallButtonsViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PHCarPlayInCallButtonsViewDelegate *)a3;
}

- (int64_t)highlightedControlIndex
{
  return self->_highlightedControlIndex;
}

- (void)setHighlightedControlIndex:(int64_t)a3
{
  self->_highlightedControlIndex = a3;
}

- (float)buttonDistributionScalingFactor
{
  return self->_buttonDistributionScalingFactor;
}

- (void)setButtonDistributionScalingFactor:(float)a3
{
  self->_buttonDistributionScalingFactor = a3;
}

- (NSMutableDictionary)buttonsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtonsDictionary:(id)a3
{
}

- (NSArray)buttonsArray
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setButtonsArray:(id)a3
{
}

- (NSMutableArray)buttonDividerViews
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setButtonDividerViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDividerViews, 0);
  objc_storeStrong((id *)&self->_buttonsArray, 0);

  objc_storeStrong((id *)&self->_buttonsDictionary, 0);
}

@end