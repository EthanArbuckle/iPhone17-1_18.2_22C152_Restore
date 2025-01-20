@interface MUPlaceCollectionPullQuotePlatterView
- (CGSize)intrinsicContentSize;
- (MUPlaceCollectionPullQuotePlatterView)initWithFrame:(CGRect)a3;
- (MUPlaceCollectionPullQuotePlatterViewDelegate)delegate;
- (MUPlaceCollectionPullQuoteViewModel)viewModel;
- (void)_contentSizeDidChange;
- (void)_didSelectCollection;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceCollectionPullQuotePlatterView

- (MUPlaceCollectionPullQuotePlatterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceCollectionPullQuotePlatterView;
  v3 = -[MUPlaceCollectionPullQuotePlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPlaceCollectionPullQuotePlatterView *)v3 _setupSubviews];
    [(MUPlaceCollectionPullQuotePlatterView *)v4 _setupConstraints];
    [(MUPlaceCollectionPullQuotePlatterView *)v4 setAccessibilityIdentifier:@"PlaceCollectionPullQuotePlatter"];
  }
  return v4;
}

- (void)_setupSubviews
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = [MUCuratedCollectionSummaryView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[MUCuratedCollectionSummaryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  collectionSummaryView = self->_collectionSummaryView;
  self->_collectionSummaryView = v8;

  [(MUCuratedCollectionSummaryView *)self->_collectionSummaryView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceCollectionPullQuotePlatterView *)self addSubview:self->_collectionSummaryView];
  v10 = -[MUExpandingLabel initWithFrame:]([MUPullQuoteView alloc], "initWithFrame:", v4, v5, v6, v7);
  pullQuoteView = self->_pullQuoteView;
  self->_pullQuoteView = v10;

  [(MUPullQuoteView *)self->_pullQuoteView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MUExpandingLabel *)self->_pullQuoteView setFont:v12];

  v13 = +[MUInfoCardStyle textColor];
  [(MUExpandingLabel *)self->_pullQuoteView setTextColor:v13];

  v14 = +[MUInfoCardStyle buttonCellTextColor];
  [(MUExpandingLabel *)self->_pullQuoteView setShowMoreTextColor:v14];

  v15 = _MULocalizedStringFromThisBundle(@"More [Placecard]");
  [(MUExpandingLabel *)self->_pullQuoteView setShowMoreText:v15];

  [(MUExpandingLabel *)self->_pullQuoteView setNumberOfLinesWhenCollapsed:4];
  [(MUPullQuoteView *)self->_pullQuoteView setUserInteractionEnabled:0];
  [(MUPlaceCollectionPullQuotePlatterView *)self addSubview:self->_pullQuoteView];
  v16 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v16;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__didSelectCollection];
  [(MUPlaceCollectionPullQuotePlatterView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__didSelectCollection];
  v18 = self;
  v21[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v20 = (id)[(MUPlaceCollectionPullQuotePlatterView *)self registerForTraitChanges:v19 withAction:sel__contentSizeDidChange];
}

- (void)_setupConstraints
{
  v26[7] = *MEMORY[0x1E4F143B8];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(MUPullQuoteView *)self->_pullQuoteView leadingAnchor];
  v24 = [(MUPlaceCollectionPullQuotePlatterView *)self leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:16.0];
  v26[0] = v23;
  v22 = [(MUPullQuoteView *)self->_pullQuoteView trailingAnchor];
  v21 = [(MUPlaceCollectionPullQuotePlatterView *)self trailingAnchor];
  id v20 = [v22 constraintEqualToAnchor:v21 constant:-16.0];
  v26[1] = v20;
  v19 = [(MUPullQuoteView *)self->_pullQuoteView topAnchor];
  v18 = [(MUPlaceCollectionPullQuotePlatterView *)self topAnchor];
  v16 = [v19 constraintEqualToAnchor:v18 constant:14.0];
  v26[2] = v16;
  v15 = [(MUPullQuoteView *)self->_pullQuoteView bottomAnchor];
  v14 = [(MUCuratedCollectionSummaryView *)self->_collectionSummaryView topAnchor];
  v13 = [v15 constraintLessThanOrEqualToAnchor:v14 constant:-14.0];
  v26[3] = v13;
  v3 = [(MUCuratedCollectionSummaryView *)self->_collectionSummaryView leadingAnchor];
  double v4 = [(MUPlaceCollectionPullQuotePlatterView *)self leadingAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4 constant:16.0];
  v26[4] = v5;
  double v6 = [(MUCuratedCollectionSummaryView *)self->_collectionSummaryView trailingAnchor];
  double v7 = [(MUPlaceCollectionPullQuotePlatterView *)self trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:-16.0];
  v26[5] = v8;
  v9 = [(MUCuratedCollectionSummaryView *)self->_collectionSummaryView bottomAnchor];
  v10 = [(MUPlaceCollectionPullQuotePlatterView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-14.0];
  v26[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];
  [v17 activateConstraints:v12];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceCollectionPullQuoteViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceCollectionPullQuotePlatterView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  v3 = [(MUPlaceCollectionPullQuoteViewModel *)self->_viewModel plainTextDescription];
  [(MUExpandingLabel *)self->_pullQuoteView setText:v3];

  viewModel = self->_viewModel;
  collectionSummaryView = self->_collectionSummaryView;
  [(MUCuratedCollectionSummaryView *)collectionSummaryView setViewModel:viewModel];
}

- (void)_didSelectCollection
{
  id v3 = [(MUPlaceCollectionPullQuotePlatterView *)self delegate];
  [v3 pullQuoteViewDidTapMore:self];
}

- (void)_contentSizeDidChange
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MUExpandingLabel *)self->_pullQuoteView setFont:v3];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = 307.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUPlaceCollectionPullQuotePlatterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceCollectionPullQuotePlatterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MUPlaceCollectionPullQuoteViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pullQuoteView, 0);
  objc_storeStrong((id *)&self->_collectionSummaryView, 0);
}

@end