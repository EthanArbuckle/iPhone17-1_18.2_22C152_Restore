@interface _SFReaderFontDownloadAccessory
- (BOOL)isDownloading;
- (UIButton)downloadButton;
- (UIProgressView)progressView;
- (_SFReaderFontDownloadAccessory)initWithTappedDownloadBlock:(id)a3;
- (id)tappedDownloadBlock;
- (id)viewForLastBaselineLayout;
- (void)_tappedDownloadButton:(id)a3;
- (void)setDownloading:(BOOL)a3;
- (void)setTappedDownloadBlock:(id)a3;
@end

@implementation _SFReaderFontDownloadAccessory

- (_SFReaderFontDownloadAccessory)initWithTappedDownloadBlock:(id)a3
{
  v45[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.and.arrow.down" withConfiguration:v5];
  [v6 size];
  v44.receiver = self;
  v44.super_class = (Class)_SFReaderFontDownloadAccessory;
  v9 = -[_SFReaderFontDownloadAccessory initWithFrame:](&v44, sel_initWithFrame_, 0.0, 0.0, v7, v8);
  if (v9)
  {
    uint64_t v10 = MEMORY[0x1AD0C36A0](v4);
    id tappedDownloadBlock = v9->_tappedDownloadBlock;
    v9->_id tappedDownloadBlock = (id)v10;

    id v12 = objc_alloc(MEMORY[0x1E4FB14D0]);
    [(_SFReaderFontDownloadAccessory *)v9 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    downloadButton = v9->_downloadButton;
    v9->_downloadButton = (UIButton *)v13;

    [(UIButton *)v9->_downloadButton addTarget:v9 action:sel__tappedDownloadButton_ forControlEvents:0x2000];
    [(UIButton *)v9->_downloadButton setImage:v6 forState:0];
    [(UIButton *)v9->_downloadButton setPreferredSymbolConfiguration:v5 forImageInState:0];
    [(UIButton *)v9->_downloadButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFReaderFontDownloadAccessory *)v9 addSubview:v9->_downloadButton];
    v15 = (UIProgressView *)objc_alloc_init(MEMORY[0x1E4FB1B48]);
    id v43 = v4;
    progressView = v9->_progressView;
    v9->_progressView = v15;

    [(UIProgressView *)v9->_progressView setHidden:1];
    [(UIProgressView *)v9->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFReaderFontDownloadAccessory *)v9 addSubview:v9->_progressView];
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(_SFReaderFontDownloadAccessory *)v9 leadingAnchor];
    v39 = [(UIButton *)v9->_downloadButton leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v45[0] = v38;
    v37 = [(_SFReaderFontDownloadAccessory *)v9 trailingAnchor];
    v36 = [(UIButton *)v9->_downloadButton trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v45[1] = v35;
    v34 = [(_SFReaderFontDownloadAccessory *)v9 topAnchor];
    v33 = [(UIButton *)v9->_downloadButton topAnchor];
    v31 = [v34 constraintEqualToAnchor:v33];
    v45[2] = v31;
    v30 = [(_SFReaderFontDownloadAccessory *)v9 bottomAnchor];
    v29 = [(UIButton *)v9->_downloadButton bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v45[3] = v28;
    [(_SFReaderFontDownloadAccessory *)v9 centerXAnchor];
    v17 = v42 = v5;
    v18 = [(UIProgressView *)v9->_progressView centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v45[4] = v19;
    v20 = [(_SFReaderFontDownloadAccessory *)v9 centerYAnchor];
    [(UIProgressView *)v9->_progressView centerYAnchor];
    v21 = v41 = v6;
    v22 = [v20 constraintEqualToAnchor:v21];
    v45[5] = v22;
    v23 = [(UIProgressView *)v9->_progressView widthAnchor];
    v24 = [v23 constraintEqualToConstant:20.0];
    v45[6] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:7];
    [v32 activateConstraints:v25];

    id v4 = v43;
    v6 = v41;

    v5 = v42;
    v26 = v9;
  }

  return v9;
}

- (void)setDownloading:(BOOL)a3
{
  if (self->_downloading != a3)
  {
    BOOL v3 = a3;
    self->_downloading = a3;
    [(UIProgressView *)self->_progressView setHidden:!a3];
    downloadButton = self->_downloadButton;
    [(UIButton *)downloadButton setHidden:v3];
  }
}

- (void)_tappedDownloadButton:(id)a3
{
  id tappedDownloadBlock = (void (**)(id, _SFReaderFontDownloadAccessory *))self->_tappedDownloadBlock;
  if (tappedDownloadBlock) {
    tappedDownloadBlock[2](tappedDownloadBlock, self);
  }
}

- (id)viewForLastBaselineLayout
{
  return [(UIButton *)self->_downloadButton imageView];
}

- (UIButton)downloadButton
{
  return self->_downloadButton;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (BOOL)isDownloading
{
  return self->_downloading;
}

- (id)tappedDownloadBlock
{
  return self->_tappedDownloadBlock;
}

- (void)setTappedDownloadBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tappedDownloadBlock, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end