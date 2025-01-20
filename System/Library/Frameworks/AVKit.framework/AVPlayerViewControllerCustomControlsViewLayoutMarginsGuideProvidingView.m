@interface AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView
+ (Class)layerClass;
- (AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
@end

@implementation AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView

- (CGSize)intrinsicContentSize
{
  double v2 = 10000.0;
  double v3 = 10000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView;
  double v3 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v3 setHidden:1];
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setPreservesSuperviewLayoutMargins:0];
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setUserInteractionEnabled:0];
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    LODWORD(v5) = 1.0;
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1.0;
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1112014848;
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setContentHuggingPriority:0 forAxis:v7];
    LODWORD(v8) = 1112014848;
    [(AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *)v4 setContentHuggingPriority:1 forAxis:v8];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end