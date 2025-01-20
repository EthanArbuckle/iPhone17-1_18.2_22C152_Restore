@interface CSLPRFWatchChoiceView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CSLPRFWatchChoiceView)initWithChoice:(id)a3 delegate:(id)a4 horizontalOffset:(double)a5 selectionHandler:(id)a6;
- (double)horizontalOffset;
- (id)_createWatchViewForChoice:(id)a3;
- (int64_t)choice;
- (void)_addWatchScreenImageIfNecessary:(id)a3;
- (void)_updateWatchViewPreferredWidth;
- (void)selectedByTap:(id)a3;
- (void)setHorizontalOffset:(double)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CSLPRFWatchChoiceView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (int64_t)choice
{
  return self->_choice;
}

- (void)setHorizontalOffset:(double)a3
{
  self->_horizontalOffset = a3;
  [(CSLPRFWatchChoiceView *)self _updateWatchViewPreferredWidth];
}

- (void)setSelected:(BOOL)a3
{
  -[CSLPRFAppViewChoiceButton setSelected:](self->_button, "setSelected:");
  button = self->_button;
  if (a3) {
    [MEMORY[0x263F825C8] systemOrangeColor];
  }
  else {
  id v6 = [MEMORY[0x263F825C8] systemGrayColor];
  }
  [(CSLPRFAppViewChoiceButton *)button setTintColor:v6];
}

- (void)selectedByTap:(id)a3
{
  selectionHandler = (void (**)(id, int64_t))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, self->_choice);
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(BPSIllustratedWatchView *)self->_watchView setNeedsLayout];
  [(BPSIllustratedWatchView *)self->_watchView layoutIfNeeded];
  v14.receiver = self;
  v14.super_class = (Class)CSLPRFWatchChoiceView;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[CSLPRFWatchChoiceView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CSLPRFWatchChoiceView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CSLPRFWatchChoiceView)initWithChoice:(id)a3 delegate:(id)a4 horizontalOffset:(double)a5 selectionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)CSLPRFWatchChoiceView;
  double v13 = [(CSLPRFWatchChoiceView *)&v37 init];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14->_choice = [v10 choice];
    uint64_t v15 = MEMORY[0x230FB9060](v12);
    id selectionHandler = v14->_selectionHandler;
    v14->_id selectionHandler = (id)v15;

    v14->_horizontalOffset = a5;
    [(CSLPRFWatchChoiceView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CSLPRFWatchChoiceView *)v14 setAxis:1];
    [(CSLPRFWatchChoiceView *)v14 setAlignment:3];
    [(CSLPRFWatchChoiceView *)v14 setDistribution:3];
    LODWORD(v17) = 1148846080;
    [(CSLPRFWatchChoiceView *)v14 setContentCompressionResistancePriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(CSLPRFWatchChoiceView *)v14 setContentHuggingPriority:1 forAxis:v18];
    uint64_t v19 = [(CSLPRFWatchChoiceView *)v14 _createWatchViewForChoice:v10];
    watchView = v14->_watchView;
    v14->_watchView = (BPSIllustratedWatchView *)v19;

    LODWORD(v21) = 1148846080;
    [(BPSIllustratedWatchView *)v14->_watchView setContentCompressionResistancePriority:1 forAxis:v21];
    [(CSLPRFWatchChoiceView *)v14 addArrangedSubview:v14->_watchView];
    [(CSLPRFWatchChoiceView *)v14 setCustomSpacing:v14->_watchView afterView:28.0];
    [(CSLPRFWatchChoiceView *)v14 _addWatchScreenImageIfNecessary:v10];
    id v22 = objc_alloc_init(MEMORY[0x263F828E0]);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    v24 = [v10 label];
    v25 = [WeakRetained localize:v24];

    [v22 setText:v25];
    [v22 setNumberOfLines:0];
    LODWORD(v26) = 1036831949;
    [v22 _setHyphenationFactor:v26];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v27) = 1148846080;
    [v22 setContentHuggingPriority:1 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [v22 setContentCompressionResistancePriority:1 forAxis:v28];
    [(CSLPRFWatchChoiceView *)v14 addArrangedSubview:v22];
    [(CSLPRFWatchChoiceView *)v14 setCustomSpacing:v22 afterView:0.0];
    v29 = objc_alloc_init(CSLPRFAppViewChoiceButton);
    [(CSLPRFAppViewChoiceButton *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CSLPRFAppViewChoiceButton *)v29 setUserInteractionEnabled:1];
    [(CSLPRFAppViewChoiceButton *)v29 addTarget:v14 action:sel_selectedByTap_ forControlEvents:1];
    LODWORD(v30) = 1148846080;
    [(CSLPRFAppViewChoiceButton *)v29 setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(CSLPRFAppViewChoiceButton *)v29 setContentCompressionResistancePriority:1 forAxis:v31];
    button = v14->_button;
    v14->_button = v29;
    v33 = v29;

    [(CSLPRFWatchChoiceView *)v14 addArrangedSubview:v14->_button];
    uint64_t v34 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v14 action:sel_selectedByTap_];
    tapRecognizer = v14->_tapRecognizer;
    v14->_tapRecognizer = (UITapGestureRecognizer *)v34;

    [(CSLPRFWatchChoiceView *)v14 addGestureRecognizer:v14->_tapRecognizer];
  }

  return v14;
}

- (void)_addWatchScreenImageIfNecessary:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BPSIllustratedWatchView *)self->_watchView watchScreenImageView];
  id v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  v9 = BPSGetActiveSetupCompletedDevice();
  id v10 = [MEMORY[0x263F2BBA0] shared];
  char v11 = [v10 inWatchSetupFlow];

  if ((v11 & 1) != 0 || !v9)
  {
    double v13 = [MEMORY[0x263F5B980] sharedDeviceController];
    uint64_t v12 = [v13 size];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F5B980] sizeFromDevice:v9];
  }
  if (v12 == 19)
  {
    double v14 = 157.0;
    double v15 = 128.333333;
  }
  else if (fabs(v8 + -3.0) <= 2.22044605e-16)
  {
    double v14 = 127.0;
    double v15 = 104.5;
  }
  else
  {
    double v14 = 128.0;
    double v15 = 103.5;
  }
  v16 = [v4 screenImage];

  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      double v17 = [v4 screenImage];
      *(_DWORD *)buf = 138412546;
      v36 = v17;
      __int16 v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> adding provided %@ to view %@", buf, 0x16u);
    }
    double v18 = [v4 screenImage];
    [v5 setImage:v18];
  }
  uint64_t v19 = [v4 imageProvider];

  if (v19)
  {
    v20 = [v5 image];

    if (v20)
    {
      double v21 = 0;
    }
    else
    {
      double v21 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v5 addSubview:v21];
      watchView = self->_watchView;
      v23 = [MEMORY[0x263F08938] constraintWithItem:v21 attribute:10 relatedBy:0 toItem:watchView attribute:10 multiplier:1.0 constant:1.0];
      [(BPSIllustratedWatchView *)watchView addConstraint:v23];

      v24 = self->_watchView;
      v25 = [MEMORY[0x263F08938] constraintWithItem:v21 attribute:9 relatedBy:0 toItem:v24 attribute:9 multiplier:1.0 constant:1.0];
      [(BPSIllustratedWatchView *)v24 addConstraint:v25];

      [v21 startAnimating];
    }
    double v26 = self->_watchView;
    double v27 = [v4 imageProvider];
    uint64_t v28 = [v4 choice];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __57__CSLPRFWatchChoiceView__addWatchScreenImageIfNecessary___block_invoke;
    v31[3] = &unk_264A0B4F0;
    v31[4] = self;
    id v32 = v5;
    v33 = v26;
    id v34 = v21;
    id v29 = v21;
    double v30 = v26;
    objc_msgSend(v27, "retrieveImageForLauncherViewMode:size:completion:", v28, v31, v15, v14);
  }
}

void __57__CSLPRFWatchChoiceView__addWatchScreenImageIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ adding retrieved image %@ to view %@", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 40) setImage:v3];
    [*(id *)(a1 + 48) setNeedsLayout];
    [*(id *)(a1 + 48) layoutIfNeeded];
    double v7 = *(void **)(a1 + 56);
    if (v7)
    {
      [v7 setHidden:1];
      [*(id *)(a1 + 56) stopAnimating];
      [*(id *)(a1 + 56) removeFromSuperview];
    }
  }
  else if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ retrieved image is %@, not adding to view %@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)_createWatchViewForChoice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F2BBB0]);
  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 bounds];
  double v8 = v7 * 0.5 - self->_horizontalOffset;

  uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v8, 0.0);
  [v5 setPreferredCGSizeValue:v9];

  int v10 = [v4 imageProvider];

  if (!v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v12 = [WeakRetained bundleID];
    [v5 setScreenImageSearchBundleIdentifier:v12];

    id v13 = [v4 screenImageName];
    [v5 setScreenImageName:v13];
  }
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v5;
}

- (void)_updateWatchViewPreferredWidth
{
  id v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4 * 0.5 - self->_horizontalOffset;

  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v5, 0.0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(BPSIllustratedWatchView *)self->_watchView setPreferredCGSizeValue:v6];
}

@end