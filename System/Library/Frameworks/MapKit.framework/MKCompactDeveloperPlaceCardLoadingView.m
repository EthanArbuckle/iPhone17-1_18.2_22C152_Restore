@interface MKCompactDeveloperPlaceCardLoadingView
+ (CGSize)contentSize;
- (MKCompactDeveloperPlaceCardLoadingView)init;
@end

@implementation MKCompactDeveloperPlaceCardLoadingView

+ (CGSize)contentSize
{
  double v2 = 240.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MKCompactDeveloperPlaceCardLoadingView)init
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MKCompactDeveloperPlaceCardLoadingView;
  double v2 = -[MKCompactDeveloperPlaceCardLoadingView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    id v3 = +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:v2 ofType:4];
    v4 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardCompactBackgroundColor");
    [(MKCompactDeveloperPlaceCardLoadingView *)v2 setBackgroundColor:v4];

    [(MKCompactDeveloperPlaceCardLoadingView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(MKCompactDeveloperPlaceCardLoadingView *)v2 widthAnchor];
    v6 = [v5 constraintGreaterThanOrEqualToConstant:240.0];

    LODWORD(v7) = 1144750080;
    [v6 setPriority:v7];
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v14[0] = v6;
    v9 = [(MKCompactDeveloperPlaceCardLoadingView *)v2 heightAnchor];
    v10 = [v9 constraintGreaterThanOrEqualToConstant:100.0];
    v14[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v8 activateConstraints:v11];
  }
  return v2;
}

@end