@interface PKPaletteTransition
- (BOOL)_canMoveToNextTransitionStage;
- (BOOL)isTransitionInProgress;
- (NSArray)_remainingTransitionStages;
- (PKPaletteTransition)initWithInitialVisualState:(int64_t)a3;
- (PKPaletteTransitionDelegate)delegate;
- (UIViewFloatAnimatableProperty)expandedToCollapsedAnimatableProperty;
- (UIViewFloatAnimatableProperty)rotationAngleAnimatableProperty;
- (double)expandedToCollapsedRatio;
- (int64_t)_currentStage;
- (int64_t)initialVisualState;
- (int64_t)intermediateVisualState;
- (int64_t)pointingDirection;
- (int64_t)targetVisualState;
- (void)_handleExpandedToCollapsedAnimatablePropertyPresentationValueChanged;
- (void)_handleRotationAnimatablePropertyPresentationValueChanged;
- (void)_moveToNextTransitionStageIfReady;
- (void)_setIntermediateVisualState:(int64_t)a3;
- (void)_setPointingDirection:(int64_t)a3;
- (void)_setTargetVisualState:(int64_t)a3;
- (void)paletteDidBeginResizingAnimation;
- (void)paletteDidBeginRotationAnimation;
- (void)setDelegate:(id)a3;
- (void)setExpandedToCollapsedAnimatableProperty:(id)a3;
- (void)setRotationAngleAnimatableProperty:(id)a3;
- (void)set_remainingTransitionStages:(id)a3;
- (void)transitionToVisualState:(int64_t)a3;
@end

@implementation PKPaletteTransition

- (PKPaletteTransition)initWithInitialVisualState:(int64_t)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PKPaletteTransition;
  v4 = [(PKPaletteTransition *)&v35 init];
  v5 = v4;
  if (v4)
  {
    v4->_targetVisualState = a3;
    v4->_intermediateVisualState = a3;
    v4->_initialVisualState = a3;
    objc_initWeak(&location, v4);
    uint64_t v6 = 2 * (a3 == 6);
    remainingTransitionStages = v5->__remainingTransitionStages;
    v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (a3 == 7) {
      uint64_t v6 = 1;
    }
    v5->_pointingDirection = v6;
    v5->__remainingTransitionStages = v8;

    v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    rotationAngleAnimatableProperty = v5->_rotationAngleAnimatableProperty;
    v5->_rotationAngleAnimatableProperty = v9;

    uint64_t v11 = [(PKPaletteTransition *)v5 pointingDirection];
    v12 = [(PKPaletteTransition *)v5 rotationAngleAnimatableProperty];
    v13 = v12;
    double v14 = 1.57079633;
    if (v11 != 2) {
      double v14 = 0.0;
    }
    if (v11 == 1) {
      double v14 = -1.57079633;
    }
    [v12 setValue:v14];

    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v16 = [(PKPaletteTransition *)v5 rotationAngleAnimatableProperty];
    v41[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __50__PKPaletteTransition_initWithInitialVisualState___block_invoke;
    v32[3] = &unk_1E64C5998;
    objc_copyWeak(&v33, &location);
    [v15 _createTransformerWithInputAnimatableProperties:v17 presentationValueChangedCallback:v32];

    v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    expandedToCollapsedAnimatableProperty = v5->_expandedToCollapsedAnimatableProperty;
    v5->_expandedToCollapsedAnimatableProperty = v18;

    double v20 = 1.0;
    if ((unint64_t)(a3 - 1) <= 6) {
      double v20 = dbl_1C482A938[a3 - 1];
    }
    v21 = [(PKPaletteTransition *)v5 expandedToCollapsedAnimatableProperty];
    [v21 setValue:v20];

    v22 = (void *)MEMORY[0x1E4FB1EB0];
    v23 = [(PKPaletteTransition *)v5 expandedToCollapsedAnimatableProperty];
    v40 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__PKPaletteTransition_initWithInitialVisualState___block_invoke_2;
    v30[3] = &unk_1E64C5998;
    objc_copyWeak(&v31, &location);
    [v22 _createTransformerWithInputAnimatableProperties:v24 presentationValueChangedCallback:v30];

    v25 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      PKPaletteVisualStateDescription(a3);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v27 = [(PKPaletteTransition *)v5 pointingDirection];
      if (v27 > 2) {
        v28 = 0;
      }
      else {
        v28 = off_1E64C90E0[v27];
      }
      *(_DWORD *)buf = 138412546;
      id v37 = v26;
      __int16 v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Initializing palette transition with initial state %@+%@.", buf, 0x16u);
    }
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __50__PKPaletteTransition_initWithInitialVisualState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleRotationAnimatablePropertyPresentationValueChanged];
    id WeakRetained = v2;
  }
}

void __50__PKPaletteTransition_initWithInitialVisualState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleExpandedToCollapsedAnimatablePropertyPresentationValueChanged];
    id WeakRetained = v2;
  }
}

- (void)_setIntermediateVisualState:(int64_t)a3
{
  if (self->_intermediateVisualState != a3)
  {
    self->_intermediateVisualState = a3;
    id v4 = [(PKPaletteTransition *)self delegate];
    [v4 transitionIntermediateVisualStateDidChange:self];
  }
}

- (void)_setPointingDirection:(int64_t)a3
{
  if (self->_pointingDirection != a3)
  {
    self->_pointingDirection = a3;
    id v4 = [(PKPaletteTransition *)self delegate];
    [v4 transitionPointingDirectionDidChange:self];
  }
}

- (int64_t)_currentStage
{
  v3 = [(PKPaletteTransition *)self _remainingTransitionStages];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(PKPaletteTransition *)self _remainingTransitionStages];
  uint64_t v6 = [v5 firstObject];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (BOOL)isTransitionInProgress
{
  id v2 = [(PKPaletteTransition *)self _remainingTransitionStages];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (double)expandedToCollapsedRatio
{
  id v2 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
  [v2 presentationValue];
  double v4 = v3;

  return v4;
}

- (void)transitionToVisualState:(int64_t)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteTransition *)self targetVisualState] != a3)
  {
    unint64_t v5 = [(PKPaletteTransition *)self intermediateVisualState];
    int64_t v6 = [(PKPaletteTransition *)self pointingDirection];
    int64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = v7;
    switch(v5)
    {
      case 2uLL:
        switch(a3)
        {
          case 2:
            if (!v6) {
              goto LABEL_49;
            }
            v9 = &unk_1F200ED18;
            break;
          case 3:
            if (v6) {
              [v7 addObjectsFromArray:&unk_1F200ED30];
            }
            v10 = &unk_1F200E6A0;
            goto LABEL_45;
          case 4:
          case 5:
            if (v6) {
              [v7 addObjectsFromArray:&unk_1F200ED48];
            }
            v9 = &unk_1F200ED60;
            goto LABEL_48;
          case 6:
          case 7:
            v9 = &unk_1F200ED78;
            goto LABEL_48;
          default:
            goto LABEL_49;
        }
        goto LABEL_48;
      case 3uLL:
        switch(a3)
        {
          case 2:
            if (v6) {
              [v7 addObjectsFromArray:&unk_1F200ED90];
            }
            v10 = &unk_1F200E6D0;
LABEL_45:
            [v8 addObject:v10];
            goto LABEL_49;
          case 3:
            if (!v6) {
              goto LABEL_49;
            }
            v9 = &unk_1F200EDA8;
            break;
          case 4:
          case 5:
            if (v6) {
              [v7 addObjectsFromArray:&unk_1F200EDC0];
            }
            v9 = &unk_1F200EDD8;
            goto LABEL_48;
          case 6:
          case 7:
            v9 = &unk_1F200EDF0;
            goto LABEL_48;
          default:
            goto LABEL_49;
        }
        goto LABEL_48;
      case 4uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1F200EE08;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 6) < 2)
        {
          v9 = &unk_1F200EE38;
          goto LABEL_48;
        }
        if (a3 != 5) {
          goto LABEL_49;
        }
        v9 = &unk_1F200EE20;
        goto LABEL_48;
      case 5uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1F200EE50;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 6) < 2)
        {
          v9 = &unk_1F200EE80;
          goto LABEL_48;
        }
        if (a3 != 4) {
          goto LABEL_49;
        }
        v9 = &unk_1F200EE68;
        goto LABEL_48;
      case 6uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1F200EE98;
          goto LABEL_48;
        }
        if ((unint64_t)(a3 - 4) < 2)
        {
          v9 = &unk_1F200EEB0;
          goto LABEL_48;
        }
        if (a3 != 7) {
          goto LABEL_49;
        }
        v9 = &unk_1F200EEC8;
        goto LABEL_48;
      case 7uLL:
        if ((unint64_t)(a3 - 2) < 2)
        {
          v9 = &unk_1F200EEE0;
        }
        else if ((unint64_t)(a3 - 4) >= 2)
        {
          if (a3 != 6) {
            goto LABEL_49;
          }
          v9 = &unk_1F200EF10;
        }
        else
        {
          v9 = &unk_1F200EEF8;
        }
LABEL_48:
        [v8 addObjectsFromArray:v9];
LABEL_49:
        int64_t v11 = [(PKPaletteTransition *)self _currentStage];
        v12 = [NSNumber numberWithInteger:v11];
        v26[0] = v12;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
        double v14 = [v13 arrayByAddingObjectsFromArray:v8];

        v15 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = PKPaletteVisualStateDescription(v5);
          unint64_t v17 = [(PKPaletteTransition *)self pointingDirection];
          if (v17 > 2) {
            v18 = 0;
          }
          else {
            v18 = off_1E64C90E0[v17];
          }
          v19 = PKPaletteVisualStateDescription(a3);
          int v20 = 138412802;
          v21 = v16;
          __int16 v22 = 2112;
          v23 = v18;
          __int16 v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Begin transition from visual state %@+%@ to new target %@.", (uint8_t *)&v20, 0x20u);
        }
        [(PKPaletteTransition *)self set_remainingTransitionStages:v14];
        [(PKPaletteTransition *)self _setTargetVisualState:a3];
        [(PKPaletteTransition *)self _moveToNextTransitionStageIfReady];

        break;
      default:
        goto LABEL_49;
    }
  }
}

- (BOOL)_canMoveToNextTransitionStage
{
  double v3 = [(PKPaletteTransition *)self _remainingTransitionStages];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(PKPaletteTransition *)self _currentStage];
  if (v4 < 2)
  {
    unint64_t v8 = 0;
  }
  else
  {
    int64_t v6 = [(PKPaletteTransition *)self _remainingTransitionStages];
    int64_t v7 = [v6 objectAtIndexedSubscript:1];
    unint64_t v8 = [v7 integerValue];
  }
  switch(v5)
  {
    case 0:
    case 3:
    case 4:
      goto LABEL_6;
    case 1:
      if (v8 > 5) {
        return 0;
      }
      if (((1 << v8) & 0x39) == 0) {
        goto LABEL_6;
      }
      v10 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
      [v10 value];
      double v12 = v11;
      v13 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
      [v13 presentationValue];
      double v15 = v12 - v14;

      double v16 = -v15;
      if (v15 >= 0.0) {
        double v16 = v15;
      }
      double v17 = 0.2;
      goto LABEL_21;
    case 2:
      if (v8) {
        goto LABEL_6;
      }
      v18 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
      [v18 value];
      double v20 = v19;
      v21 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
      [v21 presentationValue];
      double v23 = v20 - v22;

      double v16 = -v23;
      if (v23 >= 0.0) {
        double v16 = v23;
      }
      double v17 = 0.01;
      goto LABEL_21;
    case 5:
      if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
LABEL_6:
        BOOL result = 1;
      }
      else
      {
        __int16 v24 = [(PKPaletteTransition *)self rotationAngleAnimatableProperty];
        [v24 value];
        double v26 = v25;
        unint64_t v27 = [(PKPaletteTransition *)self rotationAngleAnimatableProperty];
        [v27 presentationValue];
        double v29 = v26 - v28;

        double v16 = -v29;
        if (v29 >= 0.0) {
          double v16 = v29;
        }
        double v17 = 0.392699082;
LABEL_21:
        BOOL result = v16 <= v17;
      }
      break;
    default:
      return 0;
  }
  return result;
}

- (void)_moveToNextTransitionStageIfReady
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteTransition *)self _canMoveToNextTransitionStage])
  {
    double v3 = [(PKPaletteTransition *)self _remainingTransitionStages];
    uint64_t v4 = [v3 count];

    int64_t v5 = [(PKPaletteTransition *)self _remainingTransitionStages];
    int64_t v6 = [v5 objectAtIndexedSubscript:0];
    unint64_t v7 = [v6 integerValue];

    uint64_t v8 = v4 - 1;
    if (v4 <= 1)
    {
      [(PKPaletteTransition *)self intermediateVisualState];
LABEL_6:
      int64_t v13 = [(PKPaletteTransition *)self targetVisualState];
      unint64_t v14 = v13;
      unint64_t v11 = 0;
LABEL_7:
      if (v13 == 7) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2 * (v13 == 6);
      }
    }
    else
    {
      v9 = [(PKPaletteTransition *)self _remainingTransitionStages];
      v10 = [v9 objectAtIndexedSubscript:1];
      unint64_t v11 = [v10 integerValue];

      int64_t v12 = [(PKPaletteTransition *)self intermediateVisualState];
      switch(v11)
      {
        case 0uLL:
          goto LABEL_6;
        case 1uLL:
          int64_t v26 = v12;
          if ([(PKPaletteTransition *)self targetVisualState] == 2) {
            unint64_t v14 = 2;
          }
          else {
            unint64_t v14 = 3;
          }
          if (v26 == 7) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = 2 * (v26 == 6);
          }
          unint64_t v11 = 1;
          break;
        case 2uLL:
          unint64_t v14 = [(PKPaletteTransition *)self targetVisualState];
          if (v14 == 7) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = 2 * (v14 == 6);
          }
          unint64_t v11 = 2;
          break;
        case 3uLL:
        case 4uLL:
          int64_t v13 = [(PKPaletteTransition *)self targetVisualState];
          unint64_t v14 = v13;
          goto LABEL_7;
        case 5uLL:
          if ([(PKPaletteTransition *)self targetVisualState] == 2) {
            unint64_t v14 = 2;
          }
          else {
            unint64_t v14 = 3;
          }
          int64_t v27 = [(PKPaletteTransition *)self targetVisualState];
          if (v27 == 7) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = 2 * (v27 == 6);
          }
          unint64_t v11 = 5;
          break;
        default:
          uint64_t v15 = 0;
          unint64_t v14 = 0;
          break;
      }
    }
    double v16 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v28 = PKPaletteVisualStateDescription([(PKPaletteTransition *)self targetVisualState]);
      if (v7 > 5) {
        double v29 = 0;
      }
      else {
        double v29 = off_1E64C90B0[v7];
      }
      if (v11 > 5) {
        v30 = 0;
      }
      else {
        v30 = off_1E64C90B0[v11];
      }
      id v31 = PKPaletteVisualStateDescription([(PKPaletteTransition *)self intermediateVisualState]);
      v32 = PKPaletteVisualStateDescription(v14);
      unint64_t v33 = [(PKPaletteTransition *)self pointingDirection];
      if (v33 > 2) {
        v34 = 0;
      }
      else {
        v34 = off_1E64C90E0[v33];
      }
      objc_super v35 = off_1E64C90E0[v15];
      int v36 = 138413826;
      id v37 = v28;
      __int16 v38 = 2112;
      v39 = v29;
      __int16 v40 = 2112;
      v41 = v30;
      __int16 v42 = 2112;
      v43 = v31;
      __int16 v44 = 2112;
      v45 = v32;
      __int16 v46 = 2112;
      v47 = v34;
      __int16 v48 = 2112;
      v49 = v35;
      _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Transition towards state %@. Move to next stage %@ -> %@. Intermediate state: %@ -> %@. PointingDirection: %@ -> %@.", (uint8_t *)&v36, 0x48u);
    }
    BOOL v17 = [(PKPaletteTransition *)self intermediateVisualState] != v14
       || [(PKPaletteTransition *)self pointingDirection] != v15;
    v18 = [(PKPaletteTransition *)self _remainingTransitionStages];
    double v19 = objc_msgSend(v18, "subarrayWithRange:", 1, v8);
    [(PKPaletteTransition *)self set_remainingTransitionStages:v19];

    [(PKPaletteTransition *)self _setIntermediateVisualState:v14];
    [(PKPaletteTransition *)self _setPointingDirection:v15];
    double v20 = [(PKPaletteTransition *)self _remainingTransitionStages];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      if (v17) {
        return;
      }
      goto LABEL_20;
    }
    double v22 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = PKPaletteVisualStateDescription([(PKPaletteTransition *)self targetVisualState]);
      int v36 = 138412290;
      id v37 = v23;
      _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEFAULT, "Transition finished to state %@.", (uint8_t *)&v36, 0xCu);
    }
    if (!v17)
    {
LABEL_20:
      __int16 v24 = [(PKPaletteTransition *)self _remainingTransitionStages];
      uint64_t v25 = [v24 count];

      if (v25) {
        [(PKPaletteTransition *)self _moveToNextTransitionStageIfReady];
      }
    }
  }
}

- (void)paletteDidBeginRotationAnimation
{
  int64_t v3 = [(PKPaletteTransition *)self pointingDirection];
  double v4 = 1.57079633;
  if (v3 != 2) {
    double v4 = 0.0;
  }
  if (v3 == 1) {
    double v5 = -1.57079633;
  }
  else {
    double v5 = v4;
  }
  id v6 = [(PKPaletteTransition *)self rotationAngleAnimatableProperty];
  [v6 setValue:v5];
}

- (void)paletteDidBeginResizingAnimation
{
  int64_t v3 = [(PKPaletteTransition *)self _currentStage];
  if ((unint64_t)(v3 - 3) < 2)
  {
    [(PKPaletteTransition *)self _moveToNextTransitionStageIfReady];
  }
  else if ((unint64_t)(v3 - 1) <= 1)
  {
    unint64_t v4 = [(PKPaletteTransition *)self intermediateVisualState] - 1;
    double v5 = 1.0;
    if (v4 <= 6) {
      double v5 = dbl_1C482A938[v4];
    }
    id v6 = [(PKPaletteTransition *)self expandedToCollapsedAnimatableProperty];
    [v6 setValue:v5];
  }
}

- (void)_handleRotationAnimatablePropertyPresentationValueChanged
{
  if ([(PKPaletteTransition *)self _currentStage] == 5)
  {
    [(PKPaletteTransition *)self _moveToNextTransitionStageIfReady];
  }
}

- (void)_handleExpandedToCollapsedAnimatablePropertyPresentationValueChanged
{
  if ((unint64_t)([(PKPaletteTransition *)self _currentStage] - 1) <= 1) {
    [(PKPaletteTransition *)self _moveToNextTransitionStageIfReady];
  }
  id v3 = [(PKPaletteTransition *)self delegate];
  [v3 transitionExpandedToCollapsedRatioDidChange:self];
}

- (PKPaletteTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteTransitionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)initialVisualState
{
  return self->_initialVisualState;
}

- (int64_t)targetVisualState
{
  return self->_targetVisualState;
}

- (void)_setTargetVisualState:(int64_t)a3
{
  self->_targetVisualState = a3;
}

- (int64_t)intermediateVisualState
{
  return self->_intermediateVisualState;
}

- (int64_t)pointingDirection
{
  return self->_pointingDirection;
}

- (NSArray)_remainingTransitionStages
{
  return self->__remainingTransitionStages;
}

- (void)set_remainingTransitionStages:(id)a3
{
}

- (UIViewFloatAnimatableProperty)rotationAngleAnimatableProperty
{
  return self->_rotationAngleAnimatableProperty;
}

- (void)setRotationAngleAnimatableProperty:(id)a3
{
}

- (UIViewFloatAnimatableProperty)expandedToCollapsedAnimatableProperty
{
  return self->_expandedToCollapsedAnimatableProperty;
}

- (void)setExpandedToCollapsedAnimatableProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedToCollapsedAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_rotationAngleAnimatableProperty, 0);
  objc_storeStrong((id *)&self->__remainingTransitionStages, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end