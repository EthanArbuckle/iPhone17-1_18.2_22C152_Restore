@interface AKCandidatePickerView_iOS
- (AKCandidatePickerView_iOS)initWithFrame:(CGRect)a3 items:(id)a4 annotations:(id)a5 target:(id)a6 action:(SEL)a7 visualStyle:(int64_t)a8;
- (CGSize)intrinsicContentSize;
- (NSArray)annotations;
- (NSArray)buttons;
- (NSArray)itemTags;
- (SEL)action;
- (UIStackView)buttonContainer;
- (UIVisualEffectView)visualEffectView;
- (id)target;
- (int64_t)blurStyle;
- (int64_t)tagForCandidateItemAtIndex:(unint64_t)a3;
- (void)_createButtonsWithBlurStyle:(int64_t)a3;
- (void)_selectBackground:(id)a3;
- (void)_selectBackground:(id)a3 animated:(BOOL)a4;
- (void)setAction:(SEL)a3;
- (void)setAnnotations:(id)a3;
- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setBlurStyle:(int64_t)a3;
- (void)setButtonContainer:(id)a3;
- (void)setButtons:(id)a3;
- (void)setItemTags:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setTarget:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation AKCandidatePickerView_iOS

- (AKCandidatePickerView_iOS)initWithFrame:(CGRect)a3 items:(id)a4 annotations:(id)a5 target:(id)a6 action:(SEL)a7 visualStyle:(int64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v52.receiver = self;
  v52.super_class = (Class)AKCandidatePickerView_iOS;
  v21 = -[AKCandidatePickerView_iOS initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    id v51 = v18;
    [(AKCandidatePickerView_iOS *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x263F1C550] clearColor];
    [(AKCandidatePickerView_iOS *)v22 setBackgroundColor:v23];

    v22->_blurStyle = a8;
    uint64_t v24 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:0];
    visualEffectView = v22->_visualEffectView;
    v22->_visualEffectView = (UIVisualEffectView *)v24;

    [(UIVisualEffectView *)v22->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(UIVisualEffectView *)v22->_visualEffectView layer];
    [v26 setCornerRadius:6.0];

    v27 = [(UIVisualEffectView *)v22->_visualEffectView layer];
    [v27 setMasksToBounds:1];

    v28 = [MEMORY[0x263F1C550] clearColor];
    [(UIVisualEffectView *)v22->_visualEffectView setBackgroundColor:v28];

    [(AKCandidatePickerView_iOS *)v22 addSubview:v22->_visualEffectView];
    objc_storeStrong((id *)&v22->_itemTags, a4);
    objc_storeStrong((id *)&v22->_annotations, a5);
    objc_storeWeak(&v22->_target, v20);
    if (a7) {
      SEL v29 = a7;
    }
    else {
      SEL v29 = 0;
    }
    v22->_action = v29;
    id v30 = objc_alloc(MEMORY[0x263F1C9B8]);
    uint64_t v31 = [v30 initWithArrangedSubviews:MEMORY[0x263EFFA68]];
    buttonContainer = v22->_buttonContainer;
    v22->_buttonContainer = (UIStackView *)v31;

    [(UIStackView *)v22->_buttonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [MEMORY[0x263F1C550] clearColor];
    [(UIStackView *)v22->_buttonContainer setBackgroundColor:v33];

    v34 = NSNumber;
    [(AKCandidatePickerView_iOS *)v22 intrinsicContentSize];
    v36 = [v34 numberWithDouble:v35];
    v37 = _NSDictionaryOfVariableBindings(&cfstr_HeightButtonma.isa, v36, &unk_26EA76808, 0);
    v38 = _NSDictionaryOfVariableBindings(&cfstr_Buttoncontaine.isa, v22->_buttonContainer, v22->_visualEffectView, 0);
    v39 = (void *)MEMORY[0x263F08938];
    v40 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_visualEffectView(height)]|" options:0 metrics:v37 views:v38];
    [v39 activateConstraints:v40];

    v41 = (void *)MEMORY[0x263F08938];
    v42 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_visualEffectView]|" options:0 metrics:0 views:v38];
    [v41 activateConstraints:v42];

    v43 = [(AKCandidatePickerView_iOS *)v22 visualEffectView];
    v44 = [v43 contentView];

    [v44 addSubview:v22->_buttonContainer];
    v45 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(buttonMargin)-[_buttonContainer]-(buttonMargin)-|" options:0 metrics:v37 views:v38];
    [v44 addConstraints:v45];

    v46 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(buttonMargin)-[_buttonContainer]-(buttonMargin)-|" options:0 metrics:v37 views:v38];
    [v44 addConstraints:v46];

    v47 = [MEMORY[0x263F08938] constraintWithItem:v22->_buttonContainer attribute:9 relatedBy:0 toItem:v44 attribute:9 multiplier:1.0 constant:0.0];
    [v44 addConstraint:v47];

    v48 = [(AKCandidatePickerView_iOS *)v22 visualEffectView];
    v49 = [v48 contentView];
    [v49 setAlpha:0.0];

    [(AKCandidatePickerView_iOS *)v22 _createButtonsWithBlurStyle:a8];
    [(AKCandidatePickerView_iOS *)v22 setSelectedIndex:0];

    id v18 = v51;
  }

  return v22;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  double v3 = 48.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = (void (**)(void))a5;
  unsigned int v9 = !v6;
  if (v6) {
    double v10 = 0.1;
  }
  else {
    double v10 = 0.18;
  }
  if (v6)
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x263F1C480], "effectWithStyle:", -[AKCandidatePickerView_iOS blurStyle](self, "blurStyle"));
  }
  if (v5)
  {
    v12 = (void *)MEMORY[0x263F1CB60];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_2376A875C;
    v15[3] = &unk_264CDBA30;
    v15[4] = self;
    double v17 = (double)v9;
    id v16 = v11;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2376A87F0;
    v13[3] = &unk_264CDBA58;
    v14 = v8;
    [v12 animateWithDuration:v15 animations:v13 completion:v10];
  }
  else
  {
    [(AKCandidatePickerView_iOS *)self setAlpha:(double)v9];
    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  BOOL v5 = [(AKCandidatePickerView_iOS *)self buttons];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    v7 = [(AKCandidatePickerView_iOS *)self buttons];
    id v8 = [v7 objectAtIndex:a3];

    [(AKCandidatePickerView_iOS *)self _selectBackground:v8 animated:0];
  }
}

- (int64_t)tagForCandidateItemAtIndex:(unint64_t)a3
{
  BOOL v5 = [(AKCandidatePickerView_iOS *)self buttons];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  v7 = [(AKCandidatePickerView_iOS *)self buttons];
  id v8 = [v7 objectAtIndex:a3];

  int64_t v9 = [v8 tag];
  return v9;
}

- (void)_createButtonsWithBlurStyle:(int64_t)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v4 = [(AKCandidatePickerView_iOS *)self buttons];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  v41 = [MEMORY[0x263EFF980] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(AKCandidatePickerView_iOS *)self annotations];
  uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v39 = *(void *)v47;
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * v11);
        v13 = [(AKCandidatePickerView_iOS *)self annotations];
        uint64_t v14 = [v13 indexOfObject:v12];

        v15 = [(AKCandidatePickerView_iOS *)self itemTags];
        id v16 = [v15 objectAtIndexedSubscript:v14];
        uint64_t v17 = [v16 integerValue];

        id v18 = +[AKAnnotationImageHelper imageOfSize:forAnnotation:](AKAnnotationImageHelper, "imageOfSize:forAnnotation:", v12, 32.0, 32.0);
        id v19 = [v18 imageWithRenderingMode:2];

        id v20 = objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", v7, v8, v9, v10);
        v21 = [MEMORY[0x263F1C550] clearColor];
        [v20 setBackgroundColor:v21];

        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v20 setTag:v17];
        v22 = [v20 layer];
        [v22 setCornerRadius:3.0];

        if (a3 == 2)
        {
          v23 = [MEMORY[0x263F1C550] whiteColor];
          [v20 setTintColor:v23];
        }
        [v20 setImage:v19 forState:0];
        uint64_t v24 = [(AKCandidatePickerView_iOS *)self target];
        objc_msgSend(v20, "addTarget:action:forControlEvents:", v24, -[AKCandidatePickerView_iOS action](self, "action"), 64);

        [v20 addTarget:self action:sel__selectBackground_ forControlEvents:1];
        v25 = [(AKCandidatePickerView_iOS *)self buttonContainer];
        [v25 addSubview:v20];

        v26 = _NSDictionaryOfVariableBindings(&cfstr_ButtonSize.isa, v20, &unk_26EA76820, 0);
        v27 = (void *)MEMORY[0x263F08938];
        v28 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[button(size)]|" options:0 metrics:v26 views:v26];
        [v27 activateConstraints:v28];

        SEL v29 = (void *)MEMORY[0x263F08938];
        id v30 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[button(size)]" options:0 metrics:v26 views:v26];
        [v29 activateConstraints:v30];

        [v41 addObject:v20];
        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v6);
  }

  [(AKCandidatePickerView_iOS *)self setButtons:v41];
  if ([v41 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v31 = [(AKCandidatePickerView_iOS *)self buttons];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v43;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * v35);
          v37 = [(AKCandidatePickerView_iOS *)self buttonContainer];
          [v37 addArrangedSubview:v36];

          ++v35;
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v33);
    }
  }
  [(AKCandidatePickerView_iOS *)self layoutIfNeeded];
}

- (void)_selectBackground:(id)a3
{
}

- (void)_selectBackground:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = self->_blurStyle == 2;
  double v8 = [(AKCandidatePickerView_iOS *)self buttons];
  double v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2376A8F70;
  v17[3] = &unk_264CDBA80;
  id v10 = v6;
  id v18 = v10;
  BOOL v20 = v7;
  id v11 = v9;
  id v19 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x237E1E250](v17);
  v13 = v12;
  if (v4)
  {
    uint64_t v14 = (void *)MEMORY[0x263F1CB60];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_2376A9120;
    v15[3] = &unk_264CDB048;
    id v16 = v12;
    [v14 animateWithDuration:v15 animations:0 completion:0.18];
  }
  else
  {
    v12[2](v12);
  }
}

- (UIStackView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (NSArray)itemTags
{
  return self->_itemTags;
}

- (void)setItemTags:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_itemTags, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);

  objc_storeStrong((id *)&self->_buttonContainer, 0);
}

@end