@interface ICDocCamThumbnailDecorationView
- (ICDocCamThumbnailDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation ICDocCamThumbnailDecorationView

- (ICDocCamThumbnailDecorationView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICDocCamThumbnailDecorationView;
  v3 = -[ICDocCamThumbnailDecorationView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v5 = [v4 CGColor];
    v6 = [(ICDocCamThumbnailDecorationView *)v3 layer];
    [v6 setShadowColor:v5];

    v7 = [(ICDocCamThumbnailDecorationView *)v3 layer];
    [v7 setShadowRadius:1.0];

    v8 = [(ICDocCamThumbnailDecorationView *)v3 layer];
    objc_msgSend(v8, "setShadowOffset:", 0.0, 0.0);

    v9 = [(ICDocCamThumbnailDecorationView *)v3 layer];
    LODWORD(v10) = 1045220557;
    [v9 setShadowOpacity:v10];

    v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.7];
    [(ICDocCamThumbnailDecorationView *)v3 setBackgroundColor:v11];
  }
  return v3;
}

@end