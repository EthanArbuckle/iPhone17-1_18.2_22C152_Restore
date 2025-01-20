@interface AssistantVoiceDownloadingView
- (AssistantVoiceDownloadingView)initWithActivityIndicatorStyle:(int64_t)a3;
- (UIActivityIndicatorView)indicator;
- (UILabel)downloadLabel;
- (void)layoutSubviews;
- (void)setDownloadLabel:(id)a3;
- (void)setIndicator:(id)a3;
- (void)sizeToFit;
@end

@implementation AssistantVoiceDownloadingView

- (AssistantVoiceDownloadingView)initWithActivityIndicatorStyle:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AssistantVoiceDownloadingView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[AssistantVoiceDownloadingView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:a3];
    indicator = v8->_indicator;
    v8->_indicator = (UIActivityIndicatorView *)v9;

    [(UIActivityIndicatorView *)v8->_indicator startAnimating];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
    downloadLabel = v8->_downloadLabel;
    v8->_downloadLabel = (UILabel *)v11;

    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v8->_downloadLabel setFont:v13];

    [(UILabel *)v8->_downloadLabel setAdjustsFontForContentSizeCategory:1];
    v14 = [MEMORY[0x263F825C8] lightGrayColor];
    [(UILabel *)v8->_downloadLabel setTextColor:v14];

    v15 = +[AssistantVoiceController bundle];
    v16 = SFLocalizableWAPIStringKeyForKey();
    v17 = [v15 localizedStringForKey:v16 value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(UILabel *)v8->_downloadLabel setText:v17];

    [(AssistantVoiceDownloadingView *)v8 addSubview:v8->_indicator];
    [(AssistantVoiceDownloadingView *)v8 addSubview:v8->_downloadLabel];
  }
  return v8;
}

- (void)sizeToFit
{
  [(UILabel *)self->_downloadLabel sizeToFit];
  [(UILabel *)self->_downloadLabel frame];
  double Width = CGRectGetWidth(v9);
  [(UIActivityIndicatorView *)self->_indicator frame];
  double v4 = Width + CGRectGetWidth(v10) + 8.0;
  [(UILabel *)self->_downloadLabel frame];
  double Height = CGRectGetHeight(v11);
  [(UIActivityIndicatorView *)self->_indicator frame];
  double v6 = CGRectGetHeight(v12);
  if (Height >= v6) {
    double v7 = Height;
  }
  else {
    double v7 = v6;
  }

  -[AssistantVoiceDownloadingView setFrame:](self, "setFrame:", 0.0, 0.0, v4, v7);
}

- (void)layoutSubviews
{
  [(UILabel *)self->_downloadLabel sizeToFit];
  [(UILabel *)self->_downloadLabel frame];
  double v3 = CGRectGetMaxX(v10) + 8.0;
  [(AssistantVoiceDownloadingView *)self frame];
  double Height = CGRectGetHeight(v11);
  [(UIActivityIndicatorView *)self->_indicator frame];
  double v5 = (Height - CGRectGetHeight(v12)) * 0.5;
  [(UIActivityIndicatorView *)self->_indicator frame];
  double Width = CGRectGetWidth(v13);
  [(UIActivityIndicatorView *)self->_indicator frame];
  double v7 = CGRectGetHeight(v14);
  indicator = self->_indicator;

  -[UIActivityIndicatorView setFrame:](indicator, "setFrame:", v3, v5, Width, v7);
}

- (UIActivityIndicatorView)indicator
{
  return self->_indicator;
}

- (void)setIndicator:(id)a3
{
}

- (UILabel)downloadLabel
{
  return self->_downloadLabel;
}

- (void)setDownloadLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadLabel, 0);

  objc_storeStrong((id *)&self->_indicator, 0);
}

@end