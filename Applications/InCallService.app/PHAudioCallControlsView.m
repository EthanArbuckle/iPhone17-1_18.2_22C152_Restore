@interface PHAudioCallControlsView
+ (BOOL)audioCallControlTypeDependsUponImage:(unint64_t)a3;
- (BOOL)buttonsEnabled;
- (BOOL)needsReloadButtonViews;
- (CGSize)intrinsicContentSize;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSArray)buttonsArray;
- (NSMutableDictionary)buttonUpdates;
- (PHAudioCallControlsView)initWithCallDisplayStyleManager:(id)a3;
- (PHAudioCallControlsViewDelegate)delegate;
- (_UIVisualEffectBackdropView)captureView;
- (double)_horizontalSpacing;
- (double)_topMargin;
- (double)_verticalSpacing;
- (id)buttonForControlType:(unint64_t)a3;
- (id)menuForAudioControlsButton:(id)a3;
- (void)assignControlType:(unint64_t)a3 toButton:(id)a4;
- (void)assignControlType:(unint64_t)a3 toButton:(id)a4 completion:(id)a5;
- (void)buttonLongPressGestureRecognizer:(id)a3;
- (void)buttonShortPressGestureRecognizer:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)changeVideoStreamingButtonTitleWithIsSharing:(BOOL)a3;
- (void)dismissAudioRoutesMenu;
- (void)forceUpdateAudioRoutesImageForButton:(id)a3 completion:(id)a4;
- (void)reloadButtonViewStates;
- (void)reloadButtonViews;
- (void)replaceBlock:(id)a3 currentButton:(id)a4;
- (void)setButtonUpdates:(id)a3;
- (void)setButtonsArray:(id)a3;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setCallDisplayStyleManager:(id)a3;
- (void)setCaptureView:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPrefersWhiteButtonTextColor:(BOOL)a3;
- (void)setSelectedState:(BOOL)a3 forControlType:(unint64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundMaterial:(unint64_t)a3;
- (void)updateControls;
@end

@implementation PHAudioCallControlsView

- (PHAudioCallControlsView)initWithCallDisplayStyleManager:(id)a3
{
  v4 = (ICSCallDisplayStyleManager *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PHAudioCallControlsView;
  v5 = [(PHAudioCallControlsView *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(PHAudioCallControlsView *)v5 layer];
    [v7 setAllowsGroupBlending:0];

    v8 = [(PHAudioCallControlsView *)v6 layer];
    [v8 setAllowsGroupOpacity:0];

    v9 = +[UIColor clearColor];
    [(PHAudioCallControlsView *)v6 setBackgroundColor:v9];

    v6->_buttonsEnabled = 1;
    v6->_callDisplayStyleManager = v4;
    uint64_t v10 = objc_opt_new();
    buttonUpdates = v6->_buttonUpdates;
    v6->_buttonUpdates = (NSMutableDictionary *)v10;
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PHAudioCallControlsView *)self delegate];
  id v4 = [v3 numberOfRowsInControlsView:self];

  v5 = [(PHAudioCallControlsView *)self buttonsArray];
  v6 = [v5 objectAtIndexedSubscript:0];
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v9 = (double)(unint64_t)v4;
  [(PHAudioCallControlsView *)self _topMargin];
  double v11 = v10 + v8 * (double)(unint64_t)v4;
  double v12 = (double)((unint64_t)v4 - 1);
  [(PHAudioCallControlsView *)self _verticalSpacing];
  double v14 = v11 + v12 * v13;
  [(PHAudioCallControlsView *)self _verticalSpacing];
  double v16 = v14 + v15 * 0.5;

  v17 = +[CNKFeatures sharedInstance];
  if (![v17 isButtonLayoutEnabled])
  {
    double v20 = 320.0;
LABEL_8:

    goto LABEL_9;
  }
  v18 = [(PHAudioCallControlsView *)self callDisplayStyleManager];
  id v19 = [v18 callDisplayStyle];

  if (v19 != (id)3)
  {
    v21 = +[UIScreen mainScreen];
    [v21 bounds];
    double v23 = v22;
    double v20 = v24;

    if (v23 < v20) {
      double v20 = v23;
    }
    v17 = [(PHAudioCallControlsView *)self buttonsArray];
    v25 = [v17 objectAtIndexedSubscript:0];
    [v25 intrinsicContentSize];
    double v27 = v26;
    [(PHAudioCallControlsView *)self _topMargin];
    double v29 = v28 + v27 * v9;
    [(PHAudioCallControlsView *)self _verticalSpacing];
    double v16 = v29 + v12 * v30;

    goto LABEL_8;
  }
  double v20 = 320.0;
LABEL_9:
  double v31 = v20;
  double v32 = v16;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)setDelegate:(id)a3
{
  if (a3)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    [(PHAudioCallControlsView *)self reloadButtonViews];
  }
}

- (void)reloadButtonViews
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(UI) Reloading Six-up Audio Controls", buf, 2u);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v4 = [(PHAudioCallControlsView *)self buttonsArray];
  id v5 = [v4 countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v81;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v81 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * i) removeFromSuperview];
      }
      id v6 = [v4 countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v6);
  }

  [(PHAudioCallControlsView *)self setButtonsArray:0];
  v78 = +[NSMutableArray array];
  double v9 = [(PHAudioCallControlsView *)self delegate];
  id v77 = [v9 numberOfRowsInControlsView:self];

  double v10 = [(PHAudioCallControlsView *)self delegate];
  v79 = (char *)[v10 numberOfColumnsInControlsView:self];

  double v11 = &_ss4Int8VN_ptr;
  double v12 = +[CNKFeatures sharedInstance];
  if ([v12 isButtonLayoutEnabled])
  {
    double v13 = [(PHAudioCallControlsView *)self captureView];

    if (v13) {
      goto LABEL_14;
    }
    id v14 = objc_alloc((Class)_UIVisualEffectBackdropView);
    [(PHAudioCallControlsView *)self bounds];
    id v15 = [v14 initWithFrame:];
    [(PHAudioCallControlsView *)self setCaptureView:v15];

    double v16 = [(PHAudioCallControlsView *)self captureView];
    [v16 setAutoresizingMask:18];

    v17 = [(PHAudioCallControlsView *)self captureView];
    [(PHAudioCallControlsView *)self insertSubview:v17 atIndex:0];

    v18 = [(PHAudioCallControlsView *)self captureView];
    [v18 setRenderMode:1];

    double v12 = [(PHAudioCallControlsView *)self captureView];
    id v19 = [v12 captureGroup];
    [v19 setGroupName:@"InCallButtonsCaptureGroup"];
  }
LABEL_14:
  if (v77)
  {
    uint64_t v20 = 0;
    v21 = &_ss4Int8VN_ptr;
    while (!v79)
    {
LABEL_41:
      if ((id)++v20 == v77) {
        goto LABEL_42;
      }
    }
    double v22 = 0;
    int v23 = v79 - 1;
    while (1)
    {
      double v24 = [(PHAudioCallControlsView *)self callDisplayStyleManager];
      id v25 = [v24 callDisplayStyle];

      if (v25 == (id)3)
      {
        +[PHUIConfiguration ambientInCallControlSize];
        double v27 = -[PHAudioControlsButton initWithSize:]([PHAudioControlsButton alloc], "initWithSize:", v26, v26);
      }
      else
      {
        double v27 = +[PHAudioControlsButton buttonWithType:0];
      }
      double v28 = v27;
      [(PHAudioControlsButton *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PHAudioControlsButton *)v28 setOpaque:0];
      [(PHAudioCallControlsView *)self addSubview:v28];
      double v29 = [v11[164] sharedInstance];
      if (([v29 isButtonLayoutEnabled] & 1) == 0) {
        break;
      }
      double v30 = [(PHAudioCallControlsView *)self callDisplayStyleManager];
      id v31 = [v30 callDisplayStyle];

      if (v31 == (id)3) {
        goto LABEL_28;
      }
      double v32 = +[UIScreen mainScreen];
      [v32 bounds];
      double v34 = v33;
      double v36 = v35;

      if (v34 >= v36) {
        double v37 = v36;
      }
      else {
        double v37 = v34;
      }
      double v38 = v37 * 0.102;
      double v39 = v37 + v37 * 0.102 * -2.0;
      [(PHAudioControlsButton *)v28 intrinsicContentSize];
      double v41 = (v39 + v40 * -3.0) * 0.5;
      [(PHAudioControlsButton *)v28 intrinsicContentSize];
      double v43 = v38 + (double)(int)v22 * v42 + (double)(int)v22 * v41;
      v44 = v21[247];
      double v45 = 1.0;
      v46 = v28;
      uint64_t v47 = 5;
      v48 = self;
      uint64_t v49 = 5;
LABEL_35:
      v61 = [v44 constraintWithItem:v46 attribute:v47 relatedBy:0 toItem:v48 attribute:v49 multiplier:v45 constant:v43];
      [(PHAudioCallControlsView *)self addConstraint:v61];

      v62 = v21[247];
      [(PHAudioCallControlsView *)self _topMargin];
      double v64 = v63;
      [(PHAudioControlsButton *)v28 intrinsicContentSize];
      double v66 = v65;
      [(PHAudioCallControlsView *)self _verticalSpacing];
      v68 = [v62 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v64 + (double)(int)v20 * (v66 + v67)];
      [(PHAudioCallControlsView *)self addConstraint:v68];

      v69 = [(PHAudioCallControlsView *)self delegate];
      id v70 = [v69 controlTypeAtRow:v20 column:v22];

      [(PHAudioControlsButton *)v28 setControlType:v70];
      if (v70 == (id)3) {
        [(PHAudioControlsButton *)v28 setMenuDataSource:self];
      }
      else {
        [(PHAudioControlsButton *)v28 addTarget:self action:"buttonTapped:" forControlEvents:64];
      }
      id v71 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"buttonShortPressGestureRecognizer:"];
      [v71 setMinimumPressDuration:1.5];
      [(PHAudioControlsButton *)v28 addGestureRecognizer:v71];
      id v72 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"buttonLongPressGestureRecognizer:"];
      [v72 setMinimumPressDuration:3.0];
      [v72 setAllowableMovement:1000.0];
      [(PHAudioControlsButton *)v28 addGestureRecognizer:v72];
      [v71 requireGestureRecognizerToFail:v72];
      [v78 addObject:v28];
      v73 = v11;
      v74 = [v11[164] sharedInstance];
      unsigned int v75 = [v74 isButtonLayoutEnabled];

      if (v75)
      {
        v76 = [(PHAudioCallControlsView *)self captureView];
        [(PHAudioControlsButton *)v28 setCaptureView:v76];
      }
      ++v22;
      --v23;
      double v11 = v73;
      v21 = &_ss4Int8VN_ptr;
      if (v79 == v22) {
        goto LABEL_41;
      }
    }

LABEL_28:
    if ([(PHAudioCallControlsView *)self _shouldReverseLayoutDirection]) {
      int v50 = v23;
    }
    else {
      int v50 = (int)v22;
    }
    [(PHAudioControlsButton *)v28 intrinsicContentSize];
    double v52 = v51;
    [(PHAudioCallControlsView *)self _horizontalSpacing];
    float v54 = v53 * (double)(unint64_t)(v79 - 1) + (double)(unint64_t)v79 * v52;
    [(PHAudioControlsButton *)v28 intrinsicContentSize];
    double v56 = v55;
    if (v50) {
      double v57 = 1.0;
    }
    else {
      double v57 = 0.0;
    }
    [(PHAudioCallControlsView *)self _horizontalSpacing];
    *(float *)&double v58 = (v56 + v57 * v58) * (double)v50;
    float v59 = *(float *)&v58 + (float)(v54 * -0.5);
    [(PHAudioControlsButton *)v28 intrinsicContentSize];
    *(float *)&double v60 = v60 * 0.5 + v59;
    v44 = v21[247];
    double v43 = *(float *)&v60;
    double v45 = 1.0;
    v46 = v28;
    uint64_t v47 = 9;
    v48 = self;
    uint64_t v49 = 9;
    goto LABEL_35;
  }
LABEL_42:
  [(PHAudioCallControlsView *)self setButtonsArray:v78];
  [(PHAudioCallControlsView *)self reloadButtonViewStates];
  [(PHAudioCallControlsView *)self invalidateIntrinsicContentSize];
}

- (void)replaceBlock:(id)a3 currentButton:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(PHAudioCallControlsView *)self buttonUpdates];
    double v8 = [v6 uuid];
    double v9 = [v7 objectForKey:v8];

    if (v9) {
      dispatch_block_cancel(v9);
    }
    double v10 = [(PHAudioCallControlsView *)self buttonUpdates];
    if (v13)
    {
      double v11 = objc_retainBlock(v13);
      double v12 = [v6 uuid];
      [v10 setObject:v11 forKey:v12];
    }
    else
    {
      double v11 = [v6 uuid];
      [v10 removeObjectForKey:v11];
    }
  }
}

- (void)forceUpdateAudioRoutesImageForButton:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10008A76C;
  v20[4] = sub_10008A77C;
  id v21 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A784;
  block[3] = &unk_1002CE4C8;
  id v19 = v20;
  id v8 = v6;
  id v18 = v8;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(PHAudioCallControlsView *)self replaceBlock:v9 currentButton:v8];
  double v10 = [(PHAudioCallControlsView *)self delegate];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008A878;
  v13[3] = &unk_1002CF5B0;
  double v16 = v20;
  id v11 = v9;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 fetchAudioRoutesImageWithCompletion:v13];

  _Block_object_dispose(v20, 8);
}

- (BOOL)needsReloadButtonViews
{
  v3 = [(PHAudioCallControlsView *)self delegate];
  id v4 = (char *)[v3 numberOfRowsInControlsView:self];

  id v5 = [(PHAudioCallControlsView *)self delegate];
  id v6 = [v5 numberOfColumnsInControlsView:self];

  if (!v4) {
    return 0;
  }
  uint64_t v7 = 0;
  id v8 = 0;
  while (!v6)
  {
LABEL_11:
    ++v8;
    v7 += (uint64_t)v6;
    if (v8 == v4) {
      return 0;
    }
  }
  uint64_t v9 = 0;
  while (1)
  {
    double v10 = [(PHAudioCallControlsView *)self buttonsArray];
    id v11 = [v10 count];

    if ((unint64_t)v11 <= v7 + v9) {
      return 1;
    }
    id v12 = [(PHAudioCallControlsView *)self delegate];
    id v13 = [v12 controlTypeAtRow:v8 column:v9];

    id v14 = [(PHAudioCallControlsView *)self buttonsArray];
    id v15 = [v14 objectAtIndex:v7 + v9];

    if (v13 != [v15 controlType])
    {
      BOOL v16 = 1;
      goto LABEL_16;
    }
    if ([(id)objc_opt_class() audioCallControlTypeDependsUponImage:v13]) {
      break;
    }
LABEL_10:

    if (v6 == (id)++v9) {
      goto LABEL_11;
    }
  }
  if (v13 == (id)3)
  {
    [(PHAudioCallControlsView *)self forceUpdateAudioRoutesImageForButton:v15 completion:0];
    goto LABEL_10;
  }
  v17 = [(PHAudioCallControlsView *)self buttonsArray];
  id v18 = [v17 objectAtIndexedSubscript:v7 + v9];

  id v19 = [(PHAudioCallControlsView *)self delegate];
  uint64_t v20 = [v19 imageForControlType:v13];

  id v21 = [v18 image];
  BOOL v16 = v20 != v21;

LABEL_16:
  return v16;
}

+ (BOOL)audioCallControlTypeDependsUponImage:(unint64_t)a3
{
  return (a3 < 0x11) & (0x12008u >> a3);
}

- (void)dismissAudioRoutesMenu
{
  id v4 = [(PHAudioCallControlsView *)self buttonForControlType:3];
  [v4 setMenu:0];
  v3 = [(PHAudioCallControlsView *)self menuForAudioControlsButton:v4];
  [v4 setMenu:v3];
}

- (void)updateControls
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(UI) Asked to update Six-up Audio Controls", (uint8_t *)&v14, 2u);
  }

  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];
  id v6 = [v5 mostRecentlyDisconnectedAudioCall];

  if (v6 && [v6 isEmergency]) {
    unsigned int v7 = [v6 disconnectedReasonRequiresCallBackUI];
  }
  else {
    unsigned int v7 = 0;
  }
  id v8 = +[TUCallCenter sharedInstance];
  uint64_t v9 = [v8 frontmostCall];

  if (v9 || v7)
  {
    if ([(PHAudioCallControlsView *)self needsReloadButtonViews])
    {
      [(PHAudioCallControlsView *)self reloadButtonViews];
    }
    else
    {
      id v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(UI) No need to reload Six-up Audio Controls", (uint8_t *)&v14, 2u);
      }
    }
    [(PHAudioCallControlsView *)self reloadButtonViewStates];
  }
  else
  {
    double v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[TUCallCenter sharedInstance];
      id v12 = [v11 currentCalls];
      int v14 = 138412290;
      id v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(UI) Ignoring call to update controls since frontmostCall is nil (current calls are %@).", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)reloadButtonViewStates
{
  v3 = [(PHAudioCallControlsView *)self delegate];
  id v4 = (char *)[v3 numberOfRowsInControlsView:self];

  id v5 = [(PHAudioCallControlsView *)self delegate];
  id v6 = [v5 numberOfColumnsInControlsView:self];

  if (v4)
  {
    unint64_t v7 = 0;
    for (i = 0; i != v4; ++i)
    {
      uint64_t v9 = (char *)v6;
      unint64_t v10 = v7;
      if (v6)
      {
        do
        {
          id v11 = [(PHAudioCallControlsView *)self buttonsArray];
          id v12 = [v11 count];

          if ((unint64_t)v12 > v10)
          {
            id v13 = [(PHAudioCallControlsView *)self buttonsArray];
            int v14 = [v13 objectAtIndex:v10];

            id v15 = [v14 controlType];
            if ([(PHAudioCallControlsView *)self buttonsEnabled])
            {
              BOOL v16 = [(PHAudioCallControlsView *)self delegate];
              [v14 setEnabled:[v16 controlTypeIsEnabled:v15]];
            }
            else
            {
              [v14 setEnabled:0];
            }
            v17 = [(PHAudioCallControlsView *)self delegate];
            if ([v17 controlTypeIsSelected:v15]) {
              id v18 = [v14 isEnabled];
            }
            else {
              id v18 = 0;
            }
            [v14 setSelected:v18];

            [(PHAudioCallControlsView *)self assignControlType:v15 toButton:v14];
          }
          ++v10;
          --v9;
        }
        while (v9);
      }
      v7 += (unint64_t)v6;
    }
  }
}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  if (v8
    && ([v8 imageForState:0],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10008B2D4;
    v29[3] = &unk_1002CF5D8;
    id v11 = v8;
    id v30 = v11;
    id v31 = self;
    unint64_t v32 = a3;
    id v12 = objc_retainBlock(v29);
    if (a3 == 3)
    {
      id v13 = +[TURoute speakerAudioRouteGlyph];
      int v14 = [v13 imageWithRenderingMode:2];
      ((void (*)(void *, void *))v12[2])(v12, v14);

      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = sub_10008A76C;
      v27[4] = sub_10008A77C;
      id v28 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008B3E4;
      block[3] = &unk_1002CF600;
      id v25 = v12;
      double v26 = v27;
      dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [(PHAudioCallControlsView *)self replaceBlock:v15 currentButton:v11];
      BOOL v16 = [(PHAudioCallControlsView *)self delegate];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10008B400;
      v20[3] = &unk_1002CF5B0;
      int v23 = v27;
      id v17 = v15;
      id v21 = v17;
      double v22 = v9;
      [v16 fetchAudioRoutesImageWithCompletion:v20];

      _Block_object_dispose(v27, 8);
    }
    else
    {
      [(PHAudioCallControlsView *)self replaceBlock:0 currentButton:v11];
      id v18 = [(PHAudioCallControlsView *)self delegate];
      id v19 = [v18 imageForControlType:a3];
      ((void (*)(void *, void *))v12[2])(v12, v19);

      if (v9) {
        v9[2](v9);
      }
    }
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4
{
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallControlsView *)self delegate];
  [v5 controlTypeTapped:[v4 controlType] forView:v4];
}

- (void)buttonShortPressGestureRecognizer:(id)a3
{
  id v6 = a3;
  if ([v6 state] == (id)1)
  {
    id v4 = [(PHAudioCallControlsView *)self delegate];
    id v5 = [v6 view];
    [v4 controlTypeShortPressed:[v5 controlType]];
  }
}

- (void)buttonLongPressGestureRecognizer:(id)a3
{
  id v6 = a3;
  if ([v6 state] == (id)1)
  {
    id v4 = [(PHAudioCallControlsView *)self delegate];
    id v5 = [v6 view];
    [v4 controlTypeLongPressed:[v5 controlType]];
  }
}

- (void)setSelectedState:(BOOL)a3 forControlType:(unint64_t)a4
{
  BOOL v4 = a3;
  id v5 = [(PHAudioCallControlsView *)self buttonForControlType:a4];
  [v5 setSelected:v4];
}

- (id)buttonForControlType:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(PHAudioCallControlsView *)self buttonsArray];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 controlType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)setButtonsEnabled:(BOOL)a3
{
  if (self->_buttonsEnabled != a3)
  {
    BOOL v3 = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(PHAudioCallControlsView *)self buttonsArray];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (!v3) {
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) setSelected:0];
          }
          [v10 setEnabled:v3];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    self->_buttonsEnabled = v3;
  }
}

- (void)setPrefersWhiteButtonTextColor:(BOOL)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(PHAudioCallControlsView *)self buttonsArray];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (a3)
        {
          id v10 = +[UIColor whiteColor];
          [v9 setTitleColor:v10 forState:0];

          +[UIColor whiteColor];
        }
        else
        {
          long long v11 = +[UIColor blackColor];
          [v9 setTitleColor:v11 forState:0];

          +[UIColor blackColor];
        long long v12 = };
        [v9 setTitleColor:v12 forState:2];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)updateBackgroundMaterial:(unint64_t)a3
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SNAP: Setting button background material to type: %lu", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(PHAudioCallControlsView *)self buttonsArray];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) updateBackgroundMaterial:a3];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)changeVideoStreamingButtonTitleWithIsSharing:(BOOL)a3
{
  BOOL v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(PHAudioCallControlsView *)self buttonsArray];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 controlType] == (id)17)
        {
          id v10 = +[NSBundle mainBundle];
          long long v11 = v10;
          if (v3) {
            CFStringRef v12 = @"LIVE_VIDEO";
          }
          else {
            CFStringRef v12 = @"RESUME_VIDEO";
          }
          long long v13 = [v10 localizedStringForKey:v12 value:&stru_1002D6110 table:@"InCallService"];
          [v9 setTitle:v13 forState:0];

          goto LABEL_14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PHAudioCallControlsView *)self transform];
  if (CGAffineTransformIsIdentity(&v7))
  {
    v6.receiver = self;
    v6.super_class = (Class)PHAudioCallControlsView;
    -[PHAudioCallControlsView setCenter:](&v6, "setCenter:", x, y);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PHAudioCallControlsView *)self transform];
  if (CGAffineTransformIsIdentity(&v9))
  {
    v8.receiver = self;
    v8.super_class = (Class)PHAudioCallControlsView;
    -[PHAudioCallControlsView setFrame:](&v8, "setFrame:", x, y, width, height);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHAudioCallControlsView;
  id v4 = a3;
  [(PHAudioCallControlsView *)&v11 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  objc_super v6 = [(PHAudioCallControlsView *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7)
  {
    objc_super v8 = [(PHAudioCallControlsView *)self traitCollection];
    id v9 = [v8 _backlightLuminance];

    [(PHAudioCallControlsView *)self setUserInteractionEnabled:v9 != (id)1];
    id v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v13 = v9 != (id)1;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting userInteractionEnabled of controls view to %d because of back light change", buf, 8u);
    }
  }
}

- (double)_topMargin
{
  return 0.0;
}

- (double)_verticalSpacing
{
  v2 = [(PHAudioCallControlsView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  double v4 = 0.0;
  if (v3 != (id)3)
  {
    id v5 = +[CNKFeatures sharedInstance];
    unsigned int v6 = [v5 isButtonLayoutEnabled];

    if (v6)
    {
      id v7 = +[UIScreen mainScreen];
      [v7 bounds];
      double v9 = v8;
      double v11 = v10;

      if (v9 < v11) {
        double v9 = v11;
      }
      +[PHUIConfiguration inCallControlButtonVerticalSpacingRatio];
      return v12 * v9;
    }
    else
    {
      unint64_t v13 = +[PHUIConfiguration inCallControlSpacing];
      if (v13 <= 5) {
        return dbl_100284E48[v13];
      }
    }
  }
  return v4;
}

- (double)_horizontalSpacing
{
  v2 = [(PHAudioCallControlsView *)self callDisplayStyleManager];
  id v3 = [v2 callDisplayStyle];

  if (v3 == (id)3)
  {
    +[PHUIConfiguration ambientInCallControlSpacing];
  }
  else
  {
    unint64_t v5 = +[PHUIConfiguration inCallControlSpacing];
    double result = 0.0;
    if (v5 <= 5) {
      return dbl_100284E78[v5];
    }
  }
  return result;
}

- (id)menuForAudioControlsButton:(id)a3
{
  id v3 = [(PHAudioCallControlsView *)self delegate];
  double v4 = [v3 audioRouteMenu];

  return v4;
}

- (PHAudioCallControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioCallControlsViewDelegate *)WeakRetained;
}

- (BOOL)buttonsEnabled
{
  return self->_buttonsEnabled;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (void)setCallDisplayStyleManager:(id)a3
{
  self->_callDisplayStyleManager = (ICSCallDisplayStyleManager *)a3;
}

- (NSArray)buttonsArray
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtonsArray:(id)a3
{
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
}

- (NSMutableDictionary)buttonUpdates
{
  return self->_buttonUpdates;
}

- (void)setButtonUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonUpdates, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_buttonsArray, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end