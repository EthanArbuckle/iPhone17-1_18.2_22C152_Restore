@interface SLSheetVideoPreviewView
- (CGSize)intrinsicContentSize;
- (SLSheetVideoPreviewView)initWithFrame:(CGRect)a3;
- (void)_applyConstraints;
- (void)setVideoDuration:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SLSheetVideoPreviewView

- (SLSheetVideoPreviewView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)SLSheetVideoPreviewView;
  v3 = -[SLSheetImagePreviewView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SLSheetVideoPreviewView *)v3 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
    -[SLSheetVideoPreviewView setBounds:](v4, "setBounds:", 0.0, 0.0, v5, v7);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", 0.0, 0.0, v6, v8);
    [(SLSheetImagePreviewView *)v4 setImageView:v9];

    v10 = [(SLSheetImagePreviewView *)v4 imageView];
    [v10 setContentMode:2];

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    v12 = [(SLSheetImagePreviewView *)v4 imageView];
    [v12 setBackgroundColor:v11];

    v13 = [(SLSheetImagePreviewView *)v4 imageView];
    [(SLSheetVideoPreviewView *)v4 addSubview:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    infoBar = v4->_infoBar;
    v4->_infoBar = (UIView *)v15;

    v17 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.699999988];
    [(UIView *)v4->_infoBar setBackgroundColor:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v19 = [MEMORY[0x1E4F42A80] socialFrameworkImageNamed:@"SLSheetVideoGlyph"];
    v20 = [v19 imageWithRenderingMode:2];
    uint64_t v21 = [v18 initWithImage:v20];
    videoGlyphView = v4->_videoGlyphView;
    v4->_videoGlyphView = (UIImageView *)v21;

    v23 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)v4->_videoGlyphView setTintColor:v23];

    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", 0.0, 0.0, 40.0, 22.0);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = (UILabel *)v24;

    v26 = (void *)MEMORY[0x1E4F42A30];
    v27 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v27 _scaledValueForValue:12.0];
    v28 = objc_msgSend(v26, "systemFontOfSize:");
    [(UILabel *)v4->_durationLabel setFont:v28];

    v29 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v4->_durationLabel setTextColor:v29];

    [(UIView *)v4->_infoBar addSubview:v4->_videoGlyphView];
    [(UIView *)v4->_infoBar addSubview:v4->_durationLabel];
    [(SLSheetVideoPreviewView *)v4 addSubview:v4->_infoBar];
    [(SLSheetVideoPreviewView *)v4 _applyConstraints];
    [(SLSheetVideoPreviewView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SLSheetVideoPreviewView *)self traitCollection];
  if ([v3 verticalSizeClass] == 1)
  {

    double v4 = 60.0;
    double v5 = 89.0;
  }
  else
  {
    double v6 = [(SLSheetVideoPreviewView *)self traitCollection];
    uint64_t v7 = [v6 horizontalSizeClass];

    double v4 = 60.0;
    if (v7 != 1) {
      double v4 = 61.0;
    }
    double v5 = dbl_1C2CFAA20[v7 == 1];
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLSheetVideoPreviewView;
  [(SLSheetImagePreviewView *)&v16 traitCollectionDidChange:v4];
  double v5 = [(SLSheetVideoPreviewView *)self traitCollection];
  if ([v5 verticalSizeClass] == 1)
  {
    int v6 = 1;
  }
  else
  {
    uint64_t v7 = [(SLSheetVideoPreviewView *)self traitCollection];
    int v6 = [v7 horizontalSizeClass] == 1;
  }
  int v8 = [v4 verticalSizeClass] == 1 || objc_msgSend(v4, "horizontalSizeClass") == 1;
  if (v6 != v8) {
    [(SLSheetVideoPreviewView *)self invalidateIntrinsicContentSize];
  }
  v9 = [(SLSheetVideoPreviewView *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];
  v11 = [v4 preferredContentSizeCategory];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F42A30];
    id v14 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v14 _scaledValueForValue:12.0];
    uint64_t v15 = objc_msgSend(v13, "systemFontOfSize:");
    [(UILabel *)self->_durationLabel setFont:v15];
  }
}

- (void)setVideoDuration:(double)a3
{
  if (a3 > 86400.0 || a3 < 0.0)
  {
    durationLabel = self->_durationLabel;
    [(UILabel *)durationLabel setText:&stru_1F1E28690];
  }
  else
  {
    signed int v4 = llround(a3);
    uint64_t v5 = (int)(((__int16)((34953 * (v4 % 3600)) >> 16) >> 5)
             + (((v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16)) & 0x8000) >> 15));
    uint64_t v6 = (__int16)(v4 % 3600
                 - 60
                 * (((__int16)((34953 * (v4 % 3600)) >> 16) >> 5)
                  + (((v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16)) & 0x8000) >> 15)));
    if ((v4 + 3599) > 0x1C1E)
    {
      uint64_t v11 = v4 / 3600;
      char v12 = NSString;
      int v8 = SLSocialFrameworkBundle();
      v9 = [v8 localizedStringForKey:@"SHEET_PREVIEW_VIDEO_DURATION_LONG" value:&stru_1F1E28690 table:@"Localizable"];
      objc_msgSend(v12, "stringWithFormat:", v9, v11, v5, v6);
    }
    else
    {
      uint64_t v7 = NSString;
      int v8 = SLSocialFrameworkBundle();
      v9 = [v8 localizedStringForKey:@"SHEET_PREVIEW_VIDEO_DURATION_SHORT" value:&stru_1F1E28690 table:@"Localizable"];
      objc_msgSend(v7, "stringWithFormat:", v9, v5, v6, v13);
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [(UILabel *)self->_durationLabel setText:v14];
    [(UILabel *)self->_durationLabel invalidateIntrinsicContentSize];
  }
}

- (void)_applyConstraints
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(UIImageView *)self->_videoGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_durationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_infoBar setTranslatesAutoresizingMaskIntoConstraints:0];
  signed int v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_videoGlyphView attribute:1 relatedBy:0 toItem:self->_infoBar attribute:1 multiplier:1.0 constant:6.0];
  [v3 addObject:v4];

  uint64_t v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_durationLabel attribute:2 relatedBy:0 toItem:self->_infoBar attribute:2 multiplier:1.0 constant:-6.0];
  [v3 addObject:v5];

  uint64_t v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_videoGlyphView attribute:10 relatedBy:0 toItem:self->_infoBar attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v6];

  uint64_t v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_durationLabel attribute:10 relatedBy:0 toItem:self->_infoBar attribute:10 multiplier:1.0 constant:0.0];
  [v3 addObject:v7];

  [(UIView *)self->_infoBar addConstraints:v3];
  int v8 = objc_opt_new();
  v9 = (void *)MEMORY[0x1E4F28DC8];
  infoBar = self->_infoBar;
  v19 = @"infoBar";
  v20[0] = infoBar;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  char v12 = [v9 constraintsWithVisualFormat:@"|[infoBar]|" options:0 metrics:0 views:v11];
  [v8 addObjectsFromArray:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F28DC8];
  id v14 = self->_infoBar;
  v17 = @"infoBar";
  id v18 = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  objc_super v16 = [v13 constraintsWithVisualFormat:@"V:[infoBar(==22@999)]|" options:0 metrics:0 views:v15];
  [v8 addObjectsFromArray:v16];

  [(SLSheetVideoPreviewView *)self addConstraints:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_videoGlyphView, 0);

  objc_storeStrong((id *)&self->_infoBar, 0);
}

@end