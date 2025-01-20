@interface ASCBorderedScreenshotView
- (ASCArtworkView)artworkView;
- (ASCBorderedScreenshotView)initWithCoder:(id)a3;
- (ASCBorderedScreenshotView)initWithFrame:(CGRect)a3 screenshotDisplayConfiguration:(id)a4;
- (CGSize)preferredArtworkSize;
- (id)imageView;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
@end

@implementation ASCBorderedScreenshotView

- (ASCBorderedScreenshotView)initWithFrame:(CGRect)a3 screenshotDisplayConfiguration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCBorderedScreenshotView;
  v10 = -[ASCBorderedScreenshotView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [ASCArtworkView alloc];
    uint64_t v12 = -[ASCArtworkView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    artworkView = v10->_artworkView;
    v10->_artworkView = (ASCArtworkView *)v12;

    [(ASCArtworkView *)v10->_artworkView setDecoration:@"screenshot"];
    [(ASCArtworkView *)v10->_artworkView setScreenshotDisplayConfiguration:v9];
    -[ASCBorderedScreenshotView setLayoutMargins:](v10, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCBorderedScreenshotView *)v10 addSubview:v10->_artworkView];
  }

  return v10;
}

- (ASCBorderedScreenshotView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ASCBorderedScreenshotView;
  [(ASCBorderedScreenshotView *)&v5 layoutSubviews];
  [(ASCBorderedScreenshotView *)self bounds];
  [(ASCBorderedScreenshotView *)self bounds];
  [(ASCBorderedScreenshotView *)self bounds];
  double v4 = v3;
  [(ASCBorderedScreenshotView *)self bounds];
  [(ASCArtworkView *)self->_artworkView setFrame:v4];
}

- (id)imageView
{
  return self->_artworkView;
}

- (CGSize)preferredArtworkSize
{
  double v4 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  [(ASCBorderedScreenshotView *)self bounds];
  double v8 = v7 - (v3 + v6);
  [(ASCBorderedScreenshotView *)self bounds];
  double v10 = v9 - (v4 + v5);
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (ASCArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end