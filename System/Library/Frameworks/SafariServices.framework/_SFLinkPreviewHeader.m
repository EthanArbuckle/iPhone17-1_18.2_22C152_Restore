@interface _SFLinkPreviewHeader
- (BOOL)isLinkPreviewEnabled;
- (BOOL)linkPreviewEnabled;
- (CGSize)intrinsicContentSize;
- (NSString)domain;
- (_SFFluidProgressView)progressView;
- (_SFLinkPreviewHeader)initWithMinimumPreviewUI:(BOOL)a3;
- (_SFLinkPreviewHeaderDelegate)delegate;
- (double)defaultHeight;
- (id)_initWithMinimumPreviewUI:(BOOL)a3 isOnNativeHost:(BOOL)a4;
- (id)opaqueSeparatorColor;
- (void)fluidProgressViewDidShowProgress:(id)a3;
- (void)fluidProgressViewWillShowProgress:(id)a3;
- (void)layoutSubviews;
- (void)linkPreviewHeaderContentView:(id)a3 didEnableLinkPreview:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setLinkPreviewEnabled:(BOOL)a3;
- (void)setProgressView:(id)a3;
@end

@implementation _SFLinkPreviewHeader

- (_SFLinkPreviewHeader)initWithMinimumPreviewUI:(BOOL)a3
{
  return (_SFLinkPreviewHeader *)[(_SFLinkPreviewHeader *)self _initWithMinimumPreviewUI:a3 isOnNativeHost:1];
}

- (id)_initWithMinimumPreviewUI:(BOOL)a3 isOnNativeHost:(BOOL)a4
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)_SFLinkPreviewHeader;
  v5 = -[_SFLinkPreviewHeader initWithFrame:](&v46, sel_initWithFrame_, a3, a4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_isMinimumPreviewUI = a3;
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_lastLayoutBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_lastLayoutBounds.size = v7;
    v8 = (_SFFluidProgressView *)objc_alloc_init(MEMORY[0x1E4F78588]);
    progressView = v6->_progressView;
    v6->_progressView = v8;

    [(_SFFluidProgressView *)v6->_progressView setDelegate:v6];
    v10 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(_SFFluidProgressView *)v6->_progressView setProgressBarFillColor:v10];

    [(_SFLinkPreviewHeader *)v6 setClipsToBounds:0];
    v6->_style = 0;
    if (!v6->_isMinimumPreviewUI)
    {
      v11 = [[SFLinkPreviewHeaderContentView alloc] initWithStyle:v6->_style];
      contentView = v6->_contentView;
      v6->_contentView = v11;

      [(SFLinkPreviewHeaderContentView *)v6->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(_SFLinkPreviewHeader *)v6 setLinkPreviewEnabled:1];
      [(SFLinkPreviewHeaderContentView *)v6->_contentView setDelegate:v6];
      [(_SFLinkPreviewHeader *)v6 addSubview:v6->_contentView];
      if (!v6->_style)
      {
        v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        hairline = v6->_hairline;
        v6->_hairline = v13;

        v15 = [(_SFLinkPreviewHeader *)v6 opaqueSeparatorColor];
        [(UIView *)v6->_hairline setBackgroundColor:v15];

        [(UIView *)v6->_hairline setTranslatesAutoresizingMaskIntoConstraints:0];
        [(_SFLinkPreviewHeader *)v6 addSubview:v6->_hairline];
        v35 = (void *)MEMORY[0x1E4F28DC8];
        v44 = [(UIView *)v6->_hairline leadingAnchor];
        v42 = [(_SFLinkPreviewHeader *)v6 leadingAnchor];
        v40 = [v44 constraintEqualToAnchor:v42];
        v48[0] = v40;
        v38 = [(UIView *)v6->_hairline trailingAnchor];
        v36 = [(_SFLinkPreviewHeader *)v6 trailingAnchor];
        v16 = [v38 constraintEqualToAnchor:v36];
        v48[1] = v16;
        v17 = [(UIView *)v6->_hairline bottomAnchor];
        v18 = [(_SFLinkPreviewHeader *)v6 bottomAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        v48[2] = v19;
        v20 = [(UIView *)v6->_hairline heightAnchor];
        _SFOnePixel();
        v21 = objc_msgSend(v20, "constraintEqualToConstant:");
        v48[3] = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
        [v35 activateConstraints:v22];
      }
      v37 = (void *)MEMORY[0x1E4F28DC8];
      v45 = [(SFLinkPreviewHeaderContentView *)v6->_contentView leadingAnchor];
      v43 = [(_SFLinkPreviewHeader *)v6 leadingAnchor];
      v41 = [v45 constraintEqualToAnchor:v43];
      v47[0] = v41;
      v39 = [(SFLinkPreviewHeaderContentView *)v6->_contentView trailingAnchor];
      v23 = [(_SFLinkPreviewHeader *)v6 trailingAnchor];
      v24 = [v39 constraintEqualToAnchor:v23];
      v47[1] = v24;
      v25 = [(SFLinkPreviewHeaderContentView *)v6->_contentView topAnchor];
      v26 = [(_SFLinkPreviewHeader *)v6 topAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      v47[2] = v27;
      v28 = [(SFLinkPreviewHeaderContentView *)v6->_contentView bottomAnchor];
      v29 = [(_SFLinkPreviewHeader *)v6 bottomAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v47[3] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
      [v37 activateConstraints:v31];

      if (!v6->_style)
      {
        v32 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        [(_SFLinkPreviewHeader *)v6 setBackgroundColor:v32];
      }
    }
    v33 = v6;
  }

  return v6;
}

- (id)opaqueSeparatorColor
{
  return (id)[MEMORY[0x1E4FB1618] opaqueSeparatorColor];
}

- (double)defaultHeight
{
  if (!self->_isMinimumPreviewUI) {
    return 44.0;
  }
  [MEMORY[0x1E4F78588] defaultHeight];
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  [(_SFLinkPreviewHeader *)self defaultHeight];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setLinkPreviewEnabled:(BOOL)a3
{
}

- (BOOL)isLinkPreviewEnabled
{
  return [(SFLinkPreviewHeaderContentView *)self->_contentView isPreviewEnabled];
}

- (BOOL)linkPreviewEnabled
{
  return [(SFLinkPreviewHeaderContentView *)self->_contentView isPreviewEnabled];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)_SFLinkPreviewHeader;
  [(_SFLinkPreviewHeader *)&v19 layoutSubviews];
  [(_SFLinkPreviewHeader *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_SFFluidProgressView *)self->_progressView frame];
  CGFloat v12 = v11;
  CGFloat rect = v13;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat Width = CGRectGetWidth(v20);
  [MEMORY[0x1E4F78588] defaultHeight];
  _SFFloorFloatToPixels();
  CGFloat v16 = v15;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGRectGetMaxY(v21);
  v22.origin.x = v12;
  v22.origin.y = rect;
  v22.size.width = Width;
  v22.size.height = v16;
  CGRectGetHeight(v22);
  _SFRoundRectToPixels();
  -[_SFFluidProgressView setFrame:](self->_progressView, "setFrame:");
  [(_SFFluidProgressView *)self->_progressView setCornerRadius:0.0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (!CGRectEqualToRect(self->_lastLayoutBounds, v23) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained linkPreviewHeaderBoundsDidChange:self];
  }
  self->_lastLayoutBounds.origin.x = v4;
  self->_lastLayoutBounds.origin.y = v6;
  self->_lastLayoutBounds.size.width = v8;
  self->_lastLayoutBounds.size.height = v10;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
  id v5 = a3;
  [(SFLinkPreviewHeaderContentView *)self->_contentView setDomain:v5];
}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  CGFloat v4 = [(_SFFluidProgressView *)self->_progressView superview];

  if (v4 != self)
  {
    progressView = self->_progressView;
    [(_SFLinkPreviewHeader *)self addSubview:progressView];
  }
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
}

- (void)linkPreviewHeaderContentView:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained linkPreviewHeader:self didEnableLinkPreview:v4];
  }
}

- (_SFLinkPreviewHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFLinkPreviewHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (_SFFluidProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairline, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end