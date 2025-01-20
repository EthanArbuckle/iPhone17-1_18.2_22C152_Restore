@interface CSPageControl
+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3;
+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3 desiredSize:(CGSize)a4;
+ (CGSize)defaultSize;
- (CGSize)sizeForNumberOfPages:(int64_t)a3;
- (CSPageControl)initWithFrame:(CGRect)a3;
- (id)_cameraIndicator;
- (id)_currentPageIndicatorColor;
- (id)_pageIndicatorColor;
- (unint64_t)cameraPageIndex;
- (void)_rebuildIndicators;
- (void)_updateForLegibility;
- (void)setCameraPageIndex:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation CSPageControl

- (CSPageControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSPageControl;
  v3 = -[UIPageControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_cameraPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(UIPageControl *)v3 setBackgroundStyle:2];
    [(CSPageControl *)v4 _updateForLegibility];
    [(UIPageControl *)v4 _setCustomIndicatorSpacing:5.5];
  }
  return v4;
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSPageControl;
  [(UIPageControl *)&v5 sizeForNumberOfPages:a3];
  double v4 = 10.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)defaultSize
{
  if (defaultSize_onceToken != -1) {
    dispatch_once(&defaultSize_onceToken, &__block_literal_global_7);
  }
  double v2 = *(double *)&defaultSize___DefaultSize_0;
  double v3 = *(double *)&defaultSize___DefaultSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __28__CSPageControl_defaultSize__block_invoke()
{
  v0 = [CSPageControl alloc];
  double v2 = -[CSPageControl initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPageControl *)v2 setNumberOfPages:3];
  [(CSPageControl *)v2 sizeForNumberOfPages:3];
  defaultSize___DefaultSize_0 = v1;
  defaultSize___DefaultSize_1 = 0x4028000000000000;
}

+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [a1 defaultSize];

  objc_msgSend(a1, "suggestedFrameForPageBounds:desiredSize:", x, y, width, height, v8, v9);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3 desiredSize:(CGSize)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ((unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) <= 1)
  {
    double v8 = [MEMORY[0x1E4F42948] currentDevice];
    [v8 userInterfaceIdiom];
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetMaxY(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRectGetMidX(v15);
  SBFMainScreenScale();

  BSRectRoundForScale();
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)setCameraPageIndex:(unint64_t)a3
{
  if (self->_cameraPageIndex != a3)
  {
    self->_cameraPageIndeCGFloat x = a3;
    [(CSPageControl *)self _rebuildIndicators];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_sbLegibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sbLegibilitySettings, a3);
    [(CSPageControl *)self _updateForLegibility];
  }
}

- (void)_rebuildIndicators
{
  [(UIPageControl *)self _invalidateIndicators];
  [(UIPageControl *)self setPreferredIndicatorImage:0];
  if (self->_cameraPageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v3 = [(CSPageControl *)self _cameraIndicator];
    [(UIPageControl *)self setIndicatorImage:v3 forPage:self->_cameraPageIndex];
  }

  [(CSPageControl *)self _updateForLegibility];
}

- (void)_updateForLegibility
{
  double v3 = [(CSPageControl *)self _pageIndicatorColor];
  [(UIPageControl *)self setPageIndicatorTintColor:v3];

  id v4 = [(CSPageControl *)self _currentPageIndicatorColor];
  [(UIPageControl *)self setCurrentPageIndicatorTintColor:v4];
}

- (id)_cameraIndicator
{
  double v3 = [MEMORY[0x1E4F42A98] configurationWithPointSize:12.25];
  id v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"camera.fill" withConfiguration:v3];
  [(CSPageControl *)self setContentVerticalAlignment:2];

  return v4;
}

- (id)_pageIndicatorColor
{
  double v2 = [(_UILegibilitySettings *)self->_sbLegibilitySettings primaryColor];
  double v3 = [v2 colorWithAlphaComponent:0.45];

  return v3;
}

- (id)_currentPageIndicatorColor
{
  return (id)[(_UILegibilitySettings *)self->_sbLegibilitySettings primaryColor];
}

- (unint64_t)cameraPageIndex
{
  return self->_cameraPageIndex;
}

- (void).cxx_destruct
{
}

@end