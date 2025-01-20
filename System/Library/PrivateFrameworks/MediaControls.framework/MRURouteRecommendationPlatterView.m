@interface MRURouteRecommendationPlatterView
- (MRUActivityRouteView)activityRouteView;
- (MRUNowPlayingLabelView)labelView;
- (MRURouteRecommendationPlatterView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIButton)actionButton;
- (unint64_t)actionType;
- (void)_addLayoutConstraints;
- (void)setActionType:(unint64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRURouteRecommendationPlatterView

- (MRURouteRecommendationPlatterView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MRURouteRecommendationPlatterView;
  v3 = -[MRURouteRecommendationPlatterView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRURouteRecommendationPlatterView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];

    v6 = [(MRURouteRecommendationPlatterView *)v4 visualStylingProviderForCategory:1];
    v7 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v6];
    stylingProvider = v4->_stylingProvider;
    v4->_stylingProvider = v7;

    [(MRUVisualStylingProvider *)v4->_stylingProvider addObserver:v4];
    v9 = objc_alloc_init(MRUActivityRouteView);
    activityRouteView = v4->_activityRouteView;
    v4->_activityRouteView = v9;

    [(MRUActivityRouteView *)v4->_activityRouteView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MRURouteRecommendationPlatterView *)v4 addSubview:v4->_activityRouteView];
    v11 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v4->_labelView;
    v4->_labelView = v11;

    [(MRUNowPlayingLabelView *)v4->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MRUNowPlayingLabelView *)v4->_labelView setUserInteractionEnabled:0];
    [(MRUNowPlayingLabelView *)v4->_labelView setStylingProvider:v4->_stylingProvider];
    [(MRUNowPlayingLabelView *)v4->_labelView setLayout:2];
    [(MRUNowPlayingLabelView *)v4->_labelView setShowRoute:0];
    [(MRURouteRecommendationPlatterView *)v4 addSubview:v4->_labelView];
    v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    actionButton = v4->_actionButton;
    v4->_actionButton = v13;

    v15 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    objc_initWeak(&location, v4);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __51__MRURouteRecommendationPlatterView_initWithFrame___block_invoke;
    v22 = &unk_1E5F0D898;
    objc_copyWeak(&v23, &location);
    [(UIButton *)v4->_actionButton setConfigurationUpdateHandler:&v19];
    -[UIButton setConfiguration:](v4->_actionButton, "setConfiguration:", v15, v19, v20, v21, v22);
    [(UIButton *)v4->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1148846080;
    [(UIButton *)v4->_actionButton setContentHuggingPriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UIButton *)v4->_actionButton setContentCompressionResistancePriority:0 forAxis:v17];
    [(MRURouteRecommendationPlatterView *)v4 addSubview:v4->_actionButton];
    [(MRURouteRecommendationPlatterView *)v4 setActionType:0];
    [(MRURouteRecommendationPlatterView *)v4 _addLayoutConstraints];
    [(MRURouteRecommendationPlatterView *)v4 updateVisualStyling];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __51__MRURouteRecommendationPlatterView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 configuration];
  if ([v7 isHighlighted])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = [WeakRetained stylingProvider];
    v6 = [v5 blendColorForStyle:1];
    [v3 setBaseForegroundColor:v6];
  }
  else
  {
    [v3 setBaseForegroundColor:0];
  }
  [v7 setConfiguration:v3];
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
  if (a3 == 1)
  {
    v4 = +[MRUAssetsProvider suggestedRouteTVRemote];
    v5 = (void *)MEMORY[0x1E4FB1830];
    double v6 = 25.0;
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down"];
    v5 = (void *)MEMORY[0x1E4FB1830];
    double v6 = 12.0;
  }
  id v7 = [v5 configurationWithPointSize:4 weight:v6];
  v8 = [v4 imageWithConfiguration:v7];

  [(UIButton *)self->_actionButton setImage:v8 forState:0];
LABEL_6:

  [(MRURouteRecommendationPlatterView *)self updateVisualStyling];
}

- (void)_addLayoutConstraints
{
  v44[9] = *MEMORY[0x1E4F143B8];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v42 = [v43 topAnchor];
  v41 = [(MRURouteRecommendationPlatterView *)self topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:10.0];
  v44[0] = v40;
  v39 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v38 = [v39 leadingAnchor];
  v37 = [(MRURouteRecommendationPlatterView *)self leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:10.0];
  v44[1] = v36;
  v35 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v34 = [v35 bottomAnchor];
  v33 = [(MRURouteRecommendationPlatterView *)self bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:-10.0];
  v44[2] = v32;
  v31 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v29 = [v31 widthAnchor];
  v30 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v28 = [v30 heightAnchor];
  v26 = [v29 constraintEqualToAnchor:v28];
  v44[3] = v26;
  objc_super v25 = [(MRURouteRecommendationPlatterView *)self labelView];
  id v23 = [v25 leadingAnchor];
  v24 = [(MRURouteRecommendationPlatterView *)self activityRouteView];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:10.0];
  v44[4] = v21;
  uint64_t v20 = [(MRURouteRecommendationPlatterView *)self labelView];
  uint64_t v19 = [v20 centerYAnchor];
  v18 = [(MRURouteRecommendationPlatterView *)self centerYAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v44[5] = v17;
  double v16 = [(MRURouteRecommendationPlatterView *)self actionButton];
  v15 = [v16 trailingAnchor];
  v14 = [(MRURouteRecommendationPlatterView *)self trailingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:-22.0];
  v44[6] = v13;
  v3 = [(MRURouteRecommendationPlatterView *)self actionButton];
  v4 = [v3 leadingAnchor];
  v5 = [(MRURouteRecommendationPlatterView *)self labelView];
  double v6 = [v5 trailingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:22.0];
  v44[7] = v7;
  v8 = [(MRURouteRecommendationPlatterView *)self actionButton];
  v9 = [v8 centerYAnchor];
  v10 = [(MRURouteRecommendationPlatterView *)self centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v44[8] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:9];
  [v27 activateConstraints:v12];
}

- (void)updateVisualStyling
{
  unint64_t actionType = self->_actionType;
  if (actionType)
  {
    if (actionType != 1) {
      goto LABEL_6;
    }
    stylingProvider = self->_stylingProvider;
    uint64_t v5 = 0;
  }
  else
  {
    stylingProvider = self->_stylingProvider;
    uint64_t v5 = 2;
  }
  double v6 = [(MRUVisualStylingProvider *)stylingProvider blendColorForStyle:v5];
  [(UIButton *)self->_actionButton setTintColor:v6];

LABEL_6:
  id v7 = [(MRUVisualStylingProvider *)self->_stylingProvider blendColorForStyle:0];
  [(MRUActivityRouteView *)self->_activityRouteView setTintColor:v7];
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (MRUActivityRouteView)activityRouteView
{
  return self->_activityRouteView;
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_activityRouteView, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end