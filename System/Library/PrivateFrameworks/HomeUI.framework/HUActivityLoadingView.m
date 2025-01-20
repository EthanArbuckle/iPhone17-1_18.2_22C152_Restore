@interface HUActivityLoadingView
+ (id)watchedKeyPaths;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HUActivityLoadingView)initWithFrame:(CGRect)a3;
- (HUActivityLoadingView)initWithFrame:(CGRect)a3 activityIndicatorStyle:(int64_t)a4;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UIStackView)mainStackView;
- (UIStackView)titleSpinnerStackView;
- (void)_watchLabelsForContentAndResizeIfNecessary;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HUActivityLoadingView

- (HUActivityLoadingView)initWithFrame:(CGRect)a3 activityIndicatorStyle:(int64_t)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)HUActivityLoadingView;
  v5 = -[HUActivityLoadingView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v6;

    v8 = v5->_textLabel;
    v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v8 setFont:v9];

    v10 = v5->_textLabel;
    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v10 setBackgroundColor:v11];

    v12 = v5->_textLabel;
    v13 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)v5->_textLabel setLineBreakMode:0];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    detailTextLabel = v5->_detailTextLabel;
    v5->_detailTextLabel = v14;

    v16 = v5->_detailTextLabel;
    v17 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [(UILabel *)v16 setFont:v17];

    v18 = v5->_detailTextLabel;
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v18 setBackgroundColor:v19];

    v20 = v5->_detailTextLabel;
    v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v5->_detailTextLabel setNumberOfLines:0];
    [(UILabel *)v5->_detailTextLabel setLineBreakMode:0];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:a4];
    activityIndicatorView = v5->_activityIndicatorView;
    v5->_activityIndicatorView = (UIActivityIndicatorView *)v22;

    [(UIActivityIndicatorView *)v5->_activityIndicatorView startAnimating];
    id v24 = objc_alloc(MEMORY[0x1E4F42E20]);
    v45[0] = v5->_activityIndicatorView;
    v45[1] = v5->_textLabel;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    uint64_t v26 = [v24 initWithArrangedSubviews:v25];
    titleSpinnerStackView = v5->_titleSpinnerStackView;
    v5->_titleSpinnerStackView = (UIStackView *)v26;

    [(UIStackView *)v5->_titleSpinnerStackView setAxis:0];
    [(UIStackView *)v5->_titleSpinnerStackView setAlignment:3];
    [(UIStackView *)v5->_titleSpinnerStackView setSpacing:8.0];
    id v28 = objc_alloc(MEMORY[0x1E4F42E20]);
    v44[0] = v5->_titleSpinnerStackView;
    v44[1] = v5->_detailTextLabel;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    uint64_t v30 = [v28 initWithArrangedSubviews:v29];
    mainStackView = v5->_mainStackView;
    v5->_mainStackView = (UIStackView *)v30;

    [(UIStackView *)v5->_mainStackView setAxis:1];
    [(UIStackView *)v5->_mainStackView setAlignment:3];
    [(UIStackView *)v5->_mainStackView setSpacing:4.0];
    [(UIStackView *)v5->_mainStackView setAutoresizingMask:18];
    [(HUActivityLoadingView *)v5 addSubview:v5->_mainStackView];
    v32 = [(HUActivityLoadingView *)v5 mainStackView];
    v33 = [v32 heightAnchor];
    v34 = [(HUActivityLoadingView *)v5 activityIndicatorView];
    v35 = [v34 heightAnchor];
    v36 = [v33 constraintGreaterThanOrEqualToAnchor:v35];
    [v36 setActive:1];

    v37 = [(HUActivityLoadingView *)v5 mainStackView];
    v38 = [v37 widthAnchor];
    v39 = [(HUActivityLoadingView *)v5 activityIndicatorView];
    v40 = [v39 widthAnchor];
    v41 = [v38 constraintGreaterThanOrEqualToAnchor:v40];
    [v41 setActive:1];

    [(HUActivityLoadingView *)v5 bounds];
    -[UIStackView setFrame:](v5->_mainStackView, "setFrame:");
    [(HUActivityLoadingView *)v5 _watchLabelsForContentAndResizeIfNecessary];
  }
  return v5;
}

- (HUActivityLoadingView)initWithFrame:(CGRect)a3
{
  return -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](self, "initWithFrame:activityIndicatorStyle:", 100, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(HUActivityLoadingView *)self textLabel];
  v26[0] = v3;
  v4 = [(HUActivityLoadingView *)self detailTextLabel];
  v26[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v11 = [(id)objc_opt_class() watchedKeyPaths];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              [v10 removeObserver:self forKeyPath:*(void *)(*((void *)&v17 + 1) + 8 * v15++)];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  v16.receiver = self;
  v16.super_class = (Class)HUActivityLoadingView;
  [(HUActivityLoadingView *)&v16 dealloc];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = [(HUActivityLoadingView *)self mainStackView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUActivityLoadingView *)self mainStackView];
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_watchLabelsForContentAndResizeIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v3 = [(HUActivityLoadingView *)self textLabel];
  v25[0] = v3;
  double v4 = [(HUActivityLoadingView *)self detailTextLabel];
  v25[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        double v11 = [(id)objc_opt_class() watchedKeyPaths];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v17;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              [v10 addObserver:self forKeyPath:*(void *)(*((void *)&v16 + 1) + 8 * v15++) options:1 context:0];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HUActivityLoadingView *)self textLabel];
  if (v13 != v11)
  {
    id v14 = [(HUActivityLoadingView *)self detailTextLabel];
    if (v14 != v11)
    {

LABEL_8:
      v17.receiver = self;
      v17.super_class = (Class)HUActivityLoadingView;
      [(HUActivityLoadingView *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_9;
    }
  }
  uint64_t v15 = [(id)objc_opt_class() watchedKeyPaths];
  int v16 = [v15 containsObject:v10];

  if (v13 == v11)
  {
    if (!v16) {
      goto LABEL_8;
    }
  }
  else
  {

    if ((v16 & 1) == 0) {
      goto LABEL_8;
    }
  }
  [v11 invalidateIntrinsicContentSize];
  [(HUActivityLoadingView *)self invalidateIntrinsicContentSize];
  [(HUActivityLoadingView *)self setNeedsUpdateConstraints];
LABEL_9:
}

+ (id)watchedKeyPaths
{
  if (_MergedGlobals_2_0 != -1) {
    dispatch_once(&_MergedGlobals_2_0, &__block_literal_global_12);
  }
  v2 = (void *)qword_1EA12E0D0;

  return v2;
}

void __40__HUActivityLoadingView_watchedKeyPaths__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"text", @"attributedText", @"font", @"numberOfLines", @"preferredMaxLayoutWidth", @"adjustsFontSizeToFitWidth", 0);
  v1 = (void *)qword_1EA12E0D0;
  qword_1EA12E0D0 = v0;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (UIStackView)titleSpinnerStackView
{
  return self->_titleSpinnerStackView;
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_titleSpinnerStackView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end